using Fashion.Data;
using Fashion.Models;
using Fashion.ViewModels;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;

namespace Fashion.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: /Account/Register
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        // POST: /Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra xem tên đăng nhập đã tồn tại chưa
                if (await _context.NguoiDungs.AnyAsync(u => u.TenDangNhap == model.TenDangNhap))
                {
                    ModelState.AddModelError("TenDangNhap", "Tên đăng nhập đã tồn tại.");
                    return View(model);
                }

                // Kiểm tra xem email đã tồn tại chưa
                if (await _context.NguoiDungs.AnyAsync(u => u.Email == model.Email))
                {
                    ModelState.AddModelError("Email", "Email đã được sử dụng.");
                    return View(model);
                }

                // Băm mật khẩu (cần triển khai logic băm an toàn hơn, ví dụ: BCrypt)
                var hashedPassword = BCrypt.Net.BCrypt.HashPassword(model.MatKhau);

                var nguoiDung = new NguoiDung
                {
                    TenDangNhap = model.TenDangNhap,
                    MatKhau = hashedPassword, 
                    HoTen = model.HoTen,
                    Email = model.Email,
                    SoDienThoai = model.SoDienThoai,
                    VaiTro = "KhachHang", // Gán vai trò mặc định
                    NgayTao = System.DateTime.Now
                };

                _context.Add(nguoiDung);
                await _context.SaveChangesAsync();

                // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
                TempData["SuccessMessage"] = "Đăng ký thành công! Vui lòng đăng nhập.";
                return RedirectToAction("Login");
            }
            return View(model);
        }

        // GET: /Account/Login
        [HttpGet]
        public IActionResult Login(string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            return View();
        }

        // POST: /Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel model, string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            if (ModelState.IsValid)
            {
                var user = await _context.NguoiDungs.FirstOrDefaultAsync(u => u.TenDangNhap == model.TenDangNhap);

                if (user != null && BCrypt.Net.BCrypt.Verify(model.MatKhau, user.MatKhau))
                {
                    // Tạo các claims cho người dùng
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                        new Claim(ClaimTypes.Name, user.HoTen),
                        new Claim(ClaimTypes.Role, user.VaiTro),
                        // Thêm các claim khác nếu cần
                    };

                    var claimsIdentity = new ClaimsIdentity(
                        claims, CookieAuthenticationDefaults.AuthenticationScheme);

                    var authProperties = new AuthenticationProperties
                    {
                        IsPersistent = model.GhiNhoToi,
                        ExpiresUtc = model.GhiNhoToi ? DateTimeOffset.UtcNow.AddDays(30) : (DateTimeOffset?)null
                    };
                    
                    // Đăng nhập người dùng và tạo cookie xác thực
                    await HttpContext.SignInAsync(
                        CookieAuthenticationDefaults.AuthenticationScheme, 
                        new ClaimsPrincipal(claimsIdentity), 
                        authProperties);

                    if (user.VaiTro == "Admin")
                        return RedirectToAction("Dashboard", "Admin");
                    return RedirectToLocal(returnUrl);
                }
                
                ModelState.AddModelError(string.Empty, "Tên đăng nhập hoặc mật khẩu không đúng.");
            }
            return View(model);
        }

        // POST: /Account/Logout
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home");
        }

        [Authorize]
        public async Task<IActionResult> OrderHistory()
        {
            var userIdString = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (!int.TryParse(userIdString, out var userId))
            {
                return Challenge(); // Or handle appropriately
            }

            var orders = await _context.DonHangs
                .Where(o => o.NguoiDungId.HasValue && o.NguoiDungId.Value == userId)
                .Include(o => o.ChiTietDonHangs)
                    .ThenInclude(od => od.SanPham)
                        .ThenInclude(p => p.SanPhamAnhs)
                .OrderByDescending(o => o.NgayTao)
                .Select(o => new OrderHistoryViewModel
                {
                    OrderId = o.Id,
                    OrderCode = $"#DH{o.Id:0000}",
                    OrderDate = o.NgayTao,
                    TotalAmount = o.TongGiaTri,
                    Status = o.TrangThai,
                    ShippingAddress = o.DiaChiNhan,
                    Items = o.ChiTietDonHangs
                        .Where(od => od.SanPhamId.HasValue && od.SanPham != null)
                        .Select(od => new OrderItemViewModel
                        {
                            ProductId = od.SanPhamId.Value,
                            ProductName = od.SanPham.Ten,
                            ProductImageUrl = od.SanPham.SanPhamAnhs.Any()
                                ? "/" + od.SanPham.SanPhamAnhs.First().DuongDan
                                : "/images/placeholder.png",
                            IsReviewed = _context.DanhGias.Any(dg => dg.NguoiDungId == userId && dg.SanPhamId == od.SanPhamId && dg.DonHangId == o.Id)
                        }).ToList()
                })
                .ToListAsync();

            return View(orders);
        }

        [Authorize]
        public async Task<IActionResult> Profile()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var user = await _context.NguoiDungs.FindAsync(int.Parse(userId));

            if (user == null)
            {
                return NotFound();
            }

            var model = new ProfileViewModel
            {
                HoTen = user.HoTen,
                Email = user.Email,
                SoDienThoai = user.SoDienThoai
            };

            return View(model);
        }

        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Profile(ProfileViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var user = await _context.NguoiDungs.FindAsync(int.Parse(userId));

            if (user == null)
            {
                return NotFound();
            }

            // Check if email is already used by another user
            if (await _context.NguoiDungs.AnyAsync(u => u.Email == model.Email && u.Id != user.Id))
            {
                ModelState.AddModelError("Email", "Email này đã được sử dụng bởi một tài khoản khác.");
                return View(model);
            }

            user.HoTen = model.HoTen;
            user.Email = model.Email;
            user.SoDienThoai = model.SoDienThoai;

            _context.Update(user);
            await _context.SaveChangesAsync();

            // Optional: Refresh user claims if name has changed
            var identity = (ClaimsIdentity)User.Identity;
            var nameClaim = identity.FindFirst(ClaimTypes.Name);
            if (nameClaim != null && nameClaim.Value != user.HoTen)
            {
                identity.RemoveClaim(nameClaim);
                identity.AddClaim(new Claim(ClaimTypes.Name, user.HoTen));
                await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(identity));
            }
            
            ViewData["SuccessMessage"] = "Cập nhật thông tin thành công!";
            return View(model);
        }

        [Authorize]
        [HttpGet]
        public IActionResult ChangePassword()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var user = await _context.NguoiDungs.FirstOrDefaultAsync(u => u.TenDangNhap == User.Identity.Name);
            if (user == null)
            {
                return Unauthorized();
            }

            if (!BCrypt.Net.BCrypt.Verify(model.OldPassword, user.MatKhau))
            {
                ModelState.AddModelError("OldPassword", "Mật khẩu cũ không đúng.");
                return View(model);
            }

            user.MatKhau = BCrypt.Net.BCrypt.HashPassword(model.NewPassword);
            _context.Update(user);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = "Đổi mật khẩu thành công!";
            return RedirectToAction("Profile"); // Hoặc trang nào đó bạn muốn
        }

        private IActionResult RedirectToLocal(string? returnUrl)
        {
            if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction(nameof(HomeController.Index), "Home");
            }
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View();
        }
    }
} 
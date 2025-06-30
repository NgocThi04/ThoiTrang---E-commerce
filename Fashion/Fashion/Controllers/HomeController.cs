using System.Diagnostics;
using Fashion.Data;
using Fashion.Models;
using Fashion.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Security.Claims;

namespace Fashion.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var sanPhams = await _context.SanPhams
                                    .Include(sp => sp.YeuThichs)
                                    .Include(sp => sp.DanhGias)
                                    .OrderByDescending(sp => sp.SoLuongBan)
                                    .Take(8)
                                    .Select(sp => new SanPhamViewModel
                                    {
                                        SanPham = sp,
                                        SoSaoTrungBinh = sp.DanhGias.Any() ? sp.DanhGias.Average(dg => dg.SoSao ?? 0) : 0
                                    })
                                    .ToListAsync();

            var danhMucs = await _context.DanhMucs.Take(8).ToListAsync();

            List<int> favoriteProductIds = new List<int>();
            if (User.Identity.IsAuthenticated)
            {
                var userId = int.Parse(User.FindFirstValue(System.Security.Claims.ClaimTypes.NameIdentifier));
                favoriteProductIds = await _context.YeuThichs
                    .Where(y => y.NguoiDungId == userId)
                    .Select(y => y.SanPhamId)
                    .ToListAsync();
            }

            var viewModel = new HomeViewModel
            {
                SanPhams = sanPhams,
                DanhMucs = danhMucs,
                FavoriteProductIds = favoriteProductIds
            };

            return View(viewModel);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

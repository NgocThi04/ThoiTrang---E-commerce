using Fashion.Models;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace Fashion.ViewModels
{
    public class HomeViewModel
    {
        public List<SanPhamViewModel> SanPhams { get; set; } = new();
        public List<DanhMuc> DanhMucs { get; set; } = new();
        public List<SanPham> TrendingProducts { get; set; } = new();
        public List<int> FavoriteProductIds { get; set; } = new();
    }

    public class SanPhamViewModel
    {
        public SanPham SanPham { get; set; }
        public double SoSaoTrungBinh { get; set; }
    }
} 
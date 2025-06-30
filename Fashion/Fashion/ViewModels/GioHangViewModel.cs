using Fashion.Models;
using System.Collections.Generic;

namespace Fashion.ViewModels
{
    public class GioHangViewModel
    {
        public List<GioHang> CartItems { get; set; } = new();
        public decimal Subtotal { get; set; }
        public decimal Discount { get; set; }
        public decimal Total { get; set; }
    }
} 
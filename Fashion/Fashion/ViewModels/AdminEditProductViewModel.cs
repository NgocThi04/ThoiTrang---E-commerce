using System.Collections.Generic;

namespace Fashion.ViewModels
{
    public class AdminEditProductViewModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; } = "";
        public string Description { get; set; } = "";
        public string Category { get; set; } = "";
        public string SKU { get; set; } = "";
        public int StockQuantity { get; set; }
        public decimal RegularPrice { get; set; }
        public decimal? SalePrice { get; set; }
        public List<string> Tags { get; set; } = new();
        public string? MainImageUrl { get; set; }
        public List<string> GalleryImages { get; set; } = new();
    }
} 
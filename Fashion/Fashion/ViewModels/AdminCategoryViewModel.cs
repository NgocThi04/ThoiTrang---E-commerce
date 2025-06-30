using System.ComponentModel.DataAnnotations;

namespace Fashion.ViewModels
{
    public class AdminCategoryViewModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Tên danh mục là bắt buộc")]
        [StringLength(100, ErrorMessage = "Tên không được vượt quá 100 ký tự")]
        public string Ten { get; set; } = string.Empty;

        public string? MoTa { get; set; }
    }

    public class AdminCategoryListViewModel
    {
        public int Id { get; set; }
        public string Ten { get; set; } = string.Empty;
        public int ProductCount { get; set; }
    }
} 
USE [db_fashion1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHangs]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DonHangId] [int] NULL,
	[SanPhamId] [int] NULL,
	[KichThuocSanPhamId] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaMua] [decimal](18, 2) NOT NULL,
	[NgayTao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ChiTietDonHangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGias]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NguoiDungId] [int] NULL,
	[SanPhamId] [int] NULL,
	[SoSao] [int] NULL,
	[BinhLuan] [nvarchar](1000) NULL,
	[TrangThai] [nvarchar](20) NOT NULL,
	[NgayTao] [datetime2](7) NOT NULL,
	[DonHangId] [int] NULL,
 CONSTRAINT [PK_DanhGias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucs]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayTao] [datetime2](7) NOT NULL,
	[DuongDanAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_DanhMucs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangs]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NguoiDungId] [int] NULL,
	[TongGiaTri] [decimal](18, 2) NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
	[TenNguoiNhan] [nvarchar](50) NOT NULL,
	[SoDienThoaiNhan] [nvarchar](20) NOT NULL,
	[NgayTao] [datetime2](7) NOT NULL,
	[DiaChiNhan] [nvarchar](200) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_DonHangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHangs]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NguoiDungId] [int] NOT NULL,
	[KichThuocSanPhamId] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[NgayTao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_GioHangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KichThuocSanPhams]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KichThuocSanPhams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SanPhamId] [int] NOT NULL,
	[KichThuoc] [nvarchar](10) NOT NULL,
	[MauSac] [nvarchar](50) NOT NULL,
	[TonKho] [int] NOT NULL,
 CONSTRAINT [PK_KichThuocSanPhams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHes]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NguoiDungId] [int] NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[ChuDe] [nvarchar](200) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[TrangThai] [nvarchar](20) NOT NULL,
	[PhanHoiAdmin] [nvarchar](max) NULL,
	[NgayGui] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_LienHes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDungs]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDungs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](255) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[SoDienThoai] [nvarchar](20) NOT NULL,
	[VaiTro] [nvarchar](50) NOT NULL,
	[NgayTao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_NguoiDungs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhamAnhs]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamAnhs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DuongDan] [nvarchar](500) NOT NULL,
	[SanPhamId] [int] NOT NULL,
 CONSTRAINT [PK_SanPhamAnhs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhams]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NOT NULL,
	[Gia] [decimal](18, 2) NOT NULL,
	[GiaGiam] [decimal](18, 2) NULL,
	[ChatLieu] [nvarchar](50) NOT NULL,
	[DuongDanAnh] [nvarchar](500) NULL,
	[DanhMucId] [int] NOT NULL,
	[NgayTao] [datetime2](7) NOT NULL,
	[SoLuongBan] [int] NOT NULL,
 CONSTRAINT [PK_SanPhams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToans]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DonHangId] [int] NULL,
	[PhuongThuc] [nvarchar](50) NOT NULL,
	[SoTien] [decimal](18, 2) NOT NULL,
	[NgayTao] [datetime2](7) NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ThanhToans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThichs]    Script Date: 23/06/2025 10:32:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThichs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NguoiDungId] [int] NOT NULL,
	[SanPhamId] [int] NOT NULL,
	[NgayTao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_YeuThichs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250621161204_InitialCreate', N'9.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250622104837_AddAddressAndNoteToOrder', N'9.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250622161955_AddDonHangIdToDanhGia', N'9.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250623032234_updatedatabase', N'9.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250623032552_updatedatabase1', N'9.0.6')
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHangs] ON 

INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (1, 1, 1, 1, 1, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (2, 1, 2, 3, 1, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (3, 2, 1, 1, 11, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T17:53:07.9731637' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (4, 2, 2, 3, 2, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T17:53:07.9894509' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (5, 3, 1, 1, 1, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T17:54:26.7155704' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (6, 4, 1, 2, 1, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T17:59:09.2356359' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (7, 5, 3, 6, 2, CAST(750000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T18:15:35.1406800' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (8, 5, 1, 2, 1, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T18:15:35.1576839' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (9, 6, 1, 1, 2, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T22:22:24.1483826' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (10, 7, 1, 1, 1, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T22:48:07.9398116' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (11, 8, 1, 1, 1, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T23:40:54.4945649' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (12, 8, 1, 2, 1, CAST(350000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T23:40:54.5093551' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (13, 8, 3, 6, 1, CAST(750000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T23:40:54.5094173' AS DateTime2))
INSERT [dbo].[ChiTietDonHangs] ([Id], [DonHangId], [SanPhamId], [KichThuocSanPhamId], [SoLuong], [GiaMua], [NgayTao]) VALUES (14, 8, 2, 4, 1, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2025-06-22T23:40:54.5094338' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ChiTietDonHangs] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGias] ON 

INSERT [dbo].[DanhGias] ([Id], [NguoiDungId], [SanPhamId], [SoSao], [BinhLuan], [TrangThai], [NgayTao], [DonHangId]) VALUES (1, 4, 1, 5, N'okela luôn', N'Hiển thị', CAST(N'2025-06-22T23:08:34.4143149' AS DateTime2), NULL)
INSERT [dbo].[DanhGias] ([Id], [NguoiDungId], [SanPhamId], [SoSao], [BinhLuan], [TrangThai], [NgayTao], [DonHangId]) VALUES (2, 4, 1, 5, N'oke day chu', N'Hiển thị', CAST(N'2025-06-22T23:22:20.6885410' AS DateTime2), 7)
INSERT [dbo].[DanhGias] ([Id], [NguoiDungId], [SanPhamId], [SoSao], [BinhLuan], [TrangThai], [NgayTao], [DonHangId]) VALUES (3, 4, 3, 3, N'cung binh thuong
', N'Hiển thị', CAST(N'2025-06-22T23:23:03.5645091' AS DateTime2), 5)
INSERT [dbo].[DanhGias] ([Id], [NguoiDungId], [SanPhamId], [SoSao], [BinhLuan], [TrangThai], [NgayTao], [DonHangId]) VALUES (4, 4, 1, 1, N'xau qua', N'Hiển thị', CAST(N'2025-06-22T23:23:23.4635486' AS DateTime2), 5)
INSERT [dbo].[DanhGias] ([Id], [NguoiDungId], [SanPhamId], [SoSao], [BinhLuan], [TrangThai], [NgayTao], [DonHangId]) VALUES (5, 4, 2, 5, N'ok', N'Hiển thị', CAST(N'2025-06-22T23:41:31.5612858' AS DateTime2), 8)
SET IDENTITY_INSERT [dbo].[DanhGias] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMucs] ON 

INSERT [dbo].[DanhMucs] ([Id], [Ten], [MoTa], [NgayTao], [DuongDanAnh]) VALUES (1, N'Áo sơ mi', N'Danh mục áo sơ mi thời trang', CAST(N'2025-06-21T23:45:13.7066667' AS DateTime2), N'images/banner.png')
INSERT [dbo].[DanhMucs] ([Id], [Ten], [MoTa], [NgayTao], [DuongDanAnh]) VALUES (2, N'Quần jean', N'Danh mục quần jean nam nữ', CAST(N'2025-06-21T23:45:13.7066667' AS DateTime2), N'images/banner.png')
INSERT [dbo].[DanhMucs] ([Id], [Ten], [MoTa], [NgayTao], [DuongDanAnh]) VALUES (3, N'Giày sneaker', N'Danh mục giày thể thao', CAST(N'2025-06-21T23:45:13.7066667' AS DateTime2), N'images/banner.png')
INSERT [dbo].[DanhMucs] ([Id], [Ten], [MoTa], [NgayTao], [DuongDanAnh]) VALUES (4, N'toc gia', N'phu kien cho nguoi khong co toc', CAST(N'2025-06-23T08:18:59.7064780' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[DanhMucs] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHangs] ON 

INSERT [dbo].[DonHangs] ([Id], [NguoiDungId], [TongGiaTri], [TrangThai], [TenNguoiNhan], [SoDienThoaiNhan], [NgayTao], [DiaChiNhan], [GhiChu]) VALUES (1, 1, CAST(650000.00 AS Decimal(18, 2)), N'Đã giao', N'Nguyễn Văn A', N'0909123456', CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), N'', NULL)
INSERT [dbo].[DonHangs] ([Id], [NguoiDungId], [TongGiaTri], [TrangThai], [TenNguoiNhan], [SoDienThoaiNhan], [NgayTao], [DiaChiNhan], [GhiChu]) VALUES (2, 3, CAST(5385000.00 AS Decimal(18, 2)), N'Chờ xử lý', N'tai khoan test', N'123456765', CAST(N'2025-06-22T10:53:07.7645139' AS DateTime2), N'122345', N'eqweqw')
INSERT [dbo].[DonHangs] ([Id], [NguoiDungId], [TongGiaTri], [TrangThai], [TenNguoiNhan], [SoDienThoaiNhan], [NgayTao], [DiaChiNhan], [GhiChu]) VALUES (3, 3, CAST(435000.00 AS Decimal(18, 2)), N'Chờ xử lý', N'tai khoan test', N'123456765', CAST(N'2025-06-22T10:54:26.6983929' AS DateTime2), N'ád', N'ád')
INSERT [dbo].[DonHangs] ([Id], [NguoiDungId], [TongGiaTri], [TrangThai], [TenNguoiNhan], [SoDienThoaiNhan], [NgayTao], [DiaChiNhan], [GhiChu]) VALUES (4, 3, CAST(435000.00 AS Decimal(18, 2)), N'Chờ xử lý', N'tai khoan test', N'123456765', CAST(N'2025-06-22T10:59:09.0258064' AS DateTime2), N'dat thoi khong nhan', N'123')
INSERT [dbo].[DonHangs] ([Id], [NguoiDungId], [TongGiaTri], [TrangThai], [TenNguoiNhan], [SoDienThoaiNhan], [NgayTao], [DiaChiNhan], [GhiChu]) VALUES (5, 4, CAST(2085000.00 AS Decimal(18, 2)), N'Đã giao', N'hẹ hẹ', N'1232442141', CAST(N'2025-06-22T11:15:34.9205955' AS DateTime2), N'dat thoi khong nhan', N'sda')
INSERT [dbo].[DonHangs] ([Id], [NguoiDungId], [TongGiaTri], [TrangThai], [TenNguoiNhan], [SoDienThoaiNhan], [NgayTao], [DiaChiNhan], [GhiChu]) VALUES (6, 4, CAST(820000.00 AS Decimal(18, 2)), N'Đã giao', N'hẹ hẹ hẹ', N'1232442141', CAST(N'2025-06-22T15:22:24.0810115' AS DateTime2), N'test ', N'123')
INSERT [dbo].[DonHangs] ([Id], [NguoiDungId], [TongGiaTri], [TrangThai], [TenNguoiNhan], [SoDienThoaiNhan], [NgayTao], [DiaChiNhan], [GhiChu]) VALUES (7, 4, CAST(435000.00 AS Decimal(18, 2)), N'Đã giao', N'hẹ hẹ hẹ', N'1232442141', CAST(N'2025-06-22T15:48:07.8574556' AS DateTime2), N'1213', N'12321')
INSERT [dbo].[DonHangs] ([Id], [NguoiDungId], [TongGiaTri], [TrangThai], [TenNguoiNhan], [SoDienThoaiNhan], [NgayTao], [DiaChiNhan], [GhiChu]) VALUES (8, 4, CAST(2195000.00 AS Decimal(18, 2)), N'Đã giao', N'hẹ hẹ hẹ', N'1232442141', CAST(N'2025-06-22T16:40:54.2933414' AS DateTime2), N'bo dao nha', N'siuu')
SET IDENTITY_INSERT [dbo].[DonHangs] OFF
GO
SET IDENTITY_INSERT [dbo].[KichThuocSanPhams] ON 

INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (1, 1, N'M', N'Trắng', 10)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (2, 1, N'L', N'Trắng', 5)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (3, 2, N'32', N'Xanh', 8)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (4, 2, N'34', N'Xanh', 7)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (5, 3, N'40', N'Trắng', 6)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (6, 3, N'41', N'Trắng', 4)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (7, 14, N'S', N'Đen', 4)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (8, 14, N'M', N'Đen', 2)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (9, 14, N'L', N'Đen', 3)
INSERT [dbo].[KichThuocSanPhams] ([Id], [SanPhamId], [KichThuoc], [MauSac], [TonKho]) VALUES (10, 14, N'XL', N'Đen', 1)
SET IDENTITY_INSERT [dbo].[KichThuocSanPhams] OFF
GO
SET IDENTITY_INSERT [dbo].[LienHes] ON 

INSERT [dbo].[LienHes] ([Id], [NguoiDungId], [HoTen], [Email], [ChuDe], [NoiDung], [TrangThai], [PhanHoiAdmin], [NgayGui]) VALUES (1, 4, N'hẹ hẹ hẹ', N'hehe@gmail.com', N'Tin nhắn từ khách hàng', N'don hang cua toi bi sao lau vay', N'Mới', NULL, CAST(N'2025-06-22T11:42:31.8246816' AS DateTime2))
SET IDENTITY_INSERT [dbo].[LienHes] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDungs] ON 

INSERT [dbo].[NguoiDungs] ([Id], [TenDangNhap], [MatKhau], [HoTen], [Email], [SoDienThoai], [VaiTro], [NgayTao]) VALUES (1, N'user1', N'123456', N'Nguyễn Văn A', N'a@gmail.com', N'0909123456', N'KhachHang', CAST(N'2025-06-21T23:45:13.7066667' AS DateTime2))
INSERT [dbo].[NguoiDungs] ([Id], [TenDangNhap], [MatKhau], [HoTen], [Email], [SoDienThoai], [VaiTro], [NgayTao]) VALUES (2, N'user2', N'123456', N'Trần Thị B', N'b@gmail.com', N'0909876543', N'Admin', CAST(N'2025-06-21T23:45:13.7066667' AS DateTime2))
INSERT [dbo].[NguoiDungs] ([Id], [TenDangNhap], [MatKhau], [HoTen], [Email], [SoDienThoai], [VaiTro], [NgayTao]) VALUES (3, N'test', N'$2a$11$iA/KZyb/ARxO9RYiloLWHOsNe37zQEr.90/O2qhWzdcTHxttZXmOO', N'tai khoan test', N'test@gmail.com', N'123456765', N'KhachHang', CAST(N'2025-06-22T00:03:16.9658842' AS DateTime2))
INSERT [dbo].[NguoiDungs] ([Id], [TenDangNhap], [MatKhau], [HoTen], [Email], [SoDienThoai], [VaiTro], [NgayTao]) VALUES (4, N'hihi', N'$2a$11$L0b3uRP05PGgsTj9Ihb2H.XmOTx2HfNzwMhJkjIhyFloKLTo6/spW', N'hẹ hẹ hẹ', N'hehe@gmail.com', N'1232442141', N'KhachHang', CAST(N'2025-06-22T13:11:55.0575372' AS DateTime2))
INSERT [dbo].[NguoiDungs] ([Id], [TenDangNhap], [MatKhau], [HoTen], [Email], [SoDienThoai], [VaiTro], [NgayTao]) VALUES (10, N'admin', N'$2a$11$CSJhXnXzrLreu.sit5.Sy.e90kQhJidOnn0lc88YuDDtccKpOjMXi', N'Quản Trị Viên', N'admin@example.com', N'9999999999', N'Admin', CAST(N'2025-06-23T00:20:17.8205812' AS DateTime2))
INSERT [dbo].[NguoiDungs] ([Id], [TenDangNhap], [MatKhau], [HoTen], [Email], [SoDienThoai], [VaiTro], [NgayTao]) VALUES (11, N'a', N'$2a$11$XZZgiLhIxNhbtGJOGrtmB.z3c7zVQeUoYUS5C.3RmfYbKCbZgF58m', N'a de min', N'ademi@gmail.com', N'932321412', N'Admin', CAST(N'2025-06-23T08:56:28.5915685' AS DateTime2))
SET IDENTITY_INSERT [dbo].[NguoiDungs] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPhamAnhs] ON 

INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (1, N'images/banner.png', 1)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (2, N'images/test1.png', 1)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (3, N'images/banner.png', 2)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (4, N'images/banner.png', 2)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (5, N'images/banner.png', 4)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (6, N'images/banner.png', 4)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (7, N'images/banner.png', 3)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (8, N'images/banner.png', 3)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (9, N'images/banner.png', 5)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (10, N'images/sp_6_6aa7f965.png', 6)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (11, N'images/sp_6_60e29a51.png', 6)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (12, N'images/sp_6_73023652.png', 6)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (13, N'images/sp_7_1958c870.png', 7)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (14, N'images/sp_7_0915b5c6.png', 7)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (15, N'images/sp_7_edf1434f.png', 7)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (22, N'images/sp_8_c252d675.png', 8)
INSERT [dbo].[SanPhamAnhs] ([Id], [DuongDan], [SanPhamId]) VALUES (23, N'images/sp_14_4da568b8.png', 14)
SET IDENTITY_INSERT [dbo].[SanPhamAnhs] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPhams] ON 

INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (1, N'Áo sơ mi trắng', N'Áo sơ mi vải cotton cao cấp', CAST(350000.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)), N'Cotton', N'images/banner.png', 1, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 20)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (2, N'Quần jean xanh', N'Quần jean form slim-fit', CAST(500000.00 AS Decimal(18, 2)), NULL, N'Denim', N'images/banner.png', 2, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 15)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (3, N'Giày sneaker trắng', N'Giày thể thao phong cách Hàn Quốc', CAST(750000.00 AS Decimal(18, 2)), CAST(700000.00 AS Decimal(18, 2)), N'Da tổng hợp', N'images/banner.png', 3, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 10)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (4, N'Áo khoác bomber', N'Áo khoác chất liệu kaki, phong cách năng động', CAST(620000.00 AS Decimal(18, 2)), CAST(580000.00 AS Decimal(18, 2)), N'Kaki', N'images/banner.png', 1, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 5)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (5, N'Váy xòe công sở', N'Váy xòe chất liệu vải thô mát', CAST(450000.00 AS Decimal(18, 2)), NULL, N'Vải thô', N'images/banner.png', 1, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 8)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (6, N'Quần short jean nữ', N'Quần short jean rách nhẹ, trẻ trung', CAST(320000.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)), N'Denim', N'images/sp_6_6aa7f965.png', 2, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 12)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (7, N'Áo thun unisex', N'Áo thun oversize thoải mái', CAST(200000.00 AS Decimal(18, 2)), CAST(180000.00 AS Decimal(18, 2)), N'Cotton', N'images/sp_7_1958c870.png', 1, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 30)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (8, N'Giày boots da nam', N'Giày da phong cách lịch lãm', CAST(850000.00 AS Decimal(18, 2)), CAST(820000.00 AS Decimal(18, 2)), N'Da bò', N'images/sp_8_c252d675.png', 3, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 6)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (9, N'Giày sandal nữ', N'Sandal quai mảnh thời trang', CAST(390000.00 AS Decimal(18, 2)), NULL, N'Da tổng hợp', N'images/banner.png', 3, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 15)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (10, N'Áo len cổ lọ', N'Áo len giữ ấm mùa đông', CAST(410000.00 AS Decimal(18, 2)), NULL, N'Len', N'images/banner.png', 1, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 9)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (11, N'Quần thể thao nam', N'Quần jogger phong cách thể thao', CAST(340000.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)), N'Polyester', N'images/banner.png', 2, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 10)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (12, N'Váy body tay dài', N'Váy ôm dáng, tôn dáng quyến rũ', CAST(500000.00 AS Decimal(18, 2)), CAST(470000.00 AS Decimal(18, 2)), N'Thun lạnh', N'images/banner.png', 1, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 7)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (13, N'Giày slip-on basic', N'Giày lười tiện lợi, dễ phối đồ', CAST(420000.00 AS Decimal(18, 2)), CAST(400000.00 AS Decimal(18, 2)), N'Vải canvas', N'images/banner.png', 3, CAST(N'2025-06-21T23:45:13.7100000' AS DateTime2), 11)
INSERT [dbo].[SanPhams] ([Id], [Ten], [MoTa], [Gia], [GiaGiam], [ChatLieu], [DuongDanAnh], [DanhMucId], [NgayTao], [SoLuongBan]) VALUES (14, N'ao ba lo', N'lam bang nhua duong', CAST(500000.00 AS Decimal(18, 2)), NULL, N'nhua duong', N'images/sp_14_4da568b8.png', 1, CAST(N'2025-06-23T08:10:12.8176455' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[SanPhams] OFF
GO
SET IDENTITY_INSERT [dbo].[ThanhToans] ON 

INSERT [dbo].[ThanhToans] ([Id], [DonHangId], [PhuongThuc], [SoTien], [NgayTao], [TrangThai]) VALUES (2, 1, N'Thanh toán khi nhận hàng', CAST(650000.00 AS Decimal(18, 2)), CAST(N'2025-06-21T23:47:48.2766667' AS DateTime2), N'')
SET IDENTITY_INSERT [dbo].[ThanhToans] OFF
GO
SET IDENTITY_INSERT [dbo].[YeuThichs] ON 

INSERT [dbo].[YeuThichs] ([Id], [NguoiDungId], [SanPhamId], [NgayTao]) VALUES (7, 3, 4, CAST(N'2025-06-22T10:44:16.9453880' AS DateTime2))
INSERT [dbo].[YeuThichs] ([Id], [NguoiDungId], [SanPhamId], [NgayTao]) VALUES (10, 3, 2, CAST(N'2025-06-22T10:44:33.7887098' AS DateTime2))
INSERT [dbo].[YeuThichs] ([Id], [NguoiDungId], [SanPhamId], [NgayTao]) VALUES (11, 3, 3, CAST(N'2025-06-22T10:44:37.0926613' AS DateTime2))
INSERT [dbo].[YeuThichs] ([Id], [NguoiDungId], [SanPhamId], [NgayTao]) VALUES (19, 3, 5, CAST(N'2025-06-22T12:44:54.7071320' AS DateTime2))
INSERT [dbo].[YeuThichs] ([Id], [NguoiDungId], [SanPhamId], [NgayTao]) VALUES (25, 4, 2, CAST(N'2025-06-22T13:12:26.3290118' AS DateTime2))
INSERT [dbo].[YeuThichs] ([Id], [NguoiDungId], [SanPhamId], [NgayTao]) VALUES (30, 3, 1, CAST(N'2025-06-22T18:14:00.1222810' AS DateTime2))
INSERT [dbo].[YeuThichs] ([Id], [NguoiDungId], [SanPhamId], [NgayTao]) VALUES (31, 4, 3, CAST(N'2025-06-22T22:20:56.8405354' AS DateTime2))
INSERT [dbo].[YeuThichs] ([Id], [NguoiDungId], [SanPhamId], [NgayTao]) VALUES (33, 4, 1, CAST(N'2025-06-23T09:35:49.7302556' AS DateTime2))
SET IDENTITY_INSERT [dbo].[YeuThichs] OFF
GO
ALTER TABLE [dbo].[ChiTietDonHangs] ADD  DEFAULT ((0)) FOR [KichThuocSanPhamId]
GO
ALTER TABLE [dbo].[DonHangs] ADD  DEFAULT (N'') FOR [DiaChiNhan]
GO
ALTER TABLE [dbo].[SanPhams] ADD  DEFAULT ((0)) FOR [DanhMucId]
GO
ALTER TABLE [dbo].[ThanhToans] ADD  DEFAULT (N'') FOR [TrangThai]
GO
ALTER TABLE [dbo].[ChiTietDonHangs]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHangs_DonHangs_DonHangId] FOREIGN KEY([DonHangId])
REFERENCES [dbo].[DonHangs] ([Id])
GO
ALTER TABLE [dbo].[ChiTietDonHangs] CHECK CONSTRAINT [FK_ChiTietDonHangs_DonHangs_DonHangId]
GO
ALTER TABLE [dbo].[ChiTietDonHangs]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHangs_KichThuocSanPhams_KichThuocSanPhamId] FOREIGN KEY([KichThuocSanPhamId])
REFERENCES [dbo].[KichThuocSanPhams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonHangs] CHECK CONSTRAINT [FK_ChiTietDonHangs_KichThuocSanPhams_KichThuocSanPhamId]
GO
ALTER TABLE [dbo].[ChiTietDonHangs]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHangs_SanPhams_SanPhamId] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPhams] ([Id])
GO
ALTER TABLE [dbo].[ChiTietDonHangs] CHECK CONSTRAINT [FK_ChiTietDonHangs_SanPhams_SanPhamId]
GO
ALTER TABLE [dbo].[DanhGias]  WITH CHECK ADD  CONSTRAINT [FK_DanhGias_DonHangs_DonHangId] FOREIGN KEY([DonHangId])
REFERENCES [dbo].[DonHangs] ([Id])
GO
ALTER TABLE [dbo].[DanhGias] CHECK CONSTRAINT [FK_DanhGias_DonHangs_DonHangId]
GO
ALTER TABLE [dbo].[DanhGias]  WITH CHECK ADD  CONSTRAINT [FK_DanhGias_NguoiDungs_NguoiDungId] FOREIGN KEY([NguoiDungId])
REFERENCES [dbo].[NguoiDungs] ([Id])
GO
ALTER TABLE [dbo].[DanhGias] CHECK CONSTRAINT [FK_DanhGias_NguoiDungs_NguoiDungId]
GO
ALTER TABLE [dbo].[DanhGias]  WITH CHECK ADD  CONSTRAINT [FK_DanhGias_SanPhams_SanPhamId] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPhams] ([Id])
GO
ALTER TABLE [dbo].[DanhGias] CHECK CONSTRAINT [FK_DanhGias_SanPhams_SanPhamId]
GO
ALTER TABLE [dbo].[DonHangs]  WITH CHECK ADD  CONSTRAINT [FK_DonHangs_NguoiDungs_NguoiDungId] FOREIGN KEY([NguoiDungId])
REFERENCES [dbo].[NguoiDungs] ([Id])
GO
ALTER TABLE [dbo].[DonHangs] CHECK CONSTRAINT [FK_DonHangs_NguoiDungs_NguoiDungId]
GO
ALTER TABLE [dbo].[GioHangs]  WITH CHECK ADD  CONSTRAINT [FK_GioHangs_KichThuocSanPhams_KichThuocSanPhamId] FOREIGN KEY([KichThuocSanPhamId])
REFERENCES [dbo].[KichThuocSanPhams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHangs] CHECK CONSTRAINT [FK_GioHangs_KichThuocSanPhams_KichThuocSanPhamId]
GO
ALTER TABLE [dbo].[GioHangs]  WITH CHECK ADD  CONSTRAINT [FK_GioHangs_NguoiDungs_NguoiDungId] FOREIGN KEY([NguoiDungId])
REFERENCES [dbo].[NguoiDungs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHangs] CHECK CONSTRAINT [FK_GioHangs_NguoiDungs_NguoiDungId]
GO
ALTER TABLE [dbo].[KichThuocSanPhams]  WITH CHECK ADD  CONSTRAINT [FK_KichThuocSanPhams_SanPhams_SanPhamId] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPhams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KichThuocSanPhams] CHECK CONSTRAINT [FK_KichThuocSanPhams_SanPhams_SanPhamId]
GO
ALTER TABLE [dbo].[LienHes]  WITH CHECK ADD  CONSTRAINT [FK_LienHes_NguoiDungs_NguoiDungId] FOREIGN KEY([NguoiDungId])
REFERENCES [dbo].[NguoiDungs] ([Id])
GO
ALTER TABLE [dbo].[LienHes] CHECK CONSTRAINT [FK_LienHes_NguoiDungs_NguoiDungId]
GO
ALTER TABLE [dbo].[SanPhamAnhs]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamAnhs_SanPhams_SanPhamId] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPhams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPhamAnhs] CHECK CONSTRAINT [FK_SanPhamAnhs_SanPhams_SanPhamId]
GO
ALTER TABLE [dbo].[SanPhams]  WITH CHECK ADD  CONSTRAINT [FK_SanPhams_DanhMucs_DanhMucId] FOREIGN KEY([DanhMucId])
REFERENCES [dbo].[DanhMucs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPhams] CHECK CONSTRAINT [FK_SanPhams_DanhMucs_DanhMucId]
GO
ALTER TABLE [dbo].[ThanhToans]  WITH CHECK ADD  CONSTRAINT [FK_ThanhToans_DonHangs_DonHangId] FOREIGN KEY([DonHangId])
REFERENCES [dbo].[DonHangs] ([Id])
GO
ALTER TABLE [dbo].[ThanhToans] CHECK CONSTRAINT [FK_ThanhToans_DonHangs_DonHangId]
GO
ALTER TABLE [dbo].[YeuThichs]  WITH CHECK ADD  CONSTRAINT [FK_YeuThichs_NguoiDungs_NguoiDungId] FOREIGN KEY([NguoiDungId])
REFERENCES [dbo].[NguoiDungs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThichs] CHECK CONSTRAINT [FK_YeuThichs_NguoiDungs_NguoiDungId]
GO
ALTER TABLE [dbo].[YeuThichs]  WITH CHECK ADD  CONSTRAINT [FK_YeuThichs_SanPhams_SanPhamId] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[SanPhams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThichs] CHECK CONSTRAINT [FK_YeuThichs_SanPhams_SanPhamId]
GO

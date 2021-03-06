USE [ShopTT]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 25/12/2020 11:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrator](
	[adAcc] [varchar](500) NOT NULL,
	[adPass] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[adAcc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 25/12/2020 11:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](100) NULL,
	[catePhoto] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 25/12/2020 11:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[cusPhone] [varchar](20) NOT NULL,
	[cusFullName] [nvarchar](200) NULL,
	[cusEmail] [varchar](100) NULL,
	[cusAddress] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[cusPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 25/12/2020 11:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [varchar](20) NOT NULL,
	[proID] [varchar](50) NOT NULL,
	[ordtsQuantity] [int] NULL,
	[ordtsThanhTien] [varchar](50) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25/12/2020 11:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [varchar](20) NOT NULL,
	[cusPhone] [varchar](20) NULL,
	[orderMessage] [nvarchar](max) NULL,
	[orderDateTime] [varchar](50) NULL,
	[orderStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 25/12/2020 11:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producers](
	[pdcID] [int] IDENTITY(1,1) NOT NULL,
	[pdcName] [nvarchar](100) NULL,
	[pdcPhone] [varchar](20) NULL,
	[pdcEmail] [varchar](50) NULL,
	[pdcAddress] [nvarchar](max) NULL,
	[pdcPhoto] [nvarchar](max) NULL,
	[pdcInfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[pdcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25/12/2020 11:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[proID] [varchar](50) NOT NULL,
	[pdcID] [int] NULL,
	[typeID] [int] NULL,
	[proName] [nvarchar](200) NULL,
	[proSize] [varchar](10) NULL,
	[proPrice] [varchar](10) NULL,
	[proDiscount] [int] NULL,
	[proPhoto] [nvarchar](max) NULL,
	[proUpdateDate] [varchar](50) NULL,
	[proDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 25/12/2020 11:28:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[cateID] [int] NULL,
	[typeName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Administrator] ([adAcc], [adPass]) VALUES (N'vutung', N'Z8iwc6Uz2M+EpI1l6kLxPQ==')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (1, N'Quần-áo', N'/Image/img (7).jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (2, N'Giày-dép', N'/Image/img (23).jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (3, N'Phụ kiện', N'/Image/img (4).png')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567891', N'Vũ Văn A', N'a@gmail.com', N'Nhà A')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567892', N'Vũ Văn B', N'b@gmail.com', N'Nhà B')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567893', N'Vũ Văn C', N'c@gmail.com', N'Nhà C')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567894', N'Vũ Văn D', N'd@gmail.com', N'Nhà D')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567895', N'Vũ Văn E', N'e@gmail.com', N'Nhà E')
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (1, N'4MEN', N'0868.444.644', N'4men@gmail.com', N'TpHCM', N'/Image/img (2).png', N'4Men là thương hiệu thời trang nam được giới trẻ độ tuổi từ 22-25 cực kỳ yêu thích')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (2, N'OWEN', N'0868.444.644', N'owen@gmail.com', N'TpHCM', N'/Image/img (3).png', N'Owen là thương hiệu thời trang nam được giới trẻ độ tuổi từ 22-25 cực kỳ yêu thích')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (3, N'MERRIMAN', N'0868.444.644', N'merr@gmail.com', N'TpHCM', N'/Image/img (5).jpg', N'Merr là thương hiệu thời trang nam được giới trẻ độ tuổi từ 22-25 cực kỳ yêu thích')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (4, N'BILUXURY', N'0868.444.644', N'bil@gmail.com', N'TpHCM', N'/Image/img (15).jpg', N'Bil là thương hiệu thời trang nam được giới trẻ độ tuổi từ 22-25 cực kỳ yêu thích')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (5, N'NOVELTY', N'0868.444.644', N'nov@gmail.com', N'TpHCM', N'/Image/img (18).jpg', N'Nov là thương hiệu thời trang nam được giới trẻ độ tuổi từ 22-25 cực kỳ yêu thích')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (6, N'ADAM STORE', N'0868.444.644', N'adam@gmail.com', N'TpHCM', N'/Image/img (21).jpg', N'Adam là thương hiệu thời trang nam được giới trẻ độ tuổi từ 22-25 cực kỳ yêu thích')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (7, N'MAY 10', N'0868.444.644', N'may10@gmail.com', N'TpHCM', N'/Image/img (26).jpg', N'May10 là thương hiệu thời trang nam được giới trẻ độ tuổi từ 22-25 cực kỳ yêu thích')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (8, N'CALVIN KLEIN', N'0868.444.644', N'ck@gmail.com', N'TpHCM', N'/Image/img (26).jpg', N'CK là thương hiệu thời trang nam được giới trẻ độ tuổi từ 22-25 cực kỳ yêu thích')
SET IDENTITY_INSERT [dbo].[Producers] OFF
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'A001', 1, 1, N'Áo Sơ Mi Phối Chân Cổ ASM034 Màu Đen
', N'XL,XXL,L', N'110000', 0, N'/ao-so-mi.jpg', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'A002', 1, 2, N'Áo Thun Abstract Shapes AT033 Màu Trắng Kem', N'S,M,L...', N'80000', 0, N'/ao-thun.jpg', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'A003', 1, 5, N'Áo Vest Xanh Da Trời AV1089', N'L,XL,XXL', N'130000', 0, N'/ao-vest.jpg', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'A004', 1, 7, N'Áo Len Sọc Đứng AL004 Màu Xám', N'S,M,L...', N'170000', 0, N'/ao-len.jpg', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'M001', 3, 13, N'Giày Thể Thao G210', N'M,S,...', N'82000', 0, N'/giay-the-thao.png', N'10/08/2020 6:43:36 AM', N'Đặc điểm sản phẩm
- Chất vải chuyên dụng trong thể thao.
- Công nghệ thấm hút mồ hôi, giúp giữ mát và khô ráo suốt ngày.
- Tạo cảm giác thoải mái trong suốt quá trình vận động.
- Thiết kế trẻ trung, năng động.
- Sử dụng tốt nhất đối với: hoạt động bình thường tại phòng tập Gym, trang phục tiện dụng')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'M002', 3, 15, N'Mắt Kính MK259', N'XL,L,...', N'45000', 0, N'/mat-kinh.jpg', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'M003', 3, 15, N'
Mắt Kính Đỏ MK260
Mắt Kính Đỏ MK260
Mắt Kính Đỏ MK260
Mắt Kính Đỏ MK260
Mắt Kính Đỏ MK260
MẮT KÍNH ĐỎ MK260', N'S,M,...', N'120000', 5, N'/mat-kinh1.jpg', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'OW001', 2, 8, N'Quần Tây Căn Bản Form Slimfit QT018 Màu Đen', N'S,M,...', N'320000', 10, N'/quan-tay.png', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'OW002', 2, 9, N'Quần Jean Slimfit QJ692 Màu Xám', N'M,S,L', N'230000', 5, N'/quan-jean.jpg', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'OW003', 2, 11, N'Quần Jogger Túi Đắp J001 Màu Đen', N'M,S,...', N'200000', 0, N'/quan-jogger.png', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'OW004', 2, 12, N'Quần Short Lưng Thun Túi Hộp QS008', N'M,S,L,...', N'60000', 0, N'/quan-short.jpg', N'10/08/2020 6:43:36 AM', N'Không có mô tả')
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (1, 1, N'Áo sơ mi')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (2, 1, N'Áo thun')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (3, 1, N'Áo polo')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (4, 1, N'Áo khoác')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (5, 1, N'Áo vest')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (6, 1, N'Áo ghi lê')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (7, 1, N'Áo len')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (8, 1, N'Quần tây')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (9, 1, N'Quần jean')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (10, 1, N'Quần kaki')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (11, 1, N'Quần jogger')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (12, 1, N'Quần short')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (13, 2, N'Giày')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (14, 2, N'Dép')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (15, 3, N'Mắt kính')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (16, NULL, N'aaaa')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cusPhone])
REFERENCES [dbo].[Customers] ([cusPhone])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([pdcID])
REFERENCES [dbo].[Producers] ([pdcID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([typeID])
REFERENCES [dbo].[ProductTypes] ([typeID])
GO
ALTER TABLE [dbo].[ProductTypes]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Categories] ([cateID])
GO

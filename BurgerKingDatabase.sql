USE [master]
GO
/****** Object:  Database [BurgerKingDatabase]    Script Date: 31/12/2023 6:25:02 CH ******/
CREATE DATABASE [BurgerKingDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BurgerKingDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BurgerKingDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BurgerKingDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BurgerKingDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BurgerKingDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BurgerKingDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BurgerKingDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BurgerKingDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BurgerKingDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BurgerKingDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BurgerKingDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BurgerKingDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BurgerKingDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [BurgerKingDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BurgerKingDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BurgerKingDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BurgerKingDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BurgerKingDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BurgerKingDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BurgerKingDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [BurgerKingDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BurgerKingDatabase]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 31/12/2023 6:25:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProId] [int] IDENTITY(1,1) NOT NULL,
	[ProName] [nvarchar](50) NULL,
	[ProImage] [varchar](50) NULL,
	[ProDes] [ntext] NULL,
	[CatId] [int] NULL,
	[ProPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31/12/2023 6:25:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Product_Category]    Script Date: 31/12/2023 6:25:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Product_Category] AS
SELECT 
    p.ProId,
    p.ProName,
    p.ProImage,
    p.ProDes,
    c.CatId,
    c.CatName,
    p.ProPrice
FROM 
    Product p
JOIN 
    Category c ON p.CatId = c.CatId;
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 31/12/2023 6:25:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[RoleId] [int] NULL,
	[Image] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 31/12/2023 6:25:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [varchar](10) NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderNote] [nvarchar](max) NULL,
	[PaymentType] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[CustomerPhone] [nvarchar](15) NULL,
	[CustomerEmail] [nvarchar](100) NULL,
	[CustomerAddress] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 31/12/2023 6:25:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [varchar](10) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview]    Script Date: 31/12/2023 6:25:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ProId] [int] NULL,
	[AccId] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[ReviewDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 31/12/2023 6:25:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Name], [Email], [Phone], [Password], [RoleId], [Image], [Address]) VALUES (1, N'Admin 1', N'admin1@gmail.com', N'0123456789', N'25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7', 1, N'male.jpg', NULL)
INSERT [dbo].[Accounts] ([Id], [Name], [Email], [Phone], [Password], [RoleId], [Image], [Address]) VALUES (2, N'Customer 1', N'customer1@gmail.com', N'0706996996', N'dea26157fa355301663174eac368538cff8939f36681d6712dedba439ab98b70', 3, N'male.jpg', N'242/9 Nguyễn Xí, Phường 13, Quận Bình Thạnh, TP.HCM')
INSERT [dbo].[Accounts] ([Id], [Name], [Email], [Phone], [Password], [RoleId], [Image], [Address]) VALUES (3, N'Customer 2', N'customer2@gmail.com', N'0706996991', N'c8c7cb5b9e8f7a1b3d1d02602ada62327132391dbe0e8ee07913cd550eea1f3b', 3, N'male.jpg', NULL)
INSERT [dbo].[Accounts] ([Id], [Name], [Email], [Phone], [Password], [RoleId], [Image], [Address]) VALUES (4, N'Customer 3', N'customer3@gmail.com', N'0706996994', N'18c5c9be898c65c5e5c51ac3e94feacff0b991f8463a3a18eb524e9f7e6131a8', 3, N'male.jpg', NULL)
INSERT [dbo].[Accounts] ([Id], [Name], [Email], [Phone], [Password], [RoleId], [Image], [Address]) VALUES (5, N'Customer 4', N'customer4@gmail.com', N'0586136015', N'customer4', 3, N'male.jpg', NULL)
INSERT [dbo].[Accounts] ([Id], [Name], [Email], [Phone], [Password], [RoleId], [Image], [Address]) VALUES (6, N'Customer 5', N'customer5@gmail.com', N'0798247482', N'customer5', 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CatId], [CatName]) VALUES (1, N'Combo')
INSERT [dbo].[Category] ([CatId], [CatName]) VALUES (2, N'Burger')
INSERT [dbo].[Category] ([CatId], [CatName]) VALUES (3, N'Gà rán')
INSERT [dbo].[Category] ([CatId], [CatName]) VALUES (4, N'Món ăn kèm')
INSERT [dbo].[Category] ([CatId], [CatName]) VALUES (5, N'Thức uống')
INSERT [dbo].[Category] ([CatId], [CatName]) VALUES (6, N'Tráng miệng')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'0e594ee9c9', CAST(N'2023-12-31T16:07:11.837' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Ngô Công Huân', N'0706996998', N'hvhuan9906@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'1b3353a317', CAST(N'2023-12-31T16:09:14.460' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Ngô Công Huân', N'0706996998', N'hvhuan9906@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'2c90d71ce3', CAST(N'2023-12-31T17:01:35.720' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Customer 1', N'0706996996', N'customer1@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'37a2db6744', CAST(N'2023-12-31T17:17:22.993' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Customer 1', N'0706996996', N'customer1@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'3a99b0dcd5', CAST(N'2023-12-16T03:01:05.000' AS DateTime), NULL, N'Chuyển khoản', N'Đã hủy đơn hàng', N'Admin 1', N'0123456789', N'admin1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'573714206b', CAST(N'2023-12-30T00:57:34.127' AS DateTime), N'Hello', N'Chuyển khoản', N'Đã thanh toán', N'Customer 1', N'0706996996', N'customer1@gmail.com', N'297 Phan Dinh Phung')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'62d86778b1', CAST(N'2023-12-31T15:57:47.857' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Admin 1', N'0123456789', N'admin1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'6dc39141d4', CAST(N'2023-12-31T16:27:54.380' AS DateTime), N'Đừng bỏ mè. Em cảm ơn', N'', N'Đang chờ thanh toán', N'Ngô Công Huân', N'0706996998', N'hvhuan9906@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'6f6d8ceaaa', CAST(N'2023-12-31T15:59:04.233' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Customer 1', N'0706996996', N'customer1@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'768a4aa668', CAST(N'2023-12-31T15:57:36.013' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Admin 1', N'0123456789', N'admin1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'7bae3a192a', CAST(N'2023-12-16T01:18:25.610' AS DateTime), N'Đừng bỏ mè đen. Em cảm ơn', N'Chuyển khoản', N'Đã thanh toán', N'Customer 1', N'0706996995', N'customer1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'84fac2fc22', CAST(N'2023-12-31T16:03:28.420' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Ngô Công Huân', N'0706996998', N'hvhuan9906@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'87eee5d77b', CAST(N'2023-12-31T18:10:10.500' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Ngô Công Huân', N'0706996998', N'hvhuan9906@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'8c7fcc57a2', CAST(N'2023-12-16T23:48:30.620' AS DateTime), N'Hello', N'', N'Đã xảy ra lỗi trong quá trình thanh toán', N'Phan Thị Thanh Vy', N'0787772805', N'phanthithanhvy280501@gmail.com', N'297 Phan Dinh Phung')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'8e96d6b656', CAST(N'2023-12-16T01:12:09.050' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Customer 1', N'0706996995', N'customer1@gmail.com', N'73 nguyễn xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'951a611839', CAST(N'2023-12-16T01:15:13.127' AS DateTime), N'', N'Chuyển khoản', N'Đã thanh toán', N'Customer 1', N'0706996995', N'customer1@gmail.com', N'297 Phan Dinh Phung')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'a6457c6c76', CAST(N'2023-12-31T15:57:44.060' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Admin 1', N'0123456789', N'admin1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'ae7b4630d4', CAST(N'2023-12-31T15:57:44.703' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Admin 1', N'0123456789', N'admin1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'b078ae13b4', CAST(N'2023-12-30T00:56:03.710' AS DateTime), N'Đừng bỏ mè đen. Em cảm ơn', N'Chuyển khoản', N'Đã thanh toán', N'Customer 1', N'0706996996', N'customer1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'b665a7abab', CAST(N'2023-12-31T15:48:08.400' AS DateTime), N'', N'', N'Đang chờ thanh toán', N'Admin 1', N'0123456789', N'admin1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'be381b7110', CAST(N'2023-12-16T01:13:07.633' AS DateTime), N'', N'Chuyển khoản', N'Đã thanh toán', N'Customer 1', N'0706996995', N'customer1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'ccd9895319', CAST(N'2023-12-16T04:09:15.753' AS DateTime), N'Làm bài được rồi, vui quá', N'Chuyển khoản', N'Đã thanh toán', N'Ngô Công Huân', N'0706996998', N'hvhuan9906@gmail.com', N'242/9 Nguyễn Xí, Quận Bình Thạnh, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'cf05f44a4f', CAST(N'2023-12-18T14:26:27.207' AS DateTime), N'Hello', N'Chuyển khoản', N'Đã thanh toán', N'Ngô Công Huân ', N'0384732483', N'hvhuan9906@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'd1143f1d67', CAST(N'2023-12-16T04:07:05.957' AS DateTime), N'Làm bài được rồi, vui quá', N'', N'Đang chờ thanh toán', N'Ngô Công Huân', N'0706996998', N'hvhuan9906@gmail.com@gmail.com', N'242/9 Nguyễn Xí, Quận Bình Thạnh, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'ead4c9d3a4', CAST(N'2023-12-31T16:30:18.797' AS DateTime), N'', N'Tiền mặt', N'Đang chờ thanh toán', N'Ngô Công Huân', N'0706996998', N'hvhuan9906@gmail.com', N'242/9 Nguyễn Xí')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'ef9449196f', CAST(N'2023-12-16T01:23:38.607' AS DateTime), N'', N'Chuyển khoản', N'Đã thanh toán', N'Customer 1', N'0706996995', N'customer1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderNote], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (N'f4f9b7f5e3', CAST(N'2023-12-31T18:17:12.347' AS DateTime), N'', N'Chuyển khoản', N'Đã thanh toán', N'Admin 1', N'0123456789', N'admin1@gmail.com', N'242/9 Nguyễn Xí, TP.HCM')
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'0e594ee9c9', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'1b3353a317', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'2c90d71ce3', 1, 100000, 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'37a2db6744', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'37a2db6744', 3, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'3a99b0dcd5', 1, 100000, 3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'3a99b0dcd5', 2, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'573714206b', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'573714206b', 2, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'62d86778b1', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'6dc39141d4', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'6dc39141d4', 3, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'6f6d8ceaaa', 1, 100000, 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'768a4aa668', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'7bae3a192a', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'7bae3a192a', 3, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'84fac2fc22', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'84fac2fc22', 3, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'87eee5d77b', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'8c7fcc57a2', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'8c7fcc57a2', 3, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'8c7fcc57a2', 4, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'8c7fcc57a2', 5, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'8e96d6b656', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'951a611839', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'951a611839', 2, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'a6457c6c76', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'ae7b4630d4', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b078ae13b4', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b078ae13b4', 3, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b078ae13b4', 11, 45000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b078ae13b4', 20, 90000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b078ae13b4', 26, 25000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b078ae13b4', 32, 15000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b078ae13b4', 35, 30000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b665a7abab', 19, 30000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'b665a7abab', 20, 90000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'be381b7110', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'be381b7110', 3, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'ccd9895319', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'ccd9895319', 3, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'cf05f44a4f', 1, 100000, 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'cf05f44a4f', 35, 30000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'd1143f1d67', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'd1143f1d67', 35, 30000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'd1143f1d67', 37, 30000, 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'ead4c9d3a4', 1, 100000, 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'ead4c9d3a4', 3, 100000, 4)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'ef9449196f', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'f4f9b7f5e3', 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (N'f4f9b7f5e3', 3, 100000, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (1, N'Combo 01', N'Combo01.png', N'1 Burger bò gà phô mai + 1 khoai tây chiên + 1 coca', 1, 100000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (2, N'Combo 02', N'Combo02.png', N'1 Burger gà phô mai + 1 khoai tây chiên + 1 coca', 1, 100000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (3, N'Combo 03', N'Combo03.png', N'1 Burger bò phô mai + 1 khoai tây chiên + 1 coca', 1, 100000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (4, N'Combo 04', N'Combo04.png', N'1 Burger cá hồi phô mai + 1 khoai tây chiên + 1 coca', 1, 100000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (5, N'Combo 05', N'Combo05.png', N'1 Burger phi lê cá + 1 khoai tây chiên + 1 coca', 1, 100000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (6, N'Combo 06', N'Combo06.png', N'1 Burger phi lê cá phô mai + 1 khoai tây chiên + 1 coca', 1, 100000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (7, N'Combo 07', N'Combo07.png', N'1 Burger bò phô mai nhỏ + 1 khoai tây chiên + 1 coca', 1, 75000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (8, N'Combo 08', N'Combo08.png', N'1 Burger gà phô mai nhỏ + 1 khoai tây chiên + 1 coca', 1, 75000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (9, N'Combo 09', N'Combo09.png', N'1 Burger cá hồi phô mai nhỏ + 1 khoai tây chiên + 1 coca', 1, 75000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (10, N'Combo 10', N'Combo10.png', N'1 Burger phi lê cá phô mai nhỏ + 1 khoai tây chiên + 1 coca', 1, 75000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (11, N'Burger 01', N'Burger01.png', N'Burger bò gà phô mai', 2, 45000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (12, N'Burger 02', N'Burger02.png', N'Burger gà phô mai', 2, 45000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (13, N'Burger 03', N'Burger03.png', N'Burger cá hồi phô mai', 2, 45000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (14, N'Burger 04', N'Burger04.png', N'Burger phi lê cá', 2, 45000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (15, N'Burger 05', N'Burger05.png', N'Burger phi lê cá phô mai', 2, 45000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (16, N'Burger 06', N'Burger06.png', N'Burger bò phô mai nhỏ', 2, 30000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (17, N'Burger 07', N'Burger07.png', N'Burger gà phô mai nhỏ', 2, 30000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (18, N'Burger 08', N'Burger08.png', N'Burger cá hồi phô mai nhỏ', 2, 30000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (19, N'Gà rán 01', N'GaRan01.png', N'1 đùi gà chiên giòn', 3, 30000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (20, N'Gà rán 02', N'GaRan02.png', N'1 đùi gà + 1 cánh gà + 1 ức gà chiên giòn', 3, 90000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (21, N'Gà rán 03', N'GaRan03.png', N'4 miếng gà bất kỳ chiên giòn', 3, 120000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (22, N'Gà rán 04', N'GaRan04.png', N'3 miếng gà bất kỳ chiên giòn', 3, 90000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (23, N'Gà rán 05', N'GaRan05.png', N'6 miếng gà bất kỳ chiên giòn', 3, 180000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (24, N'Gà rán 06', N'GaRan06.png', N'8 miếng gà bất kỳ chiên giòn', 3, 240000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (25, N'Gà rán 07', N'GaRan07.png', N'12 miếng gà bất kỳ chiên giòn', 3, 300000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (26, N'Khoai tây chiên nhỏ', N'Potato01.png', N'1 phần khoai tây chiên nhỏ', 4, 25000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (27, N'Khoai tây chiên vừa', N'Potato02.png', N'1 phần khoai tây chiên vừa', 4, 25000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (28, N'Khoai tây chiên lớn', N'Potato03.png', N'1 phần khoai tây chiên lớn', 4, 25000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (29, N'Salad trộn', N'Salad.png', N'1 phần salad trộn giấm chua ngọt', 4, 25000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (30, N'Coca', N'Coca.png', N'1 ly Coca (700ml)', 5, 15000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (31, N'Fanta', N'Fanta.png', N'1 ly Fanta cam (700ml)', 5, 15000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (32, N'Sprite', N'Sprite.png', N'1 ly Sprite (700ml)', 5, 15000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (33, N'Milo', N'Milo.png', N'1 hộp sữa Milo', 5, 15000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (34, N'Milk', N'Milk.png', N'1 hộp sữa TH TrueMilk', 5, 15000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (35, N'Kem Vani Chocolate', N'Cream01.png', N'1 ly kem vị vani và chocolate', 6, 30000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (36, N'Kem Oreo', N'Cream02.png', N'1 ly kem vị vani phủ bánh oreo', 6, 30000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (37, N'Kem Matcha', N'Cream03.png', N'1 ly kem vị trà xanh', 6, 30000)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImage], [ProDes], [CatId], [ProPrice]) VALUES (38, N'Kem dâu', N'Cream04.png', N'1 ly kem vị dâu tây', 6, 30000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductReview] ON 

INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (1, 2, 2, 5, N'Hamburger rất ngon', CAST(N'2023-12-29T02:22:40.010' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (2, 1, 2, 0, N'Bánh ngon lắm nha mọi người', CAST(N'2023-12-29T15:00:50.530' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (3, 3, 2, 0, N'Cũng tạm được, bánh hơi nhỏ', CAST(N'2023-12-29T15:03:28.700' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (4, 19, 2, 0, N'Gà ngon, giòn, không bị khô', CAST(N'2023-12-29T15:06:06.223' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (5, 5, 2, 5, N'Combo nhiều và rẻ lắm nhaaa', CAST(N'2023-12-29T15:08:13.363' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (6, 5, 2, 2, N'Ăn cũng ngon nha mọi người', CAST(N'2023-12-29T15:08:26.140' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (7, 5, 2, 4, N'Cũng tạm', CAST(N'2023-12-29T15:08:38.310' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (8, 2, 2, 2, N'Ăn cũng được', CAST(N'2023-12-29T15:35:59.280' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (9, 11, 2, 0, N'Bánh ngon quá trời', CAST(N'2023-12-29T16:10:00.227' AS DateTime))
INSERT [dbo].[ProductReview] ([ReviewId], [ProId], [AccId], [Rating], [Comment], [ReviewDate]) VALUES (10, 11, 2, 5, N'tuyệt', CAST(N'2023-12-29T16:10:09.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductReview] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Employee')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 31/12/2023 6:25:02 CH ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Phone]    Script Date: 31/12/2023 6:25:02 CH ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_SP_LSP] FOREIGN KEY([CatId])
REFERENCES [dbo].[Category] ([CatId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_SP_LSP]
GO
ALTER TABLE [dbo].[ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_Account] FOREIGN KEY([AccId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[ProductReview] CHECK CONSTRAINT [FK_ProductReview_Account]
GO
ALTER TABLE [dbo].[ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_Product] FOREIGN KEY([ProId])
REFERENCES [dbo].[Product] ([ProId])
GO
ALTER TABLE [dbo].[ProductReview] CHECK CONSTRAINT [FK_ProductReview_Product]
GO
USE [master]
GO
ALTER DATABASE [BurgerKingDatabase] SET  READ_WRITE 
GO

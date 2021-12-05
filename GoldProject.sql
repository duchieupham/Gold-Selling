-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by phamduchieu at 31-08-2020 23:24.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE dbo.Account
IF OBJECT_ID('dbo.Account', 'U') IS NOT NULL
DROP TABLE dbo.Account;
GO

CREATE TABLE dbo.Account (
	userID varchar(50) NOT NULL,
	password nvarchar(max) NOT NULL,
	firstname nvarchar(50) NULL,
	lastname nvarchar(50) NULL,
	email nvarchar(50) NULL,
	emailID nvarchar(50) NULL,
	address nvarchar(max) NULL,
	roleID int NULL,
	isDisable bit NULL
);
GO

ALTER TABLE dbo.Account ADD CONSTRAINT PK__Account__CB9A1CDFFC60230D PRIMARY KEY (userID);
GO

-- Inserting 4 rows into dbo.Account
-- Insert batch #1
INSERT INTO dbo.Account (userID, password, firstname, lastname, email, emailID, address, roleID, isDisable) VALUES
('blackpink', '34bcbcb5cff71537b3ccee484633d6b3a0e7bed634bcbf1973f26f3b612a68f4', 'Black', 'Pink', NULL, NULL, 'Korea', 4, 0),
('duchieuadmin', 'd54891e5fa729bc90a76f4a91f3fe0abf2417bf126686b4d211548c891ab4bf4', 'Hieu', 'Pham Duc', 'duchieupham1709@gmail.com', '112790583739149931991', 'ABC dat de di ia', 4, 0),
('duchieucustomer', '34bcbcb5cff71537b3ccee484633d6b3a0e7bed634bcbf1973f26f3b612a68f4', 'Xiao', 'Fan De', 'hieupdse62402@fpt.edu.vn', '116325077216002937528', '123 abc', 5, 0),
('motconvit', '708180ea62a8991d3b407f8abb917ef8012c586d937a0e4320e83a0cceb6cc92', 'Vit', 'Con', NULL, NULL, 'ABC dat de di ie', 5, 0);

-- END TABLE dbo.Account

-- BEGIN TABLE dbo.Bill
IF OBJECT_ID('dbo.Bill', 'U') IS NOT NULL
DROP TABLE dbo.Bill;
GO

CREATE TABLE dbo.Bill (
	billID int NOT NULL IDENTITY(1,1),
	userID varchar(50) NULL,
	dateOrder date NULL,
	totalBill float(8) NULL,
	isDisable bit NULL
);
GO

ALTER TABLE dbo.Bill ADD CONSTRAINT PK__Bill__6D903F234089C3B6 PRIMARY KEY (billID);
GO

-- Table dbo.Bill contains no data. No inserts have been genrated.
-- Inserting 0 rows into dbo.Bill


-- END TABLE dbo.Bill

-- BEGIN TABLE dbo.BillDetail
IF OBJECT_ID('dbo.BillDetail', 'U') IS NOT NULL
DROP TABLE dbo.BillDetail;
GO

CREATE TABLE dbo.BillDetail (
	billDetailID int NOT NULL IDENTITY(1,1),
	billID int NULL,
	productID int NULL,
	unitPrice float(8) NULL,
	quantity int NULL,
	isDisable bit NULL
);
GO

ALTER TABLE dbo.BillDetail ADD CONSTRAINT PK__BillDeta__C57B0CBA5E91AD69 PRIMARY KEY (billDetailID);
GO

-- Table dbo.BillDetail contains no data. No inserts have been genrated.
-- Inserting 0 rows into dbo.BillDetail


-- END TABLE dbo.BillDetail

-- BEGIN TABLE dbo.Brand
IF OBJECT_ID('dbo.Brand', 'U') IS NOT NULL
DROP TABLE dbo.Brand;
GO

CREATE TABLE dbo.Brand (
	brandID int NOT NULL IDENTITY(1,1),
	brandName nvarchar(max) NULL DEFAULT (NULL),
	isDisable bit NOT NULL,
	description nvarchar(max) NULL DEFAULT (NULL)
);
GO

ALTER TABLE dbo.Brand ADD CONSTRAINT PK__Brand__06B772B986D156D7 PRIMARY KEY (brandID);
GO

-- Inserting 6 rows into dbo.Brand
-- Insert batch #1
INSERT INTO dbo.Brand (brandID, brandName, isDisable, description) VALUES
(1, 'Bulgari', 0, 'At Bvlgari, we strongly believe that traceability and transparency should permeate all the activities implemented by the company'),
(2, 'Cartier', 0, 'Bonds that are never broken, even from afar: Trinity de Cartier'),
(3, 'PNJ', 0, 'Trang sức PNJ, tinh tế trong từng chi tiết'),
(4, 'Van Cleef & Arpels', 0, 'Since its creation, the Maison draws its inspiration from the beauty of nature to create the most beautiful pieces'),
(5, 'Harry Winston', 0, 'Satisfy your sweetest cravings and make vibrant memories this summer with Winston Candy'),
(6, 'SJC', 0, 'Vàng nhẫn SJC. Tích lũy, vững bền');

-- END TABLE dbo.Brand

-- BEGIN TABLE dbo.Category
IF OBJECT_ID('dbo.Category', 'U') IS NOT NULL
DROP TABLE dbo.Category;
GO

CREATE TABLE dbo.Category (
	catID int NOT NULL IDENTITY(1,1),
	catName nvarchar(50) NULL,
	isDisable bit NOT NULL
);
GO

ALTER TABLE dbo.Category ADD CONSTRAINT PK__Category__17B6DD266E75B7C9 PRIMARY KEY (catID);
GO

-- Inserting 5 rows into dbo.Category
-- Insert batch #1
INSERT INTO dbo.Category (catID, catName, isDisable) VALUES
(1, 'Ring', 0),
(2, 'Necklaces', 0),
(3, 'Bracelets', 0),
(4, 'Earing', 0),
(5, 'Gold Bar', 0);

-- END TABLE dbo.Category

-- BEGIN TABLE dbo.Img
IF OBJECT_ID('dbo.Img', 'U') IS NOT NULL
DROP TABLE dbo.Img;
GO

CREATE TABLE dbo.Img (
	imgID int NOT NULL IDENTITY(1,1),
	imgURL nvarchar(max) NULL,
	userID varchar(50) NULL,
	productID int NULL,
	brandID int NULL,
	isDisable bit NULL
);
GO

ALTER TABLE dbo.Img ADD CONSTRAINT PK__Img__C5BC81869D0397DD PRIMARY KEY (imgID);
GO

-- Inserting 115 rows into dbo.Img
-- Insert batch #1
INSERT INTO dbo.Img (imgID, imgURL, userID, productID, brandID, isDisable) VALUES
(1, 'bulgari.png', NULL, NULL, 1, 0),
(2, 'cartier.png', NULL, NULL, 2, 0),
(3, 'pnj.png', NULL, NULL, 3, 0),
(4, 'vancleef&arpels.png', NULL, NULL, 4, 0),
(5, 'harrywinston.png', NULL, NULL, 5, 0),
(6, 'sjc.png', NULL, NULL, 6, 0),
(47, '121-1.jp2', NULL, 121, NULL, 0),
(48, '121.jp2', NULL, 121, NULL, 0),
(49, '122-1.jp2', NULL, 122, NULL, 0),
(50, '122.jp2', NULL, 122, NULL, 0),
(51, '123-1.png', NULL, 123, NULL, 0),
(52, '123.png', NULL, 123, NULL, 0),
(53, '123-2.png', NULL, 123, NULL, 0),
(54, '124.png', NULL, 124, NULL, 0),
(55, '124-1.png', NULL, 124, NULL, 0),
(56, '125-1.png', NULL, 125, NULL, 0),
(57, '125-2.png', NULL, 125, NULL, 0),
(58, '125.png', NULL, 125, NULL, 0),
(59, '126.png', NULL, 126, NULL, 0),
(60, '126-1.png', NULL, 126, NULL, 0),
(61, '126-2.png', NULL, 126, NULL, 0),
(62, '127.png', NULL, 127, NULL, 0),
(63, '127-1.png', NULL, 127, NULL, 0),
(64, '128.png', NULL, 128, NULL, 0),
(65, '129.png', NULL, 129, NULL, 0),
(66, '129-1.png', NULL, 129, NULL, 0),
(67, '130.png', NULL, 130, NULL, 0),
(68, '130-1.png', NULL, 130, NULL, 0),
(69, '131.png', NULL, 131, NULL, 0),
(70, '132.png', NULL, 132, NULL, 0),
(71, '133.png', NULL, 133, NULL, 0),
(72, '133-1.png', NULL, 133, NULL, 0),
(73, '134.png', NULL, 134, NULL, 0),
(74, '134-1.png', NULL, 134, NULL, 0),
(75, '135.png', NULL, 135, NULL, 0),
(76, '135-1.png', NULL, 135, NULL, 0),
(77, '136.png', NULL, 136, NULL, 0),
(78, '136-1.png', NULL, 136, NULL, 0),
(79, '137.png', NULL, 137, NULL, 0),
(80, '137-1.png', NULL, 137, NULL, 0),
(81, '138.png', NULL, 138, NULL, 0),
(82, '138-1.png', NULL, 138, NULL, 0),
(83, '139.png', NULL, 139, NULL, 0),
(84, '139-1.png', NULL, 139, NULL, 0),
(85, '140.png', NULL, 140, NULL, 0),
(86, '140-1.png', NULL, 140, NULL, 0),
(87, '141.png', NULL, 141, NULL, 0),
(88, '141-1.png', NULL, 141, NULL, 0),
(89, '142.png', NULL, 142, NULL, 0),
(90, '143.png', NULL, 143, NULL, 0),
(91, '144.png', NULL, 144, NULL, 0),
(92, '151.png', NULL, 151, NULL, 0),
(93, '151-1.png', NULL, 151, NULL, 0),
(94, '152.png', NULL, 152, NULL, 0),
(95, '152-1.png', NULL, 152, NULL, 0),
(96, '153.png', NULL, 153, NULL, 0),
(97, '153-1.png', NULL, 153, NULL, 0),
(98, '153-2.png', NULL, 153, NULL, 0),
(99, '154.png', NULL, 154, NULL, 0),
(100, '154-1.png', NULL, 154, NULL, 0),
(101, '154-2.png', NULL, 154, NULL, 0),
(102, '155.png', NULL, 155, NULL, 0),
(103, '155-1.png', NULL, 155, NULL, 0),
(104, '155-2.png', NULL, 155, NULL, 0),
(105, '156.png', NULL, 156, NULL, 0),
(106, '156-1.png', NULL, 156, NULL, 0),
(107, '156-2.png', NULL, 156, NULL, 0),
(108, '157.png', NULL, 157, NULL, 0),
(109, '158.png', NULL, 158, NULL, 0),
(110, '159.png', NULL, 159, NULL, 0),
(111, '159-1.png', NULL, 159, NULL, 0),
(112, '160.png', NULL, 160, NULL, 0),
(113, '160-1.png', NULL, 160, NULL, 0),
(114, '161.png', NULL, 161, NULL, 0),
(115, '162.png', NULL, 162, NULL, 0),
(116, '169.jp2', NULL, 169, NULL, 0),
(117, '169-1.jp2', NULL, 169, NULL, 0),
(118, '169-2.jp2', NULL, 169, NULL, 0),
(119, '170.jp2', NULL, 170, NULL, 0),
(120, '170-1.jp2', NULL, 170, NULL, 0),
(121, '171.png', NULL, 171, NULL, 0),
(122, '171-1.png', NULL, 171, NULL, 0),
(123, '172.png', NULL, 172, NULL, 0),
(124, '172-1.png', NULL, 172, NULL, 0),
(125, '172-2.png', NULL, 172, NULL, 0),
(126, '173.png', NULL, 173, NULL, 0),
(127, '173-1.png', NULL, 173, NULL, 0),
(128, '173-2.png', NULL, 173, NULL, 0),
(129, '174.png', NULL, 174, NULL, 0),
(130, '174-1.png', NULL, 174, NULL, 0),
(131, '175.png', NULL, 175, NULL, 0),
(132, '176.png', NULL, 176, NULL, 0),
(133, '176-1.png', NULL, 176, NULL, 0),
(134, '177.png', NULL, 177, NULL, 0),
(135, '177-1.png', NULL, 177, NULL, 0),
(136, '178.png', NULL, 178, NULL, 0),
(137, '178-1.png', NULL, 178, NULL, 0),
(138, '179.png', NULL, 179, NULL, 0),
(139, '180.png', NULL, 180, NULL, 0),
(140, '181.png', NULL, 181, NULL, 0),
(141, '182.png', NULL, 182, NULL, 0),
(142, '183.png', NULL, 183, NULL, 0),
(143, '184.png', NULL, 184, NULL, 0),
(144, '185.png', NULL, 185, NULL, 0),
(147, '1148800.png', NULL, 199, NULL, 0),
(148, '1148800.png', NULL, 200, NULL, 0),
(149, '1086044.png', NULL, 201, NULL, 0),
(150, '1148800.png', NULL, 202, NULL, 0),
(151, '1086044.png', NULL, 203, NULL, 0),
(152, '1148800.png', NULL, 204, NULL, 0),
(153, '1148800.png', NULL, 206, NULL, 0),
(154, '1148800.png', NULL, 207, NULL, 0),
(155, '1148800.png', NULL, 208, NULL, 0),
(156, '1086044.png', NULL, 209, NULL, 0),
(157, '183.png', NULL, 211, NULL, 0);

-- END TABLE dbo.Img

-- BEGIN TABLE dbo.Product
IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL
DROP TABLE dbo.Product;
GO

CREATE TABLE dbo.Product (
	productID int NOT NULL IDENTITY(1,1),
	productName nvarchar(50) NULL,
	price float(8) NULL DEFAULT (NULL),
	quantity int NULL,
	catID int NULL,
	brandID int NULL,
	isDisable bit NULL,
	thumbnailImg int NULL DEFAULT (NULL)
);
GO

ALTER TABLE dbo.Product ADD CONSTRAINT PK__Product__2D10D14AA8B0FE97 PRIMARY KEY (productID);
GO

-- Inserting 64 rows into dbo.Product
-- Insert batch #1
INSERT INTO dbo.Product (productID, productName, price, quantity, catID, brandID, isDisable, thumbnailImg) VALUES
(121, 'Bulgari 357516', 5430.39990234375, 18, 1, 1, 0, 47),
(122, 'Bulgari 357231', 2721.580078125, 1, 1, 1, 0, 50),
(123, 'Juste Un Cloud Ring SM', 3050, 20, 1, 2, 0, 51),
(124, 'Trinity Ring Classic', 1260, 13, 1, 2, 0, 54),
(125, 'Nhẫn cưới Kim cương Vàng 18K D536', 152.61, 20, 1, 3, 0, 56),
(126, 'Nhẫn cưới Kim cương Vàng 18K D537', 2520.42, 20, 1, 3, 0, 59),
(127, 'Perlée couleurs Between the Finger Ring', 7378.27, 20, 1, 4, 0, 62),
(128, 'Two Butterfly Between the Finger Ring', 18649.86, 20, 1, 4, 0, 64),
(129, 'Lily Cluster by Harry Winston', 12200, 20, 1, 5, 0, 65),
(130, 'Winston Gates by Harry Winston', 8750, 20, 1, 5, 0, 67),
(131, 'NUTG0017', 300, 20, 1, 6, 0, 69),
(132, 'NURG0082', 555, 20, 1, 6, 0, 70),
(133, 'Bulgari 357546', 3550.13, 20, 2, 1, 0, 71),
(134, 'Bulgari 357313', 3845.97, 20, 2, 1, 0, 73),
(135, 'LOVE NECKLACE', 2160, 20, 2, 2, 0, 75),
(136, 'TRINITY NECKLACE', 1300, 20, 2, 2, 0, 77),
(137, 'Dây chuyền Vàng 18K PNJ kiểu dây đan dập', 93.47, 20, 2, 3, 0, 79),
(138, 'Dây chuyền Vàng 18K PNJ dây khít xoắn', 134.25, 20, 2, 3, 0, 81),
(139, 'Perlée diamonds pendant', 12980, 20, 2, 4, 0, 83),
(140, 'Two Butterfly pendant', 20900, 20, 2, 4, 0, 85),
(141, 'Sautoir Necklace in Yellow Gold', 18500, 20, 2, 5, 0, 87),
(142, 'Diamond Necklace in Yellow Gold', 24050, 20, 2, 5, 0, 89),
(143, 'MDRG0208', 520, 20, 2, 6, 0, 90),
(144, 'MDRG0186', 340, 20, 2, 6, 0, 91),
(151, 'Bulgari 357390', 3194.63, 20, 3, 1, 0, 92),
(152, 'Bulgari 357564', 3431.27, 20, 3, 1, 0, 94),
(153, 'LOVE BRACELET', 6300, 20, 3, 2, 0, 96),
(154, 'JUSTE UN CLOU BRACELET SM', 3050, 20, 3, 2, 0, 99),
(155, 'Vòng tay Vàng 18K đính đá Ruby PNJ RBXMY000050', 1913.62, 20, 3, 3, 0, 102),
(156, 'Vòng tay Vàng 18K CTXMY000059', 1811.31, 20, 3, 3, 0, 105),
(157, 'Frivole bracelet, 7 flowers, medium model', 32050, 20, 3, 4, 0, 108),
(158, 'Perlée couleurs bracelet, medium model', 28700, 20, 3, 4, 0, 109),
(159, 'Lily Bracelet by Harry Winston', 20780, 20, 3, 5, 0, 110),
(160, 'Yellow Gold Diamond Bracelet', 23410, 20, 3, 5, 0, 112),
(161, 'VTRC0009', 1220, 20, 3, 6, 0, 114),
(162, 'VTTC0002', 780, 20, 3, 6, 0, 115),
(169, 'Bulgari 357940', 6036.23, 20, 4, 1, 0, 116),
(170, 'Bulgari 356873', 3479.71, 20, 4, 1, 0, 119),
(171, 'LOVE EARRINGS', 1700, 20, 4, 2, 0, 121),
(172, 'TRINITY EARRINGS', 2300, 20, 4, 2, 0, 123),
(173, 'Bông tai Vàng 18K đính đá CZ PNJ XMXMY000053', 109.34, 20, 4, 3, 0, 127),
(174, 'Bông tai Vàng 10K XMXMC000042', 105.5, 20, 4, 3, 0, 129),
(175, 'Perlée diamonds earrings', 3030, 20, 4, 4, 0, 131),
(176, 'Cosmos earrings, small model', 3120, 20, 4, 4, 0, 133),
(177, 'Diamond Earrings in Rose Gold', 2500, 20, 4, 5, 0, 134),
(178, 'Emerald and Diamond Earrings', 3200, 20, 4, 5, 0, 136),
(179, 'BTRG0095', 200, 20, 4, 6, 0, 138),
(180, 'BTRC0020', 106.5, 20, 4, 6, 0, 139),
(181, 'Vàng SJC 5 chỉ', 230, 20, 5, 6, 0, 140),
(182, 'Vàng SJC 2 chỉ', 150, 20, 5, 6, 0, 141),
(183, 'Nhẫn SJC 5 phân', 389, 20, 5, 6, 0, 142),
(184, 'Vàng Miếng Lộc PNJ', 230, 20, 5, 3, 0, 143),
(185, 'Vàng Miếng Tài PNJ', 233, 20, 5, 3, 0, 144),
(199, 'Nhan Bulgari', 3000, 20, 1, 1, 1, 147),
(200, 'Bulgari Ring New', 3200, 20, 1, 1, 1, 148),
(201, 'Do it like lalalala Oh yeah', 21000, 20, 2, 1, 1, 149),
(202, 'RingBulgari', 2324.429931640625, 20, 1, 1, 1, 150),
(203, 'neceleck', 23123.19921875, 21, 2, 1, 1, 151),
(204, 'do it like lalala', 212.2220001220703, 21, 4, 3, 1, 152),
(206, 'New Ring Bulgari', 2020.199951171875, 12, 1, 1, 1, 153),
(207, 'hahahaha', 23121.220703125, 13, 2, 1, 1, 154),
(208, 'Day chuyen', 21223.212890625, 29, 2, 2, 0, 155),
(209, 'asda', 2131.22998046875, 21, 1, 1, 1, 156),
(211, 'LALALALA', 21332.2109375, 12, 2, 3, 0, 157);

-- END TABLE dbo.Product

-- BEGIN TABLE dbo.Role
IF OBJECT_ID('dbo.Role', 'U') IS NOT NULL
DROP TABLE dbo.Role;
GO

CREATE TABLE dbo.Role (
	roleID int NOT NULL IDENTITY(1,1),
	roleName nvarchar(50) NULL DEFAULT (NULL),
	isDisable bit NULL
);
GO

ALTER TABLE dbo.Role ADD CONSTRAINT PK__Role__CD98460ABC4906BF PRIMARY KEY (roleID);
GO

-- Inserting 2 rows into dbo.Role
-- Insert batch #1
INSERT INTO dbo.Role (roleID, roleName, isDisable) VALUES
(4, 'Adminstrator', 0),
(5, 'Customer', 0);

-- END TABLE dbo.Role

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.getAccessoriesProductPaging') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.getAccessoriesProductPaging
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE getAccessoriesProductPaging
@PageIndex INT,
@PageSize INT

AS


BEGIN

-- Declare the index
	DECLARE @FromIndex INT, @ToIndex INT
	SET @FromIndex=(@PageIndex-1) * @PageSize + 1
	SET @ToIndex = @PageIndex * @PageSize

	SELECT *
	FROM 
	(SELECT a.productID, a.productName, a.price, a.quantity, b.catName, c.brandName, d.imgURL, a.isDisable,
	ROW_NUMBER() OVER(ORDER BY a.productID) AS rowIndex 
	FROM dbo.Product a
	JOIN dbo.Category b 
	ON a.catID = b.catID 
	JOIN dbo.Brand c
	ON a.brandID = c.brandID
	JOIN dbo.Img d
	ON a.thumbnailImg = d.imgID
	WHERE a.isDisable = 0 AND b.catName != 'Gold Bar') AS ProductPaging
	WHERE ProductPaging.rowIndex BETWEEN @FromIndex AND @ToIndex

END
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.getAccessoriesSize') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.getAccessoriesSize
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE getAccessoriesSize
AS
BEGIN

  	SELECT COUNT(*) as sizeProduct
	FROM dbo.Product WHERE catID != 5 AND isDisable = 0

END
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.getAllProduct') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.getAllProduct
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE getAllProduct
AS
BEGIN

SELECT a.productID, a.productName, a.price, a.quantity, b.catName, c.brandName, d.imgURL, a.isDisable 
	FROM dbo.Product a
	JOIN dbo.Category b 
	ON a.catID = b.catID 
	JOIN dbo.Brand c
	ON a.brandID = c.brandID
	JOIN dbo.Img d
	ON a.thumbnailImg = d.imgID
	WHERE a.isDisable = 0
END
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.getGoldBarProductPaging') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.getGoldBarProductPaging
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE getGoldBarProductPaging
@PageIndex INT,
@PageSize INT

AS


BEGIN

-- Declare the index
	DECLARE @FromIndex INT, @ToIndex INT
	SET @FromIndex=(@PageIndex-1) * @PageSize + 1
	SET @ToIndex = @PageIndex * @PageSize

	SELECT *
	FROM 
	(SELECT a.productID, a.productName, a.price, a.quantity, b.catName, c.brandName, d.imgURL, a.isDisable,
	ROW_NUMBER() OVER(ORDER BY a.productID) AS rowIndex 
	FROM dbo.Product a
	JOIN dbo.Category b 
	ON a.catID = b.catID 
	JOIN dbo.Brand c
	ON a.brandID = c.brandID
	JOIN dbo.Img d
	ON a.thumbnailImg = d.imgID
	WHERE a.isDisable = 0 AND b.catName = 'Gold Bar') AS ProductPaging
	WHERE ProductPaging.rowIndex BETWEEN @FromIndex AND @ToIndex

END
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.getGoldBarSize') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.getGoldBarSize
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE getGoldBarSize
AS
BEGIN

  	SELECT COUNT(*) as sizeProduct
	FROM dbo.Product WHERE catID = 5 AND isDisable = 0

END
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.getImgProductByProductID') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.getImgProductByProductID
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE getImgProductByProductID
	@PID INT
AS
BEGIN

	SELECT b.imgID, b.imgURL, b.isDisable
	FROM dbo.Product a
	JOIN dbo.Img b
	ON a.productID = b.productID
	WHERE a.productID = @PID and b.isDisable = 0

END
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.GetProductByID') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.GetProductByID
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE GetProductByID
 @PID INT
AS
BEGIN
	
	SELECT a.productID, a.productName, a.price, a.quantity, b.catName, c.brandName, a.thumbnailImg, a.isDisable 
	FROM dbo.Product a
	JOIN dbo.Category b 
	ON a.catID = b.catID 
	JOIN dbo.Brand c
	ON a.brandID = c.brandID
	WHERE a.productID = @PID AND a.isDisable = 0

END
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.getProductPagingByBrandID') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.getProductPagingByBrandID
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE getProductPagingByBrandID
@PageIndex INT,
@PageSize INT,
@BID INT

AS


BEGIN

-- Declare the index
	DECLARE @FromIndex INT, @ToIndex INT
	SET @FromIndex=(@PageIndex-1) * @PageSize + 1
	SET @ToIndex = @PageIndex * @PageSize

	SELECT *
	FROM 
	(SELECT a.productID, a.productName, a.price, a.quantity, b.catName, c.brandName, d.imgURL, a.isDisable,
	ROW_NUMBER() OVER(ORDER BY a.productID) AS rowIndex 
	FROM dbo.Product a
	JOIN dbo.Category b 
	ON a.catID = b.catID 
	JOIN dbo.Brand c
	ON a.brandID = c.brandID
	JOIN dbo.Img d
	ON a.thumbnailImg = d.imgID
	WHERE a.brandID = @BID AND a.isDisable = 0) AS ProductPaging
	WHERE ProductPaging.rowIndex BETWEEN @FromIndex AND @ToIndex

END
GO

IF EXISTS ( SELECT * FROM sysobjects WHERE  id = object_id(N'dbo.getSizeProductByBrandID') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	DROP PROCEDURE dbo.getSizeProductByBrandID
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE getSizeProductByBrandID
 @PID INT
AS
BEGIN

	SELECT COUNT(productID) as sizeProduct 
	FROM dbo.Product
	WHERE brandID = @PID and isDisable = 0

END
GO

IF OBJECT_ID('dbo.Account', 'U') IS NOT NULL AND OBJECT_ID('dbo.Role', 'U') IS NOT NULL
	ALTER TABLE dbo.Account
	ADD CONSTRAINT FK__Account__roleID__38996AB5
	FOREIGN KEY (roleID)
	REFERENCES dbo.Role (roleID);

IF OBJECT_ID('dbo.Bill', 'U') IS NOT NULL AND OBJECT_ID('dbo.Account', 'U') IS NOT NULL
	ALTER TABLE dbo.Bill
	ADD CONSTRAINT FK__Bill__userID__625A9A57
	FOREIGN KEY (userID)
	REFERENCES dbo.Account (userID);

IF OBJECT_ID('dbo.BillDetail', 'U') IS NOT NULL AND OBJECT_ID('dbo.Product', 'U') IS NOT NULL
	ALTER TABLE dbo.BillDetail
	ADD CONSTRAINT FK__BillDetai__produ__662B2B3B
	FOREIGN KEY (productID)
	REFERENCES dbo.Product (productID);

IF OBJECT_ID('dbo.BillDetail', 'U') IS NOT NULL AND OBJECT_ID('dbo.Bill', 'U') IS NOT NULL
	ALTER TABLE dbo.BillDetail
	ADD CONSTRAINT FK__BillDetai__billI__65370702
	FOREIGN KEY (billID)
	REFERENCES dbo.Bill (billID);

IF OBJECT_ID('dbo.Img', 'U') IS NOT NULL AND OBJECT_ID('dbo.Brand', 'U') IS NOT NULL
	ALTER TABLE dbo.Img
	ADD CONSTRAINT FK__Img__brandID__628FA481
	FOREIGN KEY (brandID)
	REFERENCES dbo.Brand (brandID);

IF OBJECT_ID('dbo.Img', 'U') IS NOT NULL AND OBJECT_ID('dbo.Account', 'U') IS NOT NULL
	ALTER TABLE dbo.Img
	ADD CONSTRAINT FK__Img__userID__60A75C0F
	FOREIGN KEY (userID)
	REFERENCES dbo.Account (userID);

IF OBJECT_ID('dbo.Img', 'U') IS NOT NULL AND OBJECT_ID('dbo.Product', 'U') IS NOT NULL
	ALTER TABLE dbo.Img
	ADD CONSTRAINT FK__Img__productID__619B8048
	FOREIGN KEY (productID)
	REFERENCES dbo.Product (productID);

IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL AND OBJECT_ID('dbo.Brand', 'U') IS NOT NULL
	ALTER TABLE dbo.Product
	ADD CONSTRAINT FK__Product__brandID__59FA5E80
	FOREIGN KEY (brandID)
	REFERENCES dbo.Brand (brandID);

IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL AND OBJECT_ID('dbo.Category', 'U') IS NOT NULL
	ALTER TABLE dbo.Product
	ADD CONSTRAINT FK__Product__catID__59063A47
	FOREIGN KEY (catID)
	REFERENCES dbo.Category (catID);

IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL AND OBJECT_ID('dbo.Img', 'U') IS NOT NULL
	ALTER TABLE dbo.Product
	ADD CONSTRAINT FK_Product_thumnailID_imgID
	FOREIGN KEY (thumbnailImg)
	REFERENCES dbo.Img (imgID);


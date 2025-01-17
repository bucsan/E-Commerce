SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_OrderItemSubmit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_OrderItemSubmit] 
(
	@OrderID Int,
	@ProductID Int,
	@Price Money,
	@Quantity int	
)

AS

INSERT dev_OrderItems
(
	OrderID,
	ProductId,
	Price,
	Quantity
)

	VALUES
(
	@OrderID,
	@ProductID,
	@Price,
	@Quantity

)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_OrderSelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_OrderSelect]
(
	@OrderId Int
)
AS
SELECT
	OrderId,
	UserName,
	CCName,
	CCtype,
	CCNumber_Encrypted,
	CCExpiryMonth,
	CCExpiryYear,
	BillingStreet,
	BillingCity,
	BillingState,
	BillingPostalCode,
	BillingCountry,
	Email,
	ShippingStreet,
	ShippingCity,
	ShippingState,
	ShippingPostalCode,
	ShippingCountry,
	EntryDate
FROM
	dev_Orders
WHERe
	OrderId = @OrderId

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_OrderSelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_OrderSelectAll] 
AS
SELECT
	OrderID,
	UserName,
	CCName,
	CCtype,
	CCNumber_Encrypted,
	CCExpiryMonth,
	CCExpiryYear,
	BillingStreet,
	BillingCity,
	BillingState,
	BillingPostalCode,
	BillingCountry,
	Email,
	ShippingStreet,
	ShippingCity,
	ShippingState,
	ShippingPostalCode,
	ShippingCountry,
	EntryDate
FROM
	dev_Orders	


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_OrderSelectOrderItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_OrderSelectOrderItems]
(
	@OrderId Int
)
AS
SELECT
	dev_OrderItems.OrderItemsID,
	dev_Products.Title,
	dev_OrderItems.Price,
	dev_OrderItems.Quantity
FROM
	dev_OrderItems
JOIN
	dev_Products
ON
	dev_OrderItems.ProductId = dev_Products.ProductID
WHERE
	OrderId = @OrderId
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dev_Orders](
	[OrderID] [int] IDENTITY(17890,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[CCName] [nvarchar](200) NOT NULL,
	[CCType] [int] NOT NULL,
	[CCNumber_Encrypted] [varbinary](50) NOT NULL,
	[CCExpiryMonth] [int] NOT NULL,
	[CCExpiryYear] [int] NOT NULL,
	[BillingStreet] [nvarchar](200) NOT NULL,
	[BillingCity] [nvarchar](50) NOT NULL,
	[BillingState] [nvarchar](50) NOT NULL,
	[BillingPostalCode] [nvarchar](50) NOT NULL,
	[BillingCountry] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[ShippingStreet] [nvarchar](200) NOT NULL,
	[ShippingCity] [nvarchar](50) NOT NULL,
	[ShippingState] [nvarchar](50) NOT NULL,
	[ShippingPostalCode] [nvarchar](50) NOT NULL,
	[ShippingCountry] [nvarchar](50) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dev_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_OrderSubmit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_OrderSubmit] 
(
	@UserName NVarchar(50),
	@CCName NVarchar(200),
	@CCType Int,
	@CCNumber_Encrypted VarBinary(50),
	@CCExpiryMonth Int,
	@CCExpiryYear Int,
	@BillingStreet NVarchar(200),
	@BillingCity NVarchar(50),
	@BillingState NVarchar(50),
	@BillingPostalCode NVarchar(50),
	@BillingCountry NVarchar(50),
	@Email NVarchar(250),
	@ShippingStreet NVarchar(200),
	@ShippingCity NVarchar(50),	
	@ShippingState NVarchar(50),
	@ShippingPostalCode NVarchar(50),
	@ShippingCountry NVarchar(50)
	
)
AS

SET NOCOUNT ON

INSERT dev_Orders
(
	UserName,
	CCName,
	CCtype,
	CCNumber_Encrypted,
	CCExpiryMonth,
	CCExpiryYear,
	BillingStreet,
	BillingCity,
	BillingState,
	BillingPostalCode,
	BillingCountry,
	Email,
	ShippingStreet,
	ShippingCity,
	ShippingState,
	ShippingPostalCode,
	ShippingCountry,
	EntryDate
	
)
VALUES
(
	@UserName,
	@CCName,
	@CCtype,
	@CCNumber_Encrypted,
	@CCExpiryMonth,
	@CCExpiryYear,
	@BillingStreet,
	@BillingCity,
	@BillingState,
	@BillingPostalCode,
	@BillingCountry,
	@Email,
	@ShippingStreet,
	@ShippingCity,
	@ShippingState,
	@ShippingPostalCode,
	@ShippingCountry,
	GetDate()
)

SELECT SCOPE_IDENTITY()
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_ProductDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_ProductDelete]
(
	@ProductID Int
)
AS
DELETE dev_Products WHERE ProductID=@ProductID


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_ProductInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_ProductInsert] 
(
	@CategoryId INT,
	@Title NVarchar(256),
	@Description NVarchar(max),
	@Price Money,	
	@ImageURL NVarchar(256)
)
AS

INSERT dev_Products 
(
	CategoryId,
	Title,
	Description,	
	Price,		
	ImageURL
) 
	VALUES 
(
	@CategoryId,
	@Title,
	@Description,	
	@Price,	
	@ImageURL
)


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_ProductRandom]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_ProductRandom]

AS
SELECT  top 9   dev_Products.ProductID, dev_Products.CategoryID, dev_Categories.Title AS CategoryTitle, dev_Products.Title, 
                      dev_Products.Description, dev_Products.Price, dev_Products.ImageURL
FROM         dev_Categories INNER JOIN
                      dev_Products ON dev_Categories.CategoryID = dev_Products.CategoryID
ORDER BY NEWID()


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_ProductSelectByCategoryId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_ProductSelectByCategoryId]
(
	@CategoryID Int
)
AS
SELECT     dev_Products.ProductID, dev_Products.CategoryID, dev_Categories.Title AS CategoryTitle, dev_Products.Title, 
                      dev_Products.Description, dev_Products.Price, dev_Products.ImageURL
FROM         dev_Categories INNER JOIN
                      dev_Products ON dev_Categories.CategoryID = dev_Products.CategoryID
WHERE dev_Products.CategoryID = @CategoryId

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_ProductSelectById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_ProductSelectById]
(
	@ProductId Int
) 
AS
SELECT     dbo.dev_Products.ProductID, dbo.dev_Products.CategoryID, dbo.dev_Products.Title, dbo.dev_Products.Description, dbo.dev_Products.Price, 
                      dbo.dev_Categories.Title AS CategoryTitle, dbo.dev_Products.ImageURL
FROM         dbo.dev_Categories INNER JOIN
                      dbo.dev_Products ON dbo.dev_Categories.CategoryID = dbo.dev_Products.CategoryID
WHERE     (ProductId = @ProductId)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_ProductUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_ProductUpdate] 
(
	@ProductID INT,
	@CategoryID INT,
	@Title NVarchar(256),
	@Description NVarchar(max),
	@Price Money,
	@ImageURL NVarchar(256)
)
AS

UPDATE  dev_Products SET
	CategoryID = @CategoryId,
	Title = @Title,	
	Description = @Description,
	Price = @Price,
	ImageURL = @ImageURL
WHERE
	ProductID = @ProductID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_SelectAllCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_SelectAllCategory]
	
AS   SELECT CategoryID, Title FROM  dbo.dev_Categories
ORDER BY Title
	SET NOCOUNT ON 
	RETURN
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_SelectAllProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_SelectAllProduct]
	
AS   
SELECT dev_Products.ProductID, dev_Products.CategoryID, dev_Categories.Title AS CategoryTitle, dev_Products.Title, 
       dev_Products.Description, dev_Products.Price, dev_Products.ImageURL
FROM   dev_Categories INNER JOIN
       dev_Products ON dev_Categories.CategoryID = dev_Products.CategoryID
       ORDER BY   dev_Products.Title
	SET NOCOUNT ON 
	RETURN
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_CategoryDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_CategoryDelete] 
(
	@CategoryId Int
)
AS
DELETE 
	dev_Categories 
WHERE 
	CategoryId=@CategoryId 
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dev_Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_dev_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dev_Categories_AspNet_SqlCacheNotification_Trigger] ON [dbo].[dev_Categories]
                       FOR INSERT, UPDATE, DELETE AS BEGIN
                       SET NOCOUNT ON
                       EXEC dbo.AspNet_SqlCacheUpdateChangeIdStoredProcedure N'dev_Categories'
                       END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_CategoryInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[dev_CategoryInsert] 
(
	@Title NVarchar(150)	
)
AS

INSERT dev_Categories
(
	
	Title
) 
	VALUES 
(
	
	@Title
)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_CategorySelect]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_CategorySelect]
(
	@Id Int
)
AS
SELECT
	CategoryId,	
	Title	
FROM
	dev_Categories
WHERE 
	CategoryId = @Id
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_CategoryUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[dev_CategoryUpdate]
(
	@Id Int,
	@Title NVarchar(150)	
)
AS
UPDATE dev_Categories SET
	Title = @Title
	
WHERE CategoryID = @Id
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dev_Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[ImageURL] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dev_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dev_Products_AspNet_SqlCacheNotification_Trigger] ON [dbo].[dev_Products]
                       FOR INSERT, UPDATE, DELETE AS BEGIN
                       SET NOCOUNT ON
                       EXEC dbo.AspNet_SqlCacheUpdateChangeIdStoredProcedure N'dev_Products'
                       END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dev_OrderItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dev_OrderItems](
	[OrderItemsID] [int] IDENTITY(17890,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_dev_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemsID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dev_Products_dev_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[dev_Products]'))
ALTER TABLE [dbo].[dev_Products]  WITH CHECK ADD  CONSTRAINT [FK_dev_Products_dev_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[dev_Categories] ([CategoryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dev_OrderItems_dev_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[dev_OrderItems]'))
ALTER TABLE [dbo].[dev_OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_dev_OrderItems_dev_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[dev_Orders] ([OrderID])

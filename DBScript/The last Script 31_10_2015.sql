USE [master]
GO
/****** Object:  Database [KoontabiDB]    Script Date: 10/31/2015 23:51:06 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'KoontabiDB')
BEGIN
CREATE DATABASE [KoontabiDB] ON  PRIMARY 
( NAME = N'KoontabiDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\KoontabiDB.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KoontabiDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\KoontabiDB_1.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [KoontabiDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KoontabiDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KoontabiDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [KoontabiDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [KoontabiDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [KoontabiDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [KoontabiDB] SET ARITHABORT OFF
GO
ALTER DATABASE [KoontabiDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [KoontabiDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [KoontabiDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [KoontabiDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [KoontabiDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [KoontabiDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [KoontabiDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [KoontabiDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [KoontabiDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [KoontabiDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [KoontabiDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [KoontabiDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [KoontabiDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [KoontabiDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [KoontabiDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [KoontabiDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [KoontabiDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [KoontabiDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [KoontabiDB] SET  READ_WRITE
GO
ALTER DATABASE [KoontabiDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [KoontabiDB] SET  MULTI_USER
GO
ALTER DATABASE [KoontabiDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [KoontabiDB] SET DB_CHAINING OFF
GO
USE [KoontabiDB]
GO
/****** Object:  User [KoontabiUser]    Script Date: 10/31/2015 23:51:06 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'KoontabiUser')
CREATE USER [KoontabiUser] FOR LOGIN [KoontabiUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Municipalities]    Script Date: 10/31/2015 23:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Municipalities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Municipalities](
	[MunicipalityID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[ProvinceID] [int] NULL,
 CONSTRAINT [PK__municipa__8D313B0207020F21] PRIMARY KEY CLUSTERED 
(
	[MunicipalityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 10/31/2015 23:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provinces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Provinces](
	[ProvinceID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Zone] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/31/2015 23:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [nvarchar](15) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Unique_CategoryCode] UNIQUE NONCLUSTERED 
(
	[CategoryCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 10/31/2015 23:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bodega]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bodega](
	[BodegaID] [int] IDENTITY(1,1) NOT NULL,
	[BodegaName] [nvarchar](100) NOT NULL,
	[BodegaAddress] [nvarchar](100) NULL,
	[Phone] [nvarchar](15) NULL,
	[IndustrialRegistration] [nvarchar](20) NULL,
	[Email] [nvarchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[BodegaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/31/2015 23:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](30) NOT NULL,
	[DocumentIdentity] [nvarchar](15) NOT NULL,
	[EmpUserName] [nvarchar](30) NULL,
	[EmpPassword] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DocumentIdentity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Units]    Script Date: 10/31/2015 23:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Units]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Units](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitDescription] [varchar](100) NOT NULL,
	[Abbreviation] [nchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeOfPay]    Script Date: 10/31/2015 23:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeOfPay]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TypeOfPay](
	[TypeOfPayID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeOfPayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Taxes]    Script Date: 10/31/2015 23:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Taxes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Taxes](
	[TaxID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](7) NOT NULL,
	[TaxDescription] [nvarchar](max) NOT NULL,
	[TaxValue] [numeric](7, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Abbreviation] UNIQUE NONCLUSTERED 
(
	[Abbreviation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetCategories]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_GetCategories]
AS
	SELECT  0 AS CategoryID,''Seleccione..'' as CategoryName UNION ALL
	SELECT CategoryID,CategoryName FROM Categories
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllProvinces]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getAllProvinces]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[sp_getAllProvinces]
as
	begin 
		SELECT 0 AS ProvinceID ,'' Seleccione....'' AS Name UNION ALL
		SELECT  ProvinceID,Name FROM dbo.Provinces as p
		ORDER BY Name ASC
	end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetEmployeeToComboBox]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetEmployeeToComboBox]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_GetEmployeeToComboBox]
AS
SELECT 0 AS EmployeeID, ''Seleccione..'' as FullName UNION ALL
SELECT e.EmployeeID,e.FullName FROM Employees e
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllCategories]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetAllCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Sp_GetAllCategories]
AS
	SELECT CategoryID,CategoryCode,CategoryName,Description FROM Categories
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllBodega]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetAllBodega]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_GetAllBodega]
AS
SELECT * FROM Bodega 
ORDER BY BodegaName asc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllMunicipalitiesById]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getAllMunicipalitiesById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[sp_getAllMunicipalitiesById]
	@id int
as
	begin 
		SELECT 0 as MunicipalityID,'' Seleccione...'' as Name UNION ALL
		SELECT MunicipalityID,Name FROM Municipalities
		WHERE ProvinceID = @id
		ORDER BY Name
	end
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_TypeOfPay]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_TypeOfPay]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[Sp_TypeOfPay]
as
	SELECT 0 AS TypeOfPayID,''Seleccione..'' as Description
	UNION ALL
	SELECT TypeOfPayID,Description FROM TypeOfPay' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Taxes]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Taxes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_Taxes]
as
	SELECT 0 AS TaxID,''Seleccione..'' as TaxDescription
	UNION ALL
	SELECT TaxID,TaxDescription FROM Taxes
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUnits]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetUnits]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_GetUnits]
as
SELECT 0 AS UnitID, ''Seleccione...'' as UnitDescription
UNION ALL
SELECT UnitID,UnitDescription FROM Units
' 
END
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [nvarchar](15) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[CompanyOwner] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[DocumentID] [nvarchar](11) NULL,
	[Address1] [nvarchar](max) NOT NULL,
	[Address2] [nvarchar](max) NULL,
	[ProvinceID] [int] NULL,
	[MunicipalityID] [int] NULL,
	[Phone1] [nvarchar](10) NOT NULL,
	[Phone2] [nvarchar](10) NULL,
	[Cellphone] [nvarchar](12) NULL,
	[Email] [nvarchar](max) NULL,
	[BusinessRegistration] [nvarchar](20) NULL,
	[TaxRegistration] [nvarchar](20) NULL,
	[State] [int] NOT NULL,
	[DateAdmission] [datetime] NULL,
	[Birthday] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Unique_CustomerCode] UNIQUE NONCLUSTERED 
(
	[CustomerCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](30) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
	[Images] [image] NULL,
	[UnitID] [int] NULL,
	[State] [bit] NOT NULL,
	[InvoiceWithoutStock] [bit] NOT NULL,
	[InvoiceWithPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Unique_ProductCode] UNIQUE NONCLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductDetails](
	[ProductDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice1] [money] NULL,
	[UnitPrice2] [money] NULL,
	[UnitPrice3] [money] NULL,
	[ProductCost] [money] NOT NULL,
	[BodegaID] [int] NOT NULL,
	[TaxID] [int] NULL,
	[Stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductDetailsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoices]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[BodegaID] [int] NOT NULL,
	[TypeOfPayID] [int] NOT NULL,
	[TaxID] [int] NULL,
	[DisCount] [float] NULL,
	[ReferenceInvoice] [nvarchar](5) NOT NULL,
	[ExpirationInvoiceDate] [date] NOT NULL,
	[Comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[InvoiceNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ValidateProductCodeIfExit]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_ValidateProductCodeIfExit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Sp_ValidateProductCodeIfExit]
	@ProductCode nvarchar(30)
AS
	
BEGIN
	SELECT TOP 1 1 as Result FROM Products
	WHERE ProductCode = @ProductCode
	END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCustomerRadGridShowData]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAllCustomerRadGridShowData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[sp_GetAllCustomerRadGridShowData]
as 
	SELECT CustomerID,CustomerCode,CompanyName,
	CompanyOwner,ContactName,Phone1,Phone2,Cellphone FROM Customers
	WHERE  NOT Customers.State = 4
	ORDER BY CustomerID DESC
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ExitCustomerCode]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ExitCustomerCode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[sp_ExitCustomerCode] 
@CustomerCode nvarchar(15)
as
DECLARE @CodeResult int
SELECT @CodeResult =1  FROM Customers
WHERE CustomerCode = @CustomerCode
IF @CodeResult = 1
 /* Si existe un codigo esto se ejecuta de lo contrario el else*/
	SELECT 1 AS Code
ELSE
	SELECT 0 AS Code
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetCustomerByParam]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetCustomerByParam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Sp_GetCustomerByParam]
	@CustomerParam NVARCHAR(50)
AS
BEGIN
SELECT c.CustomerID,c.CustomerCode,c.CompanyName,c.ContactName,c.Address1,c.Phone1,p.Name as ''Province'',m.Name as ''Municipality'' FROM Customers c
INNER JOIN Provinces p
ON
c.ProvinceID = p.ProvinceID
INNER JOIN Municipalities m
ON
c.MunicipalityID = m.MunicipalityID
WHERE 
(@CustomerParam <> '''' AND c.CustomerCode = @CustomerParam) 
OR 
(@CustomerParam <> '''' AND c.CompanyName LIKE ''%''+ @CustomerParam + ''%'') 
OR
(@CustomerParam <> '''' AND c.CompanyOwner LIKE ''%''+ @CustomerParam+ ''%'') 
OR
(@CustomerParam <> '''' AND c.ContactName LIKE ''%''+ @CustomerParam+ ''%'') 
OR
(@CustomerParam <> '''' AND c.DocumentID = @CustomerParam) 
OR
(@CustomerParam <> '''' AND c.Address1 LIKE ''%''+ @CustomerParam+ ''%'') 
OR
(@CustomerParam <> '''' AND c.Phone1 LIKE ''%''+ @CustomerParam+ ''%'') 
OR
(@CustomerParam <> '''' AND c.Email LIKE ''%''+ @CustomerParam+ ''%'') 
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[SpValidateIfExitRefenceInvoice]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpValidateIfExitRefenceInvoice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[SpValidateIfExitRefenceInvoice]
@ReferenceInvoice NVARCHAR(10)
AS
BEGIN
SELECT 1 as ReferenceInvoice FROM Invoices where ReferenceInvoice = @ReferenceInvoice
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllProducts]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetAllProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Sp_GetAllProducts]
AS
	BEGIN
	SELECT   p.ProductName,
				 p.ProductID,
				p.ProductCode,
			  c.CategoryName,
			 pd.UnitPrice1,
			 pd.ProductCost,
			pd.Stock
FROM Products  p
LEFT JOIN
Categories c
ON
p.CategoryID = c.CategoryID
INNER JOIN
ProductDetails pd
ON
p.ProductID = pd.ProductID
ORDER BY p.ProductName ASC
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetLastInvoiceNumber]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetLastInvoiceNumber]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_GetLastInvoiceNumber]
AS
BEGIN
DECLARE @InvoiceNumberTemp int ;
SELECT @InvoiceNumberTemp = max(i.InvoiceNumber) FROM Invoices i
IF @InvoiceNumberTemp > 0
BEGIN
	SET @InvoiceNumberTemp = @InvoiceNumberTemp + 1
	select @InvoiceNumberTemp AS InvoiceNumber
END
ELSE
BEGIN
	SET @InvoiceNumberTemp = 1
	SELECT @InvoiceNumberTemp AS InvoiceNumber
END
END
' 
END
GO
/****** Object:  Table [dbo].[Kardex]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Kardex]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Kardex](
	[KardexID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[TypeOfMove] [nvarchar](30) NOT NULL,
	[KardexIn] [float] NULL,
	[KardexOut] [float] NULL,
	[KardexStock] [float] NOT NULL,
	[LastCost] [float] NULL,
	[AverageCost] [float] NULL,
	[ProductDetailsID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KardexID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InvoiceDetails](
	[InvoiceDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductDetailID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[KardexID] [int] NOT NULL,
	[TaxID] [int] NULL,
	[Discount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductByID]    Script Date: 10/31/2015 23:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetProductByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/*SELECT * FROM Products
SELECT * FROM ProductDetails
SELECT * FROM Kardex*/

CREATE PROCEDURE [dbo].[Sp_GetProductByID]
@ProductID INT
AS
BEGIN
SELECT 
			p.ProductID,
			p.ProductCode,
			p.ProductName,
			p.Description,
			pd.ProductCost,
			k.KardexIn,
			c.CategoryID,
			u.UnitID,
			pd.UnitPrice1,
			pd.UnitPrice2,
			pd.UnitPrice3,
			p.InvoiceWithPrice,
			p.InvoiceWithoutStock,
			p.State,
			t.TaxID,
			k.KardexID,
			pd.ProductDetailsID,
			Pd.BodegaID
						
FROM Products p
INNER JOIN ProductDetails pd
ON p.ProductID = pd.ProductID
INNER JOIN Kardex k
ON pd.ProductDetailsID = k.ProductDetailsID 
LEFT JOIN Categories c
ON p.CategoryID = c.CategoryID
LEFT JOIN Units u
ON P.UnitID = U.UnitID
LEFT JOIN Taxes t
ON pd.TaxID = t.TaxID
WHERE k.TypeOfMove LIKE ''%Inventario Inicial%''
AND p.ProductID = @ProductID
END
' 
END
GO
/****** Object:  View [dbo].[V_DisplayAllInvoices]    Script Date: 10/31/2015 23:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_DisplayAllInvoices]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_DisplayAllInvoices]
AS
SELECT
			I.InvoiceID,
			i.InvoiceNumber, 
			i.InvoiceDate,
			c.CompanyName,
			tp.Description as TypeOfP,
			SUM((id.Quantity * id.UnitPrice) - (((id.Quantity * id.UnitPrice)*(ISNULL(i.DisCount,0)*100))/100) +(((id.Quantity * id.UnitPrice)*ISNULL(t.TaxValue,0))/100) ) as Total
FROM InvoiceDetails id
INNER JOIN Invoices i
ON id.InvoiceID = i.InvoiceID
LEFT JOIN Taxes t
ON t.TaxID = i.TaxID
INNER JOIN
Customers c
ON i.CustomerID = c.CustomerID
INNER JOIN TypeOfPay tp
ON tp.TypeOfPayID = i.TypeOfPayID
GROUP BY i.InvoiceNumber, i.InvoiceDate,	c.CompanyName,tp.Description,I.InvoiceID;
'
GO
/****** Object:  Default [DF__Provinces__Zone__151B244E]    Script Date: 10/31/2015 23:51:08 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Provinces__Zone__151B244E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Provinces]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Provinces__Zone__151B244E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Provinces] ADD  DEFAULT ('') FOR [Zone]
END


End
GO
/****** Object:  Default [DF__Bodega__BodegaNa__114A936A]    Script Date: 10/31/2015 23:51:08 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Bodega__BodegaNa__114A936A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bodega]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Bodega__BodegaNa__114A936A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bodega] ADD  DEFAULT ('Inicial') FOR [BodegaName]
END


End
GO
/****** Object:  Default [DF__Products__State__1332DBDC]    Script Date: 10/31/2015 23:51:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Products__State__1332DBDC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Products__State__1332DBDC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [State]
END


End
GO
/****** Object:  Default [DF__Products__Invoic__14270015]    Script Date: 10/31/2015 23:51:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Products__Invoic__14270015]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Products__Invoic__14270015]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [InvoiceWithoutStock]
END


End
GO
/****** Object:  Default [DF__ProductDe__Stock__123EB7A3]    Script Date: 10/31/2015 23:51:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductDe__Stock__123EB7A3]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetails]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ProductDe__Stock__123EB7A3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDetails] ADD  DEFAULT ((0)) FOR [Stock]
END


End
GO
/****** Object:  Default [DF__Invoices__Refere__3864608B]    Script Date: 10/31/2015 23:51:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Invoices__Refere__3864608B]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Invoices__Refere__3864608B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ('') FOR [ReferenceInvoice]
END


End
GO
/****** Object:  ForeignKey [FK_Municipality]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Municipality]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Municipality] FOREIGN KEY([MunicipalityID])
REFERENCES [dbo].[Municipalities] ([MunicipalityID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Municipality]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Municipality]
GO
/****** Object:  ForeignKey [FK_Province]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Province]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Provinces] ([ProvinceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Province]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Province]
GO
/****** Object:  ForeignKey [FK_Category]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Category]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Products', N'CONSTRAINT',N'FK_Category'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RELACION CON LA TABLA CATEGORIA, MUCHOS PRODUCTO TIENEN UNA CATEGORIA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'CONSTRAINT',@level2name=N'FK_Category'
GO
/****** Object:  ForeignKey [FK_Unit]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Unit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([UnitID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Unit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Unit]
GO
/****** Object:  ForeignKey [FK_Bodega]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bodega]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetails]'))
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_Bodega] FOREIGN KEY([BodegaID])
REFERENCES [dbo].[Bodega] ([BodegaID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bodega]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetails]'))
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_Bodega]
GO
/****** Object:  ForeignKey [FK_Product]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetails]'))
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetails]'))
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_Product]
GO
/****** Object:  ForeignKey [FK_Tax]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tax]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetails]'))
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_Tax] FOREIGN KEY([TaxID])
REFERENCES [dbo].[Taxes] ([TaxID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tax]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDetails]'))
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_Tax]
GO
/****** Object:  ForeignKey [FK_Bodega2]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bodega2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Bodega2] FOREIGN KEY([BodegaID])
REFERENCES [dbo].[Bodega] ([BodegaID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bodega2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Bodega2]
GO
/****** Object:  ForeignKey [FK_Customer]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Customer]
GO
/****** Object:  ForeignKey [FK_Employee]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Employee]
GO
/****** Object:  ForeignKey [FK_Tax2]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tax2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Tax2] FOREIGN KEY([TaxID])
REFERENCES [dbo].[Taxes] ([TaxID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tax2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Tax2]
GO
/****** Object:  ForeignKey [FK_TypeOfPay]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TypeOfPay]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfPay] FOREIGN KEY([TypeOfPayID])
REFERENCES [dbo].[TypeOfPay] ([TypeOfPayID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TypeOfPay]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_TypeOfPay]
GO
/****** Object:  ForeignKey [FK_ProductDetails]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Kardex]'))
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails] FOREIGN KEY([ProductDetailsID])
REFERENCES [dbo].[ProductDetails] ([ProductDetailsID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Kardex]'))
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [FK_ProductDetails]
GO
/****** Object:  ForeignKey [FK_Invoice]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceDetails]'))
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceDetails]'))
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_Invoice]
GO
/****** Object:  ForeignKey [FK_InvoiceDetails_Kardex]    Script Date: 10/31/2015 23:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceDetails_Kardex]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceDetails]'))
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Kardex] FOREIGN KEY([KardexID])
REFERENCES [dbo].[Kardex] ([KardexID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceDetails_Kardex]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceDetails]'))
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Kardex]
GO

USE [master]
GO
/****** Object:  Database [KoontabiDB]    Script Date: 11/09/2015 21:50:34 ******/
CREATE DATABASE [KoontabiDB] ON  PRIMARY 
( NAME = N'KoontabiDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\KoontabiDB.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KoontabiDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\KoontabiDB_1.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [KoontabiUser]    Script Date: 11/09/2015 21:50:34 ******/
CREATE USER [KoontabiUser] FOR LOGIN [KoontabiUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Units](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitDescription] [varchar](100) NOT NULL,
	[Abbreviation] [nchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (23, N'Garrafón', N'GF    ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (24, N'Galón', N'GL    ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (25, N'1/2 GL', N'MGL   ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (26, N'56 Oz', N'56OZ  ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (27, N'16 Oz', N'16OZ  ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (28, N'8 Oz', N'8OZ   ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (29, N'12 Oz', N'12OZ  ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (30, N'4 Oz', N'4OZ   ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (31, N'32 Oz', N'32OZ  ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (32, N'2 Oz', N'2OZ   ')
INSERT [dbo].[Units] ([UnitID], [UnitDescription], [Abbreviation]) VALUES (34, N'Variados', N'VR    ')
SET IDENTITY_INSERT [dbo].[Units] OFF
/****** Object:  Table [dbo].[TypeOfPay]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfPay](
	[TypeOfPayID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeOfPayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TypeOfPay] ON
INSERT [dbo].[TypeOfPay] ([TypeOfPayID], [Abbreviation], [Description]) VALUES (1, N'CAST', N'Efectivo')
INSERT [dbo].[TypeOfPay] ([TypeOfPayID], [Abbreviation], [Description]) VALUES (2, N'CR', N'Credito')
INSERT [dbo].[TypeOfPay] ([TypeOfPayID], [Abbreviation], [Description]) VALUES (3, N'VISA', N'Tarjeta Visa')
INSERT [dbo].[TypeOfPay] ([TypeOfPayID], [Abbreviation], [Description]) VALUES (4, N'AMEX', N'American Express')
INSERT [dbo].[TypeOfPay] ([TypeOfPayID], [Abbreviation], [Description]) VALUES (5, N'MAST', N'Tarjeta Master')
SET IDENTITY_INSERT [dbo].[TypeOfPay] OFF
/****** Object:  Table [dbo].[Taxes]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Taxes] ON
INSERT [dbo].[Taxes] ([TaxID], [Abbreviation], [TaxDescription], [TaxValue]) VALUES (2, N'Imp1', N'Impuesto 18%', CAST(18.00 AS Numeric(7, 2)))
INSERT [dbo].[Taxes] ([TaxID], [Abbreviation], [TaxDescription], [TaxValue]) VALUES (3, N'Imp2', N'Impuesto 16%', CAST(16.00 AS Numeric(7, 2)))
SET IDENTITY_INSERT [dbo].[Taxes] OFF
/****** Object:  Table [dbo].[Provinces]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[ProvinceID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Zone] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (1, N'DISTRITO NACIONAL', N'SURESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (2, N'ALTAGRACIA', N'SURESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (3, N'AZUA', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (4, N'BAHORUCO', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (5, N'BARAHONA', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (6, N'DAJABON', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (7, N'DUARTE', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (8, N'EL SEIBO', N'SURESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (9, N'ELIAS PIÑA', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (10, N'ESPAILLAT', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (11, N'HATO MAYOR', N'SURESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (12, N'INDEPENDENCIA', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (13, N'LA ROMANA', N'SURESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (14, N'LA VEGA', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (15, N'MARIA TRINIDAD SANCHEZ', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (16, N'MONSEÑOR NOUEL', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (17, N'MONTECRISTI', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (18, N'MONTE PLATA', N'SURESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (19, N'PEDERNALES', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (20, N'PERAVIA', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (21, N'PUERTO PLATA', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (22, N'HERMANAS MIRABAL', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (23, N'SAMANA', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (24, N'SAN CRISTOBAL', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (25, N'SAN JUAN', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (26, N'SAN PEDRO DE MACORIS', N'SURESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (27, N'SANCHEZ RAMIREZ', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (28, N'SANTIAGO DE LOS CABALLEROS', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (29, N'SANTIAGO RODRIGUEZ', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (30, N'VALVERDE', N'NORTE O CIBAO')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (31, N'SAN JOSE DE OCOA', N'SUROESTE')
INSERT [dbo].[Provinces] ([ProvinceID], [Name], [Zone]) VALUES (32, N'SANTO DOMINGO', N'SURESTE')
/****** Object:  Table [dbo].[Municipalities]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Municipalities](
	[MunicipalityID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[ProvinceID] [int] NULL,
 CONSTRAINT [PK__municipa__8D313B0207020F21] PRIMARY KEY CLUSTERED 
(
	[MunicipalityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (1, N'DISTRITO NACIONAL', 1)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (2, N'SAN RAFAEL DEL YUMA', 2)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (3, N'BAYAHIBE (DM)', 2)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (4, N'LA OTRA BANDA (DM)', 2)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (5, N'BOCA DE YUMA (DM)', 2)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (6, N'TURISTICO VERON PUNTA CANA (DM)', 2)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (7, N'HIGUEY', 2)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (8, N'LA LAGUNA DE NISIBON (DM)', 2)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (9, N'VILLARPANDO (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (10, N'AZUA', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (11, N'PADRE LAS CASAS', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (12, N'GUAYABAL', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (13, N'SABANA YEGUA', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (14, N'LAS YAYAS DE VIAJAMA', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (15, N'TABARA ARRIBA', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (16, N'ESTEBANIA', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (17, N'LAS CHARCAS', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (18, N'PUEBLO VIEJO', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (19, N'PALMAR DE OCOA (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (20, N'LOS TOROS (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (21, N'PROYECTO #4 (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (22, N'PROYECTO D-1 GANADERO (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (23, N'EL ROSARIO (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (24, N'LAS BARIAS-LA ESTANCIA (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (25, N'LOS JOVILLOS (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (26, N'BARRO ARRIBA (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (27, N'AMIAMA GOMEZ (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (28, N'TABARA ABAJO (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (29, N'LAS LAGUNAS (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (30, N'LA SIEMBRA (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (31, N'PERALTA', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (32, N'BARRERAS (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (33, N'LAS LOMAS (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (34, N'MONTE BONITO (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (35, N'HATO NUEVO CORTES (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (36, N'PROYECTO 2-C (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (37, N'LOS FRIOS (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (38, N'PUERTO VIEJO-LOS NEGROS (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (39, N'DOÑA EMMA BALAGUER VDA. VALLEJO', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (40, N'LAS CLAVELLINAS (DM)', 3)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (41, N'MENA (DM)', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (42, N'EL SALADO', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (43, N'NEYBA', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (44, N'TAMAYO', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (45, N'VILLA JARAGUA', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (46, N'LOS RIOS ', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (47, N'SANTA BARBARA EL 6', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (48, N'EL PALMAR (DM)', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (49, N'LAS CLAVELLINAS (DM)', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (50, N'SANTANA (DM)', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (51, N'MONSERRAT (DM)', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (52, N'GALVAN', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (53, N'CABEZA DE TORO (DM)', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (54, N'UVILLA (DM)', 4)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (55, N'BARAHONA', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (56, N'LA GUAZARA (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (57, N'ENRIQUILLO', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (58, N'VICENTE NOBLE', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (59, N'POLO', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (60, N'FUNDACION', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (61, N'LAS SALINAS', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (62, N'LA CIENAGA', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (63, N'CANOA (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (64, N'JAQUIMEYES', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (65, N'EL CACHON (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (66, N'PESCADERIA (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (67, N'LOS PATOS (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (68, N'QUITA CORAZA (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (69, N'FONDO NEGRO (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (70, N'ARROYO DULCE (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (71, N'PALO ALTO (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (72, N'BAHORUCO (DM)', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (73, N'PARAISO', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (74, N'EL PEÑON', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (75, N'VILLA CENTRAL', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (76, N'CABRAL', 5)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (77, N'SANTIAGO DE LA CRUZ (DM)', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (78, N'RESTAURACION', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (79, N'DAJABON', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (80, N'LOMA DE CABRERA', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (81, N'CAÑONGO (DM)', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (82, N'EL PINO', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (83, N'MANUEL BUENO (DM)', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (84, N'CAPOTILLO (DM)', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (85, N'PARTIDO', 6)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (86, N'PIMENTEL', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (87, N'JAYA (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (88, N'CASTILLO', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (89, N'EUGENIO MARIA DE HOSTOS', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (90, N'ARENOSO', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (91, N'LAS GUARANAS', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (92, N'AGUA SANTA DEL YUNA (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (93, N'CRISTO REY DE GUARAGUAO (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (94, N'LA PEÑA (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (95, N'CENOVI (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (96, N'LAS TARANAS (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (97, N'LAS COLES (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (98, N'SABANA GRANDE (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (99, N'SAN FRANCISCO DE MACORIS', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (100, N'BARRAQUITO (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (101, N'DON ANTONIO GUZMAN FERNANDEZ (DM)', 7)
GO
print 'Processed 100 total records'
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (102, N'EL AGUACATE (DM)', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (103, N'VILLA RIVA', 7)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (104, N'SAN FRANCISCO-VICENTILLO (DM)', 8)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (105, N'EL SEIBO', 8)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (106, N'MICHES', 8)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (107, N'EL JOVERO (EL CEDRO) (DM)', 8)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (108, N'SANTA LUCIA-LA HIGUERA (DM)', 8)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (109, N'LA GINA (DM)', 8)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (110, N'PEDRO SANCHEZ (DM)', 8)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (111, N'GUAYABO (DM)', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (112, N'BANICA', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (113, N'COMENDADOR', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (114, N'PEDRO SANTANA', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (115, N'HONDO VALLE', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (116, N'EL LLANO', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (117, N'GUANITO (DM)', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (118, N'RIO LIMPIO (DM)', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (119, N'SABANA LARGA (DM)', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (120, N'SABANA CRUZ (DM)', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (121, N'SABANA HIGUERO (DM)', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (122, N'RANCHO DE LA GUARDIA (DM)', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (123, N'JUAN SANTIAGO ', 9)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (124, N'JOSE CONTRERAS (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (125, N'JAMAO AL NORTE', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (126, N'SAN VICTOR (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (127, N'JOBA ARRIBA (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (128, N'JUAN LOPEZ ABAJO (EL MAMEY) (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (129, N'HIGUERITO (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (130, N'MONTE DE LA JAGUA (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (131, N'ORTEGA (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (132, N'CANCA LA REYNA (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (133, N'VILLA MAGANTE (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (134, N'VERAGUA (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (135, N'LAS LAGUNAS ABAJO (DM)', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (136, N'MOCA', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (137, N'GASPAR HERNANDEZ', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (138, N'CAYETANO GERMOSEN', 10)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (139, N'EL VALLE', 11)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (140, N'YERBA BUENA (DM)', 11)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (141, N'ELUPINA CORDERO DE LAS CAÑITAS (DM)', 11)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (142, N'SABANA DE LA MAR', 11)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (143, N'GUAYABO DULCE (DM)', 11)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (144, N'HATO MAYOR', 11)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (145, N'MATA PALACIO (DM)', 11)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (146, N'POSTRER RIO', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (147, N'MELLA', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (148, N'CRISTOBAL', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (149, N'GUAYABAL (DM)', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (150, N'LA COLONIA (DM)', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (151, N'JIMANI', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (152, N'BATEY 8 (DM)', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (153, N'VENGAN A VER (DM)', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (154, N'EL LIMON (DM)', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (155, N'BOCA DE CACHON (DM)', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (156, N'DUVERGE', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (157, N'LA DESCUBIERTA', 12)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (158, N'GUAYMATE', 13)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (159, N'VILLA HERMOSA', 13)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (160, N'LA ROMANA', 13)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (161, N'LA CALETA (DM)', 13)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (162, N'CUMAYASA (DM)', 13)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (163, N'JIMA ABAJO', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (164, N'TIREO ARRIBA (DM)', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (165, N'RIO VERDE ARRIBA (DM)', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (166, N'RINCON (DM)', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (167, N'BUENA VISTA (DM)', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (168, N'CONSTANZA', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (169, N'MANABAO (DM)', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (170, N'EL RANCHITO (DM)', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (171, N'LA VEGA', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (172, N'JARABACOA', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (173, N'LA SABINA (DM)', 14)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (174, N'EL FACTOR', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (175, N'SAN JOSE DE MATANZAS (DM)', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (176, N'ARROYO SALADO (DM)', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (177, N'LA ENTRADA (DM)', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (178, N'RIO SAN JUAN', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (179, N'LAS GORDAS (DM)', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (180, N'ARROYO AL MEDIO (DM)', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (181, N'CABRERA', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (182, N'NAGUA', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (183, N'EL POZO (DM)', 15)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (184, N'MAIMON', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (185, N'PIEDRA BLANCA', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (186, N'VILLA SONADOR (DM)', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (187, N'SABANA DEL PUERTO (DM)', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (188, N'BONAO', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (189, N'JUMA BEJUCAL (DM)', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (190, N'JAYACO (DM)', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (191, N'LA SALVIA-LOS QUEMADOS (DM)', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (192, N'ARROYO TORO-MASIPEDRO (DM)', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (193, N'JUAN ADRIAN (DM)', 16)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (194, N'CASTAÑUELAS', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (195, N'LAS MATAS DE SANTA CRUZ', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (196, N'VILLA ELISA (DM)', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (197, N'HATILLO PALMA (DM)', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (198, N'PEPILLO SALCEDO', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (199, N'PALO VERDE (EL AHOGADO) (DM)', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (200, N'CANA CHAPETON (DM)', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (201, N'GUAYUBIN', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (202, N'VILLA VASQUEZ', 17)
GO
print 'Processed 200 total records'
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (203, N'MONTECRISTI', 17)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (204, N'SABANA GRANDE DE BOYA', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (205, N'DON JUAN (DM)', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (206, N'PERALVILLO', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (207, N'GONZALO (DM)', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (208, N'LOS BOTADOS (DM)', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (209, N'MONTE PLATA', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (210, N'BOYA-EL CENTRO (DM)', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (211, N'CHIRINO (DM)', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (212, N'BAYAGUANA', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (213, N'YAMASA', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (214, N'MAJAGUAL (DM)', 18)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (215, N'OVIEDO', 19)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (216, N'PEDERNALES', 19)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (217, N'JOSE FRANCISCO PEÑA GOMEZ (DM)', 19)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (218, N'JUANCHO (DM)', 19)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (219, N'VILLA SOMBRERO (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (220, N'LA CATALINA (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (221, N'EL CARRETON (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (222, N'EL LIMONAL (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (223, N'LAS BARIAS (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (224, N'BANI', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (225, N'PAYA (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (226, N'MATANZAS (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (227, N'VILLA FUNDACION (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (228, N'SABANA BUEY (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (229, N'PIZARRETE (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (230, N'SANTANA (DM)', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (231, N'NIZAO', 20)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (232, N'NAVAS (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (233, N'LA JAIBA (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (234, N'NAVAS (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (235, N'GUANANICO', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (236, N'GUALEPE', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (237, N'ESTRECHO DE LUPERON OMAR BROSS (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (238, N'MAIMON (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (239, N'SABANETA DE YASICA (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (240, N'BELLOSO (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (241, N'CABARETE (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (242, N'RIO GRANDE (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (243, N'YASICA ARRIBA (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (244, N'PUERTO PLATA', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (245, N'IMBERT', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (246, N'ALTAMIRA', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (247, N'LUPERON', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (248, N'SOSUA', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (249, N'LOS HIDALGOS', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (250, N'VILLA ISABELA', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (251, N'VILLA MONTELLANO', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (252, N'ESTERO HONDO (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (253, N'LA ISABELA (DM)', 21)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (254, N'VILLA TAPIA', 22)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (255, N'SALCEDO', 22)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (256, N'MONTE LLANO (JAMAO AFUERA) (DM)', 22)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (257, N'BLANCO (DM)', 22)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (258, N'TENARES', 22)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (259, N'SAMANA', 23)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (260, N'SANCHEZ', 23)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (261, N'LAS GALERAS (DM)', 23)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (262, N'EL LIMON (DM)', 23)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (263, N'ARROYO BARRIL (DM)', 23)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (264, N'LAS TERRENAS', 23)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (265, N'VILLA ALTAGRACIA', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (266, N'YAGUATE', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (267, N'SABANA GRANDE DE PALENQUE', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (268, N'BAJOS DE HAINA', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (269, N'CAMBITA GARABITOS', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (270, N'LOS CACAOS', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (271, N'SAN CRISTOBAL', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (272, N'HATO DAMAS (DM)', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (273, N'SAN JOSE-PINO HERRADO-EL PUERTO(DM)', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (274, N'MEDINA (DM)', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (275, N'EL CARRIL (DM)', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (276, N'CAMBITA EL PUEBLECITO (DM)', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (277, N'LA CUCHILLA (DM)', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (278, N'SAN GREGORIO DE NIGUA', 24)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (279, N'VALLEJUELO', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (280, N'EL CERCADO', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (281, N'JUAN DE HERRERA', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (282, N'MATAYAYA (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (283, N'PEDRO CORTO (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (284, N'ARROYO CANO (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (285, N'SABANETA (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (286, N'YAQUE (BUENA VISTA) (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (287, N'SAN JUAN DE LA MAGUANA', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (288, N'SABANA ALTA (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (289, N'HATO DEL PADRE (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (290, N'LAS MAGUANAS-HATO NUEVO (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (291, N'BATISTA (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (292, N'EL ROSARIO (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (293, N'JINOVA (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (294, N'LA JAGUA (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (295, N'JORGILLO (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (296, N'GUANITO (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (297, N'LA ZANJA', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (298, N'DERRUMBADERO (EL NUEVO BRAZIL) (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (299, N'LAS CHARCAS DE MARIA NOVAS (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (300, N'CARRERA DE YEGUAS (DM)', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (301, N'LAS MATAS DE FARFAN', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (302, N'BOHECHIO', 25)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (303, N'QUISQUEYA', 26)
GO
print 'Processed 300 total records'
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (304, N'EL PUERTO (DM)', 26)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (305, N'LOS LLANOS', 26)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (306, N'RAMON SANTANA', 26)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (307, N'GUAYACANES', 26)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (308, N'GAUTIER (DM)', 26)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (309, N'SAN PEDRO DE MACORIS', 26)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (310, N'CONSUELO', 26)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (311, N'CEVICOS', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (312, N'LA CUEVA (DM)', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (313, N'VILLA LA MATA', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (314, N'LA BIJA (DM)', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (315, N'ANGELINA (DM)', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (316, N'QUITA SUEÑO (DM)', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (317, N'FANTINO', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (318, N'PLATANAL (DM)', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (319, N'COMEDERO ARRIBA (DM)', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (320, N'HERNANDO ALONZO (DM)', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (321, N'CABALLERO (DM)', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (322, N'COTUI', 27)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (323, N'VILLA GONZALEZ', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (324, N'SAN JOSE DE LAS MATAS', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (325, N'PEDRO GARCIA (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (326, N'SABANA IGLESIA (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (327, N'BAITOA (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (328, N'LA CANELA (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (329, N'EL RUBIO (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (330, N'JUNCALITO (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (331, N'PALMAR ARRIBA (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (332, N'HATO DEL YAQUE (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (333, N'LAS CUESTA (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (334, N'LAS PLACETAS (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (335, N'LICEY AL MEDIO', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (336, N'PUÑAL', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (337, N'GUAYABAL (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (338, N'EL LIMON (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (339, N'LAS PALOMAS (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (340, N'EL CAIMITO (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (341, N'CANCA LA PIEDRA (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (342, N'CANABACOA ABAJO (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (343, N'SAN FRANCISCO DE JACAGUA (DM)', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (344, N'SANTIAGO DE LOS CABALLEROS', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (345, N'TAMBORIL', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (346, N'JANICO', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (347, N'VILLA BISONO -NAVARRETE-', 28)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (348, N'SAN IGNACIO DE SABANETA', 29)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (349, N'VILLA LOS ALMACIGOS', 29)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (350, N'MONCION', 29)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (351, N'JICOME (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (352, N'MAIZAL (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (353, N'JAIBON (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (354, N'GUATAPANAL (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (355, N'JAIBON (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (356, N'AMINA (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (357, N'LAGUNA SALADA', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (358, N'MAO', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (359, N'PARADERO (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (360, N'LA CAYA (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (361, N'BOCA DE MAO (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (362, N'CRUCE DE GUAYACANES (DM)', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (363, N'ESPERANZA', 30)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (364, N'SABANA LARGA', 31)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (365, N'RANCHO ARRIBA', 31)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (366, N'NIZAO-LAS AUYAMAS (DM)', 31)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (367, N'EL PINAR (DM)', 31)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (368, N'SAN JOSE DE OCOA', 31)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (369, N'EL NARANJAL (DM)', 31)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (370, N'LA CIENAGA (DM)', 31)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (371, N'PEDRO BRAND', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (372, N'SANTO DOMINGO ESTE', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (373, N'HATO VIEJO (DM)', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (374, N'SAN ANTONIO DE GUERRA', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (375, N'SAN LUIS (DM)', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (376, N'LA CALETA (DM)', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (377, N'SANTO DOMINGO NORTE', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (378, N'SANTO DOMINGO OESTE', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (379, N'LA VICTORIA (DM)', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (380, N'PALMAREJO (DM)', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (381, N'PANTOJA (DM)', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (382, N'LOS ALCARRIZOS', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (383, N'LA CUABA (DM)', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (384, N'BOCA CHICA', 32)
INSERT [dbo].[Municipalities] ([MunicipalityID], [Name], [ProvinceID]) VALUES (385, N'LA GUAYIGA (DM)', 32)
/****** Object:  Table [dbo].[CitaBiblica]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitaBiblica](
	[CitaBiblicaID] [int] IDENTITY(1,1) NOT NULL,
	[Cita] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CitaBiblicaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([CategoryID], [CategoryCode], [CategoryName], [Description]) VALUES (1, N'General', N'General', N'Categoria General')
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Bodega]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Bodega] ON
INSERT [dbo].[Bodega] ([BodegaID], [BodegaName], [BodegaAddress], [Phone], [IndustrialRegistration], [Email]) VALUES (1, N'PRUEBA BUSINESS', N'SANTO DOMINGO', N'55555', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bodega] OFF
/****** Object:  Table [dbo].[Employees]    Script Date: 11/09/2015 21:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmployeeID], [FullName], [DocumentIdentity], [EmpUserName], [EmpPassword]) VALUES (1, N'Jean Carlos', N'123', N'jcarlos', N'123456')
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  StoredProcedure [dbo].[Sp_GetCategories]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_GetCategories]
AS
	SELECT  0 AS CategoryID,'Seleccione..' as CategoryName UNION ALL
	SELECT CategoryID,CategoryName FROM Categories
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllProvinces]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getAllProvinces]
as
	begin 
		SELECT 0 AS ProvinceID ,' Seleccione....' AS Name UNION ALL
		SELECT  ProvinceID,Name FROM dbo.Provinces as p
		ORDER BY Name ASC
	end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetEmployeeToComboBox]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_GetEmployeeToComboBox]
AS
SELECT 0 AS EmployeeID, 'Seleccione..' as FullName UNION ALL
SELECT e.EmployeeID,e.FullName FROM Employees e
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllCategories]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetAllCategories]
AS
	SELECT CategoryID,CategoryCode,CategoryName,Description FROM Categories
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllBodega]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_GetAllBodega]
AS
SELECT * FROM Bodega 
ORDER BY BodegaName asc
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllMunicipalitiesById]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getAllMunicipalitiesById]
	@id int
as
	begin 
		SELECT 0 as MunicipalityID,' Seleccione...' as Name UNION ALL
		SELECT MunicipalityID,Name FROM Municipalities
		WHERE ProvinceID = @id
		ORDER BY Name
	end
GO
/****** Object:  StoredProcedure [dbo].[Sp_TypeOfPay]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_TypeOfPay]
as
	SELECT 0 AS TypeOfPayID,'Seleccione..' as Description
	UNION ALL
	SELECT TypeOfPayID,Description FROM TypeOfPay
GO
/****** Object:  StoredProcedure [dbo].[Sp_Taxes]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_Taxes]
as
	SELECT 0 AS TaxID,'Seleccione..' as TaxDescription
	UNION ALL
	SELECT TaxID,TaxDescription FROM Taxes
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUnits]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_GetUnits]
as
SELECT 0 AS UnitID, 'Seleccione...' as UnitDescription
UNION ALL
SELECT UnitID,UnitDescription FROM Units
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT [dbo].[Customers] ([CustomerID], [CustomerCode], [CompanyName], [CompanyOwner], [ContactName], [DocumentID], [Address1], [Address2], [ProvinceID], [MunicipalityID], [Phone1], [Phone2], [Cellphone], [Email], [BusinessRegistration], [TaxRegistration], [State], [DateAdmission], [Birthday]) VALUES (1, N'1', N'PRUEBA', N'PRUEBA', N'PRUEBA', N'00118633272', N'AAAAAAAAAAAAAAAA', N'', 1, 1, N'8888888888', N'', N'', N'PRUEBA', N'', N'', 1, CAST(0x0000A50A00D1565A AS DateTime), CAST(0x653A0B00 AS Date))
INSERT [dbo].[Customers] ([CustomerID], [CustomerCode], [CompanyName], [CompanyOwner], [ContactName], [DocumentID], [Address1], [Address2], [ProvinceID], [MunicipalityID], [Phone1], [Phone2], [Cellphone], [Email], [BusinessRegistration], [TaxRegistration], [State], [DateAdmission], [Birthday]) VALUES (2, N'2', N'JORGE LUIS', N'JORGE LUIS', N'JORGE LUIS', N'00118632728', N'C/RESPARDO 18 # 46 ENS. QUISQUEYA', N'', 1, 1, N'8293434425', N'8096162210', N'', N'JLGSHK@GMAIL.COM', N'', N'', 1, CAST(0x0000A50A00D1565A AS DateTime), CAST(0x653A0B00 AS Date))
INSERT [dbo].[Customers] ([CustomerID], [CustomerCode], [CompanyName], [CompanyOwner], [ContactName], [DocumentID], [Address1], [Address2], [ProvinceID], [MunicipalityID], [Phone1], [Phone2], [Cellphone], [Email], [BusinessRegistration], [TaxRegistration], [State], [DateAdmission], [Birthday]) VALUES (3, N'3', N'CLIENTE X', N'', N'CLIENTEX', N'11111111111', N'C/RES X', N'', 6, 79, N'5555555555', N'5555555555', N'5555555555', N'CLIENTEX@HOTMAIL.COM', N'', N'', 1, CAST(0x0000A50A00D1565A AS DateTime), CAST(0x653A0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Customers] OFF
/****** Object:  Table [dbo].[Products]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [Images], [UnitID], [State], [InvoiceWithoutStock], [InvoiceWithPrice]) VALUES (1, N'1010', N'VELA VELON', NULL, 1, NULL, NULL, 1, 1, 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ProductName], [Description], [CategoryID], [Images], [UnitID], [State], [InvoiceWithoutStock], [InvoiceWithPrice]) VALUES (2, N'102589', N'SEGUNDO PRODUCTO', NULL, 1, NULL, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON
INSERT [dbo].[ProductDetails] ([ProductDetailsID], [ProductID], [UnitPrice1], [UnitPrice2], [UnitPrice3], [ProductCost], [BodegaID], [TaxID], [Stock]) VALUES (1, 1, NULL, NULL, NULL, 1500.0000, 1, NULL, 1)
INSERT [dbo].[ProductDetails] ([ProductDetailsID], [ProductID], [UnitPrice1], [UnitPrice2], [UnitPrice3], [ProductCost], [BodegaID], [TaxID], [Stock]) VALUES (2, 2, NULL, NULL, NULL, 1500.0000, 1, NULL, 25)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
/****** Object:  Table [dbo].[Invoices]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (1, 1, 3, 1, CAST(0x0000A546012F7E26 AS DateTime), 1, 1, NULL, NULL, N'00011', CAST(0xA13A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (2, 2, 2, 1, CAST(0x0000A54700B6C211 AS DateTime), 1, 2, NULL, NULL, N'00005', CAST(0xCF3A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (3, 3, 1, 1, CAST(0x0000A547015C5EAC AS DateTime), 1, 2, NULL, NULL, N'00002', CAST(0xCF3A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (4, 4, 3, 1, CAST(0x0000A547015CED66 AS DateTime), 1, 1, NULL, NULL, N'00010', CAST(0xA23A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (5, 5, 1, 1, CAST(0x0000A547015E55B2 AS DateTime), 1, 1, NULL, NULL, N'00012', CAST(0xA23A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (6, 6, 2, 1, CAST(0x0000A547015F06CD AS DateTime), 1, 1, NULL, NULL, N'00009', CAST(0xA23A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (7, 7, 2, 1, CAST(0x0000A547015FEF86 AS DateTime), 1, 1, NULL, NULL, N'00015', CAST(0xA23A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (8, 8, 2, 1, CAST(0x0000A54701608C63 AS DateTime), 1, 1, 2, NULL, N'00018', CAST(0xA23A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (9, 9, 3, 1, CAST(0x0000A54701611045 AS DateTime), 1, 1, 2, NULL, N'20100', CAST(0xA23A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (10, 10, 2, 1, CAST(0x0000A54800E44B7F AS DateTime), 1, 1, NULL, NULL, N'00159', CAST(0xA33A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (11, 11, 2, 1, CAST(0x0000A548017E1CCF AS DateTime), 1, 1, 2, NULL, N'00001', CAST(0xA33A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (12, 12, 3, 1, CAST(0x0000A548018546DD AS DateTime), 1, 1, NULL, NULL, N'10012', CAST(0xA33A0B00 AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CustomerID], [EmployeeID], [InvoiceDate], [BodegaID], [TypeOfPayID], [TaxID], [DisCount], [ReferenceInvoice], [ExpirationInvoiceDate], [Comments]) VALUES (13, 13, 3, 1, CAST(0x0000A54801859688 AS DateTime), 1, 1, NULL, NULL, N'10000', CAST(0xA33A0B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Invoices] OFF
/****** Object:  StoredProcedure [dbo].[Sp_ValidateProductCodeIfExit]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ValidateProductCodeIfExit]
	@ProductCode nvarchar(30)
AS
	
BEGIN
	SELECT TOP 1 1 as Result FROM Products
	WHERE ProductCode = @ProductCode
	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetLastCustomerCode]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_GetLastCustomerCode]
AS
BEGIN
DECLARE @CustomerCodeTemp nvarchar(15) ;
SELECT @CustomerCodeTemp = max(CAST(c.CustomerCode as int)) FROM Customers c
IF @CustomerCodeTemp > 0
BEGIN
	SET @CustomerCodeTemp = @CustomerCodeTemp + 1
	select @CustomerCodeTemp AS CustomerCode
END
ELSE
BEGIN
	SET @CustomerCodeTemp = 1
	SELECT @CustomerCodeTemp AS CustomerCode
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCustomerRadGridShowData]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAllCustomerRadGridShowData]
as 
	SELECT CustomerID,CustomerCode,CompanyName,
	CompanyOwner,ContactName,Phone1,Phone2,Cellphone FROM Customers
	WHERE  NOT Customers.State = 4
	ORDER BY CustomerID DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_ExitCustomerCode]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetCustomerByParam]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetCustomerByParam]
	@CustomerParam NVARCHAR(50)
AS
BEGIN
SELECT c.CustomerID,c.CustomerCode,c.CompanyName,c.ContactName,c.Address1,c.Phone1,p.Name as 'Province',m.Name as 'Municipality' FROM Customers c
INNER JOIN Provinces p
ON
c.ProvinceID = p.ProvinceID
INNER JOIN Municipalities m
ON
c.MunicipalityID = m.MunicipalityID
WHERE 
(@CustomerParam <> '' AND c.CustomerCode = @CustomerParam) 
OR 
(@CustomerParam <> '' AND c.CompanyName LIKE '%'+ @CustomerParam + '%') 
OR
(@CustomerParam <> '' AND c.CompanyOwner LIKE '%'+ @CustomerParam+ '%') 
OR
(@CustomerParam <> '' AND c.ContactName LIKE '%'+ @CustomerParam+ '%') 
OR
(@CustomerParam <> '' AND c.DocumentID = @CustomerParam) 
OR
(@CustomerParam <> '' AND c.Address1 LIKE '%'+ @CustomerParam+ '%') 
OR
(@CustomerParam <> '' AND c.Phone1 LIKE '%'+ @CustomerParam+ '%') 
OR
(@CustomerParam <> '' AND c.Email LIKE '%'+ @CustomerParam+ '%') 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllProducts]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetLastInvoiceNumber]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Kardex]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[Kardex] ON
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (1, CAST(0x0000A543015BA8F5 AS DateTime), N'Inventario Inicial', 200, NULL, 200, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (2, CAST(0x0000A546012F4CDE AS DateTime), N'Actualizando Stock', 150, NULL, 350, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (3, CAST(0x0000A546012F7E26 AS DateTime), N'Venta-0001', NULL, 350, 0, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (4, CAST(0x0000A54700B6B7AA AS DateTime), N'Actualizando Stock', 5, NULL, 5, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (5, CAST(0x0000A54700B6C211 AS DateTime), N'Venta-0002', NULL, 2, 3, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (6, CAST(0x0000A547015C5EAC AS DateTime), N'Venta-0003', NULL, 1, 2, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (7, CAST(0x0000A547015CED66 AS DateTime), N'Venta-0004', NULL, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (8, CAST(0x0000A547015E55B2 AS DateTime), N'Venta-0005', NULL, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (9, CAST(0x0000A547015EEC89 AS DateTime), N'Actualizando Stock', 50, NULL, 50, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (10, CAST(0x0000A547015F06CD AS DateTime), N'Venta-0006', NULL, 10, 40, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (11, CAST(0x0000A547015FEF86 AS DateTime), N'Venta-0007', NULL, 10, 30, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (12, CAST(0x0000A54701608C63 AS DateTime), N'Venta-0008', NULL, 2, 28, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (13, CAST(0x0000A54701611045 AS DateTime), N'Venta-0009', NULL, 2, 26, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (14, CAST(0x0000A54800E43FC7 AS DateTime), N'Inventario Inicial', 150, NULL, 150, NULL, NULL, 2)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (15, CAST(0x0000A54800E44B7F AS DateTime), N'Venta-0010', NULL, 10, 16, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (16, CAST(0x0000A54800E44B7F AS DateTime), N'Venta-0010', NULL, 10, 140, NULL, NULL, 2)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (17, CAST(0x0000A548017E1CCF AS DateTime), N'Venta-0011', NULL, 15, 1, NULL, NULL, 1)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (18, CAST(0x0000A548017E1CCF AS DateTime), N'Venta-0011', NULL, 100, 40, NULL, NULL, 2)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (19, CAST(0x0000A548018546DD AS DateTime), N'Venta-0012', NULL, 10, 30, NULL, NULL, 2)
INSERT [dbo].[Kardex] ([KardexID], [RegisterDate], [TypeOfMove], [KardexIn], [KardexOut], [KardexStock], [LastCost], [AverageCost], [ProductDetailsID]) VALUES (20, CAST(0x0000A54801859688 AS DateTime), N'Venta-0013', NULL, 5, 25, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Kardex] OFF
/****** Object:  StoredProcedure [dbo].[SpValidateIfExitRefenceInvoice]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpValidateIfExitRefenceInvoice]
@ReferenceInvoice NVARCHAR(10)
AS
BEGIN
SELECT 1 as ReferenceInvoice FROM Invoices where ReferenceInvoice = @ReferenceInvoice
END
GO
/****** Object:  Table [dbo].[PaidAccounts]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaidAccounts](
	[PaidAccountID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[DateEmit] [date] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[Amount] [money] NOT NULL,
	[DayDelay] [int] NOT NULL,
	[State] [nchar](10) NOT NULL,
 CONSTRAINT [PK_PaidAccounts] PRIMARY KEY CLUSTERED 
(
	[PaidAccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaidAccountDetails]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaidAccountDetails](
	[PaidAccountDetailID] [int] IDENTITY(1,1) NOT NULL,
	[PaidAccountID] [int] NOT NULL,
	[Concept] [text] NOT NULL,
	[Payment] [money] NOT NULL,
	[Pending] [money] NOT NULL,
	[DatePayment] [date] NOT NULL,
 CONSTRAINT [PK_PaidAccountDetails] PRIMARY KEY CLUSTERED 
(
	[PaidAccountDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET IDENTITY_INSERT [dbo].[InvoiceDetails] ON
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (1, 1, 1, 150.0000, 350, 3, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (2, 2, 1, 100.0000, 2, 5, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (3, 3, 1, 10.0000, 1, 6, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (4, 4, 1, 10.0000, 1, 7, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (5, 5, 1, 100.0000, 1, 8, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (6, 6, 1, 10.0000, 10, 10, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (7, 7, 1, 150.0000, 10, 11, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (8, 8, 1, 10.0000, 2, 12, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (9, 9, 1, 10.0000, 2, 13, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (10, 10, 1, 150.0000, 10, 15, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (11, 10, 2, 100.0000, 10, 16, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (12, 11, 1, 2500.0000, 15, 17, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (13, 11, 2, 2952.0000, 100, 18, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (14, 12, 2, 150.0000, 10, 19, NULL, NULL)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailsID], [InvoiceID], [ProductDetailID], [UnitPrice], [Quantity], [KardexID], [TaxID], [Discount]) VALUES (15, 13, 2, 10.0000, 5, 20, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InvoiceDetails] OFF
/****** Object:  StoredProcedure [dbo].[Sp_GetProductByID]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
WHERE k.TypeOfMove LIKE '%Inventario Inicial%'
AND p.ProductID = @ProductID
END
GO
/****** Object:  View [dbo].[V_DisplayAllInvoices]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  View [dbo].[GetInvoiceByIDView]    Script Date: 11/09/2015 21:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetInvoiceByIDView]
AS

SELECT 
	iv.InvoiceID,
	iv.InvoiceNumber,
	iv.InvoiceDate,
	iv.ReferenceInvoice,
	iv.ExpirationInvoiceDate,
	iv.DisCount AS InvoiceDisCount,
	ivd.Quantity as InvoiceDetailQuantity,
	ivd.UnitPrice as InvoiceDetailUnitPrice,
	p.ProductCode,
	p.ProductName,
	t.TaxDescription,
	t.TaxValue,
	tp.Description AS TypeOfPayDescription,
	b.BodegaAddress,
	b.BodegaName,
	b.Email as BodegaEmail,
	b.IndustrialRegistration AS BodegaIndustrialRegistration,
	b.Phone AS BodegaPhone,
	c.Address1 as CustomerAddress1,
	c.Address2 as CustomerAddress2,
	c.BusinessRegistration as CustomerBusinessRegistration,
	c.Cellphone AS CustomerCellPhone,
	c.CompanyName as CustomerCompanyName,
	c.CompanyOwner as CustomerCompanyOwner,
	c.ContactName as CustomerContactName,
	c.CustomerCode AS CustomerCustomerCode,
	c.DocumentID as CustomerDocumentID ,
	c.Email as CustomerEmail,
	c.Phone1 as CustomerPhone1,
	c.Phone2 as CustomerPhone2,
	c.TaxRegistration AS CustomerTaxRegistration,
	e.DocumentIdentity AS EmployeeDocumentIdentity,
	e.FullName as EmployeeFullName,
	mp.Name as MunicipalityOfCustomer,
	pc.Name as ProvinceOfCustomer
 FROM Invoices as iv
INNER JOIN
InvoiceDetails ivd
ON iv.InvoiceID = ivd.InvoiceID
INNER JOIN Kardex as k
ON ivd.KardexID = k.KardexID
INNER JOIN ProductDetails pd
ON k.ProductDetailsID = pd.ProductDetailsID
INNER JOIN Products as p
ON pd.ProductID = p.ProductID
LEFT JOIN Taxes as t
ON iv.TaxID = t.TaxID
INNER JOIN TypeOfPay AS tp
ON iv.TypeOfPayID = tp.TypeOfPayID
INNER JOIN	Bodega AS b
ON pd.BodegaID = b.BodegaID
INNER JOIN Customers as c
ON iv.CustomerID = c.CustomerID
INNER JOIN Employees as e
ON iv.EmployeeID = e.EmployeeID
INNER JOIN Municipalities as mp
on c.MunicipalityID = mp.MunicipalityID
INNER JOIN Provinces as pc
ON c.ProvinceID = pc.ProvinceID
GO
/****** Object:  Default [DF__Provinces__Zone__151B244E]    Script Date: 11/09/2015 21:50:36 ******/
ALTER TABLE [dbo].[Provinces] ADD  DEFAULT ('') FOR [Zone]
GO
/****** Object:  Default [DF__Bodega__BodegaNa__114A936A]    Script Date: 11/09/2015 21:50:36 ******/
ALTER TABLE [dbo].[Bodega] ADD  DEFAULT ('Inicial') FOR [BodegaName]
GO
/****** Object:  Default [DF__Products__State__1332DBDC]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF__Products__Invoic__14270015]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [InvoiceWithoutStock]
GO
/****** Object:  Default [DF__ProductDe__Stock__123EB7A3]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[ProductDetails] ADD  DEFAULT ((0)) FOR [Stock]
GO
/****** Object:  Default [DF__Invoices__Refere__3864608B]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ('') FOR [ReferenceInvoice]
GO
/****** Object:  ForeignKey [FK_Municipality]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Municipality] FOREIGN KEY([MunicipalityID])
REFERENCES [dbo].[Municipalities] ([MunicipalityID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Municipality]
GO
/****** Object:  ForeignKey [FK_Province]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Provinces] ([ProvinceID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Province]
GO
/****** Object:  ForeignKey [FK_Category]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Category]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RELACION CON LA TABLA CATEGORIA, MUCHOS PRODUCTO TIENEN UNA CATEGORIA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'CONSTRAINT',@level2name=N'FK_Category'
GO
/****** Object:  ForeignKey [FK_Unit]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([UnitID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Unit]
GO
/****** Object:  ForeignKey [FK_Bodega]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_Bodega] FOREIGN KEY([BodegaID])
REFERENCES [dbo].[Bodega] ([BodegaID])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_Bodega]
GO
/****** Object:  ForeignKey [FK_Product]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_Product]
GO
/****** Object:  ForeignKey [FK_Tax]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_Tax] FOREIGN KEY([TaxID])
REFERENCES [dbo].[Taxes] ([TaxID])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_Tax]
GO
/****** Object:  ForeignKey [FK_Bodega2]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Bodega2] FOREIGN KEY([BodegaID])
REFERENCES [dbo].[Bodega] ([BodegaID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Bodega2]
GO
/****** Object:  ForeignKey [FK_Customer]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Customer]
GO
/****** Object:  ForeignKey [FK_Employee]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Employee]
GO
/****** Object:  ForeignKey [FK_Tax2]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Tax2] FOREIGN KEY([TaxID])
REFERENCES [dbo].[Taxes] ([TaxID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Tax2]
GO
/****** Object:  ForeignKey [FK_TypeOfPay]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfPay] FOREIGN KEY([TypeOfPayID])
REFERENCES [dbo].[TypeOfPay] ([TypeOfPayID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_TypeOfPay]
GO
/****** Object:  ForeignKey [FK_ProductDetails]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails] FOREIGN KEY([ProductDetailsID])
REFERENCES [dbo].[ProductDetails] ([ProductDetailsID])
GO
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [FK_ProductDetails]
GO
/****** Object:  ForeignKey [FK_PaidAccounts_Customers]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[PaidAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PaidAccounts_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[PaidAccounts] CHECK CONSTRAINT [FK_PaidAccounts_Customers]
GO
/****** Object:  ForeignKey [FK_PaidAccounts_Invoices]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[PaidAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PaidAccounts_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[PaidAccounts] CHECK CONSTRAINT [FK_PaidAccounts_Invoices]
GO
/****** Object:  ForeignKey [FK_PaidAccountDetails_PaidAccounts]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[PaidAccountDetails]  WITH CHECK ADD  CONSTRAINT [FK_PaidAccountDetails_PaidAccounts] FOREIGN KEY([PaidAccountID])
REFERENCES [dbo].[PaidAccounts] ([PaidAccountID])
GO
ALTER TABLE [dbo].[PaidAccountDetails] CHECK CONSTRAINT [FK_PaidAccountDetails_PaidAccounts]
GO
/****** Object:  ForeignKey [FK_Invoice]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_Invoice]
GO
/****** Object:  ForeignKey [FK_InvoiceDetails_Kardex]    Script Date: 11/09/2015 21:50:37 ******/
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Kardex] FOREIGN KEY([KardexID])
REFERENCES [dbo].[Kardex] ([KardexID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Kardex]
GO

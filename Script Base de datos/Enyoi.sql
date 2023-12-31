USE [master]
GO
/****** Object:  Database [Tienda]    Script Date: 3/11/2023 2:14:25 a. m. ******/
CREATE DATABASE [Tienda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tienda', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tienda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tienda_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tienda_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tienda] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tienda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tienda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tienda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tienda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tienda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tienda] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tienda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tienda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tienda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tienda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tienda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tienda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tienda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tienda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tienda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tienda] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tienda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tienda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tienda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tienda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tienda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tienda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tienda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tienda] SET RECOVERY FULL 
GO
ALTER DATABASE [Tienda] SET  MULTI_USER 
GO
ALTER DATABASE [Tienda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tienda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tienda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tienda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tienda] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tienda] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tienda', N'ON'
GO
ALTER DATABASE [Tienda] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tienda] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tienda]
GO
/****** Object:  Table [dbo].[Carrito_Productos]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_Productos](
	[id_carrito_productos] [int] NOT NULL,
	[id_producto] [int] NULL,
	[id_carrito] [varchar](50) NULL,
	[cantidad] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carritos]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carritos](
	[id_carrito] [int] NOT NULL,
	[id_usuario] [int] NULL,
	[id_producto] [int] NULL,
	[id_pedido] [int] NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_Carritos] PRIMARY KEY CLUSTERED 
(
	[id_carrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id_categorias] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[estado] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[id_ciudad] [int] NULL,
	[nombre] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciyyy]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciyyy](
	[id_ciudad] [int] NOT NULL,
	[Nombre] [int] NULL,
 CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ofertas]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ofertas](
	[id_oferta] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[estado] [varchar](50) NULL,
	[inicio] [date] NULL,
	[fin] [date] NULL,
	[id_productos] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id_pedidos] [int] NOT NULL,
	[fecha] [date] NULL,
	[metodo_pago] [varchar](50) NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[id_pedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[precio] [decimal](18, 2) NULL,
	[id_categoria] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/11/2023 2:14:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[id_ciudad] [int] NULL,
	[direccion] [varchar](50) NULL,
	[estado] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (1, 1, NULL, CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (2, 5, NULL, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (3, 12, NULL, CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (4, 7, NULL, CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (5, 3, NULL, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (6, 9, NULL, CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (7, 2, NULL, CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (8, 8, NULL, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (9, 11, NULL, CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (10, 4, NULL, CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (11, 6, NULL, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (12, 15, NULL, CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (13, 10, NULL, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (14, 13, NULL, CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Carrito_Productos] ([id_carrito_productos], [id_producto], [id_carrito], [cantidad]) VALUES (15, 14, NULL, CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (1, 1, 1, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (2, 2, 2, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (3, 3, 3, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (4, 4, 4, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (5, 5, 5, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (6, 6, 6, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (7, 7, 7, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (8, 8, 8, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (9, 9, 9, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (10, 10, 10, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (11, 11, 11, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (12, 12, 12, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (13, 13, 13, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (14, 14, 14, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (15, 15, 15, NULL, N'Activo')
INSERT [dbo].[Carritos] ([id_carrito], [id_usuario], [id_producto], [id_pedido], [estado]) VALUES (30, 30, 30, NULL, N'Activo')
GO
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (1, N'Categoría 1', N'Descripción de la categoría 1', N'Activa')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (2, N'Categoría 2', N'Descripción de la categoría 2', N'Inactiva')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (3, N'Categoría 3', N'Descripción de la categoría 3', N'Activa')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (4, N'Categoría 4', N'Descripción de la categoría 4', N'Inactiva')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (5, N'Categoría 5', N'Descripción de la categoría 5', N'Activa')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (6, N'Categoría 6', N'Descripción de la categoría 6', N'Inactiva')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (7, N'Categoría 7', N'Descripción de la categoría 7', N'Activa')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (8, N'Categoría 8', N'Descripción de la categoría 8', N'Inactiva')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (9, N'Categoría 9', N'Descripción de la categoría 9', N'Activa')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (10, N'Categoría 10', N'Descripción de la categoría 10', N'Inactiva')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (11, N'Categoría 11', N'Descripción de la categoría 11', N'Activa')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (12, N'Categoría 12', N'Descripción de la categoría 12', N'Inactiva')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (13, N'Categoría 13', N'Descripción de la categoría 13', N'Activa')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (14, N'Categoría 14', N'Descripción de la categoría 14', N'Inactiva')
INSERT [dbo].[Categorias] ([id_categorias], [nombre], [descripcion], [estado]) VALUES (15, N'Categoría 15', N'Descripción de la categoría 15', N'Activa')
GO
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (1, N'Bogotá')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (2, N'Medellín')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (3, N'Cali')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (30, N'Neiva')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (4, N'Barranquilla')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (5, N'Cartagena')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (6, N'Bucaramanga')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (7, N'Santa Marta')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (8, N'Manizales')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (9, N'Pereira')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (10, N'Villavicencio')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (11, N'Cúcuta')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (12, N'Ibagué')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (13, N'Pasto')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (14, N'Popayán')
INSERT [dbo].[Ciudades] ([id_ciudad], [nombre]) VALUES (15, N'Armenia')
GO
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (1, N'Oferta 1', N'Descripción de la oferta 1', N'Activa', CAST(N'2023-11-05' AS Date), CAST(N'2023-11-15' AS Date), 1)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (2, N'Oferta 2', N'Descripción de la oferta 2', N'Inactiva', CAST(N'2023-11-10' AS Date), CAST(N'2023-11-20' AS Date), 2)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (3, N'Oferta 3', N'Descripción de la oferta 3', N'Activa', CAST(N'2023-11-15' AS Date), CAST(N'2023-11-25' AS Date), 3)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (4, N'Oferta 4', N'Descripción de la oferta 4', N'Inactiva', CAST(N'2023-11-20' AS Date), CAST(N'2023-11-30' AS Date), 4)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (5, N'Oferta 5', N'Descripción de la oferta 5', N'Activa', CAST(N'2023-11-25' AS Date), CAST(N'2023-12-05' AS Date), 5)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (6, N'Oferta 6', N'Descripción de la oferta 6', N'Inactiva', CAST(N'2023-11-30' AS Date), CAST(N'2023-12-10' AS Date), 6)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (7, N'Oferta 7', N'Descripción de la oferta 7', N'Activa', CAST(N'2023-12-05' AS Date), CAST(N'2023-12-15' AS Date), 7)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (8, N'Oferta 8', N'Descripción de la oferta 8', N'Inactiva', CAST(N'2023-12-10' AS Date), CAST(N'2023-12-20' AS Date), 8)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (9, N'Oferta 9', N'Descripción de la oferta 9', N'Activa', CAST(N'2023-12-15' AS Date), CAST(N'2023-12-25' AS Date), 9)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (10, N'Oferta 10', N'Descripción de la oferta 10', N'Inactiva', CAST(N'2023-12-20' AS Date), CAST(N'2023-12-30' AS Date), 10)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (11, N'Oferta 11', N'Descripción de la oferta 11', N'Activa', CAST(N'2023-12-25' AS Date), CAST(N'2024-01-05' AS Date), 11)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (12, N'Oferta 12', N'Descripción de la oferta 12', N'Inactiva', CAST(N'2023-12-30' AS Date), CAST(N'2024-01-10' AS Date), 12)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (13, N'Oferta 13', N'Descripción de la oferta 13', N'Activa', CAST(N'2024-01-05' AS Date), CAST(N'2024-01-15' AS Date), 13)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (14, N'Oferta 14', N'Descripción de la oferta 14', N'Inactiva', CAST(N'2024-01-10' AS Date), CAST(N'2024-01-20' AS Date), 14)
INSERT [dbo].[Ofertas] ([id_oferta], [nombre], [descripcion], [estado], [inicio], [fin], [id_productos]) VALUES (15, N'Oferta 15', N'Descripción de la oferta 15', N'Activa', CAST(N'2024-01-15' AS Date), CAST(N'2024-01-25' AS Date), 15)
GO
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (1, CAST(N'2023-01-01' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (2, CAST(N'2023-01-02' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (3, CAST(N'2023-01-03' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (4, CAST(N'2023-02-01' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (5, CAST(N'2023-02-02' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (6, CAST(N'2023-02-03' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (7, CAST(N'2023-02-04' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (8, CAST(N'2023-02-05' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (9, CAST(N'2023-02-06' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (10, CAST(N'2023-02-07' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (11, CAST(N'2023-02-08' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (12, CAST(N'2023-02-09' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (13, CAST(N'2023-02-10' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (14, CAST(N'2023-02-11' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (15, CAST(N'2023-02-12' AS Date), NULL, N'Enviado')
INSERT [dbo].[Pedidos] ([id_pedidos], [fecha], [metodo_pago], [estado]) VALUES (30, CAST(N'2023-01-30' AS Date), NULL, N'Enviado')
GO
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (1, N'Producto 1', CAST(10.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (2, N'Producto 2', CAST(15.49 AS Decimal(18, 2)), 2)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (3, N'Producto 3', CAST(25.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (4, N'Producto 4', CAST(7.99 AS Decimal(18, 2)), 3)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (5, N'Producto 5', CAST(12.99 AS Decimal(18, 2)), 2)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (6, N'Producto 6', CAST(19.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (7, N'Producto 7', CAST(8.49 AS Decimal(18, 2)), 3)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (8, N'Producto 8', CAST(6.99 AS Decimal(18, 2)), 2)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (9, N'Producto 9', CAST(11.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (10, N'Producto 10', CAST(13.99 AS Decimal(18, 2)), 2)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (11, N'Producto 11', CAST(9.99 AS Decimal(18, 2)), 3)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (12, N'Producto 12', CAST(16.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (13, N'Producto 13', CAST(14.49 AS Decimal(18, 2)), 2)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (14, N'Producto 14', CAST(22.99 AS Decimal(18, 2)), 1)
INSERT [dbo].[Productos] ([id_producto], [descripcion], [precio], [id_categoria]) VALUES (15, N'Producto 15', CAST(17.99 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (1, N'Juan', NULL, N'Calle 1', N'Activo', N'1234', N'juan@example.com', N'3001112233')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (2, N'Maria', NULL, N'Calle 2', N'Activo', N'5678', N'maria@example.com', N'3001112234')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (3, N'Carlos', NULL, N'Calle 3', N'Activo', N'9012', N'carlos@example.com', N'3001112235')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (4, N'Laura', NULL, N'Calle 4', N'Activo', N'1234', N'laura@example.com', N'3001112236')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (5, N'Andres', NULL, N'Calle 5', N'Activo', N'5678', N'andres@example.com', N'3001112237')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (6, N'Isabel', NULL, N'Calle 6', N'Activo', N'9012', N'isabel@example.com', N'3001112238')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (7, N'Pedro', NULL, N'Calle 7', N'Activo', N'3456', N'pedro@example.com', N'3001112239')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (8, N'Luisa', NULL, N'Calle 8', N'Activo', N'7890', N'luisa@example.com', N'3001112240')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (9, N'Gabriel', NULL, N'Calle 9', N'Activo', N'2345', N'gabriel@example.com', N'3001112241')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (10, N'Marta', NULL, N'Calle 10', N'Activo', N'6789', N'marta@example.com', N'3001112242')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (11, N'Camilo', NULL, N'Calle 11', N'Activo', N'1234', N'camilo@example.com', N'3001112243')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (12, N'Elena', NULL, N'Calle 12', N'Activo', N'5678', N'elena@example.com', N'3001112244')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (13, N'Ricardo', NULL, N'Calle 13', N'Activo', N'9012', N'ricardo@example.com', N'3001112245')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (14, N'Ana', NULL, N'Calle 14', N'Activo', N'3456', N'ana@example.com', N'3001112246')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (15, N'Felipe', NULL, N'Calle 15', N'Activo', N'7890', N'felipe@example.com', N'3001112247')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [id_ciudad], [direccion], [estado], [password], [correo], [telefono]) VALUES (30, N'Sofia', NULL, N'Calle 30', N'Activo', N'3456', N'sofia@example.com', N'3001112262')
GO
ALTER TABLE [dbo].[Carritos]  WITH CHECK ADD  CONSTRAINT [FK_Carritos_Pedidos] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[Pedidos] ([id_pedidos])
GO
ALTER TABLE [dbo].[Carritos] CHECK CONSTRAINT [FK_Carritos_Pedidos]
GO
ALTER TABLE [dbo].[Carritos]  WITH CHECK ADD  CONSTRAINT [FK_Carritos_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Carritos] CHECK CONSTRAINT [FK_Carritos_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_ciudades] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[ciyyy] ([id_ciudad])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_ciudades]
GO
USE [master]
GO
ALTER DATABASE [Tienda] SET  READ_WRITE 
GO

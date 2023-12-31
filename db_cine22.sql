USE [CINE_22]
GO
/****** Object:  Database [CINE]    Script Date: 14/11/2023 15:01:12 ******/
CREATE DATABASE [CINE_22]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CINE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CINE.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CINE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CINE_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CINE_22] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CINE_22].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CINE_22] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CINE_22] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CINE_22] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CINE_22] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CINE_22] SET ARITHABORT OFF 
GO
ALTER DATABASE [CINE_22] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CINE_22] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CINE_22] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CINE_22] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CINE_22] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CINE_22] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CINE_22] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CINE_22] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CINE_22] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CINE_22] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CINE_22] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CINE_22] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CINE_22] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CINE_22] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CINE_22] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CINE_22] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CINE_22] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CINE_22] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CINE_22] SET  MULTI_USER 
GO
ALTER DATABASE [CINE_22] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CINE_22] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CINE_22] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CINE_22] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CINE_22] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CINE_22]
GO
/****** Object:  UserDefinedFunction [dbo].[f_promedio]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_promedio] 
	(
	@valor1 decimal (4,2), 
	@valor2 decimal (4,2)
	) 
returns decimal (6,2) 
as 
begin  
	declare @resultado decimal (6,2) 
	set @resultado = (@valor1 + @valor2) / 2 
	return @resultado  
end; 
GO
/****** Object:  Table [dbo].[ACTORES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACTORES](
	[id_actor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fecha_nac] [date] NULL,
	[id_pais_origen] [int] NULL,
 CONSTRAINT [pk_actor] PRIMARY KEY CLUSTERED 
(
	[id_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BARRIOS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BARRIOS](
	[id_barrio] [int] IDENTITY(1,1) NOT NULL,
	[barrio] [varchar](50) NULL,
	[id_localidad] [int] NULL,
 CONSTRAINT [pk_barrio] PRIMARY KEY CLUSTERED 
(
	[id_barrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUTACAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUTACAS](
	[id_butaca] [int] IDENTITY(1,1) NOT NULL,
	[id_sala] [int] NULL,
	[id_estado] [int] NULL,
	[id_funcion] [int] NULL,
	[nro_butaca] [int] NULL,
	[id_posicion] [int] NULL,
 CONSTRAINT [pk_butaca] PRIMARY KEY CLUSTERED 
(
	[id_butaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CLASIFICACIONES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLASIFICACIONES](
	[id_clasificacion] [int] IDENTITY(1,1) NOT NULL,
	[clasificacion] [varchar](50) NULL,
 CONSTRAINT [pk_clasi] PRIMARY KEY CLUSTERED 
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[dni] [int] NULL,
	[mail] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[fecha_nac] [date] NULL,
	[calle] [varchar](50) NULL,
	[nro] [int] NULL,
	[id_barrio] [int] NULL,
	[id_genero_cliente] [int] NULL,
	[id_tipo_cliente] [int] NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_baja] [datetime] NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMPROBANTES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPROBANTES](
	[id_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[id_cliente] [int] NULL,
	[id_forma_pago] [int] NULL,
 CONSTRAINT [pk_comprobante] PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DET_COMPROBANTE]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DET_COMPROBANTE](
	[id_det_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[precio_entrada] [decimal](10, 2) NULL,
	[id_comprobante] [int] NULL,
	[id_butaca] [int] NULL,
 CONSTRAINT [pk_det_compro] PRIMARY KEY CLUSTERED 
(
	[id_det_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DET_PELICULAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DET_PELICULAS](
	[id_det_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[id_pelicula] [int] NULL,
	[id_actor] [int] NULL,
 CONSTRAINT [pk_det_peli] PRIMARY KEY CLUSTERED 
(
	[id_det_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIRECTORES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIRECTORES](
	[id_director] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fecha_nac] [date] NULL,
	[id_pais_origen] [int] NULL,
 CONSTRAINT [pk_director] PRIMARY KEY CLUSTERED 
(
	[id_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ESTADOS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESTADOS](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [pk_estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FORMA_PAGOS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FORMA_PAGOS](
	[id_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[forma_pago] [varchar](50) NULL,
 CONSTRAINT [pk_forma_pago] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FUNCIONES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUNCIONES](
	[id_funcion] [int] IDENTITY(1,1) NOT NULL,
	[id_pelicula] [int] NULL,
	[id_sala] [int] NULL,
	[fecha] [date] NULL,
	[hora_inicio] [time](7) NULL,
 CONSTRAINT [pk_funcion] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GENERO_CLIENTES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GENERO_CLIENTES](
	[id_genero_cliente] [int] IDENTITY(1,1) NOT NULL,
	[genero_cliente] [varchar](50) NULL,
 CONSTRAINT [pk_gene_clien] PRIMARY KEY CLUSTERED 
(
	[id_genero_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GENEROS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GENEROS](
	[id_genero] [int] IDENTITY(1,1) NOT NULL,
	[genero] [varchar](50) NULL,
 CONSTRAINT [pk_genero] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IDIOMAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IDIOMAS](
	[id_idioma] [int] IDENTITY(1,1) NOT NULL,
	[idioma] [varchar](50) NULL,
 CONSTRAINT [pk_idioma] PRIMARY KEY CLUSTERED 
(
	[id_idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOCALIDADES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOCALIDADES](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[localidad] [varchar](50) NULL,
	[id_provincia] [int] NULL,
 CONSTRAINT [pk_localidad] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAISES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAISES](
	[id_pais] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NULL,
 CONSTRAINT [pk_pais] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PELICULAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PELICULAS](
	[id_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NULL,
	[duracion] [time](7) NULL,
	[id_genero] [int] NULL,
	[id_clasificacion] [int] NULL,
	[id_idioma] [int] NULL,
	[id_subtitulo] [int] NULL,
	[id_director] [int] NULL,
	[doblaje] [bit] NULL,
	[id_produ] [int] NULL,
 CONSTRAINT [pk_peli] PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POSICIONES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POSICIONES](
	[id_posicion] [int] IDENTITY(1,1) NOT NULL,
	[posicion] [varchar](255) NOT NULL,
 CONSTRAINT [pk_pos] PRIMARY KEY CLUSTERED 
(
	[id_posicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCTORAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTORAS](
	[id_productora] [int] IDENTITY(1,1) NOT NULL,
	[productora] [varchar](50) NULL,
 CONSTRAINT [pk_produ] PRIMARY KEY CLUSTERED 
(
	[id_productora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROMOCIONES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROMOCIONES](
	[id_promocion] [int] IDENTITY(1,1) NOT NULL,
	[promocion] [int] NULL,
 CONSTRAINT [pk_promo] PRIMARY KEY CLUSTERED 
(
	[id_promocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROVINCIAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROVINCIAS](
	[id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](50) NULL,
 CONSTRAINT [pk_provi] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RESERVAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVAS](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[id_butaca] [int] NULL,
 CONSTRAINT [pk_reserva] PRIMARY KEY CLUSTERED 
(
	[id_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SALAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALAS](
	[id_sala] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_sala] [int] NULL,
 CONSTRAINT [pk_sala] PRIMARY KEY CLUSTERED 
(
	[id_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SUBTITULOS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBTITULOS](
	[id_subtitulo] [int] IDENTITY(1,1) NOT NULL,
	[id_idioma] [int] NULL,
 CONSTRAINT [pk_sub] PRIMARY KEY CLUSTERED 
(
	[id_subtitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TIPO_CLIENTES]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_CLIENTES](
	[id_tipo_cliente] [int] IDENTITY(1,1) NOT NULL,
	[tipo_cliente] [varchar](50) NULL,
	[id_promocion] [int] NULL,
 CONSTRAINT [pk_tipo_cliente] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIPO_SALAS]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_SALAS](
	[id_tipo_sala] [int] IDENTITY(1,1) NOT NULL,
	[tipo_sala] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_S] PRIMARY KEY CLUSTERED 
(
	[id_tipo_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[view_sp1]    Script Date: 14/11/2023 15:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_sp1]
as
select c.id_cliente, apellido + ' ' + nombre Cliente, 'No Vino' Observaciones
from clientes c
join tipo_clientes tc on tc.id_tipo_cliente = c.id_tipo_cliente
join comprobantes co on co.id_cliente = c.id_cliente
join barrios b on b.id_barrio = c.id_barrio
where barrio in ('Alberdi')
and c.id_cliente not in (select id_cliente
	from comprobantes 
	where datediff(month, fecha, getdate()) = 1)
union
select c.id_cliente, apellido + ' ' + nombre, '+2 Pelis' 
from clientes c 
join comprobantes co on co.id_cliente = c.id_cliente
join det_comprobante dc on dc.id_comprobante = co.id_comprobante
join butacas b on b.id_butaca = dc.id_butaca
join funciones f on f.id_funcion = b.id_funcion
join peliculas p on p.id_pelicula = f.id_pelicula
where duracion > '02:00:00'
and 2 < (select count(*)
	from det_comprobante dc1
	join comprobantes co1 on co1.id_comprobante = dc1.id_comprobante
	join clientes c1 on c1.id_cliente = co1.id_cliente)
GO
SET IDENTITY_INSERT [dbo].[ACTORES] ON 

INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (1, N'Tom', N'Hanks', CAST(N'1956-07-09' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (2, N'Harrison', N'Ford', CAST(N'1942-07-13' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (3, N'Scarlett', N'Johansson', CAST(N'1984-11-22' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (4, N'Leonardo', N'DiCaprio', CAST(N'1974-11-11' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (5, N'Natalie', N'Portman', CAST(N'1981-06-09' AS Date), 4)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (6, N'Meryl', N'Streep', CAST(N'1949-06-22' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (7, N'Brad', N'Pitt', CAST(N'1963-12-18' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (8, N'Angelina', N'Jolie', CAST(N'1975-06-04' AS Date), 3)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (9, N'Johnny', N'Depp', CAST(N'1963-06-09' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (10, N'Cate', N'Blanchett', CAST(N'1969-05-14' AS Date), 2)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (11, N'Keanu', N'Reeves', CAST(N'1964-09-02' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (12, N'Julia', N'Roberts', CAST(N'1967-10-28' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (13, N'Matt', N'Damon', CAST(N'1970-10-08' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (14, N'Emma', N'Stone', CAST(N'1988-11-06' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (15, N'Hugh', N'Jackman', CAST(N'1968-10-12' AS Date), 3)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (16, N'Denzel', N'Washington', CAST(N'1954-12-28' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (17, N'Nicole', N'Kidman', CAST(N'1967-06-20' AS Date), 3)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (18, N'Robert', N'Downey Jr.', CAST(N'1965-04-04' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (19, N'Javier', N'Bardem', CAST(N'1969-03-01' AS Date), 5)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (20, N'Mila', N'Kunis', CAST(N'1983-08-14' AS Date), 6)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (21, N'Marlon', N'Brando', CAST(N'1924-04-03' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (22, N'Al', N'Pacino', CAST(N'1940-04-25' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (23, N'James', N'Caan', CAST(N'1940-03-26' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (24, N'Robert', N'Duvall', CAST(N'1931-01-05' AS Date), 1)
INSERT [dbo].[ACTORES] ([id_actor], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (25, N'Diane', N'Keaton', CAST(N'1946-01-05' AS Date), 1)
SET IDENTITY_INSERT [dbo].[ACTORES] OFF
SET IDENTITY_INSERT [dbo].[BARRIOS] ON 

INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (1, N'Nueva Córdoba', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (2, N'Güemes', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (3, N'Alberdi', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (4, N'General Paz', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (5, N'Los Boulevares', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (6, N'Villa Belgrano', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (7, N'Alta Córdoba', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (8, N'San Vicente', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (9, N'Ciudad Universitaria', 1)
INSERT [dbo].[BARRIOS] ([id_barrio], [barrio], [id_localidad]) VALUES (10, N'Cerro de las Rosas', 1)
SET IDENTITY_INSERT [dbo].[BARRIOS] OFF
SET IDENTITY_INSERT [dbo].[BUTACAS] ON 

INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (91, 1, 2, 1, 1, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (92, 1, 3, 1, 2, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (93, 1, 1, 1, 3, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (94, 1, 1, 1, 4, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (95, 1, 1, 1, 5, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (96, 1, 1, 1, 6, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (97, 1, 1, 1, 7, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (98, 1, 3, 1, 8, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (99, 1, 3, 1, 9, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (100, 1, 1, 1, 10, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (101, 1, 2, 1, 11, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (102, 1, 1, 1, 12, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (103, 1, 1, 1, 13, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (104, 1, 2, 1, 14, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (105, 1, 1, 1, 15, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (106, 1, 2, 1, 16, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (107, 1, 2, 1, 17, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (108, 1, 1, 1, 18, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (109, 1, 1, 1, 19, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (110, 1, 1, 1, 20, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (111, 1, 1, 1, 21, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (112, 1, 1, 1, 22, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (113, 1, 1, 1, 23, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (114, 1, 2, 1, 24, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (115, 1, 1, 1, 25, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (116, 1, 2, 1, 26, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (117, 1, 2, 1, 27, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (118, 1, 1, 1, 28, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (119, 1, 1, 1, 29, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (120, 1, 1, 1, 30, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (121, 1, 2, 1, 31, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (122, 1, 2, 1, 32, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (123, 1, 1, 1, 33, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (124, 1, 2, 1, 34, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (125, 1, 1, 1, 35, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (126, 1, 1, 1, 36, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (127, 1, 1, 1, 37, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (128, 1, 3, 1, 38, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (129, 1, 1, 1, 39, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (130, 1, 3, 1, 40, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (131, 1, 1, 1, 41, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (132, 1, 3, 1, 42, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (133, 1, 3, 1, 43, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (134, 1, 3, 1, 44, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (135, 1, 2, 1, 45, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (136, 1, 1, 1, 46, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (137, 1, 2, 1, 47, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (138, 1, 1, 1, 48, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (139, 1, 1, 1, 49, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (140, 1, 1, 1, 50, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (141, 1, 3, 1, 51, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (142, 1, 1, 1, 52, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (143, 1, 1, 1, 53, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (144, 1, 3, 1, 54, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (145, 1, 2, 1, 55, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (146, 1, 1, 1, 56, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (147, 1, 1, 1, 57, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (148, 1, 1, 1, 58, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (149, 1, 1, 1, 59, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (150, 1, 1, 1, 60, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (151, 1, 2, 1, 61, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (152, 1, 2, 1, 62, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (153, 1, 1, 1, 63, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (154, 1, 3, 1, 64, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (155, 1, 3, 1, 65, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (156, 1, 1, 1, 66, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (157, 1, 1, 1, 67, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (158, 1, 1, 1, 68, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (159, 1, 1, 1, 69, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (160, 1, 1, 1, 70, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (161, 1, 2, 1, 71, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (162, 1, 2, 1, 72, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (163, 1, 1, 1, 73, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (164, 1, 1, 1, 74, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (165, 1, 1, 1, 75, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (166, 1, 2, 1, 76, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (167, 1, 1, 1, 77, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (168, 1, 1, 1, 78, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (169, 1, 1, 1, 79, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (170, 1, 1, 1, 80, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (171, 1, 2, 1, 81, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (172, 1, 2, 1, 82, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (173, 1, 1, 1, 83, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (174, 1, 1, 1, 84, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (175, 1, 1, 1, 85, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (176, 1, 2, 1, 86, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (177, 1, 2, 1, 87, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (178, 1, 1, 1, 88, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (179, 1, 1, 1, 89, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (180, 1, 1, 1, 90, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (181, 1, 2, 1, 91, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (182, 1, 2, 1, 92, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (183, 1, 2, 1, 93, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (184, 1, 2, 1, 94, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (185, 1, 1, 1, 95, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (186, 1, 1, 1, 96, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (187, 1, 2, 1, 97, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (188, 1, 1, 1, 98, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (189, 1, 1, 1, 99, NULL)
GO
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (190, 1, 1, 1, 100, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (191, 1, 1, 2, 1, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (192, 1, 1, 2, 2, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (193, 1, 1, 2, 3, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (194, 1, 1, 2, 4, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (195, 1, 1, 2, 5, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (196, 1, 1, 2, 6, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (197, 1, 1, 2, 7, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (198, 1, 1, 2, 8, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (199, 1, 3, 2, 9, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (200, 1, 1, 2, 10, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (201, 1, 1, 2, 11, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (202, 1, 1, 2, 12, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (203, 1, 3, 2, 13, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (204, 1, 1, 2, 14, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (205, 1, 1, 2, 15, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (206, 1, 1, 2, 16, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (207, 1, 1, 2, 17, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (208, 1, 1, 2, 18, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (209, 1, 3, 2, 19, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (210, 1, 1, 2, 20, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (211, 1, 2, 2, 21, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (212, 1, 2, 2, 22, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (213, 1, 1, 2, 23, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (214, 1, 3, 2, 24, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (215, 1, 1, 2, 25, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (216, 1, 1, 2, 26, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (217, 1, 1, 2, 27, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (218, 1, 3, 2, 28, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (219, 1, 3, 2, 29, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (220, 1, 1, 2, 30, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (221, 1, 2, 2, 31, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (222, 1, 1, 2, 32, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (223, 1, 3, 2, 33, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (224, 1, 3, 2, 34, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (225, 1, 1, 2, 35, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (226, 1, 1, 2, 36, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (227, 1, 1, 2, 37, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (228, 1, 1, 2, 38, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (229, 1, 1, 2, 39, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (230, 1, 1, 2, 40, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (231, 1, 2, 2, 41, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (232, 1, 3, 2, 42, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (233, 1, 1, 2, 43, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (234, 1, 1, 2, 44, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (235, 1, 1, 2, 45, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (236, 1, 1, 2, 46, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (237, 1, 1, 2, 47, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (238, 1, 1, 2, 48, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (239, 1, 1, 2, 49, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (240, 1, 1, 2, 50, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (241, 1, 3, 2, 51, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (242, 1, 1, 2, 52, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (243, 1, 1, 2, 53, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (244, 1, 1, 2, 54, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (245, 1, 1, 2, 55, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (246, 1, 1, 2, 56, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (247, 1, 1, 2, 57, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (248, 1, 1, 2, 58, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (249, 1, 1, 2, 59, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (250, 1, 1, 2, 60, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (251, 1, 1, 2, 61, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (252, 1, 3, 2, 62, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (253, 1, 1, 2, 63, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (254, 1, 1, 2, 64, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (255, 1, 1, 2, 65, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (256, 1, 1, 2, 66, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (257, 1, 3, 2, 67, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (258, 1, 3, 2, 68, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (259, 1, 1, 2, 69, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (260, 1, 1, 2, 70, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (261, 1, 3, 2, 71, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (262, 1, 1, 2, 72, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (263, 1, 1, 2, 73, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (264, 1, 3, 2, 74, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (265, 1, 1, 2, 75, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (266, 1, 2, 2, 76, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (267, 1, 3, 2, 77, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (268, 1, 1, 2, 78, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (269, 1, 3, 2, 79, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (270, 1, 1, 2, 80, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (271, 1, 2, 2, 81, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (272, 1, 1, 2, 82, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (273, 1, 1, 2, 83, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (274, 1, 1, 2, 84, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (275, 1, 3, 2, 85, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (276, 1, 3, 2, 86, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (277, 1, 1, 2, 87, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (278, 1, 1, 2, 88, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (279, 1, 1, 2, 89, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (280, 1, 3, 2, 90, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (281, 1, 3, 2, 91, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (282, 1, 2, 2, 92, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (283, 1, 2, 2, 93, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (284, 1, 2, 2, 94, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (285, 1, 1, 2, 95, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (286, 1, 1, 2, 96, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (287, 1, 1, 2, 97, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (288, 1, 1, 2, 98, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (289, 1, 1, 2, 99, NULL)
GO
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (290, 1, 1, 2, 100, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (291, 1, 2, 3, 1, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (292, 1, 2, 3, 2, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (293, 1, 3, 3, 3, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (294, 1, 3, 3, 4, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (295, 1, 1, 3, 5, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (296, 1, 1, 3, 6, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (297, 1, 1, 3, 7, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (298, 1, 1, 3, 8, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (299, 1, 3, 3, 9, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (300, 1, 1, 3, 10, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (301, 1, 1, 3, 11, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (302, 1, 1, 3, 12, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (303, 1, 3, 3, 13, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (304, 1, 3, 3, 14, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (305, 1, 1, 3, 15, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (306, 1, 1, 3, 16, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (307, 1, 3, 3, 17, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (308, 1, 1, 3, 18, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (309, 1, 3, 3, 19, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (310, 1, 1, 3, 20, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (311, 1, 2, 3, 21, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (312, 1, 2, 3, 22, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (313, 1, 1, 3, 23, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (314, 1, 3, 3, 24, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (315, 1, 1, 3, 25, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (316, 1, 1, 3, 26, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (317, 1, 1, 3, 27, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (318, 1, 3, 3, 28, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (319, 1, 3, 3, 29, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (320, 1, 1, 3, 30, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (321, 1, 1, 3, 31, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (322, 1, 1, 3, 32, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (323, 1, 3, 3, 33, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (324, 1, 3, 3, 34, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (325, 1, 1, 3, 35, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (326, 1, 1, 3, 36, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (327, 1, 1, 3, 37, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (328, 1, 1, 3, 38, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (329, 1, 3, 3, 39, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (330, 1, 1, 3, 40, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (331, 1, 2, 3, 41, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (332, 1, 3, 3, 42, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (333, 1, 1, 3, 43, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (334, 1, 1, 3, 44, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (335, 1, 1, 3, 45, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (336, 1, 1, 3, 46, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (337, 1, 3, 3, 47, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (338, 1, 3, 3, 48, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (339, 1, 1, 3, 49, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (340, 1, 1, 3, 50, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (341, 1, 3, 3, 51, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (342, 1, 1, 3, 52, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (343, 1, 1, 3, 53, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (344, 1, 1, 3, 54, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (345, 1, 3, 3, 55, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (346, 1, 1, 3, 56, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (347, 1, 1, 3, 57, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (348, 1, 3, 3, 58, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (349, 1, 1, 3, 59, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (350, 1, 1, 3, 60, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (351, 1, 1, 3, 61, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (352, 1, 3, 3, 62, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (353, 1, 1, 3, 63, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (354, 1, 1, 3, 64, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (355, 1, 1, 3, 65, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (356, 1, 1, 3, 66, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (357, 1, 3, 3, 67, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (358, 1, 3, 3, 68, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (359, 1, 1, 3, 69, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (360, 1, 1, 3, 70, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (361, 1, 3, 3, 71, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (362, 1, 2, 3, 72, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (363, 1, 1, 3, 73, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (364, 1, 3, 3, 74, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (365, 1, 1, 3, 75, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (366, 1, 1, 3, 76, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (367, 1, 3, 3, 77, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (368, 1, 1, 3, 78, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (369, 1, 3, 3, 79, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (370, 1, 1, 3, 80, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (371, 1, 2, 3, 81, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (372, 1, 2, 3, 82, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (373, 1, 1, 3, 83, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (374, 1, 1, 3, 84, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (375, 1, 3, 3, 85, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (376, 1, 3, 3, 86, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (377, 1, 2, 3, 87, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (378, 1, 2, 3, 88, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (379, 1, 2, 3, 89, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (380, 1, 2, 3, 90, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (381, 1, 3, 3, 91, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (382, 1, 3, 3, 92, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (383, 1, 2, 3, 93, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (384, 1, 2, 3, 94, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (385, 1, 1, 3, 95, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (386, 1, 1, 3, 96, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (387, 1, 3, 3, 97, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (388, 1, 3, 3, 98, NULL)
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (389, 1, 1, 3, 99, NULL)
GO
INSERT [dbo].[BUTACAS] ([id_butaca], [id_sala], [id_estado], [id_funcion], [nro_butaca], [id_posicion]) VALUES (390, 1, 2, 3, 100, NULL)
SET IDENTITY_INSERT [dbo].[BUTACAS] OFF
SET IDENTITY_INSERT [dbo].[CLASIFICACIONES] ON 

INSERT [dbo].[CLASIFICACIONES] ([id_clasificacion], [clasificacion]) VALUES (1, N'PG-13')
INSERT [dbo].[CLASIFICACIONES] ([id_clasificacion], [clasificacion]) VALUES (2, N'R')
INSERT [dbo].[CLASIFICACIONES] ([id_clasificacion], [clasificacion]) VALUES (3, N'G')
INSERT [dbo].[CLASIFICACIONES] ([id_clasificacion], [clasificacion]) VALUES (4, N'PG')
SET IDENTITY_INSERT [dbo].[CLASIFICACIONES] OFF
SET IDENTITY_INSERT [dbo].[CLIENTES] ON 

INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (1, N'Guillermo', N'Meyer', 40404040, N'guillermomeyer@gmail.com', N'3512622793', CAST(N'2000-03-12' AS Date), N'Independencia', 800, 1, 1, 1, CAST(N'2023-10-26 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (2, N'Javier', N'Milei', 0, N'@@@@', N'351', CAST(N'2000-04-13' AS Date), N'', 0, 3, 1, 2, CAST(N'2023-10-26 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (5, N'test', N'test', 0, NULL, NULL, CAST(N'2023-10-26' AS Date), NULL, 0, 1, 1, 1, CAST(N'2023-10-26 00:00:00.000' AS DateTime), CAST(N'2023-11-01 12:14:17.397' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (6, N'Charles', N'Bukowski', 0, N'string', N'string', CAST(N'2023-10-26' AS Date), N'string', 0, 1, 1, 1, CAST(N'2023-10-26 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (7, N'Henry', N'Miller', 0, N'string', N'string', CAST(N'2023-10-26' AS Date), N'string', 0, 1, 1, 1, CAST(N'2023-10-26 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (8, N'TEST', N'TEST', 0, NULL, NULL, CAST(N'2023-10-26' AS Date), NULL, 0, 1, 1, 1, CAST(N'2023-10-26 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (9, N'carlitos', NULL, 0, NULL, NULL, CAST(N'2000-05-14' AS Date), NULL, 0, 1, 1, 1, CAST(N'2023-10-26 17:51:09.440' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (11, N'testtttt', N'testttt', 0, NULL, NULL, CAST(N'2023-10-28' AS Date), NULL, 0, 1, 1, 1, CAST(N'2023-10-28 01:20:42.873' AS DateTime), CAST(N'2023-10-28 20:54:54.850' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (13, N'stringTEST', N'stringTEST', 0, N'string', N'string', CAST(N'2023-10-28' AS Date), N'string', 0, 1, 1, 1, CAST(N'2023-10-28 01:22:14.657' AS DateTime), CAST(N'2023-10-28 19:45:35.167' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (14, N'Louis', N'Celine', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 1, 3, CAST(N'2023-10-29 13:15:56.990' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (16, N'HENRY', N'CHINASKI', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 1, 3, CAST(N'2023-10-29 13:27:41.567' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (17, N'bla', N'bla', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 1, 1, CAST(N'2023-10-29 13:47:39.967' AS DateTime), CAST(N'2023-10-29 22:59:12.170' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (18, N'glu', N'glu', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 2, 1, CAST(N'2023-10-29 13:48:58.610' AS DateTime), CAST(N'2023-10-29 22:59:04.663' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (19, N'glu', N'glu', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 2, 1, CAST(N'2023-10-29 13:50:22.107' AS DateTime), CAST(N'2023-10-29 22:58:55.490' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (20, N'glu', N'glu', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 2, 1, CAST(N'2023-10-29 13:56:38.970' AS DateTime), CAST(N'2023-10-29 22:58:45.323' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (21, N'glu', N'glu', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 2, 1, CAST(N'2023-10-29 14:00:53.443' AS DateTime), CAST(N'2023-10-29 19:45:02.867' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (22, N'test1000', N'test1000', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 2, 1, CAST(N'2023-10-29 14:02:14.160' AS DateTime), CAST(N'2023-10-29 22:56:59.070' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (23, N'asd', N'asd', 0, NULL, NULL, CAST(N'2023-10-29' AS Date), NULL, 0, 1, 1, 1, CAST(N'2023-10-29 23:56:16.037' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (26, N'elle', N'elle', 0, NULL, NULL, CAST(N'2023-10-30' AS Date), NULL, 0, 1, 3, 1, CAST(N'2023-10-30 00:44:57.230' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (27, N'el', N'el', 0, NULL, NULL, CAST(N'2023-10-30' AS Date), NULL, 0, 1, 1, 1, CAST(N'2023-10-30 00:45:31.217' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (28, N'TEST', N'TEST', 0, NULL, NULL, CAST(N'2008-10-30' AS Date), NULL, 0, 1, 3, 1, CAST(N'2023-10-30 00:47:47.110' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (29, N'nro', N'nro', 1, N'@', N'', CAST(N'2008-10-30' AS Date), N'', 0, 1, 3, 1, CAST(N'2023-10-30 01:28:36.003' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (30, N'h', N'h', 1, N'@', N'', CAST(N'2008-10-30' AS Date), N'', 0, 1, 3, 1, CAST(N'2023-10-30 01:35:44.547' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (31, N'a', N'a', 1, N'@', N'', CAST(N'2008-10-30' AS Date), N'', 0, 1, 3, 1, CAST(N'2023-10-30 01:41:27.887' AS DateTime), CAST(N'2023-10-30 01:43:37.003' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (32, N'jjj', N'jjj', 111, N'@@@', N'351', CAST(N'2008-10-30' AS Date), N'123', 0, 1, 3, 1, CAST(N'2023-10-30 01:42:47.827' AS DateTime), CAST(N'2023-10-30 01:43:33.000' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (33, N'jjj', N'jjj', 111, N'@@@', N'351', CAST(N'2008-10-30' AS Date), N'', 2, 1, 3, 1, CAST(N'2023-10-30 01:42:50.567' AS DateTime), CAST(N'2023-11-01 14:11:01.430' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (38, N'string', N'string', 0, N'string', N'string', CAST(N'2023-10-30' AS Date), N'string', 0, 1, 1, 1, CAST(N'2023-10-30 01:47:15.890' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (39, N'a', N'a', 1, N'a', N'', CAST(N'2008-10-30' AS Date), N'', 0, 1, 3, 1, CAST(N'2023-10-30 02:10:14.413' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (40, N'a', N'a', 1, N'a', N'', CAST(N'2008-10-30' AS Date), N'', 1, 1, 3, 1, CAST(N'2023-10-30 02:10:23.920' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (41, N'xd', N'xd', 123, N'', N'351', CAST(N'2008-11-01' AS Date), N'', 0, 4, 1, 2, CAST(N'2023-11-01 18:21:51.480' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (42, N'xd2', N'xd2', 123, N'', N'351', CAST(N'2008-11-01' AS Date), N'', 123, 4, 1, 2, CAST(N'2023-11-01 18:22:07.050' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (43, N'xd22222', N'xd222222', 123, N'', N'351', CAST(N'2008-11-01' AS Date), N'', 123, 4, 2, 2, CAST(N'2023-11-01 18:22:19.307' AS DateTime), CAST(N'2023-11-02 12:01:34.230' AS DateTime))
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (44, N'ERNEST', N'HEMINGWAY', 10101010, N'', N'351', CAST(N'2008-11-02' AS Date), N'', 0, 6, 1, 3, CAST(N'2023-11-02 12:04:43.940' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (45, N'hola', N'hola', 1, N'', N'1', CAST(N'2008-11-02' AS Date), N'', 0, 1, 2, 1, CAST(N'2023-11-02 12:18:01.100' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (46, N'Meyer', N'Lisandro', 50505050, N'', N'351', CAST(N'2008-11-03' AS Date), N'', 0, 1, 3, 1, CAST(N'2023-11-03 15:02:01.530' AS DateTime), NULL)
INSERT [dbo].[CLIENTES] ([id_cliente], [nombre], [apellido], [dni], [mail], [telefono], [fecha_nac], [calle], [nro], [id_barrio], [id_genero_cliente], [id_tipo_cliente], [fecha_alta], [fecha_baja]) VALUES (47, N'Lisandro', N'Meyer', 60606060, N'', N'351', CAST(N'2008-11-03' AS Date), N'', 0, 1, 3, 1, CAST(N'2023-11-03 15:04:58.097' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CLIENTES] OFF
SET IDENTITY_INSERT [dbo].[COMPROBANTES] ON 

INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (1, CAST(N'2023-10-27' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (2, CAST(N'2021-10-27' AS Date), 1, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (3, CAST(N'2021-10-27' AS Date), 2, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (4, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (5, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (6, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (7, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (8, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (9, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (10, CAST(N'2023-11-05' AS Date), 9, 2)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (11, CAST(N'2023-11-05' AS Date), 39, 2)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (12, CAST(N'2023-11-05' AS Date), 39, 2)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (13, CAST(N'2023-11-05' AS Date), 39, 2)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (14, CAST(N'2023-11-05' AS Date), 39, 2)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (15, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (16, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (17, CAST(N'2023-11-05' AS Date), 16, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (18, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (19, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (20, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (21, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (22, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (23, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (24, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (25, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (26, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (27, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (28, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (29, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (30, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (31, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (32, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (33, CAST(N'2023-11-05' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (34, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (35, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (36, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (37, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (38, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (39, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (40, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (41, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (42, CAST(N'2023-11-06' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (43, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (44, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (45, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (46, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (50, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (51, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (52, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (53, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (54, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (55, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (56, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (57, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (58, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (59, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (60, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (61, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (62, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (63, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (64, CAST(N'2023-11-07' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (65, CAST(N'2023-11-07' AS Date), 9, 2)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (66, CAST(N'2023-11-07' AS Date), 39, 2)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (67, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (68, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (69, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (70, CAST(N'2023-11-07' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (71, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (72, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (73, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (74, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (75, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (76, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (77, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (78, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (79, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (80, CAST(N'2023-11-07' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (81, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (82, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (83, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (84, CAST(N'2023-11-07' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (85, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (86, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (87, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (88, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (89, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (90, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (91, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (92, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (93, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (94, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (95, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (96, CAST(N'2023-11-08' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (97, CAST(N'2023-11-08' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (98, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (99, CAST(N'2023-11-08' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (100, CAST(N'2023-11-11' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (101, CAST(N'2023-11-11' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (102, CAST(N'2023-11-11' AS Date), NULL, 1)
GO
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (103, CAST(N'2023-11-11' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (104, CAST(N'2023-11-11' AS Date), 45, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (105, CAST(N'2023-11-11' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (106, CAST(N'2023-11-11' AS Date), 39, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (107, CAST(N'2023-11-11' AS Date), 26, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (108, CAST(N'2023-11-11' AS Date), 28, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (109, CAST(N'2023-11-12' AS Date), 27, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (110, CAST(N'2023-11-12' AS Date), 16, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (111, CAST(N'2023-11-12' AS Date), 23, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (112, CAST(N'2023-11-12' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (113, CAST(N'2023-11-12' AS Date), NULL, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (114, CAST(N'2023-11-12' AS Date), 16, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (115, CAST(N'2023-11-12' AS Date), 9, 1)
INSERT [dbo].[COMPROBANTES] ([id_comprobante], [fecha], [id_cliente], [id_forma_pago]) VALUES (116, CAST(N'2023-11-12' AS Date), 9, 1)
SET IDENTITY_INSERT [dbo].[COMPROBANTES] OFF
SET IDENTITY_INSERT [dbo].[DET_COMPROBANTE] ON 

INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (1, CAST(3600.00 AS Decimal(10, 2)), 4, 132)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (3, CAST(3600.00 AS Decimal(10, 2)), 10, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (4, CAST(3600.00 AS Decimal(10, 2)), 11, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (5, CAST(3600.00 AS Decimal(10, 2)), 12, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (6, CAST(3600.00 AS Decimal(10, 2)), 13, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (7, CAST(3600.00 AS Decimal(10, 2)), 14, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (8, CAST(4500.00 AS Decimal(10, 2)), 15, 351)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (9, CAST(4500.00 AS Decimal(10, 2)), 16, 322)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (10, CAST(4500.00 AS Decimal(10, 2)), 16, 313)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (13, CAST(3600.00 AS Decimal(10, 2)), 18, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (14, CAST(3600.00 AS Decimal(10, 2)), 19, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (15, CAST(3600.00 AS Decimal(10, 2)), 19, 132)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (16, CAST(3600.00 AS Decimal(10, 2)), 20, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (17, CAST(3600.00 AS Decimal(10, 2)), 21, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (18, CAST(3600.00 AS Decimal(10, 2)), 21, 132)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (19, CAST(3600.00 AS Decimal(10, 2)), 22, 162)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (20, CAST(3600.00 AS Decimal(10, 2)), 22, 153)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (21, CAST(3600.00 AS Decimal(10, 2)), 23, 111)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (22, CAST(3600.00 AS Decimal(10, 2)), 24, 132)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (23, CAST(3600.00 AS Decimal(10, 2)), 25, 141)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (24, CAST(3600.00 AS Decimal(10, 2)), 26, 111)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (25, CAST(3600.00 AS Decimal(10, 2)), 27, 93)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (26, CAST(3600.00 AS Decimal(10, 2)), 28, 93)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (27, CAST(3600.00 AS Decimal(10, 2)), 29, 96)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (28, CAST(3600.00 AS Decimal(10, 2)), 30, 132)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (29, CAST(3600.00 AS Decimal(10, 2)), 31, 132)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (30, CAST(3600.00 AS Decimal(10, 2)), 31, 111)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (31, CAST(3600.00 AS Decimal(10, 2)), 32, 111)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (32, CAST(3600.00 AS Decimal(10, 2)), 33, 111)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (33, CAST(3600.00 AS Decimal(10, 2)), 33, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (34, CAST(3600.00 AS Decimal(10, 2)), 34, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (35, CAST(3600.00 AS Decimal(10, 2)), 34, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (36, CAST(3600.00 AS Decimal(10, 2)), 35, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (37, CAST(3600.00 AS Decimal(10, 2)), 35, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (38, CAST(3600.00 AS Decimal(10, 2)), 36, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (39, CAST(3600.00 AS Decimal(10, 2)), 36, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (40, CAST(3600.00 AS Decimal(10, 2)), 37, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (41, CAST(3600.00 AS Decimal(10, 2)), 37, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (42, CAST(3600.00 AS Decimal(10, 2)), 38, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (43, CAST(3600.00 AS Decimal(10, 2)), 38, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (44, CAST(3600.00 AS Decimal(10, 2)), 39, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (45, CAST(3600.00 AS Decimal(10, 2)), 39, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (46, CAST(3600.00 AS Decimal(10, 2)), 40, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (47, CAST(3600.00 AS Decimal(10, 2)), 40, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (48, CAST(3600.00 AS Decimal(10, 2)), 41, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (49, CAST(3600.00 AS Decimal(10, 2)), 41, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (50, CAST(3600.00 AS Decimal(10, 2)), 41, 111)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (51, CAST(3600.00 AS Decimal(10, 2)), 41, 112)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (52, CAST(3600.00 AS Decimal(10, 2)), 41, 113)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (53, CAST(3600.00 AS Decimal(10, 2)), 41, 114)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (54, CAST(3600.00 AS Decimal(10, 2)), 42, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (55, CAST(3600.00 AS Decimal(10, 2)), 42, 102)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (56, CAST(3600.00 AS Decimal(10, 2)), 42, 111)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (57, CAST(3600.00 AS Decimal(10, 2)), 42, 112)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (58, CAST(3600.00 AS Decimal(10, 2)), 42, 113)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (59, CAST(3600.00 AS Decimal(10, 2)), 42, 114)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (60, CAST(3600.00 AS Decimal(10, 2)), 42, 122)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (61, CAST(3600.00 AS Decimal(10, 2)), 42, 123)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (62, CAST(3600.00 AS Decimal(10, 2)), 43, 92)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (63, CAST(3600.00 AS Decimal(10, 2)), 44, 92)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (64, CAST(3600.00 AS Decimal(10, 2)), 45, 92)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (65, CAST(3600.00 AS Decimal(10, 2)), 45, 95)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (66, CAST(3600.00 AS Decimal(10, 2)), 46, 92)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (67, CAST(3600.00 AS Decimal(10, 2)), 46, 95)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (68, CAST(3600.00 AS Decimal(10, 2)), 46, 98)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (69, CAST(3600.00 AS Decimal(10, 2)), 50, 105)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (70, CAST(3600.00 AS Decimal(10, 2)), 51, 125)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (71, CAST(3600.00 AS Decimal(10, 2)), 52, 125)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (72, CAST(3600.00 AS Decimal(10, 2)), 52, 126)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (73, CAST(3600.00 AS Decimal(10, 2)), 52, 127)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (74, CAST(3600.00 AS Decimal(10, 2)), 53, 125)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (75, CAST(3600.00 AS Decimal(10, 2)), 53, 126)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (76, CAST(3600.00 AS Decimal(10, 2)), 53, 127)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (77, CAST(3600.00 AS Decimal(10, 2)), 53, 153)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (78, CAST(3600.00 AS Decimal(10, 2)), 53, 144)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (79, CAST(3600.00 AS Decimal(10, 2)), 53, 134)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (80, CAST(3600.00 AS Decimal(10, 2)), 53, 135)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (81, CAST(3600.00 AS Decimal(10, 2)), 53, 153)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (82, CAST(3600.00 AS Decimal(10, 2)), 53, 144)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (83, CAST(3600.00 AS Decimal(10, 2)), 53, 134)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (84, CAST(3600.00 AS Decimal(10, 2)), 53, 135)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (85, CAST(3600.00 AS Decimal(10, 2)), 54, 189)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (86, CAST(3600.00 AS Decimal(10, 2)), 54, 186)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (87, CAST(3600.00 AS Decimal(10, 2)), 55, 189)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (88, CAST(3600.00 AS Decimal(10, 2)), 55, 186)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (89, CAST(3600.00 AS Decimal(10, 2)), 55, 183)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (90, CAST(3600.00 AS Decimal(10, 2)), 56, 189)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (91, CAST(3600.00 AS Decimal(10, 2)), 56, 186)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (92, CAST(3600.00 AS Decimal(10, 2)), 56, 183)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (93, CAST(3600.00 AS Decimal(10, 2)), 56, 171)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (94, CAST(3600.00 AS Decimal(10, 2)), 57, 189)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (95, CAST(3600.00 AS Decimal(10, 2)), 57, 186)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (96, CAST(3600.00 AS Decimal(10, 2)), 57, 183)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (97, CAST(3600.00 AS Decimal(10, 2)), 57, 171)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (98, CAST(3600.00 AS Decimal(10, 2)), 57, 180)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (99, CAST(3600.00 AS Decimal(10, 2)), 58, 108)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (100, CAST(3600.00 AS Decimal(10, 2)), 59, 108)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (101, CAST(3600.00 AS Decimal(10, 2)), 59, 128)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (102, CAST(3600.00 AS Decimal(10, 2)), 59, 129)
GO
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (103, CAST(3600.00 AS Decimal(10, 2)), 60, 117)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (104, CAST(3600.00 AS Decimal(10, 2)), 61, 117)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (105, CAST(3600.00 AS Decimal(10, 2)), 61, 162)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (106, CAST(3600.00 AS Decimal(10, 2)), 62, 99)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (107, CAST(3600.00 AS Decimal(10, 2)), 63, 99)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (108, CAST(3600.00 AS Decimal(10, 2)), 64, 99)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (109, CAST(3600.00 AS Decimal(10, 2)), 65, 110)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (110, CAST(3600.00 AS Decimal(10, 2)), 65, 120)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (111, CAST(3600.00 AS Decimal(10, 2)), 66, 165)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (112, CAST(3600.00 AS Decimal(10, 2)), 67, 174)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (113, CAST(3600.00 AS Decimal(10, 2)), 67, 165)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (114, CAST(3600.00 AS Decimal(10, 2)), 68, 174)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (115, CAST(3600.00 AS Decimal(10, 2)), 68, 165)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (116, CAST(3600.00 AS Decimal(10, 2)), 69, 174)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (117, CAST(3600.00 AS Decimal(10, 2)), 69, 165)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (118, CAST(3600.00 AS Decimal(10, 2)), 70, 174)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (119, CAST(3600.00 AS Decimal(10, 2)), 70, 165)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (120, CAST(3600.00 AS Decimal(10, 2)), 71, 192)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (121, CAST(3600.00 AS Decimal(10, 2)), 72, 192)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (122, CAST(3600.00 AS Decimal(10, 2)), 73, 156)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (123, CAST(3600.00 AS Decimal(10, 2)), 73, 165)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (124, CAST(3600.00 AS Decimal(10, 2)), 74, 156)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (125, CAST(3600.00 AS Decimal(10, 2)), 74, 165)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (126, CAST(3600.00 AS Decimal(10, 2)), 74, 174)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (127, CAST(3600.00 AS Decimal(10, 2)), 75, 156)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (128, CAST(3600.00 AS Decimal(10, 2)), 75, 165)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (129, CAST(3600.00 AS Decimal(10, 2)), 75, 174)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (130, CAST(3600.00 AS Decimal(10, 2)), 75, 177)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (131, CAST(3600.00 AS Decimal(10, 2)), 75, 168)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (132, CAST(3600.00 AS Decimal(10, 2)), 76, 147)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (133, CAST(3600.00 AS Decimal(10, 2)), 77, 110)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (134, CAST(3600.00 AS Decimal(10, 2)), 77, 120)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (135, CAST(3600.00 AS Decimal(10, 2)), 78, 99)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (136, CAST(3600.00 AS Decimal(10, 2)), 79, 138)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (137, CAST(3600.00 AS Decimal(10, 2)), 80, 159)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (138, CAST(3600.00 AS Decimal(10, 2)), 81, 192)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (139, CAST(4500.00 AS Decimal(10, 2)), 81, 302)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (140, CAST(4500.00 AS Decimal(10, 2)), 81, 292)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (141, CAST(3600.00 AS Decimal(10, 2)), 82, 202)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (142, CAST(4500.00 AS Decimal(10, 2)), 82, 311)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (143, CAST(3600.00 AS Decimal(10, 2)), 83, 213)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (144, CAST(4500.00 AS Decimal(10, 2)), 83, 322)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (145, CAST(3600.00 AS Decimal(10, 2)), 84, 211)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (146, CAST(3600.00 AS Decimal(10, 2)), 85, 150)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (147, CAST(3600.00 AS Decimal(10, 2)), 85, 236)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (148, CAST(3600.00 AS Decimal(10, 2)), 85, 235)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (149, CAST(3600.00 AS Decimal(10, 2)), 86, 205)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (150, CAST(3600.00 AS Decimal(10, 2)), 86, 206)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (151, CAST(4500.00 AS Decimal(10, 2)), 86, 313)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (152, CAST(3600.00 AS Decimal(10, 2)), 87, 290)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (153, CAST(4500.00 AS Decimal(10, 2)), 88, 351)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (154, CAST(3600.00 AS Decimal(10, 2)), 88, 196)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (155, CAST(3600.00 AS Decimal(10, 2)), 88, 197)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (156, CAST(3600.00 AS Decimal(10, 2)), 89, 91)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (157, CAST(3600.00 AS Decimal(10, 2)), 90, 104)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (158, CAST(3600.00 AS Decimal(10, 2)), 90, 105)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (159, CAST(3600.00 AS Decimal(10, 2)), 90, 106)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (160, CAST(3600.00 AS Decimal(10, 2)), 90, 107)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (161, CAST(3600.00 AS Decimal(10, 2)), 91, 114)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (162, CAST(3600.00 AS Decimal(10, 2)), 91, 115)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (163, CAST(3600.00 AS Decimal(10, 2)), 91, 116)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (164, CAST(3600.00 AS Decimal(10, 2)), 91, 117)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (165, CAST(3600.00 AS Decimal(10, 2)), 92, 181)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (166, CAST(3600.00 AS Decimal(10, 2)), 92, 182)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (167, CAST(3600.00 AS Decimal(10, 2)), 92, 183)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (168, CAST(3600.00 AS Decimal(10, 2)), 92, 184)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (169, CAST(3600.00 AS Decimal(10, 2)), 93, 171)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (170, CAST(3600.00 AS Decimal(10, 2)), 93, 173)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (171, CAST(3600.00 AS Decimal(10, 2)), 93, 174)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (172, CAST(3600.00 AS Decimal(10, 2)), 93, 172)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (173, CAST(3600.00 AS Decimal(10, 2)), 93, 171)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (174, CAST(3600.00 AS Decimal(10, 2)), 93, 172)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (175, CAST(3600.00 AS Decimal(10, 2)), 93, 173)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (176, CAST(3600.00 AS Decimal(10, 2)), 93, 161)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (177, CAST(3600.00 AS Decimal(10, 2)), 94, 151)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (178, CAST(3600.00 AS Decimal(10, 2)), 94, 152)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (179, CAST(3600.00 AS Decimal(10, 2)), 95, 172)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (180, CAST(3600.00 AS Decimal(10, 2)), 95, 162)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (181, CAST(3600.00 AS Decimal(10, 2)), 95, 172)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (182, CAST(3600.00 AS Decimal(10, 2)), 95, 162)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (183, CAST(3600.00 AS Decimal(10, 2)), 95, 172)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (184, CAST(3600.00 AS Decimal(10, 2)), 95, 182)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (185, CAST(3600.00 AS Decimal(10, 2)), 95, 271)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (186, CAST(3600.00 AS Decimal(10, 2)), 96, 121)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (187, CAST(3600.00 AS Decimal(10, 2)), 96, 122)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (188, CAST(3600.00 AS Decimal(10, 2)), 96, 231)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (189, CAST(4500.00 AS Decimal(10, 2)), 97, 291)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (190, CAST(3600.00 AS Decimal(10, 2)), 98, 211)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (191, CAST(3600.00 AS Decimal(10, 2)), 98, 212)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (192, CAST(3600.00 AS Decimal(10, 2)), 98, 201)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (193, CAST(3600.00 AS Decimal(10, 2)), 98, 211)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (194, CAST(3600.00 AS Decimal(10, 2)), 99, 112)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (195, CAST(3600.00 AS Decimal(10, 2)), 100, 124)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (196, CAST(3600.00 AS Decimal(10, 2)), 101, 266)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (197, CAST(4500.00 AS Decimal(10, 2)), 102, 384)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (198, CAST(3600.00 AS Decimal(10, 2)), 103, 211)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (199, CAST(3600.00 AS Decimal(10, 2)), 103, 212)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (200, CAST(3600.00 AS Decimal(10, 2)), 103, 101)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (201, CAST(3600.00 AS Decimal(10, 2)), 104, 283)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (202, CAST(3600.00 AS Decimal(10, 2)), 104, 282)
GO
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (203, CAST(4500.00 AS Decimal(10, 2)), 104, 390)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (204, CAST(4500.00 AS Decimal(10, 2)), 105, 383)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (205, CAST(4500.00 AS Decimal(10, 2)), 105, 372)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (206, CAST(4500.00 AS Decimal(10, 2)), 106, 380)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (207, CAST(4500.00 AS Decimal(10, 2)), 106, 380)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (208, CAST(4500.00 AS Decimal(10, 2)), 106, 380)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (209, CAST(4500.00 AS Decimal(10, 2)), 106, 380)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (210, CAST(4500.00 AS Decimal(10, 2)), 106, 379)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (211, CAST(4500.00 AS Decimal(10, 2)), 106, 378)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (212, CAST(3600.00 AS Decimal(10, 2)), 107, 145)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (213, CAST(3600.00 AS Decimal(10, 2)), 107, 145)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (214, CAST(3600.00 AS Decimal(10, 2)), 107, 145)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (215, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (216, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (217, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (218, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (219, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (220, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (221, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (222, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (223, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (224, CAST(3600.00 AS Decimal(10, 2)), 108, 166)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (225, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (226, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (227, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (228, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (229, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (230, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (231, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (232, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (233, CAST(3600.00 AS Decimal(10, 2)), 109, 176)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (234, CAST(3600.00 AS Decimal(10, 2)), 110, 177)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (235, CAST(3600.00 AS Decimal(10, 2)), 111, 135)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (236, CAST(3600.00 AS Decimal(10, 2)), 111, 137)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (237, CAST(3600.00 AS Decimal(10, 2)), 112, 187)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (238, CAST(3600.00 AS Decimal(10, 2)), 112, 284)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (239, CAST(4500.00 AS Decimal(10, 2)), 113, 311)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (240, CAST(4500.00 AS Decimal(10, 2)), 113, 312)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (243, CAST(4500.00 AS Decimal(10, 2)), 115, 331)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (244, CAST(3600.00 AS Decimal(10, 2)), 116, 221)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (247, CAST(1000.00 AS Decimal(10, 2)), 9, NULL)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (248, CAST(1000.00 AS Decimal(10, 2)), 17, NULL)
INSERT [dbo].[DET_COMPROBANTE] ([id_det_comprobante], [precio_entrada], [id_comprobante], [id_butaca]) VALUES (255, CAST(4500.00 AS Decimal(10, 2)), 114, 292)
SET IDENTITY_INSERT [dbo].[DET_COMPROBANTE] OFF
SET IDENTITY_INSERT [dbo].[DET_PELICULAS] ON 

INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (4, 4, 2)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (5, 4, 3)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (6, 4, 4)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (7, 4, NULL)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (8, 4, 5)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (9, 2, NULL)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (10, 2, 7)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (11, 2, 11)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (12, 2, 1)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (13, 2, 3)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (14, 3, 19)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (15, 3, 18)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (16, 3, 17)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (17, 3, 16)
INSERT [dbo].[DET_PELICULAS] ([id_det_pelicula], [id_pelicula], [id_actor]) VALUES (18, 3, 15)
SET IDENTITY_INSERT [dbo].[DET_PELICULAS] OFF
SET IDENTITY_INSERT [dbo].[DIRECTORES] ON 

INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (1, N'Steven', N'Spielberg', CAST(N'1946-12-18' AS Date), 1)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (2, N'Martin', N'Scorsese', CAST(N'1942-11-17' AS Date), 1)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (3, N'Quentin', N'Tarantino', CAST(N'1963-03-27' AS Date), 1)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (4, N'Alfred', N'Hitchcock', CAST(N'1899-08-13' AS Date), 2)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (5, N'Christopher', N'Nolan', CAST(N'1970-07-30' AS Date), 2)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (6, N'Pedro', N'Almodóvar', CAST(N'1949-09-25' AS Date), 3)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (7, N'Hayao', N'Miyazaki', CAST(N'1941-01-05' AS Date), 4)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (8, N'Akira', N'Kurosawa', CAST(N'1910-03-23' AS Date), 4)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (9, N'Federico', N'Fellini', CAST(N'1920-01-20' AS Date), 5)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (10, N'Wong', N'Kar-wai', CAST(N'1958-07-17' AS Date), 6)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (11, N'Francis', N'Ford Coppola', CAST(N'1939-04-07' AS Date), 1)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (12, N'Stanley', N'Kubrick', CAST(N'1928-07-26' AS Date), 2)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (13, N'Woody', N'Allen', CAST(N'1935-12-01' AS Date), 1)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (14, N'Jean-Pierre', N'Jeunet', CAST(N'1953-09-03' AS Date), 7)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (15, N'Werner', N'Herzog', CAST(N'1942-09-05' AS Date), 8)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (16, N'Sofia', N'Coppola', CAST(N'1971-05-14' AS Date), 1)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (17, N'Gus', N'Van Sant', CAST(N'1952-07-24' AS Date), 1)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (18, N'Park', N'Chan-wook', CAST(N'1963-08-23' AS Date), 4)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (19, N'Fritz', N'Lang', CAST(N'1890-12-05' AS Date), 2)
INSERT [dbo].[DIRECTORES] ([id_director], [nombre], [apellido], [fecha_nac], [id_pais_origen]) VALUES (20, N'Jacques', N'Tati', CAST(N'1907-10-09' AS Date), 7)
SET IDENTITY_INSERT [dbo].[DIRECTORES] OFF
SET IDENTITY_INSERT [dbo].[ESTADOS] ON 

INSERT [dbo].[ESTADOS] ([id_estado], [estado]) VALUES (1, N'Libre')
INSERT [dbo].[ESTADOS] ([id_estado], [estado]) VALUES (2, N'Ocupada')
INSERT [dbo].[ESTADOS] ([id_estado], [estado]) VALUES (3, N'Reservada')
INSERT [dbo].[ESTADOS] ([id_estado], [estado]) VALUES (4, N'Seleccionada')
SET IDENTITY_INSERT [dbo].[ESTADOS] OFF
SET IDENTITY_INSERT [dbo].[FORMA_PAGOS] ON 

INSERT [dbo].[FORMA_PAGOS] ([id_forma_pago], [forma_pago]) VALUES (1, N'Efectivo')
INSERT [dbo].[FORMA_PAGOS] ([id_forma_pago], [forma_pago]) VALUES (2, N'Tarjeta de Credito/Debito')
SET IDENTITY_INSERT [dbo].[FORMA_PAGOS] OFF
SET IDENTITY_INSERT [dbo].[FUNCIONES] ON 

INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (1, 2, 1, CAST(N'2023-01-05' AS Date), CAST(N'14:30:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (2, 3, 2, CAST(N'2023-01-10' AS Date), CAST(N'16:45:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (3, 4, 3, CAST(N'2023-02-15' AS Date), CAST(N'16:45:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (4, 5, 4, CAST(N'2023-03-20' AS Date), CAST(N'21:00:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (5, 6, 5, CAST(N'2023-04-25' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (6, 7, 6, NULL, CAST(N'15:30:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (7, 8, 1, CAST(N'2023-06-05' AS Date), CAST(N'17:45:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (8, 9, 2, CAST(N'2023-07-10' AS Date), CAST(N'20:15:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (9, 10, 3, CAST(N'2023-08-15' AS Date), CAST(N'14:00:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (10, 11, 4, CAST(N'2023-09-20' AS Date), CAST(N'16:30:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (11, 12, NULL, CAST(N'2023-10-25' AS Date), CAST(N'18:45:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (12, 13, 6, CAST(N'2023-11-30' AS Date), CAST(N'22:00:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (13, 14, 1, CAST(N'2023-12-05' AS Date), CAST(N'14:30:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (14, 15, 2, CAST(N'2023-01-10' AS Date), CAST(N'16:45:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (15, 16, 3, CAST(N'2023-02-15' AS Date), NULL)
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (16, 17, 4, CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (17, 18, 5, CAST(N'2023-04-25' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (18, 19, 6, NULL, CAST(N'15:30:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (19, 20, 1, CAST(N'2023-06-05' AS Date), CAST(N'17:45:00' AS Time))
INSERT [dbo].[FUNCIONES] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora_inicio]) VALUES (20, 21, 2, CAST(N'2023-07-10' AS Date), CAST(N'20:15:00' AS Time))
SET IDENTITY_INSERT [dbo].[FUNCIONES] OFF
SET IDENTITY_INSERT [dbo].[GENERO_CLIENTES] ON 

INSERT [dbo].[GENERO_CLIENTES] ([id_genero_cliente], [genero_cliente]) VALUES (1, N'Masculino')
INSERT [dbo].[GENERO_CLIENTES] ([id_genero_cliente], [genero_cliente]) VALUES (2, N'Femenino')
INSERT [dbo].[GENERO_CLIENTES] ([id_genero_cliente], [genero_cliente]) VALUES (3, N'Otros')
SET IDENTITY_INSERT [dbo].[GENERO_CLIENTES] OFF
SET IDENTITY_INSERT [dbo].[GENEROS] ON 

INSERT [dbo].[GENEROS] ([id_genero], [genero]) VALUES (1, N'Acción')
INSERT [dbo].[GENEROS] ([id_genero], [genero]) VALUES (2, N'Comedia')
INSERT [dbo].[GENEROS] ([id_genero], [genero]) VALUES (3, N'Drama')
INSERT [dbo].[GENEROS] ([id_genero], [genero]) VALUES (4, N'Ciencia ficción')
SET IDENTITY_INSERT [dbo].[GENEROS] OFF
SET IDENTITY_INSERT [dbo].[IDIOMAS] ON 

INSERT [dbo].[IDIOMAS] ([id_idioma], [idioma]) VALUES (1, N'Inglés')
INSERT [dbo].[IDIOMAS] ([id_idioma], [idioma]) VALUES (2, N'Español')
INSERT [dbo].[IDIOMAS] ([id_idioma], [idioma]) VALUES (3, N'Francés')
INSERT [dbo].[IDIOMAS] ([id_idioma], [idioma]) VALUES (4, N'Alemán')
INSERT [dbo].[IDIOMAS] ([id_idioma], [idioma]) VALUES (5, N'Portugués')
SET IDENTITY_INSERT [dbo].[IDIOMAS] OFF
SET IDENTITY_INSERT [dbo].[LOCALIDADES] ON 

INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (1, N'Córdoba', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (2, N'Villa Carlos Paz', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (3, N'Río Cuarto', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (4, N'Villa María', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (5, N'La Falda', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (6, N'Villa General Belgrano', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (7, N'Alta Gracia', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (8, N'Cosquín', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (9, N'Villa Allende', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (10, N'Villa del Rosario', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (11, N'Santa Rosa de Calamuchita', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (12, N'Mina Clavero', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (13, N'Jesús María', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (14, N'Capilla del Monte', 189)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (15, N'Buenos Aires', 161)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (16, N'Mar del Plata', 161)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (17, N'Rosario', 180)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (18, N'Mendoza', 172)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (19, N'San Carlos de Bariloche', 199)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (20, N'Salta', 200)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (21, N'Tucumán', 207)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (22, N'Ushuaia', 206)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (23, N'San Juan', 201)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (24, N'Neuquén', 198)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (25, N'San Martín de los Andes', 198)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (26, N'La Plata', 161)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (27, N'Bahía Blanca', 161)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (28, N'Tandil', 161)
INSERT [dbo].[LOCALIDADES] ([id_localidad], [localidad], [id_provincia]) VALUES (29, N'San Salvador de Jujuy', 169)
SET IDENTITY_INSERT [dbo].[LOCALIDADES] OFF
SET IDENTITY_INSERT [dbo].[PAISES] ON 

INSERT [dbo].[PAISES] ([id_pais], [pais]) VALUES (1, N'Estados Unidos')
INSERT [dbo].[PAISES] ([id_pais], [pais]) VALUES (2, N'Reino Unido')
INSERT [dbo].[PAISES] ([id_pais], [pais]) VALUES (3, N'España')
INSERT [dbo].[PAISES] ([id_pais], [pais]) VALUES (4, N'Japón')
INSERT [dbo].[PAISES] ([id_pais], [pais]) VALUES (5, N'Italia')
INSERT [dbo].[PAISES] ([id_pais], [pais]) VALUES (6, N'Hong Kong')
INSERT [dbo].[PAISES] ([id_pais], [pais]) VALUES (7, N'Francia')
INSERT [dbo].[PAISES] ([id_pais], [pais]) VALUES (8, N'Alemania')
SET IDENTITY_INSERT [dbo].[PAISES] OFF
SET IDENTITY_INSERT [dbo].[PELICULAS] ON 

INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (2, N'Jurassic Park', CAST(N'01:27:00' AS Time), 1, 1, 1, NULL, 1, 1, 1)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (3, N'Forrest Gump', CAST(N'01:42:00' AS Time), 3, 2, 1, NULL, 2, 1, 2)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (4, N'La La Land', CAST(N'01:28:00' AS Time), 2, 1, 1, 2, 3, 1, 3)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (5, N'Inception', CAST(N'01:48:00' AS Time), 4, 2, 1, 2, 3, 1, 4)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (6, N'Avatar', CAST(N'02:02:00' AS Time), 1, 1, 1, 2, 3, NULL, 5)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (7, N'Pulp Fiction', CAST(N'01:54:00' AS Time), 3, 2, 1, NULL, NULL, NULL, 6)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (8, N'The Shawshank Redemption', CAST(N'01:42:00' AS Time), 3, 2, 1, 2, 4, 1, 6)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (9, N'The Matrix', CAST(N'01:36:00' AS Time), 1, 2, 1, 2, 5, 1, 6)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (10, N'E.T. the Extra-Terrestrial', CAST(N'01:15:00' AS Time), 2, 3, 1, 2, 6, 0, 6)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (11, N'Die Hard', CAST(N'01:32:00' AS Time), 1, 2, 1, 2, 6, 0, NULL)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (12, N'Amélie', CAST(N'01:22:00' AS Time), 3, 3, 3, 2, 6, 0, NULL)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (13, N'Das Boot', CAST(N'02:09:00' AS Time), 1, 2, 4, NULL, 7, 0, 7)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (14, N'Gladiator', CAST(N'01:55:00' AS Time), 1, 1, 1, NULL, 8, 1, 1)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (15, N'The Silence of the Lambs', CAST(N'01:18:00' AS Time), 3, 2, 1, NULL, 9, 0, 1)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (16, N'The Godfather', CAST(N'01:25:00' AS Time), 3, 2, 1, 1, 9, 1, 1)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (17, N'Blade Runner', CAST(N'01:17:00' AS Time), 4, 2, 1, 1, 10, 0, 1)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (18, N'The Dark Knight', CAST(N'01:52:00' AS Time), 1, 1, 1, NULL, 11, 1, 2)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (19, N'The Grand Budapest Hotel', CAST(N'01:39:00' AS Time), 2, 3, 1, 2, 12, 0, 2)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (20, N'Gravity', CAST(N'01:31:00' AS Time), 4, 1, 1, 2, 13, 1, NULL)
INSERT [dbo].[PELICULAS] ([id_pelicula], [titulo], [duracion], [id_genero], [id_clasificacion], [id_idioma], [id_subtitulo], [id_director], [doblaje], [id_produ]) VALUES (21, N'The Revenant', CAST(N'01:56:00' AS Time), 1, 1, 1, 1, 14, 0, NULL)
SET IDENTITY_INSERT [dbo].[PELICULAS] OFF
SET IDENTITY_INSERT [dbo].[PRODUCTORAS] ON 

INSERT [dbo].[PRODUCTORAS] ([id_productora], [productora]) VALUES (1, N'Warner Bros. Pictures')
INSERT [dbo].[PRODUCTORAS] ([id_productora], [productora]) VALUES (2, N'Universal Pictures')
INSERT [dbo].[PRODUCTORAS] ([id_productora], [productora]) VALUES (3, N'20th Century Fox')
INSERT [dbo].[PRODUCTORAS] ([id_productora], [productora]) VALUES (4, N'Paramount Pictures')
INSERT [dbo].[PRODUCTORAS] ([id_productora], [productora]) VALUES (5, N'Walt Disney Pictures')
INSERT [dbo].[PRODUCTORAS] ([id_productora], [productora]) VALUES (6, N'Columbia Pictures')
INSERT [dbo].[PRODUCTORAS] ([id_productora], [productora]) VALUES (7, N'Sony Pictures Entertainment')
INSERT [dbo].[PRODUCTORAS] ([id_productora], [productora]) VALUES (8, N'New Line Cinema')
SET IDENTITY_INSERT [dbo].[PRODUCTORAS] OFF
SET IDENTITY_INSERT [dbo].[PROMOCIONES] ON 

INSERT [dbo].[PROMOCIONES] ([id_promocion], [promocion]) VALUES (10, 10)
INSERT [dbo].[PROMOCIONES] ([id_promocion], [promocion]) VALUES (11, 20)
INSERT [dbo].[PROMOCIONES] ([id_promocion], [promocion]) VALUES (12, 40)
SET IDENTITY_INSERT [dbo].[PROMOCIONES] OFF
SET IDENTITY_INSERT [dbo].[PROVINCIAS] ON 

INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (161, N'Buenos Aires')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (162, N'Catamarca')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (163, N'Chaco')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (164, N'Chubut')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (165, N'Córdoba')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (166, N'Corrientes')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (167, N'Entre Ríos')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (168, N'Formosa')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (169, N'Jujuy')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (170, N'La Pampa')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (171, N'La Rioja')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (172, N'Mendoza')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (173, N'Misiones')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (174, N'Neuquén')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (175, N'Río Negro')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (176, N'Salta')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (177, N'San Juan')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (178, N'San Luis')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (179, N'Santa Cruz')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (180, N'Santa Fe')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (181, N'Santiago del Estero')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (182, N'Tierra del Fuego')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (183, N'Tucumán')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (184, N'Ciudad Autónoma de Buenos Aires')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (185, N'Buenos Aires')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (186, N'Catamarca')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (187, N'Chaco')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (188, N'Chubut')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (189, N'Córdoba')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (190, N'Corrientes')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (191, N'Entre Ríos')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (192, N'Formosa')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (193, N'Jujuy')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (194, N'La Pampa')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (195, N'La Rioja')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (196, N'Mendoza')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (197, N'Misiones')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (198, N'Neuquén')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (199, N'Río Negro')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (200, N'Salta')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (201, N'San Juan')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (202, N'San Luis')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (203, N'Santa Cruz')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (204, N'Santa Fe')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (205, N'Santiago del Estero')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (206, N'Tierra del Fuego')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (207, N'Tucumán')
INSERT [dbo].[PROVINCIAS] ([id_provincia], [provincia]) VALUES (208, N'Ciudad Autónoma de Buenos Aires')
SET IDENTITY_INSERT [dbo].[PROVINCIAS] OFF
SET IDENTITY_INSERT [dbo].[SALAS] ON 

INSERT [dbo].[SALAS] ([id_sala], [id_tipo_sala]) VALUES (1, 1)
INSERT [dbo].[SALAS] ([id_sala], [id_tipo_sala]) VALUES (2, 1)
INSERT [dbo].[SALAS] ([id_sala], [id_tipo_sala]) VALUES (3, 3)
INSERT [dbo].[SALAS] ([id_sala], [id_tipo_sala]) VALUES (4, 3)
INSERT [dbo].[SALAS] ([id_sala], [id_tipo_sala]) VALUES (5, 5)
INSERT [dbo].[SALAS] ([id_sala], [id_tipo_sala]) VALUES (6, 5)
SET IDENTITY_INSERT [dbo].[SALAS] OFF
SET IDENTITY_INSERT [dbo].[SUBTITULOS] ON 

INSERT [dbo].[SUBTITULOS] ([id_subtitulo], [id_idioma]) VALUES (1, 1)
INSERT [dbo].[SUBTITULOS] ([id_subtitulo], [id_idioma]) VALUES (2, 2)
INSERT [dbo].[SUBTITULOS] ([id_subtitulo], [id_idioma]) VALUES (3, 3)
INSERT [dbo].[SUBTITULOS] ([id_subtitulo], [id_idioma]) VALUES (4, 4)
INSERT [dbo].[SUBTITULOS] ([id_subtitulo], [id_idioma]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[SUBTITULOS] OFF
SET IDENTITY_INSERT [dbo].[TIPO_CLIENTES] ON 

INSERT [dbo].[TIPO_CLIENTES] ([id_tipo_cliente], [tipo_cliente], [id_promocion]) VALUES (1, N'Plata', 10)
INSERT [dbo].[TIPO_CLIENTES] ([id_tipo_cliente], [tipo_cliente], [id_promocion]) VALUES (2, N'Oro', 11)
INSERT [dbo].[TIPO_CLIENTES] ([id_tipo_cliente], [tipo_cliente], [id_promocion]) VALUES (3, N'Diamante', 12)
SET IDENTITY_INSERT [dbo].[TIPO_CLIENTES] OFF
SET IDENTITY_INSERT [dbo].[TIPO_SALAS] ON 

INSERT [dbo].[TIPO_SALAS] ([id_tipo_sala], [tipo_sala]) VALUES (1, N'Estándar')
INSERT [dbo].[TIPO_SALAS] ([id_tipo_sala], [tipo_sala]) VALUES (2, N'Premium')
INSERT [dbo].[TIPO_SALAS] ([id_tipo_sala], [tipo_sala]) VALUES (3, N'3D')
INSERT [dbo].[TIPO_SALAS] ([id_tipo_sala], [tipo_sala]) VALUES (4, N'IMAX')
INSERT [dbo].[TIPO_SALAS] ([id_tipo_sala], [tipo_sala]) VALUES (5, N'4DX')
INSERT [dbo].[TIPO_SALAS] ([id_tipo_sala], [tipo_sala]) VALUES (6, N'Dolby Atmos')
SET IDENTITY_INSERT [dbo].[TIPO_SALAS] OFF
ALTER TABLE [dbo].[ACTORES]  WITH CHECK ADD  CONSTRAINT [fk_pais1] FOREIGN KEY([id_pais_origen])
REFERENCES [dbo].[PAISES] ([id_pais])
GO
ALTER TABLE [dbo].[ACTORES] CHECK CONSTRAINT [fk_pais1]
GO
ALTER TABLE [dbo].[BARRIOS]  WITH CHECK ADD  CONSTRAINT [fk_localidad] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[LOCALIDADES] ([id_localidad])
GO
ALTER TABLE [dbo].[BARRIOS] CHECK CONSTRAINT [fk_localidad]
GO
ALTER TABLE [dbo].[BUTACAS]  WITH CHECK ADD  CONSTRAINT [fk_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[ESTADOS] ([id_estado])
GO
ALTER TABLE [dbo].[BUTACAS] CHECK CONSTRAINT [fk_estado]
GO
ALTER TABLE [dbo].[BUTACAS]  WITH CHECK ADD  CONSTRAINT [fk_funcion] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[FUNCIONES] ([id_funcion])
GO
ALTER TABLE [dbo].[BUTACAS] CHECK CONSTRAINT [fk_funcion]
GO
ALTER TABLE [dbo].[BUTACAS]  WITH CHECK ADD  CONSTRAINT [fk_pos] FOREIGN KEY([id_posicion])
REFERENCES [dbo].[POSICIONES] ([id_posicion])
GO
ALTER TABLE [dbo].[BUTACAS] CHECK CONSTRAINT [fk_pos]
GO
ALTER TABLE [dbo].[BUTACAS]  WITH CHECK ADD  CONSTRAINT [fk_sala1] FOREIGN KEY([id_sala])
REFERENCES [dbo].[SALAS] ([id_sala])
GO
ALTER TABLE [dbo].[BUTACAS] CHECK CONSTRAINT [fk_sala1]
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_barrio] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[BARRIOS] ([id_barrio])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [fk_barrio]
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_genero_clien] FOREIGN KEY([id_genero_cliente])
REFERENCES [dbo].[GENERO_CLIENTES] ([id_genero_cliente])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [fk_genero_clien]
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_tipo_cliente] FOREIGN KEY([id_tipo_cliente])
REFERENCES [dbo].[TIPO_CLIENTES] ([id_tipo_cliente])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [fk_tipo_cliente]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[CLIENTES] ([id_cliente])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_cliente]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_forma_pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[FORMA_PAGOS] ([id_forma_pago])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_forma_pago]
GO
ALTER TABLE [dbo].[DET_COMPROBANTE]  WITH CHECK ADD  CONSTRAINT [fk_butaca1] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[BUTACAS] ([id_butaca])
GO
ALTER TABLE [dbo].[DET_COMPROBANTE] CHECK CONSTRAINT [fk_butaca1]
GO
ALTER TABLE [dbo].[DET_COMPROBANTE]  WITH CHECK ADD  CONSTRAINT [fk_compro] FOREIGN KEY([id_comprobante])
REFERENCES [dbo].[COMPROBANTES] ([id_comprobante])
GO
ALTER TABLE [dbo].[DET_COMPROBANTE] CHECK CONSTRAINT [fk_compro]
GO
ALTER TABLE [dbo].[DET_PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_actor] FOREIGN KEY([id_actor])
REFERENCES [dbo].[ACTORES] ([id_actor])
GO
ALTER TABLE [dbo].[DET_PELICULAS] CHECK CONSTRAINT [fk_actor]
GO
ALTER TABLE [dbo].[DET_PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_peli1] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[PELICULAS] ([id_pelicula])
GO
ALTER TABLE [dbo].[DET_PELICULAS] CHECK CONSTRAINT [fk_peli1]
GO
ALTER TABLE [dbo].[DIRECTORES]  WITH CHECK ADD  CONSTRAINT [fk_pais] FOREIGN KEY([id_pais_origen])
REFERENCES [dbo].[PAISES] ([id_pais])
GO
ALTER TABLE [dbo].[DIRECTORES] CHECK CONSTRAINT [fk_pais]
GO
ALTER TABLE [dbo].[FUNCIONES]  WITH CHECK ADD  CONSTRAINT [fk_peli] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[PELICULAS] ([id_pelicula])
GO
ALTER TABLE [dbo].[FUNCIONES] CHECK CONSTRAINT [fk_peli]
GO
ALTER TABLE [dbo].[FUNCIONES]  WITH CHECK ADD  CONSTRAINT [fk_sala] FOREIGN KEY([id_sala])
REFERENCES [dbo].[SALAS] ([id_sala])
GO
ALTER TABLE [dbo].[FUNCIONES] CHECK CONSTRAINT [fk_sala]
GO
ALTER TABLE [dbo].[LOCALIDADES]  WITH CHECK ADD  CONSTRAINT [fk_provi] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[PROVINCIAS] ([id_provincia])
GO
ALTER TABLE [dbo].[LOCALIDADES] CHECK CONSTRAINT [fk_provi]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_clasi] FOREIGN KEY([id_clasificacion])
REFERENCES [dbo].[CLASIFICACIONES] ([id_clasificacion])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_clasi]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_dire] FOREIGN KEY([id_director])
REFERENCES [dbo].[DIRECTORES] ([id_director])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_dire]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_genero] FOREIGN KEY([id_genero])
REFERENCES [dbo].[GENEROS] ([id_genero])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_genero]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_idioma1] FOREIGN KEY([id_idioma])
REFERENCES [dbo].[IDIOMAS] ([id_idioma])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_idioma1]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_produ] FOREIGN KEY([id_produ])
REFERENCES [dbo].[PRODUCTORAS] ([id_productora])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_produ]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_sub] FOREIGN KEY([id_subtitulo])
REFERENCES [dbo].[SUBTITULOS] ([id_subtitulo])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_sub]
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD  CONSTRAINT [fk_butaca] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[BUTACAS] ([id_butaca])
GO
ALTER TABLE [dbo].[RESERVAS] CHECK CONSTRAINT [fk_butaca]
GO
ALTER TABLE [dbo].[SALAS]  WITH CHECK ADD  CONSTRAINT [fk_tipo_sala] FOREIGN KEY([id_tipo_sala])
REFERENCES [dbo].[TIPO_SALAS] ([id_tipo_sala])
GO
ALTER TABLE [dbo].[SALAS] CHECK CONSTRAINT [fk_tipo_sala]
GO
ALTER TABLE [dbo].[SUBTITULOS]  WITH CHECK ADD  CONSTRAINT [fk_idioma] FOREIGN KEY([id_idioma])
REFERENCES [dbo].[IDIOMAS] ([id_idioma])
GO
ALTER TABLE [dbo].[SUBTITULOS] CHECK CONSTRAINT [fk_idioma]
GO
ALTER TABLE [dbo].[TIPO_CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_promo] FOREIGN KEY([id_promocion])
REFERENCES [dbo].[PROMOCIONES] ([id_promocion])
GO
ALTER TABLE [dbo].[TIPO_CLIENTES] CHECK CONSTRAINT [fk_promo]
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_BUTACA]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ACTUALIZAR_BUTACA] 
	@id_butaca int,
	@estado varchar(255)
as
begin
	update butacas set id_estado =
		case
			when @estado = 'Libre' then 1
			when @estado = 'Ocupada' then 2
			when @estado = 'Reservada' then 3
		end
	where id_butaca = @id_butaca
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar_comprobante]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_actualizar_comprobante]
	@id_comprobante int
as
begin
	delete det_comprobante
	where @id_comprobante = id_comprobante
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_BARRIOS]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_BARRIOS]
as
begin
	select * from barrios
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_BUTACAS]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CONSULTAR_BUTACAS]
	@id_funcion int
as
begin
	select id_butaca, tipo_sala, estado, bu.id_funcion, nro_butaca
	from BUTACAS bu
	join SALAS sa on sa.id_sala = bu.id_sala
	join TIPO_SALAS ts on ts.id_tipo_sala = sa.id_tipo_sala
	join ESTADOS es on es.id_estado = bu.id_estado
	join FUNCIONES fu on fu.id_funcion = bu.id_funcion
	where fu.id_funcion = @id_funcion
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTE]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_CLIENTE]
	@id_cliente INT
AS
BEGIN
	SELECT *
	FROM clientes
	WHERE id_cliente = @id_cliente
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_CLIENTES]
	@nombre VARCHAR(50),
	@apellido VARCHAR(50),
	@dni INT,
	@inactivo VARCHAR(1),
	@baja VARCHAR(1)
AS
BEGIN
	SELECT id_cliente, nombre, apellido, dni, mail, telefono, fecha_nac, calle, nro, barrio, tipo_cliente, genero_cliente, fecha_alta, fecha_baja
	FROM clientes cl
	JOIN barrios ba on ba.id_barrio = cl.id_barrio
	JOIN tipo_clientes tc on tc.id_tipo_cliente = cl.id_tipo_cliente
	JOIN genero_clientes gc on gc.id_genero_cliente = cl.id_genero_cliente
	WHERE (@nombre IS NULL OR nombre LIKE '%' + @nombre + '%')
	AND (@apellido IS NULL OR apellido LIKE '%' + @apellido + '%')
	AND (@dni IS NULL OR dni = @dni)
	AND (@inactivo IS NULL OR (@inactivo = 'S' AND (SELECT TOP 1 fecha
		FROM comprobantes co
		WHERE co.id_cliente = cl.id_cliente
		ORDER BY fecha DESC) < DATEADD(YEAR, -1, GETDATE())))
	AND ((@baja IS NULL AND fecha_baja IS NULL) OR (@baja = 'S' AND fecha_baja IS NOT NULL))
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_comprobante]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_consultar_comprobante]
	@id_comprobante int
as
begin
	select cp.id_comprobante, cp.fecha cp_fecha, cl.id_cliente, nombre, apellido, fn.id_funcion, titulo, fn.fecha fn_fecha, hora_inicio, tipo_sala, fp.id_forma_pago, forma_pago, tc.id_tipo_cliente, tipo_cliente, precio_entrada, dc.id_det_comprobante, bt.id_butaca, idioma = 
		case doblaje 
			when 0 then 'Original'
			when 1 then 'Doblado' 
			else '¿?'
		end
	from comprobantes cp
	join clientes cl on cp.id_cliente = cl.id_cliente 
	join det_comprobante dc on cp.id_comprobante = dc.id_comprobante
	join butacas bt on dc.id_butaca = bt.id_butaca
	join funciones fn on bt.id_funcion = fn.id_funcion
	join forma_pagos fp on cp.id_forma_pago = fp.id_forma_pago
	join peliculas pl on fn.id_pelicula = pl.id_pelicula
	join salas sl on fn.id_sala = sl.id_sala
	join tipo_salas ts on sl.id_tipo_sala = ts.id_tipo_sala
	join tipo_clientes tc on cl.id_tipo_cliente = tc.id_tipo_cliente
	join promociones pr on tc.id_promocion = pr.id_promocion
	where cp.id_comprobante = @id_comprobante
end
GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_comprobantes]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_consultar_comprobantes]
	@fecha_desde datetime = null,
	@fecha_hasta datetime = null,
	@id_cliente int = null
as
begin
	select cp.id_comprobante, fecha, cl.id_cliente, nombre, apellido, dc.id_det_comprobante, id_butaca, precio_entrada
	from comprobantes cp
	join det_comprobante dc on cp.id_comprobante = dc.id_comprobante
	join clientes cl on cp.id_cliente = cl.id_cliente
	where (@fecha_desde is null or fecha >= @fecha_desde)
	and (@fecha_hasta is null or fecha <= @fecha_hasta)
	and (@id_cliente is null or cl.id_cliente = @id_cliente)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FORMAS_PAGO]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CONSULTAR_FORMAS_PAGO]
as
begin
	select * from FORMA_PAGOS
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FUNCIONES]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CONSULTAR_FUNCIONES]
as
begin
	
	select id_funcion, titulo Titulo, fecha Fecha, hora_inicio Hora, tipo_sala Sala, Idioma =
		case doblaje 
			when 0 then 'Original'
			when 1 then 'Doblado' 
			else '¿?'
		end
	from PELICULAS pe
	join FUNCIONES fu on fu.id_pelicula = pe.id_pelicula
	join SALAS sa on sa.id_sala = fu.id_sala
	join TIPO_SALAS ts on ts.id_tipo_sala = sa.id_tipo_sala
	order by 1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_TIPOS_CLIENTES]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONSULTAR_TIPOS_CLIENTES]
as
begin
	select * from tipo_clientes
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_CLIENTE]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAR_CLIENTE] 
	@id_cliente int
AS
BEGIN
	UPDATE CLIENTES SET fecha_baja = GETDATE()
	WHERE id_cliente = @id_cliente;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_CLIENTE]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_CLIENTE]
    @nombre VARCHAR(50),
	@apellido varchar(50),
	@dni int,
	@mail varchar(50),
	@telefono varchar(50),
    @fecha_nac datetime,
	@calle varchar(50),
	@nro int,
	@id_barrio int,
    @id_genero_cliente int,
	@id_tipo_cliente int
AS
BEGIN
    INSERT INTO CLIENTES (nombre, apellido, dni, mail, telefono, fecha_nac, calle, nro, id_barrio, id_genero_cliente, id_tipo_cliente, fecha_alta) 
	VALUES (@nombre, @apellido, @dni, @mail, @telefono, @fecha_nac, @calle, @nro, @id_barrio, @id_genero_cliente, @id_tipo_cliente, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_COMPROBANTE]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_INSERTAR_COMPROBANTE]
	@id_cliente int,
	@id_forma_pago int,
	@id_comprobante int output
as
begin
	insert into comprobantes (fecha, id_cliente, id_forma_pago) values
	(getdate(), @id_cliente, @id_forma_pago)
	set @id_comprobante = scope_identity();
end
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_INSERTAR_DETALLE]
	@precio_entrada decimal(10,2),
	@id_comprobante int,
	@id_butaca int
as
begin
	insert into det_comprobante (precio_entrada, id_comprobante, id_butaca) values
	(@precio_entrada, @id_comprobante, @id_butaca)
end	
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_CLIENTE]    Script Date: 14/11/2023 15:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICAR_CLIENTE]
	@id_cliente INT,
	@telefono VARCHAR(255),
	@mail VARCHAR(255),
	@calle VARCHAR(255),
	@nro INT NULL,
	@id_barrio INT,
	@id_tipo INT,
	@fecha_baja DATETIME
AS
BEGIN
	UPDATE CLIENTES 
	SET telefono = @telefono, mail = @mail, calle = @calle, nro = @nro, id_barrio = @id_barrio, id_tipo_cliente = @id_tipo, fecha_baja = @fecha_baja
	WHERE id_cliente = @id_cliente
END
GO
USE [master]
GO
ALTER DATABASE [CINE] SET  READ_WRITE 
GO


use CINE_22
go

select * from CLIENTES
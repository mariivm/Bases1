USE [master]
GO
/****** Object:  Database [elementalGDB]    Script Date: 30/4/2023 16:05:02 ******/
CREATE DATABASE [elementalGDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'elementalGDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\elementalGDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'elementalGDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\elementalGDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [elementalGDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [elementalGDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [elementalGDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [elementalGDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [elementalGDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [elementalGDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [elementalGDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [elementalGDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [elementalGDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [elementalGDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [elementalGDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [elementalGDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [elementalGDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [elementalGDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [elementalGDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [elementalGDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [elementalGDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [elementalGDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [elementalGDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [elementalGDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [elementalGDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [elementalGDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [elementalGDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [elementalGDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [elementalGDB] SET RECOVERY FULL 
GO
ALTER DATABASE [elementalGDB] SET  MULTI_USER 
GO
ALTER DATABASE [elementalGDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [elementalGDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [elementalGDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [elementalGDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [elementalGDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [elementalGDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'elementalGDB', N'ON'
GO
ALTER DATABASE [elementalGDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [elementalGDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [elementalGDB]
GO
/****** Object:  UserDefinedTableType [dbo].[TVPquiz]    Script Date: 30/4/2023 16:05:02 ******/
CREATE TYPE [dbo].[TVPquiz] AS TABLE(
	[Columna1] [varchar](10) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVPType]    Script Date: 30/4/2023 16:05:02 ******/
CREATE TYPE [dbo].[TVPType] AS TABLE(
	[Column1] [int] NULL,
	[Column2] [varchar](50) NULL
)
GO
/****** Object:  Table [dbo].[actores]    Script Date: 30/4/2023 16:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actores](
	[actorId] [int] NOT NULL,
	[descripcion] [varchar](125) NOT NULL,
	[tipoActorId] [int] NOT NULL,
 CONSTRAINT [PK_actores] PRIMARY KEY CLUSTERED 
(
	[actorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actoresXcontratoXproducto]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actoresXcontratoXproducto](
	[contratoId] [int] NOT NULL,
	[localId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[porcentaje] [decimal](8, 2) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[checksum] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calles]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calles](
	[calleId] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[regionId] [int] NOT NULL,
	[estadoId] [int] NOT NULL,
	[paisId] [int] NOT NULL,
 CONSTRAINT [PK_calles] PRIMARY KEY CLUSTERED 
(
	[calleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cantidadDesechosXlocal]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cantidadDesechosXlocal](
	[localId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
	[unidadMedida] [decimal](8, 2) NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoriaProducto]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoriaProducto](
	[categoriaId] [int] NOT NULL,
	[descripcion] [varchar](75) NOT NULL,
 CONSTRAINT [PK_categoriaProducto] PRIMARY KEY CLUSTERED 
(
	[categoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoriaXproductos]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoriaXproductos](
	[categoriaId] [int] NOT NULL,
	[productoId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cicloRecoleccion]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cicloRecoleccion](
	[cicloId] [int] NOT NULL,
	[localId] [int] NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
 CONSTRAINT [PK_cicloRecoleccion] PRIMARY KEY CLUSTERED 
(
	[cicloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[clienteId] [int] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[numTelefono] [varchar](13) NOT NULL,
	[cedula] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[status] [smallint] NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[clienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coberturaXempresas]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coberturaXempresas](
	[paisId] [int] NOT NULL,
	[empresaId] [int] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoXactores]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoXactores](
	[contactoActorId] [int] NOT NULL,
	[contactValueId] [int] NOT NULL,
	[actorId] [int] NOT NULL,
 CONSTRAINT [PK_contactoXactores] PRIMARY KEY CLUSTERED 
(
	[contactoActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoXempresaEV]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoXempresaEV](
	[contactoEmpresaEVId] [int] NOT NULL,
	[contactValueId] [int] NOT NULL,
	[empresaId] [int] NOT NULL,
 CONSTRAINT [PK_contactoXempresaEV] PRIMARY KEY CLUSTERED 
(
	[contactoEmpresaEVId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoXlocal]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoXlocal](
	[contactoLocalId] [int] NOT NULL,
	[contactValueId] [int] NOT NULL,
	[localId] [int] NOT NULL,
 CONSTRAINT [PK_contactoXlocal] PRIMARY KEY CLUSTERED 
(
	[contactoLocalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactType]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactType](
	[contactTypeId] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_contactType] PRIMARY KEY CLUSTERED 
(
	[contactTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactValues]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactValues](
	[contactValueId] [int] NOT NULL,
	[contactTypeId] [int] NOT NULL,
	[value] [varchar](30) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_contactValues] PRIMARY KEY CLUSTERED 
(
	[contactValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContaminantesPagosEmpresas]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContaminantesPagosEmpresas](
	[contaminante] [int] NOT NULL,
	[localId] [int] NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratos]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratos](
	[contratoId] [int] NOT NULL,
	[empresaId] [int] NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[cicloId] [int] NOT NULL,
	[localId] [int] NOT NULL,
	[enabled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratosGenerales]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratosGenerales](
	[contratoId] [int] NOT NULL,
	[actorId] [int] NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
 CONSTRAINT [PK_contratosGenerales] PRIMARY KEY CLUSTERED 
(
	[contratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conversionMonedas]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conversionMonedas](
	[monedaBase] [int] NOT NULL,
	[monedaDest] [int] NOT NULL,
	[factorConver] [decimal](8, 4) NOT NULL,
	[cantidadBase] [decimal](8, 4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[costoProcesoXmateriales]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costoProcesoXmateriales](
	[productoId] [int] NOT NULL,
	[cantidadBase] [decimal](8, 2) NOT NULL,
	[costoXcant] [decimal](8, 2) NOT NULL,
	[empresaId] [int] NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[checksum] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diaXciclo]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diaXciclo](
	[cicloId] [int] NOT NULL,
	[dXcId] [int] NOT NULL,
	[hora] [time](7) NOT NULL,
	[diaSemana] [varchar](1) NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
 CONSTRAINT [PK_diasXciclo] PRIMARY KEY CLUSTERED 
(
	[dXcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direcciones]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direcciones](
	[direccionId] [int] NOT NULL,
	[calleId] [int] NOT NULL,
	[regionId] [int] NOT NULL,
	[estadoId] [int] NOT NULL,
	[codigoPostal] [int] NOT NULL,
	[paisId] [int] NOT NULL,
 CONSTRAINT [PK_direcciones] PRIMARY KEY CLUSTERED 
(
	[direccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[divisas]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[divisas](
	[divisaId] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[abreviatura] [varchar](10) NOT NULL,
	[simbolo] [varchar](10) NOT NULL,
 CONSTRAINT [PK_divisas] PRIMARY KEY CLUSTERED 
(
	[divisaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[divisasXpais]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[divisasXpais](
	[divisaId] [int] NOT NULL,
	[paisId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresaEVXvehiculo]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresaEVXvehiculo](
	[empresaId] [int] NOT NULL,
	[vehiculoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[checksum] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresasEV]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresasEV](
	[empresaId] [int] NOT NULL,
	[direccionId] [int] NOT NULL,
 CONSTRAINT [PK_empresasEV] PRIMARY KEY CLUSTERED 
(
	[empresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[estadoId] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[paisId] [int] NOT NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[estadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event log]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event log](
	[EventLogId] [smallint] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[computer] [varchar](45) NOT NULL,
	[username] [varchar](45) NOT NULL,
	[checksum] [decimal](18, 0) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[value1] [varchar](60) NOT NULL,
	[value2] [varchar](60) NOT NULL,
	[referenceId1] [bigint] NOT NULL,
	[referenceId2] [bigint] NOT NULL,
	[levelId] [smallint] NOT NULL,
	[sourceId] [smallint] NOT NULL,
	[evenTypeId] [smallint] NOT NULL,
	[objectTypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_Event log] PRIMARY KEY CLUSTERED 
(
	[EventLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventTypes]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventTypes](
	[EventTypeId] [smallint] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
 CONSTRAINT [PK_eventTypes] PRIMARY KEY CLUSTERED 
(
	[EventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturaXproductora]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturaXproductora](
	[localId] [int] NOT NULL,
	[cantidadDebida] [decimal](8, 2) NOT NULL,
	[pago] [bit] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[checksum] [varchar](50) NOT NULL,
	[facturaId] [int] NOT NULL,
 CONSTRAINT [PK_facturaXproductora] PRIMARY KEY CLUSTERED 
(
	[facturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flotillas]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flotillas](
	[vehiculoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[paisId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idiomas]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomas](
	[idiomaId] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[variacionCult] [varchar](5) NOT NULL,
 CONSTRAINT [PK_idiomas] PRIMARY KEY CLUSTERED 
(
	[idiomaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idiomaXpaises]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomaXpaises](
	[idiomaId] [int] NOT NULL,
	[paisId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventarioProductos]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventarioProductos](
	[productoId] [int] NOT NULL,
	[lote] [int] NOT NULL,
	[cantidad] [decimal](8, 2) NOT NULL,
	[unidadMedida] [varchar](10) NOT NULL,
	[costo] [decimal](8, 2) NOT NULL,
	[checksum] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[levels]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[levels](
	[levelId] [smallint] NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
 CONSTRAINT [PK_levels] PRIMARY KEY CLUSTERED 
(
	[levelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localesXproceso]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localesXproceso](
	[localId] [int] NOT NULL,
	[procesoRecoId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localesXproductor]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localesXproductor](
	[localId] [int] NOT NULL,
	[actorId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[payId] [int] NOT NULL,
	[direccionId] [int] NOT NULL,
 CONSTRAINT [PK_localesXproductor] PRIMARY KEY CLUSTERED 
(
	[localId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logpagos]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logpagos](
	[actorId] [int] NOT NULL,
	[pago] [decimal](8, 3) NOT NULL,
	[fecha] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logUbicacionRecipiente]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logUbicacionRecipiente](
	[recipienteId] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[direccionId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[metricasXlocal]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metricasXlocal](
	[localId] [int] NOT NULL,
	[indiceContaminacion] [smallint] NOT NULL,
	[indiceRecoleccion] [smallint] NOT NULL,
	[indiceTratamiento] [smallint] NOT NULL,
	[año] [varchar](4) NOT NULL,
	[checksum] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objectTypes]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objectTypes](
	[objectTypesId] [smallint] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
 CONSTRAINT [PK_objectTypes] PRIMARY KEY CLUSTERED 
(
	[objectTypesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordenProduccion]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordenProduccion](
	[lote] [int] NOT NULL,
	[recepcionId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[cantidadInicial] [decimal](8, 2) NOT NULL,
	[productoResult] [int] NOT NULL,
	[cantidadResult] [decimal](8, 2) NOT NULL,
	[costo] [decimal](8, 2) NOT NULL,
	[actorId] [int] NULL,
 CONSTRAINT [PK_conversionProductos] PRIMARY KEY CLUSTERED 
(
	[lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[paisId] [int] NOT NULL,
	[nombre] [varchar](10) NOT NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[paisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payType]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payType](
	[payId] [int] NOT NULL,
	[descripcion] [int] NOT NULL,
 CONSTRAINT [PK_payType] PRIMARY KEY CLUSTERED 
(
	[payId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precioXkm]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precioXkm](
	[unidadBase] [smallint] NOT NULL,
	[precio] [decimal](8, 2) NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[paisId] [int] NOT NULL,
	[checksum] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precioXproducto]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precioXproducto](
	[productoId] [int] NOT NULL,
	[precio] [decimal](8, 2) NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[cantidad] [int] NOT NULL,
	[unidadMedida] [varchar](10) NOT NULL,
	[empresaId] [int] NOT NULL,
	[checksum] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precioXpunto]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precioXpunto](
	[unidadBase] [smallint] NOT NULL,
	[precio] [decimal](8, 2) NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[paisId] [int] NOT NULL,
	[checksum] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[procesadoRecipientes]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procesadoRecipientes](
	[procesoId] [int] NOT NULL,
	[motivo] [varchar](100) NOT NULL,
	[recipienteRetornado] [int] NULL,
	[procesadoId] [int] NOT NULL,
	[lote] [int] NOT NULL,
	[timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_procesadoRecipientes] PRIMARY KEY CLUSTERED 
(
	[procesoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[productoId] [int] NOT NULL,
	[tipo] [smallint] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[unidadMedida] [varchar](10) NOT NULL,
	[vendible] [bit] NOT NULL,
	[status] [smallint] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[productoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recepcionDesechos]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recepcionDesechos](
	[localId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[recepcionId] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[tipoRecepcion] [smallint] NOT NULL,
	[productoId] [int] NOT NULL,
	[pesoRecibido] [decimal](8, 2) NOT NULL,
	[empresaId] [int] NULL,
	[checksum] [varchar](50) NOT NULL,
 CONSTRAINT [PK_recepcionDesechos] PRIMARY KEY CLUSTERED 
(
	[recepcionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipientes]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipientes](
	[recipienteId] [int] NOT NULL,
	[productoId] [int] NULL,
	[recipCapacidad] [int] NOT NULL,
	[recipPeso] [int] NOT NULL,
	[enable] [bit] NOT NULL,
	[fechaCompra] [datetime] NOT NULL,
	[categoriaId] [int] NOT NULL,
	[actorId] [int] NOT NULL,
	[estado] [smallint] NOT NULL,
 CONSTRAINT [PK_recipiente] PRIMARY KEY CLUSTERED 
(
	[recipienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipienteXlocal]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipienteXlocal](
	[localId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regiones]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regiones](
	[regionId] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estadoId] [int] NOT NULL,
	[paisId] [int] NOT NULL,
 CONSTRAINT [PK_regiones] PRIMARY KEY CLUSTERED 
(
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[source]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[source](
	[sourceId] [smallint] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
 CONSTRAINT [PK_source] PRIMARY KEY CLUSTERED 
(
	[sourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoActores]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoActores](
	[tipoActorId] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipoActores] PRIMARY KEY CLUSTERED 
(
	[tipoActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoProcesado]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoProcesado](
	[procesadoId] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipoProcesado] PRIMARY KEY CLUSTERED 
(
	[procesadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoProcesoReco]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoProcesoReco](
	[procesoRecoId] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tipoProcesoReco] PRIMARY KEY CLUSTERED 
(
	[procesoRecoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traducciones]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traducciones](
	[traduccionId] [int] NOT NULL,
	[textOrg] [varchar](50) NOT NULL,
	[textoTradu] [varchar](50) NOT NULL,
	[idiomaId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Traducciones] PRIMARY KEY CLUSTERED 
(
	[traduccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubicacionXlocal]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubicacionXlocal](
	[ubicacionId] [int] NOT NULL,
	[localId] [int] NOT NULL,
	[direccion] [geography] NOT NULL,
	[paisId] [int] NOT NULL,
 CONSTRAINT [PK_ubicacionXlocal] PRIMARY KEY CLUSTERED 
(
	[ubicacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehiculo]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculo](
	[vehiculoId] [int] NOT NULL,
	[capacidad] [float] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_vehiculo] PRIMARY KEY CLUSTERED 
(
	[vehiculoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehiculoXciclo]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculoXciclo](
	[vehiculoId] [int] NOT NULL,
	[dXcId] [int] NOT NULL,
	[fechaInicial] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventasProductos]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventasProductos](
	[ventaId] [int] NOT NULL,
	[clienteId] [int] NOT NULL,
	[empresaId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[fechaVenta] [datetime] NOT NULL,
	[cantidadVenta] [decimal](8, 2) NOT NULL,
	[lote] [int] NOT NULL,
 CONSTRAINT [PK_ventasProductos] PRIMARY KEY CLUSTERED 
(
	[ventaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[actores]  WITH CHECK ADD  CONSTRAINT [FK_actores_tipoActores_tipoActorId] FOREIGN KEY([tipoActorId])
REFERENCES [dbo].[tipoActores] ([tipoActorId])
GO
ALTER TABLE [dbo].[actores] CHECK CONSTRAINT [FK_actores_tipoActores_tipoActorId]
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto]  WITH CHECK ADD  CONSTRAINT [FK_actoresXcontratoXproducto_contratosGenerales_contratoId] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratosGenerales] ([contratoId])
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto] CHECK CONSTRAINT [FK_actoresXcontratoXproducto_contratosGenerales_contratoId]
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto]  WITH CHECK ADD  CONSTRAINT [FK_actoresXcontratoXproducto_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto] CHECK CONSTRAINT [FK_actoresXcontratoXproducto_localesXproductor_localId]
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto]  WITH CHECK ADD  CONSTRAINT [FK_actoresXcontratoXproducto_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[actoresXcontratoXproducto] CHECK CONSTRAINT [FK_actoresXcontratoXproducto_productos_productoId]
GO
ALTER TABLE [dbo].[cantidadDesechosXlocal]  WITH CHECK ADD  CONSTRAINT [FK_cantidadDesechosXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[cantidadDesechosXlocal] CHECK CONSTRAINT [FK_cantidadDesechosXlocal_localesXproductor_localId]
GO
ALTER TABLE [dbo].[cantidadDesechosXlocal]  WITH CHECK ADD  CONSTRAINT [FK_cantidadDesechosXlocal_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[cantidadDesechosXlocal] CHECK CONSTRAINT [FK_cantidadDesechosXlocal_productos_productoId]
GO
ALTER TABLE [dbo].[categoriaXproductos]  WITH CHECK ADD  CONSTRAINT [FK_categoriaXporductos_categoriaProducto_categoriaId] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[categoriaProducto] ([categoriaId])
GO
ALTER TABLE [dbo].[categoriaXproductos] CHECK CONSTRAINT [FK_categoriaXporductos_categoriaProducto_categoriaId]
GO
ALTER TABLE [dbo].[categoriaXproductos]  WITH CHECK ADD  CONSTRAINT [FK_categoriaXporductos_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[categoriaXproductos] CHECK CONSTRAINT [FK_categoriaXporductos_productos_productoId]
GO
ALTER TABLE [dbo].[cicloRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_cicloRecoleccion_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[cicloRecoleccion] CHECK CONSTRAINT [FK_cicloRecoleccion_localesXproductor_localId]
GO
ALTER TABLE [dbo].[cicloRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_cicloRecoleccion_ubicacionXlocal_ubicacionId] FOREIGN KEY([cicloId])
REFERENCES [dbo].[ubicacionXlocal] ([ubicacionId])
GO
ALTER TABLE [dbo].[cicloRecoleccion] CHECK CONSTRAINT [FK_cicloRecoleccion_ubicacionXlocal_ubicacionId]
GO
ALTER TABLE [dbo].[coberturaXempresas]  WITH CHECK ADD  CONSTRAINT [FK_coberturaXempresas_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[coberturaXempresas] CHECK CONSTRAINT [FK_coberturaXempresas_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[coberturaXempresas]  WITH CHECK ADD  CONSTRAINT [FK_coberturaXempresas_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[coberturaXempresas] CHECK CONSTRAINT [FK_coberturaXempresas_paises_paisId]
GO
ALTER TABLE [dbo].[contactoXactores]  WITH CHECK ADD  CONSTRAINT [FK_contactoXactores_actores_actorId] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[contactoXactores] CHECK CONSTRAINT [FK_contactoXactores_actores_actorId]
GO
ALTER TABLE [dbo].[contactoXactores]  WITH CHECK ADD  CONSTRAINT [FK_contactoXactores_contactValues_id] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactoXactores] CHECK CONSTRAINT [FK_contactoXactores_contactValues_id]
GO
ALTER TABLE [dbo].[contactoXempresaEV]  WITH CHECK ADD  CONSTRAINT [FK_contactoXempresaEV_contactValues_contactValueID] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactoXempresaEV] CHECK CONSTRAINT [FK_contactoXempresaEV_contactValues_contactValueID]
GO
ALTER TABLE [dbo].[contactoXempresaEV]  WITH CHECK ADD  CONSTRAINT [FK_contactoXempresaEV_empresasEV_empresaID] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[contactoXempresaEV] CHECK CONSTRAINT [FK_contactoXempresaEV_empresasEV_empresaID]
GO
ALTER TABLE [dbo].[contactoXlocal]  WITH CHECK ADD  CONSTRAINT [FK_contactoXlocal_contactValues_contactValueId] FOREIGN KEY([contactValueId])
REFERENCES [dbo].[contactValues] ([contactValueId])
GO
ALTER TABLE [dbo].[contactoXlocal] CHECK CONSTRAINT [FK_contactoXlocal_contactValues_contactValueId]
GO
ALTER TABLE [dbo].[contactoXlocal]  WITH CHECK ADD  CONSTRAINT [FK_contactoXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[contactoXlocal] CHECK CONSTRAINT [FK_contactoXlocal_localesXproductor_localId]
GO
ALTER TABLE [dbo].[contactValues]  WITH CHECK ADD  CONSTRAINT [FK_contactValues_contactType_id] FOREIGN KEY([contactTypeId])
REFERENCES [dbo].[contactType] ([contactTypeId])
GO
ALTER TABLE [dbo].[contactValues] CHECK CONSTRAINT [FK_contactValues_contactType_id]
GO
ALTER TABLE [dbo].[ContaminantesPagosEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_ContaminantesPagosEmpresas_localesXproductor_local] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[ContaminantesPagosEmpresas] CHECK CONSTRAINT [FK_ContaminantesPagosEmpresas_localesXproductor_local]
GO
ALTER TABLE [dbo].[ContaminantesPagosEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_ContaminantesPagosEmpresas_localesXproductor_localId] FOREIGN KEY([contaminante])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[ContaminantesPagosEmpresas] CHECK CONSTRAINT [FK_ContaminantesPagosEmpresas_localesXproductor_localId]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_contratosGenerales_contratoId] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratosGenerales] ([contratoId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_contratosGenerales_contratoId]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_Traducciones_traduccionId] FOREIGN KEY([status])
REFERENCES [dbo].[Traducciones] ([traduccionId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_Traducciones_traduccionId]
GO
ALTER TABLE [dbo].[conversionMonedas]  WITH CHECK ADD  CONSTRAINT [FK_conversionMonedas_divisas_divisaId_base] FOREIGN KEY([monedaBase])
REFERENCES [dbo].[divisas] ([divisaId])
GO
ALTER TABLE [dbo].[conversionMonedas] CHECK CONSTRAINT [FK_conversionMonedas_divisas_divisaId_base]
GO
ALTER TABLE [dbo].[conversionMonedas]  WITH CHECK ADD  CONSTRAINT [FK_conversionMonedas_divisas_divisaId_Destino] FOREIGN KEY([monedaDest])
REFERENCES [dbo].[divisas] ([divisaId])
GO
ALTER TABLE [dbo].[conversionMonedas] CHECK CONSTRAINT [FK_conversionMonedas_divisas_divisaId_Destino]
GO
ALTER TABLE [dbo].[costoProcesoXmateriales]  WITH CHECK ADD  CONSTRAINT [FK_costoProcesoXmateriales_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[costoProcesoXmateriales] CHECK CONSTRAINT [FK_costoProcesoXmateriales_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[costoProcesoXmateriales]  WITH CHECK ADD  CONSTRAINT [FK_costoProcesoXmateriales_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[costoProcesoXmateriales] CHECK CONSTRAINT [FK_costoProcesoXmateriales_productos_productoId]
GO
ALTER TABLE [dbo].[diaXciclo]  WITH CHECK ADD  CONSTRAINT [FK_diaXciclo_cicloRecoleccion_cicloId] FOREIGN KEY([cicloId])
REFERENCES [dbo].[cicloRecoleccion] ([cicloId])
GO
ALTER TABLE [dbo].[diaXciclo] CHECK CONSTRAINT [FK_diaXciclo_cicloRecoleccion_cicloId]
GO
ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_direcciones_calles_calleId] FOREIGN KEY([calleId])
REFERENCES [dbo].[calles] ([calleId])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_direcciones_calles_calleId]
GO
ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_direcciones_estados_estadosId] FOREIGN KEY([estadoId])
REFERENCES [dbo].[estados] ([estadoId])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_direcciones_estados_estadosId]
GO
ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_direcciones_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_direcciones_paises_paisId]
GO
ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_direcciones_regiones_regionId] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_direcciones_regiones_regionId]
GO
ALTER TABLE [dbo].[divisasXpais]  WITH CHECK ADD  CONSTRAINT [FK_divisasXpais_divisas_divisaId] FOREIGN KEY([divisaId])
REFERENCES [dbo].[divisas] ([divisaId])
GO
ALTER TABLE [dbo].[divisasXpais] CHECK CONSTRAINT [FK_divisasXpais_divisas_divisaId]
GO
ALTER TABLE [dbo].[divisasXpais]  WITH CHECK ADD  CONSTRAINT [FK_divisasXpais_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[divisasXpais] CHECK CONSTRAINT [FK_divisasXpais_paises_paisId]
GO
ALTER TABLE [dbo].[empresaEVXvehiculo]  WITH CHECK ADD  CONSTRAINT [FK_empresaEVXvehiculo_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[empresaEVXvehiculo] CHECK CONSTRAINT [FK_empresaEVXvehiculo_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[empresaEVXvehiculo]  WITH CHECK ADD  CONSTRAINT [FK_empresaEVXvehiculo_vehiculo_vehiculoId] FOREIGN KEY([vehiculoId])
REFERENCES [dbo].[vehiculo] ([vehiculoId])
GO
ALTER TABLE [dbo].[empresaEVXvehiculo] CHECK CONSTRAINT [FK_empresaEVXvehiculo_vehiculo_vehiculoId]
GO
ALTER TABLE [dbo].[empresasEV]  WITH CHECK ADD  CONSTRAINT [FK_empresasEV_direcciones_direccionId] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[empresasEV] CHECK CONSTRAINT [FK_empresasEV_direcciones_direccionId]
GO
ALTER TABLE [dbo].[Event log]  WITH CHECK ADD  CONSTRAINT [FK_Event log_eventTypes_eventTypesId] FOREIGN KEY([evenTypeId])
REFERENCES [dbo].[eventTypes] ([EventTypeId])
GO
ALTER TABLE [dbo].[Event log] CHECK CONSTRAINT [FK_Event log_eventTypes_eventTypesId]
GO
ALTER TABLE [dbo].[Event log]  WITH CHECK ADD  CONSTRAINT [FK_Event log_levels_levelId] FOREIGN KEY([levelId])
REFERENCES [dbo].[levels] ([levelId])
GO
ALTER TABLE [dbo].[Event log] CHECK CONSTRAINT [FK_Event log_levels_levelId]
GO
ALTER TABLE [dbo].[Event log]  WITH CHECK ADD  CONSTRAINT [FK_Event log_objectTypes_objectTypeId] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypesId])
GO
ALTER TABLE [dbo].[Event log] CHECK CONSTRAINT [FK_Event log_objectTypes_objectTypeId]
GO
ALTER TABLE [dbo].[Event log]  WITH CHECK ADD  CONSTRAINT [FK_Event log_source_sourceId] FOREIGN KEY([sourceId])
REFERENCES [dbo].[source] ([sourceId])
GO
ALTER TABLE [dbo].[Event log] CHECK CONSTRAINT [FK_Event log_source_sourceId]
GO
ALTER TABLE [dbo].[facturaXproductora]  WITH CHECK ADD  CONSTRAINT [FK_facturaXproductora_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[facturaXproductora] CHECK CONSTRAINT [FK_facturaXproductora_localesXproductor_localId]
GO
ALTER TABLE [dbo].[flotillas]  WITH CHECK ADD  CONSTRAINT [FK_flotillas_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[flotillas] CHECK CONSTRAINT [FK_flotillas_paises_paisId]
GO
ALTER TABLE [dbo].[flotillas]  WITH CHECK ADD  CONSTRAINT [FK_flotillas_vehiculo_vehiculoId] FOREIGN KEY([vehiculoId])
REFERENCES [dbo].[vehiculo] ([vehiculoId])
GO
ALTER TABLE [dbo].[flotillas] CHECK CONSTRAINT [FK_flotillas_vehiculo_vehiculoId]
GO
ALTER TABLE [dbo].[idiomaXpaises]  WITH CHECK ADD  CONSTRAINT [FK_idiomaXpaises_idiomas_idiomasId] FOREIGN KEY([idiomaId])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[idiomaXpaises] CHECK CONSTRAINT [FK_idiomaXpaises_idiomas_idiomasId]
GO
ALTER TABLE [dbo].[idiomaXpaises]  WITH CHECK ADD  CONSTRAINT [FK_idiomaXpaises_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[idiomaXpaises] CHECK CONSTRAINT [FK_idiomaXpaises_paises_paisId]
GO
ALTER TABLE [dbo].[inventarioProductos]  WITH CHECK ADD  CONSTRAINT [FK_inventarioProductos_conversionProductos_conversionId] FOREIGN KEY([lote])
REFERENCES [dbo].[ordenProduccion] ([lote])
GO
ALTER TABLE [dbo].[inventarioProductos] CHECK CONSTRAINT [FK_inventarioProductos_conversionProductos_conversionId]
GO
ALTER TABLE [dbo].[inventarioProductos]  WITH CHECK ADD  CONSTRAINT [FK_inventarioProductos_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[inventarioProductos] CHECK CONSTRAINT [FK_inventarioProductos_productos_productoId]
GO
ALTER TABLE [dbo].[localesXproceso]  WITH CHECK ADD  CONSTRAINT [FK_localesXproceso_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[localesXproceso] CHECK CONSTRAINT [FK_localesXproceso_localesXproductor_localId]
GO
ALTER TABLE [dbo].[localesXproceso]  WITH CHECK ADD  CONSTRAINT [FK_localesXproceso_tipoProcesoReco_procesoId] FOREIGN KEY([procesoRecoId])
REFERENCES [dbo].[tipoProcesoReco] ([procesoRecoId])
GO
ALTER TABLE [dbo].[localesXproceso] CHECK CONSTRAINT [FK_localesXproceso_tipoProcesoReco_procesoId]
GO
ALTER TABLE [dbo].[localesXproductor]  WITH CHECK ADD  CONSTRAINT [FK_localesXproductor_actores_actorId] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[localesXproductor] CHECK CONSTRAINT [FK_localesXproductor_actores_actorId]
GO
ALTER TABLE [dbo].[localesXproductor]  WITH CHECK ADD  CONSTRAINT [FK_localesXproductor_direcciones_localId] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[localesXproductor] CHECK CONSTRAINT [FK_localesXproductor_direcciones_localId]
GO
ALTER TABLE [dbo].[localesXproductor]  WITH CHECK ADD  CONSTRAINT [FK_localesXproductor_payType_patId] FOREIGN KEY([payId])
REFERENCES [dbo].[payType] ([payId])
GO
ALTER TABLE [dbo].[localesXproductor] CHECK CONSTRAINT [FK_localesXproductor_payType_patId]
GO
ALTER TABLE [dbo].[logpagos]  WITH CHECK ADD  CONSTRAINT [FK_logpagos_actores_actorId] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[logpagos] CHECK CONSTRAINT [FK_logpagos_actores_actorId]
GO
ALTER TABLE [dbo].[logUbicacionRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_logUbicacionRecipiente_direcciones_direccionId] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[logUbicacionRecipiente] CHECK CONSTRAINT [FK_logUbicacionRecipiente_direcciones_direccionId]
GO
ALTER TABLE [dbo].[logUbicacionRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_logUbicacionRecipiente_recipiente_recipienteId] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[logUbicacionRecipiente] CHECK CONSTRAINT [FK_logUbicacionRecipiente_recipiente_recipienteId]
GO
ALTER TABLE [dbo].[metricasXlocal]  WITH CHECK ADD  CONSTRAINT [FK_metricasXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[metricasXlocal] CHECK CONSTRAINT [FK_metricasXlocal_localesXproductor_localId]
GO
ALTER TABLE [dbo].[ordenProduccion]  WITH CHECK ADD  CONSTRAINT [FK_conversionProductos_actores_actorId] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[ordenProduccion] CHECK CONSTRAINT [FK_conversionProductos_actores_actorId]
GO
ALTER TABLE [dbo].[ordenProduccion]  WITH CHECK ADD  CONSTRAINT [FK_conversionProductos_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[ordenProduccion] CHECK CONSTRAINT [FK_conversionProductos_productos_productoId]
GO
ALTER TABLE [dbo].[ordenProduccion]  WITH CHECK ADD  CONSTRAINT [FK_conversionProductos_recepcionDesechos_recepcionId] FOREIGN KEY([recepcionId])
REFERENCES [dbo].[recepcionDesechos] ([recepcionId])
GO
ALTER TABLE [dbo].[ordenProduccion] CHECK CONSTRAINT [FK_conversionProductos_recepcionDesechos_recepcionId]
GO
ALTER TABLE [dbo].[payType]  WITH CHECK ADD  CONSTRAINT [FK_payType_Traducciones_traduccionId] FOREIGN KEY([descripcion])
REFERENCES [dbo].[Traducciones] ([traduccionId])
GO
ALTER TABLE [dbo].[payType] CHECK CONSTRAINT [FK_payType_Traducciones_traduccionId]
GO
ALTER TABLE [dbo].[precioXkm]  WITH CHECK ADD  CONSTRAINT [FK_precioXkm_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[precioXkm] CHECK CONSTRAINT [FK_precioXkm_paises_paisId]
GO
ALTER TABLE [dbo].[precioXproducto]  WITH CHECK ADD  CONSTRAINT [FK_precioXproducto_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[precioXproducto] CHECK CONSTRAINT [FK_precioXproducto_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[precioXproducto]  WITH CHECK ADD  CONSTRAINT [FK_precioXproducto_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[precioXproducto] CHECK CONSTRAINT [FK_precioXproducto_productos_productoId]
GO
ALTER TABLE [dbo].[precioXpunto]  WITH CHECK ADD  CONSTRAINT [FK_precioXpunto_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[precioXpunto] CHECK CONSTRAINT [FK_precioXpunto_paises_paisId]
GO
ALTER TABLE [dbo].[procesadoRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_procesadoRecipientes_conversionProductos] FOREIGN KEY([lote])
REFERENCES [dbo].[ordenProduccion] ([lote])
GO
ALTER TABLE [dbo].[procesadoRecipientes] CHECK CONSTRAINT [FK_procesadoRecipientes_conversionProductos]
GO
ALTER TABLE [dbo].[procesadoRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_procesadoRecipientes_recipiente_recipienteId] FOREIGN KEY([recipienteRetornado])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[procesadoRecipientes] CHECK CONSTRAINT [FK_procesadoRecipientes_recipiente_recipienteId]
GO
ALTER TABLE [dbo].[procesadoRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_procesadoRecipientes_tipoProcesado_procesadoId] FOREIGN KEY([procesadoId])
REFERENCES [dbo].[tipoProcesado] ([procesadoId])
GO
ALTER TABLE [dbo].[procesadoRecipientes] CHECK CONSTRAINT [FK_procesadoRecipientes_tipoProcesado_procesadoId]
GO
ALTER TABLE [dbo].[recepcionDesechos]  WITH CHECK ADD  CONSTRAINT [FK_recepcionDesechos_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[recepcionDesechos] CHECK CONSTRAINT [FK_recepcionDesechos_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[recepcionDesechos]  WITH CHECK ADD  CONSTRAINT [FK_recepcionDesechos_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[recepcionDesechos] CHECK CONSTRAINT [FK_recepcionDesechos_localesXproductor_localId]
GO
ALTER TABLE [dbo].[recepcionDesechos]  WITH CHECK ADD  CONSTRAINT [FK_recepcionDesechos_recipiente_recipienteId] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[recepcionDesechos] CHECK CONSTRAINT [FK_recepcionDesechos_recipiente_recipienteId]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipiente_categoriaProducto_categoriaId] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[categoriaProducto] ([categoriaId])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipiente_categoriaProducto_categoriaId]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipiente_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipiente_productos_productoId]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipientes_actores] FOREIGN KEY([actorId])
REFERENCES [dbo].[actores] ([actorId])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipientes_actores]
GO
ALTER TABLE [dbo].[recipienteXlocal]  WITH CHECK ADD  CONSTRAINT [FK_recipienteXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[recipienteXlocal] CHECK CONSTRAINT [FK_recipienteXlocal_localesXproductor_localId]
GO
ALTER TABLE [dbo].[recipienteXlocal]  WITH CHECK ADD  CONSTRAINT [FK_recipienteXlocal_recipiente_recipienteId] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[recipienteXlocal] CHECK CONSTRAINT [FK_recipienteXlocal_recipiente_recipienteId]
GO
ALTER TABLE [dbo].[Traducciones]  WITH CHECK ADD  CONSTRAINT [FK_Traducciones_idiomas_idiomaId] FOREIGN KEY([idiomaId])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[Traducciones] CHECK CONSTRAINT [FK_Traducciones_idiomas_idiomaId]
GO
ALTER TABLE [dbo].[ubicacionXlocal]  WITH CHECK ADD  CONSTRAINT [FK_ubicacionXlocal_localesXproductor_localId] FOREIGN KEY([localId])
REFERENCES [dbo].[localesXproductor] ([localId])
GO
ALTER TABLE [dbo].[ubicacionXlocal] CHECK CONSTRAINT [FK_ubicacionXlocal_localesXproductor_localId]
GO
ALTER TABLE [dbo].[ubicacionXlocal]  WITH CHECK ADD  CONSTRAINT [FK_ubicacionXlocal_paises_paisId] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[ubicacionXlocal] CHECK CONSTRAINT [FK_ubicacionXlocal_paises_paisId]
GO
ALTER TABLE [dbo].[vehiculoXciclo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculoXciclo_diaXciclo_id] FOREIGN KEY([dXcId])
REFERENCES [dbo].[diaXciclo] ([dXcId])
GO
ALTER TABLE [dbo].[vehiculoXciclo] CHECK CONSTRAINT [FK_vehiculoXciclo_diaXciclo_id]
GO
ALTER TABLE [dbo].[vehiculoXciclo]  WITH CHECK ADD  CONSTRAINT [FK_vehiculoXciclo_vehiculo_vehiculoId] FOREIGN KEY([vehiculoId])
REFERENCES [dbo].[vehiculo] ([vehiculoId])
GO
ALTER TABLE [dbo].[vehiculoXciclo] CHECK CONSTRAINT [FK_vehiculoXciclo_vehiculo_vehiculoId]
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductos_clientes_clienteId] FOREIGN KEY([clienteId])
REFERENCES [dbo].[clientes] ([clienteId])
GO
ALTER TABLE [dbo].[ventasProductos] CHECK CONSTRAINT [FK_ventasProductos_clientes_clienteId]
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductos_conversionProductos_conversionId] FOREIGN KEY([lote])
REFERENCES [dbo].[ordenProduccion] ([lote])
GO
ALTER TABLE [dbo].[ventasProductos] CHECK CONSTRAINT [FK_ventasProductos_conversionProductos_conversionId]
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductos_empresasEV_empresaId] FOREIGN KEY([empresaId])
REFERENCES [dbo].[empresasEV] ([empresaId])
GO
ALTER TABLE [dbo].[ventasProductos] CHECK CONSTRAINT [FK_ventasProductos_empresasEV_empresaId]
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductos_productos_productoId] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[ventasProductos] CHECK CONSTRAINT [FK_ventasProductos_productos_productoId]
GO
/****** Object:  StoredProcedure [dbo].[procQuiz]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procQuiz]
@Param1 NVARCHAR(35),
@Param2 BIGINT,
@TVPpar TVPquiz READONLY
AS
BEGIN
SET NOCOUNT ON -- no retorne metadatos
DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
DECLARE @Message VARCHAR(200)
DECLARE @InicieTransaccion BIT
-- declaracion de otras variables
-- operaciones de select que no tengan que ser bloqueadas
-- tratar de hacer todo lo posible antes de q inice la transaccion
SET @InicieTransaccion = 0
IF @@TRANCOUNT=0 BEGIN
SET @InicieTransaccion = 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
END
BEGIN TRY
SET @CustomError = 2001
-- put your code here
SELECT * FROM @TVPPar
IF @InicieTransaccion=1 BEGIN
COMMIT
END
END TRY
BEGIN CATCH
SET @ErrorNumber = ERROR_NUMBER()
SET @ErrorSeverity = ERROR_SEVERITY()
SET @ErrorState = ERROR_STATE()
SET @Message = ERROR_MESSAGE()
IF @InicieTransaccion=1 BEGIN
ROLLBACK
END
RAISERROR('%s - Error Number: %i',
@ErrorSeverity, @ErrorState, @Message, @CustomError)
END CATCH
END
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spLlenarCoberturaXempresa]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLlenarCoberturaXempresa]
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
  BEGIN
    DECLARE @paisId int;
	DECLARE @empresaId int;
	DECLARE @posttime DATETIME;
	DECLARE @enabled int;

    SET @paisId =  CAST((RAND() * 5) + 1 AS int); 
	SET @empresaId =  CAST((RAND() * 100) + 1 AS int);
	SET @posttime =  GETDATE();
    SET @enabled = 1;

    INSERT INTO coberturaXempresas (paisId,empresaId,posttime,enabled)
    VALUES (@paisId,@empresaId,@posttime,@enabled);

    SET @contador = @contador + 1;
  END
 END
GO
/****** Object:  StoredProcedure [dbo].[spLlenarDirecciones]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLlenarDirecciones]
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
  BEGIN
    DECLARE @direccionId int;
    DECLARE @calleId int;
    DECLARE @regionId int;
    DECLARE @estadoId int;
    DECLARE @codigoPostal int;
    DECLARE @paisId int;

    SET @direccionId =  @contador; -- direccionId aleatorios del 1 al 10
    SET @calleId = CAST((RAND() * 44) + 1 AS int); -- calleId aleatorios del 1 al 44
    SET @regionId = CAST((RAND() * 44) + 1 AS int); -- regionId aleatorios del 1 al 44
    SET @estadoId = CAST((RAND() * 22) + 1 AS int); -- estadoId aleatorios del 1 al 22
    SET @codigoPostal = CAST((RAND() * 89999) + 10000 AS INT); -- codigoPostal aleatorios de 10000 a 99999
    SET @paisId = CAST((RAND() * 5) + 1 AS int); -- paisId aleatorios del 1 al 5

    INSERT INTO direcciones (direccionId, calleId, regionId, estadoId, codigoPostal, paisId)
    VALUES (@direccionId, @calleId, @regionId, @estadoId, @codigoPostal, @paisId);

    SET @contador = @contador + 1;
  END
  end
GO
/****** Object:  StoredProcedure [dbo].[spLlenarEmpresas]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLlenarEmpresas]
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
  BEGIN
    DECLARE @direccionId int;
	DECLARE @empresaId int;

    SET @direccionId =  CAST((RAND() * 100) + 1 AS int);; -- direccionId aleatorios del 1 al 10
    SET @empresaId = @contador;

    INSERT INTO empresasEV (empresaId,direccionId)
    VALUES (@empresaId,@direccionId);

    SET @contador = @contador + 1;
  END
  end
GO
/****** Object:  StoredProcedure [dbo].[spLlenarLocales]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLlenarLocales]
AS
BEGIN
  DECLARE @contador int;
  SET @contador = 1;

  WHILE (@contador <= 100)
  BEGIN
    DECLARE @direccionId int;
	DECLARE @actorId int;
	DECLARE @localId int;
	DECLARE @payId int;

    SET @direccionId =  CAST((RAND() * 100) + 1 AS int); 
	SET @actorId =  CAST((RAND() * 21) + 1 AS int);
	SET @payId =  CAST((RAND() * 2) + 1 AS int);
    SET @localId = @contador;

    INSERT INTO localesXproductor (localId,actorId,enabled,payId,direccionId)
    VALUES (@localId,@actorId,1,@payId,@direccionId);

    SET @contador = @contador + 1;
  END
 END
GO
/****** Object:  StoredProcedure [dbo].[XXXXXXSP_VerboEntidad]    Script Date: 30/4/2023 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XXXXXXSP_VerboEntidad]
	@Param1 NVARCHAR(35),
	@Param2 BIGINT,
	@TVPParam [dbo].[TVPType] READONLY--Agregar parámetro TVP
AS 
BEGIN
	
	SET NOCOUNT ON -- no retorne metadatos
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inice la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here

        -- Operación simple vía TVP
		SELECT * FROM @TVPParam;

		
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END
RETURN 0
GO
USE [master]
GO
ALTER DATABASE [elementalGDB] SET  READ_WRITE 
GO

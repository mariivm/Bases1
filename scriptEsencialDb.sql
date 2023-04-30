USE [master]
GO
/****** Object:  Database [elementalGDB]    Script Date: 29/4/2023 19:41:40 ******/
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
/****** Object:  UserDefinedTableType [dbo].[TVPquiz]    Script Date: 29/4/2023 19:41:40 ******/
CREATE TYPE [dbo].[TVPquiz] AS TABLE(
	[Columna1] [varchar](10) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVPType]    Script Date: 29/4/2023 19:41:40 ******/
CREATE TYPE [dbo].[TVPType] AS TABLE(
	[Column1] [int] NULL,
	[Column2] [varchar](50) NULL
)
GO
/****** Object:  Table [dbo].[actores]    Script Date: 29/4/2023 19:41:40 ******/
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
/****** Object:  Table [dbo].[actoresXcontratoXproducto]    Script Date: 29/4/2023 19:41:40 ******/
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
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calles]    Script Date: 29/4/2023 19:41:40 ******/
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
/****** Object:  Table [dbo].[cantidadDesechosXlocal]    Script Date: 29/4/2023 19:41:40 ******/
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
/****** Object:  Table [dbo].[categoriaProducto]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[categoriaXproductos]    Script Date: 29/4/2023 19:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoriaXproductos](
	[categoriaId] [int] NOT NULL,
	[productoId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cicloRecoleccion]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[clientes]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[coberturaXempresas]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[contactoXactores]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[contactoXempresaEV]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[contactoXlocal]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[contactType]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[contactValues]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[ContaminantesPagosEmpresas]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[contratos]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[contratosGenerales]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[conversionMonedas]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[costoProcesoXmateriales]    Script Date: 29/4/2023 19:41:41 ******/
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
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diaXciclo]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[direcciones]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[divisas]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[divisasXpais]    Script Date: 29/4/2023 19:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[divisasXpais](
	[divisaId] [int] NOT NULL,
	[paisId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresaEVXvehiculo]    Script Date: 29/4/2023 19:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresaEVXvehiculo](
	[empresaId] [int] NOT NULL,
	[vehiculoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresasEV]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[estados]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[Event log]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[eventTypes]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[facturaXproductora]    Script Date: 29/4/2023 19:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturaXproductora](
	[localId] [int] NOT NULL,
	[cantidadDebida] [decimal](8, 2) NOT NULL,
	[pago] [bit] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[facturaId] [int] NOT NULL,
 CONSTRAINT [PK_facturaXproductora] PRIMARY KEY CLUSTERED 
(
	[facturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flotillas]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[idiomas]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[idiomaXpaises]    Script Date: 29/4/2023 19:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomaXpaises](
	[idiomaId] [int] NOT NULL,
	[paisId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventarioProductos]    Script Date: 29/4/2023 19:41:41 ******/
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
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[levels]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[localesXproceso]    Script Date: 29/4/2023 19:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localesXproceso](
	[localId] [int] NOT NULL,
	[procesoRecoId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localesXproductor]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[logpagos]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[logUbicacionRecipiente]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[metricasXlocal]    Script Date: 29/4/2023 19:41:41 ******/
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
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objectTypes]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[ordenProduccion]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[paises]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[payType]    Script Date: 29/4/2023 19:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payType](
	[payId] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_payType] PRIMARY KEY CLUSTERED 
(
	[payId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precioXkm]    Script Date: 29/4/2023 19:41:41 ******/
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
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precioXproducto]    Script Date: 29/4/2023 19:41:41 ******/
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
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precioXpunto]    Script Date: 29/4/2023 19:41:41 ******/
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
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[procesadoRecipientes]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[productos]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[recepcionDesechos]    Script Date: 29/4/2023 19:41:41 ******/
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
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_recepcionDesechos] PRIMARY KEY CLUSTERED 
(
	[recepcionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipientes]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[recipienteXlocal]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[regiones]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[source]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[tipoActores]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[tipoProcesado]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[tipoProcesoReco]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[Traducciones]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[ubicacionXlocal]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[vehiculo]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[vehiculoXciclo]    Script Date: 29/4/2023 19:41:41 ******/
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
/****** Object:  Table [dbo].[ventasProductos]    Script Date: 29/4/2023 19:41:41 ******/
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
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (1, N'KFC', 1)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (2, N'McDonalds', 1)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (3, N'Sardimar', 1)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (4, N'Pollolandia', 1)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (5, N'Apple', 1)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (6, N'Walmart', 1)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (7, N'CLEAN', 2)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (8, N'WM', 2)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (9, N'EBI', 2)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (10, N'WasteTech', 2)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (11, N'RBA', 2)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (12, N'Ayuntamiento de Nueva York', 3)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (13, N'Ayuntamiento de São Paulo', 3)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (14, N'Municipalidad de San Jose', 3)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (15, N'Municipio de Azul', 3)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (16, N'Brampton Township', 3)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (17, N'Gobierno de Estados Unidos', 4)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (18, N'Gobierno de Brasil', 4)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (19, N'Gobierno de Argentina', 4)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (20, N'Gobierno de Costa Rica', 4)
INSERT [dbo].[actores] ([actorId], [descripcion], [tipoActorId]) VALUES (21, N'Gobierno de Canada', 4)
GO
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (1, N'34', 1, 1, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (2, N'75', 2, 1, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (3, N'122', 3, 2, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (4, N'89', 4, 2, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (5, N'1', 5, 3, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (6, N'129', 6, 3, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (7, N'55', 7, 4, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (8, N'103', 8, 4, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (9, N'23', 9, 5, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (10, N'99', 10, 5, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (11, N'44', 11, 6, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (12, N'118', 12, 6, 1)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (13, N'93', 13, 7, 2)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (14, N'15', 14, 7, 2)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (15, N'19', 15, 8, 2)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (16, N'128', 16, 8, 2)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (17, N'111', 17, 9, 2)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (18, N'67', 18, 9, 2)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (19, N'54', 19, 10, 2)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (20, N'73', 20, 10, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (21, N'3', 21, 11, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (22, N'139', 22, 11, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (23, N'78', 23, 12, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (24, N'28', 24, 12, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (25, N'35', 25, 13, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (26, N'41', 26, 13, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (27, N'109', 27, 14, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (28, N'83', 28, 14, 3)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (29, N'92', 29, 15, 4)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (30, N'59', 30, 15, 4)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (31, N'14', 31, 16, 4)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (32, N'104', 32, 16, 4)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (33, N'68', 33, 17, 4)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (34, N'72', 34, 17, 4)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (35, N'57', 35, 18, 4)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (36, N'116', 36, 18, 4)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (37, N'77', 37, 19, 5)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (38, N'39', 38, 19, 5)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (39, N'86', 39, 20, 5)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (40, N'27', 40, 20, 5)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (41, N'51', 41, 21, 5)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (42, N'131', 42, 21, 5)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (43, N'33', 43, 22, 5)
INSERT [dbo].[calles] ([calleId], [nombre], [regionId], [estadoId], [paisId]) VALUES (44, N'98', 44, 22, 5)
GO
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 80, CAST(N'2023-04-29T12:40:42.903' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 99, CAST(N'2023-04-29T12:40:42.907' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 24, CAST(N'2023-04-29T12:40:42.907' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 84, CAST(N'2023-04-29T12:40:42.907' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 54, CAST(N'2023-04-29T12:40:42.907' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 44, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 41, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 39, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 37, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 29, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 90, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 56, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 11, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 7, CAST(N'2023-04-29T12:40:42.910' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 66, CAST(N'2023-04-29T12:40:42.913' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 39, CAST(N'2023-04-29T12:40:42.913' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 15, CAST(N'2023-04-29T12:40:42.917' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 69, CAST(N'2023-04-29T12:40:42.917' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 61, CAST(N'2023-04-29T12:40:42.917' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 32, CAST(N'2023-04-29T12:40:42.917' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 73, CAST(N'2023-04-29T12:40:42.917' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 95, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 3, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 38, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 52, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 67, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 98, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 25, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 40, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 30, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 32, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 45, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 75, CAST(N'2023-04-29T12:40:42.920' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 84, CAST(N'2023-04-29T12:40:42.943' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 83, CAST(N'2023-04-29T12:40:42.943' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 12, CAST(N'2023-04-29T12:40:42.943' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 76, CAST(N'2023-04-29T12:40:42.943' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 94, CAST(N'2023-04-29T12:40:42.943' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 1, CAST(N'2023-04-29T12:40:42.943' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 40, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 56, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 78, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 67, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 15, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 77, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 80, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 74, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 95, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 48, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 68, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 7, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 10, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 58, CAST(N'2023-04-29T12:40:42.947' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 88, CAST(N'2023-04-29T12:40:42.950' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 90, CAST(N'2023-04-29T12:40:42.950' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 28, CAST(N'2023-04-29T12:40:42.950' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 17, CAST(N'2023-04-29T12:40:42.950' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 14, CAST(N'2023-04-29T12:40:42.950' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 89, CAST(N'2023-04-29T12:40:42.957' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 16, CAST(N'2023-04-29T12:40:42.957' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 25, CAST(N'2023-04-29T12:40:42.957' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 27, CAST(N'2023-04-29T12:40:42.957' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 79, CAST(N'2023-04-29T12:40:42.957' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 77, CAST(N'2023-04-29T12:40:42.967' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 75, CAST(N'2023-04-29T12:40:42.970' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 9, CAST(N'2023-04-29T12:40:42.970' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 18, CAST(N'2023-04-29T12:40:42.970' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 56, CAST(N'2023-04-29T12:40:42.970' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 36, CAST(N'2023-04-29T12:40:42.970' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 79, CAST(N'2023-04-29T12:40:42.970' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 1, CAST(N'2023-04-29T12:40:42.970' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 85, CAST(N'2023-04-29T12:40:42.970' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 49, CAST(N'2023-04-29T12:40:42.973' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 13, CAST(N'2023-04-29T12:40:42.973' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 58, CAST(N'2023-04-29T12:40:42.973' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 56, CAST(N'2023-04-29T12:40:42.973' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 18, CAST(N'2023-04-29T12:40:42.973' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 47, CAST(N'2023-04-29T12:40:42.973' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 38, CAST(N'2023-04-29T12:40:42.977' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 67, CAST(N'2023-04-29T12:40:42.977' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 74, CAST(N'2023-04-29T12:40:42.977' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 100, CAST(N'2023-04-29T12:40:42.977' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 60, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 54, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 79, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (5, 21, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 58, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (1, 86, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 45, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 92, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 9, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 22, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 57, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 94, CAST(N'2023-04-29T12:40:43.020' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (3, 74, CAST(N'2023-04-29T12:40:43.023' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (4, 43, CAST(N'2023-04-29T12:40:43.023' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 45, CAST(N'2023-04-29T12:40:43.023' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 92, CAST(N'2023-04-29T12:40:43.023' AS DateTime), 1)
INSERT [dbo].[coberturaXempresas] ([paisId], [empresaId], [posttime], [enabled]) VALUES (2, 41, CAST(N'2023-04-29T12:40:43.023' AS DateTime), 1)
GO
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (1, N'Teléfono')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (2, N'Correo electrónico')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (3, N'Fax')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (4, N'SMS')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (5, N'WhatsApp')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (6, N'Skype')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (7, N'Zoom')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (8, N'Telegram')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (9, N'LinkedIn')
INSERT [dbo].[contactType] ([contactTypeId], [nombre]) VALUES (10, N'Pagina Web')
GO
INSERT [dbo].[contactValues] ([contactValueId], [contactTypeId], [value], [posttime], [enabled]) VALUES (1, 1, N'(+506) 2551 1158', CAST(N'2023-04-24T21:07:35.957' AS DateTime), 1)
INSERT [dbo].[contactValues] ([contactValueId], [contactTypeId], [value], [posttime], [enabled]) VALUES (2, 2, N'KFC@gmail.com', CAST(N'2023-04-24T21:07:35.957' AS DateTime), 1)
INSERT [dbo].[contactValues] ([contactValueId], [contactTypeId], [value], [posttime], [enabled]) VALUES (5, 5, N'4031 5024', CAST(N'2023-04-24T21:07:35.957' AS DateTime), 1)
INSERT [dbo].[contactValues] ([contactValueId], [contactTypeId], [value], [posttime], [enabled]) VALUES (6, 6, N'walmart@gmail.com', CAST(N'2023-04-24T21:07:35.957' AS DateTime), 1)
INSERT [dbo].[contactValues] ([contactValueId], [contactTypeId], [value], [posttime], [enabled]) VALUES (7, 1, N'(+506) 2201-6869', CAST(N'2023-04-24T21:07:35.957' AS DateTime), 1)
INSERT [dbo].[contactValues] ([contactValueId], [contactTypeId], [value], [posttime], [enabled]) VALUES (8, 2, N'800–692–7753', CAST(N'2023-04-24T21:07:35.957' AS DateTime), 1)
INSERT [dbo].[contactValues] ([contactValueId], [contactTypeId], [value], [posttime], [enabled]) VALUES (9, 10, N'https://sardimar.com', CAST(N'2023-04-24T21:07:35.957' AS DateTime), 1)
GO
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (1, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (2, 2, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (3, 3, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (4, 4, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (5, 5, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (6, 6, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (7, 7, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (8, 8, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (9, 9, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (10, 10, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (11, 11, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (12, 12, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (13, 13, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (14, 14, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (15, 15, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (16, 16, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (17, 17, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (18, 18, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (19, 19, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (20, 20, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[contratosGenerales] ([contratoId], [actorId], [fechaInicial], [fechaFinal]) VALUES (21, 21, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (1, 36, 43, 8, 70314, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (2, 36, 42, 19, 93999, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (3, 11, 5, 16, 71411, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (4, 29, 14, 1, 70533, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (5, 28, 35, 21, 78448, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (6, 34, 17, 13, 20600, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (7, 4, 29, 18, 95437, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (8, 14, 13, 14, 85480, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (9, 35, 3, 21, 26499, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (10, 32, 32, 15, 46462, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (11, 5, 31, 20, 18139, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (12, 10, 1, 2, 16325, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (13, 15, 6, 19, 64137, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (14, 16, 8, 17, 46796, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (15, 31, 38, 13, 52899, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (16, 41, 26, 16, 70135, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (17, 28, 34, 10, 77018, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (18, 24, 4, 13, 51439, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (19, 24, 33, 8, 12106, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (20, 42, 33, 16, 83234, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (21, 7, 15, 5, 58501, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (22, 1, 41, 19, 83153, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (23, 44, 20, 12, 45032, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (24, 40, 35, 7, 22448, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (25, 27, 19, 6, 96190, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (26, 14, 17, 1, 19467, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (27, 35, 34, 12, 74549, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (28, 15, 7, 16, 24552, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (29, 2, 37, 3, 97933, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (30, 8, 38, 8, 86198, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (31, 29, 37, 6, 71040, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (32, 31, 30, 11, 18484, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (33, 35, 23, 22, 35290, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (34, 35, 25, 13, 39062, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (35, 26, 32, 5, 87498, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (36, 41, 36, 5, 59606, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (37, 32, 8, 22, 86643, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (38, 29, 9, 22, 25307, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (39, 44, 16, 10, 34604, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (40, 23, 41, 4, 76283, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (41, 23, 5, 21, 72455, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (42, 5, 35, 4, 92094, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (43, 38, 38, 22, 22043, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (44, 44, 28, 5, 28598, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (45, 20, 5, 6, 51869, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (46, 25, 33, 18, 40711, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (47, 26, 6, 2, 63640, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (48, 11, 40, 18, 41321, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (49, 2, 25, 3, 33824, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (50, 29, 8, 15, 19896, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (51, 30, 43, 16, 90796, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (52, 2, 12, 21, 30268, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (53, 27, 40, 21, 60544, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (54, 19, 21, 19, 62626, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (55, 28, 8, 22, 39762, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (56, 19, 8, 20, 65332, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (57, 40, 36, 2, 37956, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (58, 24, 23, 11, 71896, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (59, 31, 42, 8, 94965, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (60, 38, 27, 4, 16716, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (61, 29, 39, 14, 58314, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (62, 19, 41, 2, 86832, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (63, 5, 29, 14, 59372, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (64, 21, 20, 4, 68486, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (65, 25, 36, 9, 61412, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (66, 17, 29, 13, 28379, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (67, 21, 38, 7, 23034, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (68, 33, 38, 19, 49489, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (69, 43, 9, 14, 71879, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (70, 26, 6, 1, 58827, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (71, 4, 16, 10, 50122, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (72, 35, 20, 9, 89438, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (73, 36, 42, 10, 75475, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (74, 12, 22, 1, 40978, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (75, 18, 31, 15, 39943, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (76, 34, 25, 1, 97970, 4)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (77, 36, 3, 13, 10480, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (78, 32, 28, 13, 80979, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (79, 13, 27, 18, 42988, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (80, 15, 14, 13, 30175, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (81, 29, 44, 19, 39650, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (82, 23, 31, 22, 48044, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (83, 25, 18, 2, 63543, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (84, 41, 6, 9, 23381, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (85, 44, 40, 10, 79850, 5)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (86, 4, 1, 8, 75861, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (87, 23, 1, 22, 93760, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (88, 3, 11, 17, 91219, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (89, 11, 21, 17, 81435, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (90, 35, 35, 15, 29839, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (91, 34, 34, 6, 40679, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (92, 44, 14, 5, 58521, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (93, 21, 3, 13, 62776, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (94, 22, 23, 4, 83569, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (95, 12, 23, 4, 40845, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (96, 6, 10, 17, 86862, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (97, 5, 39, 20, 33844, 2)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (98, 15, 18, 20, 34775, 3)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (99, 22, 20, 16, 95273, 1)
INSERT [dbo].[direcciones] ([direccionId], [calleId], [regionId], [estadoId], [codigoPostal], [paisId]) VALUES (100, 35, 19, 22, 19803, 4)
GO
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (1, N'Dólar Canadiense', N'CAD', N'$')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (2, N'Colón Costarricense', N'CRC', N'¢')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (3, N'Real Brasileño', N'BRL', N'R$')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (4, N'Peso Argentino', N'ARS', N'$')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (5, N'Euro', N'EUR', N'€')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (6, N'Yen Japonés', N'JPY', N'¥')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (7, N'Libra Esterlina', N'GBP', N'£')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (8, N'Dólar Australiano', N'AUD', N'$')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (9, N'Peso Mexicano', N'MXN', N'$')
INSERT [dbo].[divisas] ([divisaId], [nombre], [abreviatura], [simbolo]) VALUES (10, N'Dólar Estadounidense', N'USA', N'$')
GO
INSERT [dbo].[divisasXpais] ([divisaId], [paisId]) VALUES (1, 5)
INSERT [dbo].[divisasXpais] ([divisaId], [paisId]) VALUES (2, 1)
INSERT [dbo].[divisasXpais] ([divisaId], [paisId]) VALUES (3, 4)
INSERT [dbo].[divisasXpais] ([divisaId], [paisId]) VALUES (4, 3)
INSERT [dbo].[divisasXpais] ([divisaId], [paisId]) VALUES (10, 2)
GO
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (1, 1)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (2, 97)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (3, 38)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (4, 83)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (5, 27)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (6, 62)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (7, 53)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (8, 21)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (9, 97)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (10, 47)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (11, 37)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (12, 59)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (13, 58)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (14, 53)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (15, 53)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (16, 9)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (17, 79)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (18, 47)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (19, 88)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (20, 52)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (21, 9)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (22, 34)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (23, 62)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (24, 71)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (25, 53)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (26, 23)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (27, 7)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (28, 51)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (29, 48)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (30, 80)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (31, 58)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (32, 66)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (33, 51)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (34, 53)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (35, 13)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (36, 89)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (37, 8)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (38, 39)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (39, 61)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (40, 58)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (41, 96)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (42, 85)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (43, 18)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (44, 69)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (45, 95)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (46, 79)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (47, 35)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (48, 67)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (49, 100)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (50, 71)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (51, 87)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (52, 99)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (53, 94)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (54, 16)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (55, 34)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (56, 3)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (57, 82)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (58, 1)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (59, 47)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (60, 10)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (61, 47)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (62, 64)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (63, 8)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (64, 94)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (65, 14)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (66, 46)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (67, 3)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (68, 92)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (69, 76)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (70, 91)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (71, 14)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (72, 25)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (73, 35)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (74, 63)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (75, 27)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (76, 96)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (77, 44)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (78, 63)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (79, 29)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (80, 6)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (81, 1)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (82, 7)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (83, 1)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (84, 50)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (85, 38)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (86, 30)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (87, 47)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (88, 29)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (89, 13)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (90, 12)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (91, 97)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (92, 3)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (93, 88)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (94, 41)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (95, 9)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (96, 1)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (97, 45)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (98, 48)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (99, 47)
INSERT [dbo].[empresasEV] ([empresaId], [direccionId]) VALUES (100, 75)
GO
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (1, N'San José', 1)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (2, N'Alajuela', 1)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (3, N'Cartago', 1)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (4, N'Heredia', 1)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (5, N'Limon', 1)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (6, N'Puntarenas', 1)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (7, N'California', 2)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (8, N'Texas', 2)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (9, N'Florida', 2)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (10, N'Nueva York', 2)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (11, N'Buenos Aires', 3)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (12, N'Córdoba', 3)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (13, N'Santa Fe', 3)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (14, N'Mendoza', 3)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (15, N'São Paulo', 4)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (16, N'Río de Janeiro', 4)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (17, N'Minas Gerais', 4)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (18, N'Bahía', 4)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (19, N'Ontario', 5)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (20, N'Quebec', 5)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (21, N'Alberta', 5)
INSERT [dbo].[estados] ([estadoId], [nombre], [paisId]) VALUES (22, N'British Columbia', 5)
GO
INSERT [dbo].[idiomas] ([idiomaId], [nombre], [variacionCult]) VALUES (1, N'Inglés', N'UK')
INSERT [dbo].[idiomas] ([idiomaId], [nombre], [variacionCult]) VALUES (2, N'Inglés', N'US')
INSERT [dbo].[idiomas] ([idiomaId], [nombre], [variacionCult]) VALUES (3, N'Español', N'ES')
INSERT [dbo].[idiomas] ([idiomaId], [nombre], [variacionCult]) VALUES (4, N'Español', N'MX')
INSERT [dbo].[idiomas] ([idiomaId], [nombre], [variacionCult]) VALUES (5, N'Francés', N'FR')
INSERT [dbo].[idiomas] ([idiomaId], [nombre], [variacionCult]) VALUES (6, N'Francés', N'CA')
INSERT [dbo].[idiomas] ([idiomaId], [nombre], [variacionCult]) VALUES (7, N'Portugués', N'PT')
GO
INSERT [dbo].[idiomaXpaises] ([idiomaId], [paisId]) VALUES (4, 1)
INSERT [dbo].[idiomaXpaises] ([idiomaId], [paisId]) VALUES (2, 2)
INSERT [dbo].[idiomaXpaises] ([idiomaId], [paisId]) VALUES (4, 3)
INSERT [dbo].[idiomaXpaises] ([idiomaId], [paisId]) VALUES (7, 4)
INSERT [dbo].[idiomaXpaises] ([idiomaId], [paisId]) VALUES (2, 5)
INSERT [dbo].[idiomaXpaises] ([idiomaId], [paisId]) VALUES (6, 5)
GO
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (1, 10, 1, 1, 22)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (2, 18, 1, 3, 16)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (3, 11, 1, 1, 88)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (4, 20, 1, 2, 7)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (5, 19, 1, 1, 11)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (6, 13, 1, 3, 89)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (7, 4, 1, 1, 37)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (8, 9, 1, 1, 12)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (9, 1, 1, 2, 48)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (10, 5, 1, 1, 39)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (11, 7, 1, 2, 89)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (12, 21, 1, 3, 55)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (13, 11, 1, 3, 85)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (14, 4, 1, 1, 62)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (15, 8, 1, 1, 27)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (16, 6, 1, 2, 7)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (17, 3, 1, 1, 33)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (18, 4, 1, 1, 63)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (19, 1, 1, 2, 11)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (20, 5, 1, 3, 35)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (21, 4, 1, 3, 61)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (22, 5, 1, 2, 45)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (23, 15, 1, 2, 51)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (24, 18, 1, 3, 53)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (25, 7, 1, 1, 79)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (26, 17, 1, 3, 100)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (27, 16, 1, 1, 96)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (28, 20, 1, 1, 26)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (29, 17, 1, 3, 30)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (30, 10, 1, 2, 16)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (31, 10, 1, 2, 83)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (32, 2, 1, 3, 11)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (33, 9, 1, 3, 21)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (34, 15, 1, 3, 38)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (35, 15, 1, 1, 28)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (36, 1, 1, 1, 6)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (37, 1, 1, 3, 45)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (38, 13, 1, 1, 21)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (39, 2, 1, 3, 38)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (40, 7, 1, 3, 100)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (41, 21, 1, 1, 28)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (42, 20, 1, 1, 20)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (43, 4, 1, 3, 75)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (44, 5, 1, 2, 94)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (45, 18, 1, 3, 81)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (46, 9, 1, 3, 78)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (47, 5, 1, 1, 93)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (48, 4, 1, 2, 85)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (49, 2, 1, 3, 10)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (50, 3, 1, 2, 97)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (51, 7, 1, 2, 6)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (52, 1, 1, 3, 3)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (53, 9, 1, 1, 41)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (54, 6, 1, 1, 97)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (55, 11, 1, 1, 93)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (56, 17, 1, 2, 71)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (57, 13, 1, 2, 51)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (58, 13, 1, 1, 3)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (59, 3, 1, 1, 42)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (60, 17, 1, 1, 1)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (61, 13, 1, 2, 38)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (62, 9, 1, 1, 92)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (63, 17, 1, 3, 53)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (64, 12, 1, 3, 55)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (65, 7, 1, 3, 47)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (66, 14, 1, 3, 70)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (67, 12, 1, 2, 27)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (68, 14, 1, 2, 13)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (69, 9, 1, 1, 70)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (70, 21, 1, 1, 89)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (71, 18, 1, 2, 73)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (72, 11, 1, 3, 61)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (73, 5, 1, 2, 58)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (74, 13, 1, 2, 7)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (75, 14, 1, 2, 89)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (76, 15, 1, 2, 89)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (77, 14, 1, 1, 34)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (78, 14, 1, 3, 25)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (79, 15, 1, 2, 55)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (80, 14, 1, 3, 15)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (81, 5, 1, 2, 15)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (82, 6, 1, 1, 29)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (83, 17, 1, 1, 11)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (84, 12, 1, 1, 4)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (85, 6, 1, 3, 46)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (86, 5, 1, 1, 48)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (87, 19, 1, 1, 48)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (88, 9, 1, 3, 83)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (89, 6, 1, 1, 3)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (90, 16, 1, 3, 43)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (91, 14, 1, 1, 54)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (92, 13, 1, 2, 34)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (93, 10, 1, 1, 45)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (94, 2, 1, 3, 43)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (95, 9, 1, 2, 87)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (96, 16, 1, 2, 37)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (97, 17, 1, 1, 96)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (98, 20, 1, 2, 48)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (99, 13, 1, 1, 36)
INSERT [dbo].[localesXproductor] ([localId], [actorId], [enabled], [payId], [direccionId]) VALUES (100, 8, 1, 3, 13)
GO
INSERT [dbo].[paises] ([paisId], [nombre]) VALUES (1, N'CRC')
INSERT [dbo].[paises] ([paisId], [nombre]) VALUES (2, N'USA')
INSERT [dbo].[paises] ([paisId], [nombre]) VALUES (3, N'ARG')
INSERT [dbo].[paises] ([paisId], [nombre]) VALUES (4, N'BRA')
INSERT [dbo].[paises] ([paisId], [nombre]) VALUES (5, N'CAN')
GO
INSERT [dbo].[payType] ([payId], [descripcion]) VALUES (1, N'pays for others')
INSERT [dbo].[payType] ([payId], [descripcion]) VALUES (2, N'pays its own')
INSERT [dbo].[payType] ([payId], [descripcion]) VALUES (3, N'pays what it owes')
GO
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (1, 1, N'restos alimentos', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (2, 1, N'hojas', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (3, 1, N'carton', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (4, 1, N'papel', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (5, 1, N'periodico', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (6, 1, N'botella', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (7, 1, N'bolsa', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (8, 1, N'botella', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (9, 1, N'toallas', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (10, 1, N'latas', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (11, 1, N'papel envoltura', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (12, 1, N'cajas', N'kg', 0, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (13, 2, N'mesa', N'uni', 1, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (14, 2, N'vaso', N'uni', 1, 1)
INSERT [dbo].[productos] ([productoId], [tipo], [nombre], [unidadMedida], [vendible], [status]) VALUES (15, 2, N'papel bond', N'uni', 1, 1)
GO
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (1, N'Curridabat', 1, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (2, N'San Jose', 1, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (3, N'Grecia', 2, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (4, N'San Ramon', 2, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (5, N'Oreamuno', 3, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (6, N'Paraiso', 3, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (7, N'Barva', 4, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (8, N'San Rafael', 4, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (9, N'Pococi', 5, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (10, N'Siquirres', 5, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (11, N'Esparza', 6, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (12, N'Buenos Aires', 6, 1)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (13, N'Los Angeles', 7, 2)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (14, N'Sacramento', 7, 2)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (15, N'Anderson', 8, 2)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (16, N'Dalas', 8, 2)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (17, N'Orlando', 9, 2)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (18, N'Miami', 9, 2)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (19, N'New York County', 10, 2)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (20, N'Nassau County', 10, 2)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (21, N'La Matanza', 11, 3)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (22, N'Tigre', 11, 3)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (23, N'Capital', 12, 3)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (24, N'Punilla', 12, 3)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (25, N'Rosario', 13, 3)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (26, N'La Capital', 13, 3)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (27, N'Capital', 14, 3)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (28, N'Malargüe', 14, 3)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (29, N'São Paulo', 15, 4)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (30, N'Campinas', 15, 4)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (31, N'Rio de Janeiro', 16, 4)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (32, N'Niteroi', 16, 4)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (33, N'Belo Horizonte', 17, 4)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (34, N'Ouro Preto', 17, 4)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (35, N'Salvador', 18, 4)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (36, N'Porto Seguro', 18, 4)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (37, N'Toronto', 19, 5)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (38, N'Ottawa', 19, 5)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (39, N'Montreal', 20, 5)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (40, N'Quebec', 20, 5)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (41, N'Calgary', 21, 5)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (42, N'Edmonton', 21, 5)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (43, N'Vancouver', 22, 5)
INSERT [dbo].[regiones] ([regionId], [nombre], [estadoId], [paisId]) VALUES (44, N'Victoria', 22, 5)
GO
INSERT [dbo].[tipoActores] ([tipoActorId], [descripcion]) VALUES (1, N'productor')
INSERT [dbo].[tipoActores] ([tipoActorId], [descripcion]) VALUES (2, N'recolector')
INSERT [dbo].[tipoActores] ([tipoActorId], [descripcion]) VALUES (3, N'gobierno local')
INSERT [dbo].[tipoActores] ([tipoActorId], [descripcion]) VALUES (4, N'gobierno general')
GO
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (1, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (2, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (3, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (4, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (5, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (6, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (7, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (8, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (9, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (10, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (11, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (12, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (13, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (14, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (15, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (16, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (17, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (18, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (19, 1600, 1)
INSERT [dbo].[vehiculo] ([vehiculoId], [capacidad], [enabled]) VALUES (20, 1600, 1)
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
/****** Object:  StoredProcedure [dbo].[procQuiz]    Script Date: 29/4/2023 19:41:42 ******/
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
/****** Object:  StoredProcedure [dbo].[spLlenarCoberturaXempresa]    Script Date: 29/4/2023 19:41:42 ******/
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
/****** Object:  StoredProcedure [dbo].[spLlenarDirecciones]    Script Date: 29/4/2023 19:41:42 ******/
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
/****** Object:  StoredProcedure [dbo].[spLlenarEmpresas]    Script Date: 29/4/2023 19:41:42 ******/
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
/****** Object:  StoredProcedure [dbo].[spLlenarLocales]    Script Date: 29/4/2023 19:41:42 ******/
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

    SET @direccionId =  CAST((RAND() * 100) + 1 AS int); -- direccionId aleatorios del 1 al 10
	SET @actorId =  CAST((RAND() * 21) + 1 AS int);
	SET @payId =  CAST((RAND() * 3) + 1 AS int);
    SET @localId = @contador;

    INSERT INTO localesXproductor (localId,actorId,enabled,payId,direccionId)
    VALUES (@localId,@actorId,1,@payId,@direccionId);

    SET @contador = @contador + 1;
  END
 END
GO
/****** Object:  StoredProcedure [dbo].[XXXXXXSP_VerboEntidad]    Script Date: 29/4/2023 19:41:42 ******/
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

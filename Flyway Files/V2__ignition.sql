-- +FlywayNonRepeatable
USE [esencialv]
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
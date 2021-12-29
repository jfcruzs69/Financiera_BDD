USE [master]
GO
/****** Object:  Database [Financiera]    Script Date: 29/12/2021 05:16:38 p. m. ******/
CREATE DATABASE [Financiera]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Financiera', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_2019\MSSQL\DATA\Financiera.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Financiera_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_2019\MSSQL\DATA\Financiera_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Financiera] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Financiera].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Financiera] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Financiera] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Financiera] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Financiera] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Financiera] SET ARITHABORT OFF 
GO
ALTER DATABASE [Financiera] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Financiera] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Financiera] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Financiera] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Financiera] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Financiera] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Financiera] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Financiera] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Financiera] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Financiera] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Financiera] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Financiera] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Financiera] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Financiera] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Financiera] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Financiera] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Financiera] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Financiera] SET RECOVERY FULL 
GO
ALTER DATABASE [Financiera] SET  MULTI_USER 
GO
ALTER DATABASE [Financiera] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Financiera] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Financiera] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Financiera] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Financiera] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Financiera] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Financiera', N'ON'
GO
ALTER DATABASE [Financiera] SET QUERY_STORE = OFF
GO
USE [Financiera]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[Nombre_RazonSocial] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[RFC] [varchar](14) NOT NULL,
	[idEstatus] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[TipoPersona] [varchar](5) NULL,
	[idTipoIdentificacion] [int] NULL,
	[NumeroIdentificacion] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_Direccion]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_Direccion](
	[idCliente] [int] NOT NULL,
	[idDireccion] [int] NOT NULL,
	[idEstatus] [int] NOT NULL,
	[FechaAlta] [datetime] NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Cliente_Direccion] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC,
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_Identificacion]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_Identificacion](
	[idCliente] [int] NOT NULL,
	[idTipoIdentificacion] [int] NOT NULL,
	[Numero_identificacion] [varchar](50) NOT NULL,
	[idEstatus] [int] NOT NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[idCuenta] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idTipoCuenta] [int] NOT NULL,
	[idEstatus] [int] NOT NULL,
	[Numero] [varchar](50) NOT NULL,
	[Saldo] [decimal](18, 5) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[NumeroExterior] [varchar](30) NOT NULL,
	[NumeroInterior] [varchar](30) NULL,
	[CodigoPostal] [varchar](15) NOT NULL,
	[Alcaldia] [varchar](50) NOT NULL,
	[Colonia] [varchar](50) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[idTipoDireccion] [int] NOT NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[idEstatus] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estatus]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estatus](
	[idEstatus] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](5) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[idUsuarioAlta] [int] NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Estatus] PRIMARY KEY CLUSTERED 
(
	[idEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[idMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[idTipoMovimiento] [int] NOT NULL,
	[idCuenta] [int] NOT NULL,
	[Referencia] [varchar](500) NOT NULL,
	[FechaMovimiento] [datetime] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[Importe] [decimal](18, 5) NOT NULL,
	[Cargo] [decimal](18, 5) NOT NULL,
	[Abono] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_identificacion]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_identificacion](
	[idTipoIdentificacion] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](15) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[idEstatus] [int] NOT NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Tipo_identificacion] PRIMARY KEY CLUSTERED 
(
	[idTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuenta]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuenta](
	[idTipoCuenta] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](30) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[idEstatus] [int] NOT NULL,
 CONSTRAINT [PK_TipoCuenta] PRIMARY KEY CLUSTERED 
(
	[idTipoCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDireccion](
	[idTipoDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](5) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_TipoDireccion] PRIMARY KEY CLUSTERED 
(
	[idTipoDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[idTipoMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](15) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Signo] [varchar](2) NOT NULL,
	[CargoAbono] [varchar](5) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[idUsuarioAlta] [int] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[idEstatus] [int] NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[idTipoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[ClaveAcceso] [varchar](50) NOT NULL,
	[Contrasenia] [varchar](15) NOT NULL,
	[idEstatus] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cliente]    Script Date: 29/12/2021 05:16:39 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cliente] ON [dbo].[Cliente]
(
	[Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cuenta]    Script Date: 29/12/2021 05:16:39 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cuenta] ON [dbo].[Cuenta]
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Estatus]    Script Date: 29/12/2021 05:16:39 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Estatus] ON [dbo].[Estatus]
(
	[Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tipo_identificacion]    Script Date: 29/12/2021 05:16:39 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tipo_identificacion] ON [dbo].[Tipo_identificacion]
(
	[Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TipoCuenta]    Script Date: 29/12/2021 05:16:39 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TipoCuenta] ON [dbo].[TipoCuenta]
(
	[Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TipoDireccion]    Script Date: 29/12/2021 05:16:39 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TipoDireccion] ON [dbo].[TipoDireccion]
(
	[Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TipoMovimiento]    Script Date: 29/12/2021 05:16:39 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TipoMovimiento] ON [dbo].[TipoMovimiento]
(
	[Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cuenta] ADD  CONSTRAINT [DF_Cuenta_Saldo]  DEFAULT ((0)) FOR [Saldo]
GO
ALTER TABLE [dbo].[Movimiento] ADD  CONSTRAINT [DF_Movimiento_Cargo]  DEFAULT ((0)) FOR [Cargo]
GO
ALTER TABLE [dbo].[Movimiento] ADD  CONSTRAINT [DF_Movimiento_Abono]  DEFAULT ((0)) FOR [Abono]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Estatus] FOREIGN KEY([idEstatus])
REFERENCES [dbo].[Estatus] ([idEstatus])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Estatus]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY([idUsuarioAlta])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Usuario]
GO
ALTER TABLE [dbo].[Cliente_Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Direccion_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Cliente_Direccion] CHECK CONSTRAINT [FK_Cliente_Direccion_Cliente]
GO
ALTER TABLE [dbo].[Cliente_Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Direccion_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Cliente_Direccion] CHECK CONSTRAINT [FK_Cliente_Direccion_Direccion]
GO
ALTER TABLE [dbo].[Cliente_Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Direccion_Estatus] FOREIGN KEY([idEstatus])
REFERENCES [dbo].[Estatus] ([idEstatus])
GO
ALTER TABLE [dbo].[Cliente_Direccion] CHECK CONSTRAINT [FK_Cliente_Direccion_Estatus]
GO
ALTER TABLE [dbo].[Cliente_Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Direccion_Usuario] FOREIGN KEY([idUsuarioAlta])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Cliente_Direccion] CHECK CONSTRAINT [FK_Cliente_Direccion_Usuario]
GO
ALTER TABLE [dbo].[Cliente_Identificacion]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Identificacion_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Cliente_Identificacion] CHECK CONSTRAINT [FK_Cliente_Identificacion_Cliente]
GO
ALTER TABLE [dbo].[Cliente_Identificacion]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Identificacion_Estatus] FOREIGN KEY([idEstatus])
REFERENCES [dbo].[Estatus] ([idEstatus])
GO
ALTER TABLE [dbo].[Cliente_Identificacion] CHECK CONSTRAINT [FK_Cliente_Identificacion_Estatus]
GO
ALTER TABLE [dbo].[Cliente_Identificacion]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Identificacion_Tipo_identificacion] FOREIGN KEY([idTipoIdentificacion])
REFERENCES [dbo].[Tipo_identificacion] ([idTipoIdentificacion])
GO
ALTER TABLE [dbo].[Cliente_Identificacion] CHECK CONSTRAINT [FK_Cliente_Identificacion_Tipo_identificacion]
GO
ALTER TABLE [dbo].[Cliente_Identificacion]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Identificacion_Usuario] FOREIGN KEY([idUsuarioAlta])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Cliente_Identificacion] CHECK CONSTRAINT [FK_Cliente_Identificacion_Usuario]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Cliente]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Estatus] FOREIGN KEY([idEstatus])
REFERENCES [dbo].[Estatus] ([idEstatus])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Estatus]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_TipoCuenta] FOREIGN KEY([idTipoCuenta])
REFERENCES [dbo].[TipoCuenta] ([idTipoCuenta])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_TipoCuenta]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Estatus] FOREIGN KEY([idEstatus])
REFERENCES [dbo].[Estatus] ([idEstatus])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Estatus]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_TipoDireccion] FOREIGN KEY([idTipoDireccion])
REFERENCES [dbo].[TipoDireccion] ([idTipoDireccion])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_TipoDireccion]
GO
ALTER TABLE [dbo].[Estatus]  WITH CHECK ADD  CONSTRAINT [FK_Estatus_Usuario] FOREIGN KEY([idUsuarioAlta])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Estatus] CHECK CONSTRAINT [FK_Estatus_Usuario]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_Cuenta] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_Cuenta]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_TipoMovimiento] FOREIGN KEY([idTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([idTipoMovimiento])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_TipoMovimiento]
GO
ALTER TABLE [dbo].[TipoCuenta]  WITH CHECK ADD  CONSTRAINT [FK_TipoCuenta_Usuario] FOREIGN KEY([idUsuarioAlta])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[TipoCuenta] CHECK CONSTRAINT [FK_TipoCuenta_Usuario]
GO
ALTER TABLE [dbo].[TipoDireccion]  WITH CHECK ADD  CONSTRAINT [FK_TipoDireccion_Usuario] FOREIGN KEY([idUsuarioAlta])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[TipoDireccion] CHECK CONSTRAINT [FK_TipoDireccion_Usuario]
GO
ALTER TABLE [dbo].[TipoMovimiento]  WITH CHECK ADD  CONSTRAINT [FK_TipoMovimiento_Estatus] FOREIGN KEY([idEstatus])
REFERENCES [dbo].[Estatus] ([idEstatus])
GO
ALTER TABLE [dbo].[TipoMovimiento] CHECK CONSTRAINT [FK_TipoMovimiento_Estatus]
GO
ALTER TABLE [dbo].[TipoMovimiento]  WITH CHECK ADD  CONSTRAINT [FK_TipoMovimiento_Usuario] FOREIGN KEY([idUsuarioAlta])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[TipoMovimiento] CHECK CONSTRAINT [FK_TipoMovimiento_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Estatus] FOREIGN KEY([idEstatus])
REFERENCES [dbo].[Estatus] ([idEstatus])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Estatus]
GO
/****** Object:  StoredProcedure [dbo].[alta_Cliente]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[alta_Cliente]
	@Clave varchar(50),
	@Nombre_RazonSocial varchar(50),
	@ApellidoPaterno varchar(50),
	@ApellidoMaterno varchar(50),
	@RFC varchar(14),
	@idEstatus int,
	@FechaAlta datetime,
	--@FechaModificacion datetime,
	@idUsuarioAlta int
AS

Declare 
	@id int = -1,
	@fechaActual datetime = getdate()

INSERT INTO [dbo].[Cliente]
           ([Clave],
		   [Nombre_RazonSocial],
		   [ApellidoPaterno],
		   [ApellidoMaterno],
		   [RFC],
		   [idEstatus],
		   [FechaAlta],
		   --[FechaModificacion],
		   [idUsuarioAlta])
     VALUES(
           @Clave,
		   @Nombre_RazonSocial,
		   @ApellidoPaterno,
		   @ApellidoMaterno,
		   @RFC,
		   @idEstatus,
		   @fechaActual,
		   --@FechaModificacion,
		   @idUsuarioAlta
		   )

Select @id = @@IDENTITY
Select @id

GO
/****** Object:  StoredProcedure [dbo].[alta_Cuenta]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[alta_Cuenta] 	
	@idCliente int,
    @idTipoCuenta int,
    @idEstatus int,
    @Numero varchar(50),
    --@Saldo decimal(18,5),
    --FechaAlta, datetime,
    @idUsuarioAlta int
    --@FechaModificacion datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare 
		@id int = -1,
		@fechaActual datetime = getdate();

    -- Insert statements for procedure here
	Insert into Cuenta(idCliente, idTipoCuenta, idEstatus, Numero, FechaAlta, idUsuarioAlta)
	values(@idCliente, @idTipoCuenta, @idEstatus,'N00001',@fechaActual,@idUsuarioAlta)

	Select @id = @@identity;

	select @id;

END
GO
/****** Object:  StoredProcedure [dbo].[alta_Direccion]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[alta_Direccion]
	@Calle varchar(50),
	@NumeroExterior varchar(30),
	@NumeroInterior varchar(30),
	@CodigoPostal varchar(15),
	@AlcaldiaMunicipio varchar(50),
	@Colonia varchar(50),
	@Ciudad varchar(50),
	@idTipoDireccion int,
	@idUsuarioAlta int,
	@idEstatus int
	
AS
BEGIN

	Declare 
		@id int = -1,
		@fechaActual datetime = getdate()
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Direccion(Calle,NumeroExterior,NumeroInterior,CodigoPostal,Alcaldia,Colonia,Ciudad,idTipoDireccion,idUsuarioAlta,idEstatus,FechaAlta)
	values(@Calle,@NumeroExterior,@NumeroInterior,@CodigoPostal,@AlcaldiaMunicipio,@Colonia,@Ciudad,@idTipoDireccion,@idUsuarioAlta,@idEstatus,@fechaActual)

	Select @id = @@identity;
	Select @id;

END
GO
/****** Object:  StoredProcedure [dbo].[alta_Estatus]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[alta_Estatus]
@Clave varchar(5),
@Descripcion varchar(50),
@idUsuarioAlta int
as
Declare 
	@Id int = -1,
	@FechaActual datetime = getdate()

INSERT INTO [dbo].[Estatus](
           [Clave],
		   [Descripcion],
		   [idUsuarioAlta],
		   [FechaAlta]
		   )
     VALUES(
           @Clave,
           @Descripcion,
           @idUsuarioAlta,
           @FechaActual
		   )

Select @id = @@IDENTITY;




GO
/****** Object:  StoredProcedure [dbo].[recuperaT_Estatus]    Script Date: 29/12/2021 05:16:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[recuperaT_Estatus] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		idEstatus,
		Clave,
		Descripcion
	FROM 
		Estatus
END
GO
USE [master]
GO
ALTER DATABASE [Financiera] SET  READ_WRITE 
GO

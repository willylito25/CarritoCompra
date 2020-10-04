
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/04/2020 04:54:24
-- Generated from EDMX file: C:\Users\deii\Desktop\CarritoComprasTuCodigo\CarritoComprasTuCodigo\Models\CarritoBD.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CarritoCompra];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Producto__Catego__1273C1CD]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK__Producto__Catego__1273C1CD];
GO
IF OBJECT_ID(N'[dbo].[FK__ListaVent__Produ__182C9B23]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ListaVenta] DROP CONSTRAINT [FK__ListaVent__Produ__182C9B23];
GO
IF OBJECT_ID(N'[dbo].[FK__ListaVent__Venta__173876EA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ListaVenta] DROP CONSTRAINT [FK__ListaVent__Venta__173876EA];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categoria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categoria];
GO
IF OBJECT_ID(N'[dbo].[ListaVenta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ListaVenta];
GO
IF OBJECT_ID(N'[dbo].[Producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Producto];
GO
IF OBJECT_ID(N'[dbo].[Venta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Venta];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categoria'
CREATE TABLE [dbo].[Categoria] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(50)  NULL
);
GO

-- Creating table 'ListaVenta'
CREATE TABLE [dbo].[ListaVenta] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [VentaId] int  NULL,
    [ProductoId] int  NULL,
    [Cantidad] int  NULL,
    [Total] float  NULL
);
GO

-- Creating table 'Producto'
CREATE TABLE [dbo].[Producto] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(50)  NULL,
    [Precio] float  NULL,
    [FechaCreacion] datetime  NULL,
    [Foto] varchar(200)  NULL,
    [CategoriaId] int  NULL
);
GO

-- Creating table 'Venta'
CREATE TABLE [dbo].[Venta] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DiaVenta] datetime  NULL,
    [Subtotal] float  NULL,
    [Iva] float  NULL,
    [Total] float  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Categoria'
ALTER TABLE [dbo].[Categoria]
ADD CONSTRAINT [PK_Categoria]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ListaVenta'
ALTER TABLE [dbo].[ListaVenta]
ADD CONSTRAINT [PK_ListaVenta]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [PK_Producto]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Venta'
ALTER TABLE [dbo].[Venta]
ADD CONSTRAINT [PK_Venta]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoriaId] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [FK__Producto__Catego__1273C1CD]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[Categoria]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Producto__Catego__1273C1CD'
CREATE INDEX [IX_FK__Producto__Catego__1273C1CD]
ON [dbo].[Producto]
    ([CategoriaId]);
GO

-- Creating foreign key on [ProductoId] in table 'ListaVenta'
ALTER TABLE [dbo].[ListaVenta]
ADD CONSTRAINT [FK__ListaVent__Produ__182C9B23]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Producto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ListaVent__Produ__182C9B23'
CREATE INDEX [IX_FK__ListaVent__Produ__182C9B23]
ON [dbo].[ListaVenta]
    ([ProductoId]);
GO

-- Creating foreign key on [VentaId] in table 'ListaVenta'
ALTER TABLE [dbo].[ListaVenta]
ADD CONSTRAINT [FK__ListaVent__Venta__173876EA]
    FOREIGN KEY ([VentaId])
    REFERENCES [dbo].[Venta]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ListaVent__Venta__173876EA'
CREATE INDEX [IX_FK__ListaVent__Venta__173876EA]
ON [dbo].[ListaVenta]
    ([VentaId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------

-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/15/2016 19:27:10
-- Generated from EDMX file: C:\Users\Shaggy\Documents\Visual Studio 2015\Projects\LittleRabit\Persistencia\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Carrot_db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BodegaInventario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BodegaSet] DROP CONSTRAINT [FK_BodegaInventario];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoBodega_Bodega]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoBodega] DROP CONSTRAINT [FK_ProductoBodega_Bodega];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoBodega_Producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoBodega] DROP CONSTRAINT [FK_ProductoBodega_Producto];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoCategoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoSet] DROP CONSTRAINT [FK_ProductoCategoria];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoComponente_Componente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoComponente] DROP CONSTRAINT [FK_ProductoComponente_Componente];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoComponente_Producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoComponente] DROP CONSTRAINT [FK_ProductoComponente_Producto];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoInventario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoSet] DROP CONSTRAINT [FK_ProductoInventario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BodegaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BodegaSet];
GO
IF OBJECT_ID(N'[dbo].[CategoriaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategoriaSet];
GO
IF OBJECT_ID(N'[dbo].[ComponenteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ComponenteSet];
GO
IF OBJECT_ID(N'[dbo].[InventarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InventarioSet];
GO
IF OBJECT_ID(N'[dbo].[ProductoBodega]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoBodega];
GO
IF OBJECT_ID(N'[dbo].[ProductoComponente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoComponente];
GO
IF OBJECT_ID(N'[dbo].[ProductoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoSet];
GO
IF OBJECT_ID(N'[dbo].[ProveedorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProveedorSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ProductoSet'
CREATE TABLE [dbo].[ProductoSet] (
    [IdProducto] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Imagen] nvarchar(max)  NOT NULL,
    [Precio] decimal(19,4)  NOT NULL,
    [Categoria_IdCategoria] int  NOT NULL,
    [Inventario_IdProducto] int  NOT NULL,
    [Inventario_IdBodega] int  NOT NULL,
    [Proveedor_IdProveedor] int  NOT NULL
);
GO

-- Creating table 'BodegaSet'
CREATE TABLE [dbo].[BodegaSet] (
    [IdBodega] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Ubicacion] nvarchar(max)  NOT NULL,
    [Inventario_IdProducto] int  NOT NULL,
    [Inventario_IdBodega] int  NOT NULL
);
GO

-- Creating table 'InventarioSet'
CREATE TABLE [dbo].[InventarioSet] (
    [IdProducto] int  NOT NULL,
    [IdBodega] int  NOT NULL,
    [Cantidad] int  NOT NULL
);
GO

-- Creating table 'ComponenteSet'
CREATE TABLE [dbo].[ComponenteSet] (
    [IdComponente] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [PrecioUnitario] decimal(18,0)  NOT NULL,
    [Proveedor_IdProveedor] int  NOT NULL
);
GO

-- Creating table 'CategoriaSet'
CREATE TABLE [dbo].[CategoriaSet] (
    [IdCategoria] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Imagen] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProveedorSet'
CREATE TABLE [dbo].[ProveedorSet] (
    [IdProveedor] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProductoBodega'
CREATE TABLE [dbo].[ProductoBodega] (
    [BodegaSet_IdBodega] int  NOT NULL,
    [ProductoSet_IdProducto] int  NOT NULL
);
GO

-- Creating table 'ProductoComponente'
CREATE TABLE [dbo].[ProductoComponente] (
    [Producto_IdProducto] int  NOT NULL,
    [Componente_IdComponente] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdProducto] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [PK_ProductoSet]
    PRIMARY KEY CLUSTERED ([IdProducto] ASC);
GO

-- Creating primary key on [IdBodega] in table 'BodegaSet'
ALTER TABLE [dbo].[BodegaSet]
ADD CONSTRAINT [PK_BodegaSet]
    PRIMARY KEY CLUSTERED ([IdBodega] ASC);
GO

-- Creating primary key on [IdProducto], [IdBodega] in table 'InventarioSet'
ALTER TABLE [dbo].[InventarioSet]
ADD CONSTRAINT [PK_InventarioSet]
    PRIMARY KEY CLUSTERED ([IdProducto], [IdBodega] ASC);
GO

-- Creating primary key on [IdComponente] in table 'ComponenteSet'
ALTER TABLE [dbo].[ComponenteSet]
ADD CONSTRAINT [PK_ComponenteSet]
    PRIMARY KEY CLUSTERED ([IdComponente] ASC);
GO

-- Creating primary key on [IdCategoria] in table 'CategoriaSet'
ALTER TABLE [dbo].[CategoriaSet]
ADD CONSTRAINT [PK_CategoriaSet]
    PRIMARY KEY CLUSTERED ([IdCategoria] ASC);
GO

-- Creating primary key on [IdProveedor] in table 'ProveedorSet'
ALTER TABLE [dbo].[ProveedorSet]
ADD CONSTRAINT [PK_ProveedorSet]
    PRIMARY KEY CLUSTERED ([IdProveedor] ASC);
GO

-- Creating primary key on [BodegaSet_IdBodega], [ProductoSet_IdProducto] in table 'ProductoBodega'
ALTER TABLE [dbo].[ProductoBodega]
ADD CONSTRAINT [PK_ProductoBodega]
    PRIMARY KEY CLUSTERED ([BodegaSet_IdBodega], [ProductoSet_IdProducto] ASC);
GO

-- Creating primary key on [Producto_IdProducto], [Componente_IdComponente] in table 'ProductoComponente'
ALTER TABLE [dbo].[ProductoComponente]
ADD CONSTRAINT [PK_ProductoComponente]
    PRIMARY KEY CLUSTERED ([Producto_IdProducto], [Componente_IdComponente] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BodegaSet_IdBodega] in table 'ProductoBodega'
ALTER TABLE [dbo].[ProductoBodega]
ADD CONSTRAINT [FK_ProductoBodega_Bodega]
    FOREIGN KEY ([BodegaSet_IdBodega])
    REFERENCES [dbo].[BodegaSet]
        ([IdBodega])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductoSet_IdProducto] in table 'ProductoBodega'
ALTER TABLE [dbo].[ProductoBodega]
ADD CONSTRAINT [FK_ProductoBodega_Producto]
    FOREIGN KEY ([ProductoSet_IdProducto])
    REFERENCES [dbo].[ProductoSet]
        ([IdProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoBodega_Producto'
CREATE INDEX [IX_FK_ProductoBodega_Producto]
ON [dbo].[ProductoBodega]
    ([ProductoSet_IdProducto]);
GO

-- Creating foreign key on [Categoria_IdCategoria] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [FK_ProductoCategoria]
    FOREIGN KEY ([Categoria_IdCategoria])
    REFERENCES [dbo].[CategoriaSet]
        ([IdCategoria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoCategoria'
CREATE INDEX [IX_FK_ProductoCategoria]
ON [dbo].[ProductoSet]
    ([Categoria_IdCategoria]);
GO

-- Creating foreign key on [Producto_IdProducto] in table 'ProductoComponente'
ALTER TABLE [dbo].[ProductoComponente]
ADD CONSTRAINT [FK_ProductoComponente_Producto]
    FOREIGN KEY ([Producto_IdProducto])
    REFERENCES [dbo].[ProductoSet]
        ([IdProducto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Componente_IdComponente] in table 'ProductoComponente'
ALTER TABLE [dbo].[ProductoComponente]
ADD CONSTRAINT [FK_ProductoComponente_Componente]
    FOREIGN KEY ([Componente_IdComponente])
    REFERENCES [dbo].[ComponenteSet]
        ([IdComponente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoComponente_Componente'
CREATE INDEX [IX_FK_ProductoComponente_Componente]
ON [dbo].[ProductoComponente]
    ([Componente_IdComponente]);
GO

-- Creating foreign key on [Inventario_IdProducto], [Inventario_IdBodega] in table 'BodegaSet'
ALTER TABLE [dbo].[BodegaSet]
ADD CONSTRAINT [FK_BodegaInventario]
    FOREIGN KEY ([Inventario_IdProducto], [Inventario_IdBodega])
    REFERENCES [dbo].[InventarioSet]
        ([IdProducto], [IdBodega])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BodegaInventario'
CREATE INDEX [IX_FK_BodegaInventario]
ON [dbo].[BodegaSet]
    ([Inventario_IdProducto], [Inventario_IdBodega]);
GO

-- Creating foreign key on [Inventario_IdProducto], [Inventario_IdBodega] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [FK_ProductoInventario]
    FOREIGN KEY ([Inventario_IdProducto], [Inventario_IdBodega])
    REFERENCES [dbo].[InventarioSet]
        ([IdProducto], [IdBodega])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoInventario'
CREATE INDEX [IX_FK_ProductoInventario]
ON [dbo].[ProductoSet]
    ([Inventario_IdProducto], [Inventario_IdBodega]);
GO

-- Creating foreign key on [Proveedor_IdProveedor] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [FK_ProductoProveedor]
    FOREIGN KEY ([Proveedor_IdProveedor])
    REFERENCES [dbo].[ProveedorSet]
        ([IdProveedor])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoProveedor'
CREATE INDEX [IX_FK_ProductoProveedor]
ON [dbo].[ProductoSet]
    ([Proveedor_IdProveedor]);
GO

-- Creating foreign key on [Proveedor_IdProveedor] in table 'ComponenteSet'
ALTER TABLE [dbo].[ComponenteSet]
ADD CONSTRAINT [FK_ComponenteProveedor]
    FOREIGN KEY ([Proveedor_IdProveedor])
    REFERENCES [dbo].[ProveedorSet]
        ([IdProveedor])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComponenteProveedor'
CREATE INDEX [IX_FK_ComponenteProveedor]
ON [dbo].[ComponenteSet]
    ([Proveedor_IdProveedor]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
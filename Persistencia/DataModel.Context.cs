﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Persistencia
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DataModelContainer : DbContext
    {
        public DataModelContainer()
            : base("name=DataModelContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Producto> ProductoSet { get; set; }
        public virtual DbSet<Bodega> BodegaSet { get; set; }
        public virtual DbSet<Inventario> InventarioSet { get; set; }
        public virtual DbSet<Componente> ComponenteSet { get; set; }
        public virtual DbSet<Categoria> CategoriaSet { get; set; }
        public virtual DbSet<Proveedor> ProveedorSet { get; set; }
        public virtual DbSet<Historial> HistorialSet { get; set; }
        public virtual DbSet<Cliente> ClienteSet { get; set; }
        public virtual DbSet<Factura> FacturaSet { get; set; }
    }
}

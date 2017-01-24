using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bodega
{
    public class Producto
    {
        private int id;
        private string nombre;
        private LinkedList<Item> items;
        private String descripccion;
        private float precio;

        public Producto()
        {
            throw new System.NotImplementedException();
        }

        ~Producto()
        {
            throw new System.NotImplementedException();
        }

        public Categoria Categoria
        {
            get
            {
                throw new System.NotImplementedException();
            }

            set
            {
            }
        }
    }
}
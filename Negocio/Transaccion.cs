using LittleRabit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Transaccion
    {
        private int id;
        private LinkedList<Evento> eventos;
        private Usuario usuario;
    }
}

using CineBack.Servicios.Interfaz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Servicios
{
    public abstract class FactoryService
    {
        public abstract IServicio CrearServicio();
    }
}

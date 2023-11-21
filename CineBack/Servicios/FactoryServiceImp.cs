using CineBack.Servicios.Implementacion;
using CineBack.Servicios.Interfaz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Servicios
{
    public class FactoryServiceImp : FactoryService
    {
        public override IServicio CrearServicio()
        {
            return new Servicio();
        }
    }
}

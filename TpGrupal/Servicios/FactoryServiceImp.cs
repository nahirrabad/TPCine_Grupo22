using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TpGrupal.Servicios.Implementacion;

namespace TpGrupal.Servicios
{
    public class FactoryServiceImp : FactoryService
    {
        public override IServicio CrearServicio()
        {
            return new Servicio();
        }
    }
}

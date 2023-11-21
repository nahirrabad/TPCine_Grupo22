using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TpGrupal.Datos.Implementacion;
using TpGrupal.Datos.Interfaz;

namespace TpGrupal.Servicios.Implementacion
{
    public class Servicio : IServicio
    {
        private ICineDao dao;

        public Servicio()
        {
            dao = new CineDao();
        }

        //Configuramos los metodos que vamos a utilizar
    }
}

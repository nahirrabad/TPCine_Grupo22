using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Dominio
{
    public class Barrio
    {
        public int IdBarrio { get; set; }
        public string Nombre { get; set; }
        public int IdLocalidad { get; set; }

        public Barrio(int idBarrio, string nombre, int idLocalidad)
        {
            IdBarrio = idBarrio;
            Nombre = nombre;
            IdLocalidad = idLocalidad;
        }

        public Barrio()
        {
            
        }       
    }
}

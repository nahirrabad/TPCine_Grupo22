using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Dominio
{
    public class Butaca
    {
        public int Id { get; set; }
        public Sala Sala { get; set; }
        public Estado Estado { get; set; }
        public Funcion Funcion { get; set; }
        public int Nro { get; set; }

        public Butaca(int id, Sala sala, Estado estado, Funcion funcion, int nro)
        {
            Id = id;
            Sala = sala;
            Estado = estado;
            Funcion = funcion;
            Nro = nro;
        }

        public Butaca()
        {

        }
    }
}

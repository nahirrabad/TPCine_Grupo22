using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Dominio
{
    public class TipoCliente
    {
        public int IdTipoCliente { get; set; }
        public string NombreTipoCliente { get; set; }
        public int IdPromocion { get; set; }

        public TipoCliente(int idTipoCliente, string nombreTipoCliente, int idPromocion)
        {
            IdTipoCliente = idTipoCliente;
            NombreTipoCliente = nombreTipoCliente;
            IdPromocion = idPromocion;
        }

        public TipoCliente()
        {
            
        }
    }
}

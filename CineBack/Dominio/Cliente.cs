using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Dominio
{
    public class Cliente
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Dni { get; set; }
        public DateTime FechaNac { get; set; }
        public int Nro { get; set; }
        public int IdBarrio { get; set; }
        public int IdTipoCliente { get; set; }
        public int IdGeneroCliente { get; set; }
        public DateTime FechaAlta { get; set; }
        public int? Id { get; set; }
        public string? Telefono { get; set; }
        public string? Mail { get; set; }
        public string? Calle { get; set; }
        public string? Barrio { get; set; }
        public string? TipoCliente { get; set; }
        public string? GeneroCliente { get; set; }
        public DateTime? FechaBaja { get; set; }

        public Cliente(string nombre, string apellido, int dni, DateTime fechaNac, int nro, int idBarrio, int idTipoCliente, int idGeneroCliente, DateTime fechaAlta, int? id = null, string? telefono = null, string? mail = null, string? calle = null, string? barrio = null, string? tipoCliente = null, string? generoCliente = null, DateTime? fechaBaja = null)
        {
            Nombre = nombre;
            Apellido = apellido;
            Dni = dni;
            FechaNac = fechaNac;
            Nro = nro;
            IdBarrio = idBarrio;
            IdTipoCliente = idTipoCliente;
            IdGeneroCliente = idGeneroCliente;
            FechaAlta = fechaAlta;
            Id = id;
            Telefono = telefono;
            Mail = mail;
            Calle = calle;
            Barrio = barrio;
            TipoCliente = tipoCliente;
            GeneroCliente = generoCliente;
            FechaBaja = fechaBaja;
        }

        public Cliente()
        {

        }

        public string InfoCliente
        {   
            get { return $"{Apellido} {Nombre} || {Id}"; }         
        }
    }
}

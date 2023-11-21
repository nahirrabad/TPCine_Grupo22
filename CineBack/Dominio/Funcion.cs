using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Dominio
{
    public class Funcion
    {
        public int Id { get; set; }
        public Pelicula Pelicula { get; set; }
        public Sala Sala { get; set; }
        public DateTime? Fecha { get; set; }
        public TimeSpan? Hora { get; set; }

        public Funcion()
        {

        }

        public string InfoFuncion
        {
            get 
            {
                string fechaFormateada = Fecha.HasValue ? Fecha.Value.ToString("dd/MM/yyyy") : string.Empty;
                return $"{Pelicula.Nombre} || {fechaFormateada} || {Hora} || {Sala.TipoSala.Nombre} || {Pelicula.Idioma}"; 
            }
        }
    }
}

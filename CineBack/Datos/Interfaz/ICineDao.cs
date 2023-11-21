using CineBack.Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Datos.Interfaz
{
    internal interface ICineDao
    {
        List<Barrio> CargarBarrios(string nombreSP);
        List<TipoCliente> CargarTiposClientes(string nombreSP);
        List<Funcion> CargarFunciones(string nombreSP);
        List<Cliente> CargarClientes(List<Parametro> lParams);





        List<Butaca> CargarButacas(List<Parametro> lParams);
        Cliente ConsultarCliente(List<Parametro> lParams);










        List<FormaPago> CargarFormasPago(string nombreSP);
        bool SaveCliente(Cliente oC);
        bool SaveComprobante(Comprobante oC);

        bool ModificarCliente(Cliente oC);
        bool ActualizarButaca(Comprobante oC);

        bool DeleteCliente(int id);
        Comprobante CargarComprobante(List<Parametro> lParams);
    }
}

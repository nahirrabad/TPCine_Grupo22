using CineBack.Datos;
using CineBack.Dominio;
using CineBack.Servicios;
using CineBack.Servicios.Interfaz;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CineWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CineController : ControllerBase
    {
        private IServicio serv;

        public CineController()
        {
            serv = new FactoryServiceImp().CrearServicio();
        }

        [HttpGet("Barrios")]
        public IActionResult CargarBarrios() 
        {
            return Ok(serv.CargarBarrios("SP_CONSULTAR_BARRIOS"));
        }

        [HttpGet("TiposClientes")]
        public IActionResult CargarTiposClientes()
        {
            return Ok(serv.CargarTiposClientes("SP_CONSULTAR_TIPOS_CLIENTES"));
        }

        [HttpGet("Funciones")]
        public IActionResult CargarFunciones()
        {
            return Ok(serv.CargarFunciones("SP_CONSULTAR_FUNCIONES"));
        }

        [HttpGet("FormasPago")]
        public IActionResult CargarFormasPago()
        {
            return Ok(serv.CargarFormasPago("SP_CONSULTAR_FORMAS_PAGO"));
        }

        [HttpPost("Clientes")]
        public IActionResult PostCliente(Cliente oC)
        {
            if (oC == null)
                return BadRequest();

            if (serv.SaveCliente(oC) == true)
                return Ok("¡Cliente registrado con exito!");
            else
                return Ok("¡Error al registrar cliente!");
        }

        [HttpPost("Comprobante")]
        public IActionResult PostComprobante(Comprobante oC)
        {
            if (oC == null)
                return BadRequest();

            if (serv.SaveComprobante(oC) == true)
                return Ok("¡Enhorabuena, comprobante registrado con exito!");
            else
                return Ok("¡ERROR FATAL! No se pudo registrar el comprobante");
        }

        [HttpPost("CargarButacas")]
        public IActionResult CargarButacas(List<Parametro> lParams)
        {
            if (lParams == null || lParams.Count == 0)
                return BadRequest("Se requiere una lista de parametros");

            return Ok(serv.CargarButacas(lParams));
        }

        [HttpPost("ConsultarCliente")]
        public IActionResult ConsultarCliente(List<Parametro> lParams)
        {
            if (lParams == null || lParams.Count == 0)
                return BadRequest("Se requiere una lista de parametros (id)");

            return Ok(serv.ConsultarCliente(lParams));
        }

        [HttpPost("CargarComprobante")]
        public IActionResult CargarComprobante(List<Parametro> lParams)
        {
            if (lParams == null || lParams.Count == 0)
                return BadRequest("Se requiere una lista de parametros (id)");

            return Ok(serv.CargarComprobante(lParams));
        }

        [HttpPost("CargarClientes")] 
        public IActionResult CargarClientes(List<Parametro> lParams)
        {
            if (lParams == null || lParams.Count == 0)
                return BadRequest("Se requiere una lista de parametros");

            return Ok(serv.CargarClientes(lParams));
        }

        [HttpPut("ActualizarCliente")]
        public IActionResult ActualizarCliente(Cliente oC)
        {
            if (oC == null)
                return BadRequest("");

            if (serv.ModificarCliente(oC) == true)
                return Ok("¡Cliente actualizado con exito!");
            else
                return Ok("¡Error al actualizar cliente!");
        }

        [HttpPut("Butaca")]
        public IActionResult PutButaca(Comprobante oC)
        {
            if (oC == null)
                return BadRequest();

            if (serv.ActualizarButaca(oC) == true)
                return Ok("¡BUTACAS ACTUALIZADAS!");
            else
                return Ok("Oh, genial, cometiste el mismo error al actualizar las butacas ");
        }

        [HttpDelete("BajaCliente")]
        public IActionResult DeleteCliente(int id)
        {
            if (id == 0)
                return BadRequest("Se requiere un id");
            if (serv.DeleteCliente(id) == true)
                return Ok("¡Cliente dado de baja con exito!");
            else
                return BadRequest("¡Error al dar de baja cliente!");
        }        
    }
}

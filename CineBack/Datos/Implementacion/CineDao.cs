using CineBack.Datos.Interfaz;
using CineBack.Dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Datos.Implementacion
{
    internal class CineDao : ICineDao
    {
        public List<Barrio> CargarBarrios(string nombreSP)
        {
            DataTable table = HelperDao.GetInstance().GetTable(nombreSP);
            List<Barrio> lBarrios = new List<Barrio>();

            foreach (DataRow row in table.Rows)
            {
                Barrio oB = new Barrio();
                
                oB.IdBarrio = Convert.ToInt32(row["id_barrio"].ToString());
                oB.Nombre = row["barrio"].ToString();

                lBarrios.Add(oB);
            }

            return lBarrios;
        }

        public List<TipoCliente> CargarTiposClientes(string nombreSP)
        {
            DataTable table = HelperDao.GetInstance().GetTable(nombreSP);
            List<TipoCliente> lTiposClientes = new List<TipoCliente>();

            foreach (DataRow row in table.Rows)
            {
                TipoCliente oTP = new TipoCliente();

                oTP.IdTipoCliente = Convert.ToInt32(row["id_tipo_cliente"].ToString());
                oTP.NombreTipoCliente = row["tipo_cliente"].ToString();

                lTiposClientes.Add(oTP);
            }

            return lTiposClientes;
        }

        public List<Funcion> CargarFunciones(string nombreSP)
        {
            DataTable table = HelperDao.GetInstance().GetTable(nombreSP);
            List<Funcion> lFunciones = new List<Funcion>();

            foreach (DataRow row in table.Rows)
            {
                Funcion oF = new Funcion();
                
                oF.Pelicula = new Pelicula();
                oF.Sala = new Sala();
                oF.Sala.TipoSala = new TipoSala();

                oF.Id = Convert.ToInt32(row["id_funcion"].ToString());
                oF.Pelicula.Nombre = row["Titulo"].ToString();
                oF.Fecha = (row["Fecha"] as DateTime?) ?? null;
                oF.Hora = (row["Hora"] as TimeSpan?) ?? null;
                oF.Sala.TipoSala.Nombre = row["Sala"].ToString();
                oF.Pelicula.Idioma = row["Idioma"].ToString();

                lFunciones.Add(oF);
            }

            return lFunciones;
        }

        public List<FormaPago> CargarFormasPago(string nombreSP)
        {
            DataTable table = HelperDao.GetInstance().GetTable(nombreSP);
            List<FormaPago> lFormasPago = new List<FormaPago>();

            foreach (DataRow row in table.Rows)
            {
                FormaPago oFP = new FormaPago();

                oFP.Id = Convert.ToInt32(row["id_forma_pago"].ToString());
                oFP.Nombre = row["forma_pago"].ToString();

                lFormasPago.Add(oFP);
            }

            return lFormasPago;
        }

        public Cliente ConsultarCliente(List<Parametro> lParams)
        {
            DataTable table = HelperDao.GetInstance().GetTable("SP_CONSULTAR_CLIENTE", lParams);
            Cliente oC = new Cliente();

            foreach (DataRow row in table.Rows)
            {
                oC.Id = Convert.ToInt32(row["id_cliente"].ToString());
                oC.Nombre = row["nombre"].ToString();
                oC.Apellido = row["apellido"].ToString();
                oC.Dni = Convert.ToInt32(row["dni"].ToString());
                oC.Mail = row["mail"].ToString();
                oC.Telefono = row["telefono"].ToString();
                oC.FechaNac = Convert.ToDateTime(row["fecha_nac"].ToString());
                oC.Calle = row["calle"].ToString();
                oC.Nro = Convert.ToInt32(row["nro"].ToString());
                oC.IdBarrio = Convert.ToInt32(row["id_barrio"].ToString());
                oC.IdGeneroCliente = Convert.ToInt32(row["id_genero_cliente"].ToString());
                oC.IdTipoCliente = Convert.ToInt32(row["id_tipo_cliente"].ToString());
                oC.FechaAlta = Convert.ToDateTime(row["fecha_alta"].ToString());
                oC.FechaBaja = null;
                if (row["fecha_baja"] != DBNull.Value)
                    oC.FechaBaja = Convert.ToDateTime(row["fecha_baja"].ToString());
            }

            return oC;
        }

        public Comprobante CargarComprobante(List<Parametro> lParams)
        {
            DataTable table = HelperDao.GetInstance().GetTable("sp_consultar_comprobante", lParams);
            
            Comprobante oC = new Comprobante();
            oC.FormaPago = new FormaPago();
            oC.Cliente = new Cliente();

            foreach (DataRow row in table.Rows)
            {
                oC.Fecha = Convert.ToDateTime(row["cp_fecha"].ToString());
                oC.FormaPago.Id = Convert.ToInt32(row["id_forma_pago"].ToString());
                oC.FormaPago.Nombre = row["forma_pago"].ToString();
                oC.Cliente.Id = Convert.ToInt32(row["id_cliente"].ToString());
                oC.Cliente.Nombre = row["nombre"].ToString();
                oC.Cliente.Apellido = row["apellido"].ToString();
                oC.Cliente.IdTipoCliente = Convert.ToInt32(row["id_tipo_cliente"].ToString());
                oC.Cliente.TipoCliente = row["tipo_cliente"].ToString();
                
                DetalleComprobante oDC = new DetalleComprobante();
                oDC.Butaca = new Butaca();
                oDC.Butaca.Funcion = new Funcion();
                oDC.Butaca.Funcion.Pelicula = new Pelicula();
                oDC.Butaca.Funcion.Sala = new Sala();
                oDC.Butaca.Funcion.Sala.TipoSala = new TipoSala();

                oDC.Id = Convert.ToInt32(row["id_det_comprobante"].ToString());
                oDC.Butaca.Id = Convert.ToInt32(row["id_butaca"].ToString());
                oDC.Butaca.Funcion.Id = Convert.ToInt32(row["id_funcion"].ToString());
                oDC.Butaca.Funcion.Pelicula.Nombre = row["titulo"].ToString();
                oDC.Butaca.Funcion.Pelicula.Idioma = row["idioma"].ToString();
                oDC.Butaca.Funcion.Fecha = (row["fn_fecha"] as DateTime?) ?? null;
                oDC.Butaca.Funcion.Hora = (row["hora_inicio"] as TimeSpan?) ?? null;
                oDC.Butaca.Funcion.Sala.TipoSala.Nombre = row["tipo_sala"].ToString();
                oDC.PrecioEntrada = Convert.ToDouble(row["precio_entrada"].ToString());

                oC.AgregarDetalle(oDC);
            }

            return oC;
        }

        public bool SaveCliente(Cliente oC)
        {
            bool rst = true;
            SqlConnection cnn = HelperDao.GetInstance().GetCnn();
            SqlTransaction txn = null;

            try
            {
                cnn.Open();
                txn = cnn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("SP_INSERTAR_CLIENTE", cnn, txn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@nombre", oC.Nombre);
                cmd.Parameters.AddWithValue("@apellido", oC.Apellido);
                cmd.Parameters.AddWithValue("@dni", oC.Dni);
                cmd.Parameters.AddWithValue("@mail", oC.Mail);
                cmd.Parameters.AddWithValue("@telefono", oC.Telefono);
                cmd.Parameters.AddWithValue("@fecha_nac", oC.FechaNac);
                cmd.Parameters.AddWithValue("@calle", oC.Calle);
                cmd.Parameters.AddWithValue("@nro", oC.Nro);
                cmd.Parameters.AddWithValue("@id_barrio", oC.IdBarrio);
                cmd.Parameters.AddWithValue("@id_genero_cliente", oC.IdGeneroCliente);
                cmd.Parameters.AddWithValue("@id_tipo_cliente", oC.IdTipoCliente);

                cmd.ExecuteNonQuery();
                txn.Commit();
            }

            catch
            {
                txn.Rollback();
                rst = false;
            }

            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }

            return rst;
        }

        public bool SaveComprobante(Comprobante oC)
        {
            bool rst = true;
            SqlConnection cnn = HelperDao.GetInstance().GetCnn();
            SqlTransaction txn = null;

            try
            {
                cnn.Open();
                txn = cnn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("SP_INSERTAR_COMPROBANTE", cnn, txn);
                cmd.CommandType = CommandType.StoredProcedure;

                object valor = oC.Cliente?.Id != null ? (object)oC.Cliente.Id : DBNull.Value;
                cmd.Parameters.AddWithValue("id_cliente", valor);
                cmd.Parameters.AddWithValue("id_forma_pago", oC.FormaPago.Id);

                SqlParameter param = new SqlParameter("@id_comprobante", SqlDbType.Int);
                param.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(param);

                cmd.ExecuteNonQuery();

                int idComprobante = (int)param.Value;

                foreach (DetalleComprobante oDC in oC.DetsComprobante)
                {
                    SqlCommand cmdDC = new SqlCommand("SP_INSERTAR_DETALLE", cnn, txn);
                    cmdDC.CommandType = CommandType.StoredProcedure;

                    cmdDC.Parameters.AddWithValue("@precio_entrada", oDC.PrecioEntrada);
                    cmdDC.Parameters.AddWithValue("@id_comprobante", idComprobante);
                    cmdDC.Parameters.AddWithValue("@id_butaca", oDC.Butaca.Id);

                    cmdDC.ExecuteNonQuery();
                }

                txn.Commit();
            }

            catch
            {
                txn.Rollback();
                rst = false;
            }

            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }

            return rst;
        }

        public List<Cliente> CargarClientes(List<Parametro> lParams)
        {
            DataTable table = HelperDao.GetInstance().GetTable("SP_CONSULTAR_CLIENTES", lParams);
            List<Cliente> lClientes = new List<Cliente>();

            foreach (DataRow row in table.Rows)
            {
                Cliente oC = new Cliente();

                oC.Id = Convert.ToInt32(row["id_cliente"].ToString());
                oC.Nombre = row["nombre"].ToString();
                oC.Apellido = row["apellido"].ToString();
                oC.Dni = Convert.ToInt32(row["dni"].ToString());
                oC.Mail = row["mail"].ToString();
                oC.Telefono = row["telefono"].ToString();
                oC.FechaNac = Convert.ToDateTime(row["fecha_nac"].ToString());
                oC.Calle = row["calle"].ToString();
                oC.Nro = Convert.ToInt32(row["nro"].ToString());
                oC.Barrio = row["barrio"].ToString();
                oC.GeneroCliente = row["genero_cliente"].ToString();
                oC.TipoCliente = row["tipo_cliente"].ToString();
                oC.FechaAlta = Convert.ToDateTime(row["fecha_alta"].ToString());
                oC.FechaBaja = null;
                if (row["fecha_baja"] != DBNull.Value)
                    oC.FechaBaja = Convert.ToDateTime(row["fecha_baja"].ToString());

                lClientes.Add(oC);
            }

            return lClientes;
        }

        public bool ModificarCliente(Cliente oC)
        {
            bool rst = true;
            SqlConnection cnn = HelperDao.GetInstance().GetCnn();
            SqlTransaction txn = null;

            try
            {
                cnn.Open();
                txn = cnn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("SP_MODIFICAR_CLIENTE", cnn, txn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id_cliente", oC.Id);
                cmd.Parameters.AddWithValue("@telefono", oC.Telefono);
                cmd.Parameters.AddWithValue("@mail", oC.Mail);
                cmd.Parameters.AddWithValue("@calle", oC.Calle);
                cmd.Parameters.AddWithValue("@nro", oC.Nro);
                cmd.Parameters.AddWithValue("@id_barrio", oC.IdBarrio);
                cmd.Parameters.AddWithValue("@id_tipo", oC.IdTipoCliente);
                cmd.Parameters.AddWithValue("@fecha_baja", (object)oC.FechaBaja ?? DBNull.Value);

                cmd.ExecuteNonQuery();
                txn.Commit();
            }

            catch
            {
                txn.Rollback();
                rst = false;
            }

            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }

            return rst;
        }

        public bool ActualizarButaca(Comprobante oC)
        {
            bool rst = true;
            SqlConnection cnn = HelperDao.GetInstance().GetCnn();
            SqlTransaction txn = null;

            try
            {
                cnn.Open();
                txn = cnn.BeginTransaction();

                foreach (DetalleComprobante oDC in oC.DetsComprobante)
                {
                    SqlCommand cmd = new SqlCommand("SP_ACTUALIZAR_BUTACA", cnn, txn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@id_butaca", oDC.Butaca.Id);
                    cmd.Parameters.AddWithValue("@estado", oDC.Butaca.Estado.Nombre);

                    cmd.ExecuteNonQuery();
                }

                txn.Commit();
            }

            catch
            {
                txn.Rollback();
                rst = false;
            }

            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }

            return rst;
        }

        public bool DeleteCliente(int id)
        {
            bool rst = false;
            SqlConnection cnn = HelperDao.GetInstance().GetCnn();
            SqlTransaction txn = null;
            
            try
            {
                cnn.Open();
                txn = cnn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("SP_ELIMINAR_CLIENTE", cnn, txn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_cliente", id);
                rst = cmd.ExecuteNonQuery() == 1;
                txn.Commit();
            }

            catch
            {
                txn.Rollback();
            }

            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }

            return rst;
        }

        public List<Butaca> CargarButacas(List<Parametro> lParams)
        {
            DataTable table = HelperDao.GetInstance().GetTable("SP_CONSULTAR_BUTACAS", lParams);
            List<Butaca> lButacas = new List<Butaca>();

            foreach (DataRow row in table.Rows)
            {
                Butaca oB = new Butaca();
                oB.Sala = new Sala();
                oB.Sala.TipoSala = new TipoSala();
                oB.Estado = new Estado();

                oB.Id = Convert.ToInt32(row["id_butaca"].ToString());
                oB.Sala.TipoSala.Nombre = row["tipo_sala"].ToString();
                oB.Estado.Nombre = row["estado"].ToString();
                oB.Nro = Convert.ToInt32(row["nro_butaca"].ToString());

                lButacas.Add(oB);
            }

            return lButacas;
        }

        
    }
}

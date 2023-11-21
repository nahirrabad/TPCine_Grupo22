using CineBack.Dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Datos
{
    internal class HelperDao
    {
        private SqlConnection cnn;
        private static HelperDao instance;

        private HelperDao()
        {
            cnn = new SqlConnection("Data Source=172.16.10.196;Initial Catalog=CINE_22;User ID=alumno1w1; Password=alumno1w1");
        }

        public static HelperDao GetInstance()
        {
            if (instance == null)
                instance = new HelperDao();
            return instance;
        }

        public SqlConnection GetCnn()
        {
            return cnn;
        } 
        
        //Configuracion de los metodos que vamos a utilizar
        public DataTable GetTable(string nombreSP)
        {
            cnn.Open();

            SqlCommand cmd = new SqlCommand(nombreSP, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());

            cnn.Close();

            return table;
        }

        public DataTable GetTable(string nombreSP, List<Parametro> lParams)
        {
            cnn.Close();

            cnn.Open();

            SqlCommand cmd = new SqlCommand(nombreSP, cnn);
            cmd.CommandType= CommandType.StoredProcedure;

            cmd.Parameters.Clear();

            foreach (Parametro param in lParams)
            {
                if (param.Valor == null)
                    cmd.Parameters.AddWithValue(param.Nombre, DBNull.Value);
                else
                    cmd.Parameters.AddWithValue(param.Nombre, param.Valor.ToString());
            }

            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());

            cnn.Close();

            return table;
        }
    }
}

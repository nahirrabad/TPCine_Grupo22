using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TpGrupal.Datos
{
    public class HelperDao
    {
        private SqlConnection cnn;
        private static HelperDao instance; //definimos la variable instancia para usarla en el singleton

        private HelperDao() 
        {
            cnn = new SqlConnection(); 
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

        //Configuramos los metodos que vamos a utilizar

        



    }
}

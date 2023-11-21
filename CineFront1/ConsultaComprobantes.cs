using CineBack.Datos;
using CineBack.Dominio;
using CineFront.ClienteSing;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CineFront
{
    public partial class frmConsultarComprobantes : Form
    {
        public frmConsultarComprobantes()
        {
            InitializeComponent();
        }

        private async Task CargarClientes()
        {
            List<Parametro> lFiltros = new List<Parametro>();
            lFiltros.Add(new Parametro("@nombre", DBNull.Value));
            lFiltros.Add(new Parametro("@apellido", DBNull.Value));
            lFiltros.Add(new Parametro("dni", DBNull.Value));
            lFiltros.Add(new Parametro("inactivo", DBNull.Value));
            lFiltros.Add(new Parametro("baja", DBNull.Value));

            string url = "https://localhost:7218/api/Cine/CargarClientes";
            string filtrosJson = JsonConvert.SerializeObject(lFiltros);
            var bodyJson = await ClienteSgl.GetInstance().PostAsync(url, filtrosJson);

            List<Cliente> lClientes = JsonConvert.DeserializeObject<List<Cliente>>(bodyJson).OrderBy(oC => oC.Apellido).ToList();
            lClientes.Insert(0, new Cliente { Id = null, Nombre = "Final", Apellido = "Consumidor" });

            cboClientes.DataSource = lClientes;
            cboClientes.ValueMember = "Id";
            cboClientes.DisplayMember = "InfoCliente";
            cboClientes.AutoCompleteMode = AutoCompleteMode.Suggest;
            cboClientes.AutoCompleteSource = AutoCompleteSource.ListItems;
            cboClientes.SelectedIndex = 0;
        }
        private void ConsultaComprobantes_Load(object sender, EventArgs e)
        {

        }

        private void frmConsultarComprobantes_Load(object sender, EventArgs e)
        {
            CargarClientes();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void dtpDesde_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            frmConsultarComprobantes form = new frmConsultarComprobantes();
            form.Close(); 
        }

        private async void cboClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}

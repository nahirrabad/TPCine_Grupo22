using CineBack.Datos;
using CineBack.Dominio;
using CineBack.Servicios;
using CineBack.Servicios.Interfaz;
using CineFront.ClienteSing;
using CineFront1;
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
    public partial class frmConsultarClientes : Form
    {
        public IServicio serv;

        public frmConsultarClientes()
        {
            InitializeComponent();

            serv = new FactoryServiceImp().CrearServicio();
        }

        

        private void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void dgvClientes_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void frmConsultarClientes_Load(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void chkInactivo_CheckedChanged_1(object sender, EventArgs e)
        {
            chkBaja.Checked = false;

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void txtApellido_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {

        }

        private async void btnConsultar_Click_1(object sender, EventArgs e)
        {
            List<Parametro> lFiltros = new List<Parametro>();

            object valor = DBNull.Value;
            if (!string.IsNullOrEmpty(txtNombre.Text))
                valor = txtNombre.Text;
            lFiltros.Add(new Parametro("@nombre", valor));
            valor = DBNull.Value;
            if (!string.IsNullOrEmpty(txtApellido.Text))
                valor = txtApellido.Text;
            lFiltros.Add(new Parametro("@apellido", valor));
            valor = DBNull.Value;
            if (!string.IsNullOrEmpty(txtDni.Text))
                valor = txtDni.Text;
            lFiltros.Add(new Parametro("@dni", valor));
            valor = DBNull.Value;
            if (chkInactivo.Checked)
                valor = "S";
            lFiltros.Add(new Parametro("@inactivo", valor));
            valor = DBNull.Value;
            if (chkBaja.Checked)
                valor = "S";
            lFiltros.Add(new Parametro("@baja", valor));

            List<Cliente> lClientes = null;

            string url = "https://localhost:7218/api/Cine/CargarClientes";
            string filtrosJson = JsonConvert.SerializeObject(lFiltros);
            var bodyJson = await ClienteSgl.GetInstance().PostAsync(url, filtrosJson);

            lClientes = JsonConvert.DeserializeObject<List<Cliente>>(bodyJson);

            dgvClientes.Rows.Clear();

            foreach (Cliente oC in lClientes)
            {
                dgvClientes.Rows.Add(new object[] { oC.Id, oC.Nombre, oC.Apellido, oC.Dni, oC.FechaNac, oC.Telefono, oC.Mail, oC.Calle, oC.Nro, oC.Barrio, oC.TipoCliente, oC.GeneroCliente, oC.FechaBaja });
            }
        }

        private void chkBaja_CheckedChanged_1(object sender, EventArgs e)
        {
            chkInactivo.Checked = false;
        }

        private void btnEditar_Click_1(object sender, EventArgs e)
        {

            if (dgvClientes.CurrentRow != null)
            {
                int id = Convert.ToInt32(dgvClientes.CurrentRow.Cells["colId"].Value.ToString());
                FrmClienteAM frm = new FrmClienteAM(Accion.Act, id);
                frm.ShowDialog();
                this.btnConsultar_Click_1(null, null);
            }
        }

        private async void btnBaja_Click_1(object sender, EventArgs e)
        {

            DataGridViewRow row = dgvClientes.CurrentRow;

            if (row != null)
            {
                string id = row.Cells["colId"].Value.ToString();

                if (MessageBox.Show("¿Seguro que desea dar de baja a el cliente?", "Confirmación", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    string url = "https://localhost:7218/api/Cine/BajaCliente?id=" + id;
                    var bodyJson = await ClienteSgl.GetInstance().DeleteAsync(url);

                    MessageBox.Show(bodyJson, "Estado");

                    this.btnConsultar_Click_1(null, null);
                }
            }
        }
    }
}

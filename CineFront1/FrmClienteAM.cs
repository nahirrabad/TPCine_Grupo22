using CineBack.Datos;
using CineBack.Dominio;
using CineBack.Servicios;
using CineBack.Servicios.Interfaz;
using CineFront.ClienteSing;
using Newtonsoft.Json;
using System.Text.Json.Serialization;
using static System.Net.WebRequestMethods;

namespace CineFront
{
    public enum Accion
    {
        New,
        Act
    }

    public partial class FrmClienteAM : Form
    {
        private Accion modo;
        private IServicio serv;
        Cliente oCliente = new Cliente();

        public FrmClienteAM(Accion modo, int id)
        {
            InitializeComponent();
            serv = new FactoryServiceImp().CrearServicio();
            this.modo = modo;
            oCliente.Id = id;

            if (modo.Equals(Accion.New))
            {
                this.Text = "Nuevo Cliente";
                dtpFecNac.Value = DateTime.Now.AddYears(-15);
                chkBaja.Enabled = false;
            }

            if (modo.Equals(Accion.Act))
            {
                this.Text = "Actualizar Cliente";
                txtNombre.Enabled = false;
                txtApellido.Enabled = false;
                txtDni.Enabled = false;
                dtpFecNac.Enabled = false;
                rbtHombre.Enabled = false;
                rbtMujer.Enabled = false;
            }
        }

        

        private async Task CargarBarrrios()
        {
            string url = "https://localhost:7218/api/Cine/Barrios";
            var bodyJson = await ClienteSgl.GetInstance().GetAsync(url);

            List<Barrio> lBarrios = JsonConvert.DeserializeObject<List<Barrio>>(bodyJson);

            cboBarrios.DataSource = lBarrios;
            cboBarrios.ValueMember = "IdBarrio";
            cboBarrios.DisplayMember = "Nombre";
            cboBarrios.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private async Task CargarTiposClientes()
        {
            string url = "https://localhost:7218/api/Cine/TiposClientes";
            var bodyJson = await ClienteSgl.GetInstance().GetAsync(url);

            List<TipoCliente> lTiposClientes = JsonConvert.DeserializeObject<List<TipoCliente>>(bodyJson);

            cboTiposClientes.DataSource = lTiposClientes;
            cboTiposClientes.ValueMember = "IdTipoCliente";
            cboTiposClientes.DisplayMember = "NombreTipoCliente";
            cboTiposClientes.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private async Task ConsultarCliente(int? id) 
        {
            List<Parametro> lFiltros = new List<Parametro>();
            lFiltros.Add(new Parametro("@id_cliente", id));

            string url = "https://localhost:7218/api/Cine/ConsultarCliente";
            string filtrosJson = JsonConvert.SerializeObject(lFiltros);
            var bodyJson = await ClienteSgl.GetInstance().PostAsync(url, filtrosJson);

            oCliente = JsonConvert.DeserializeObject<Cliente>(bodyJson);

            txtNombre.Text = oCliente.Nombre;
            txtApellido.Text = oCliente.Apellido;
            txtDni.Text = oCliente.Dni.ToString();
            dtpFecNac.Value = oCliente.FechaNac;
            txtTelefono.Text = oCliente.Telefono;
            txtMail.Text = oCliente.Mail;
            txtCalle.Text = oCliente.Calle;
            txtNro.Text = oCliente.Nro.ToString();
            cboBarrios.SelectedValue = oCliente.IdBarrio;
            cboTiposClientes.SelectedValue = oCliente.IdTipoCliente;
            rbtHombre.Checked = oCliente.IdGeneroCliente == 1;
            rbtMujer.Checked = oCliente.IdGeneroCliente == 2;
            chkBaja.Checked = oCliente.FechaBaja != null;
        }

        private async void btnAceptar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text.Trim() == "")
            {
                MessageBox.Show("Debe ingresar un nombre", "Control");
                return;
            }
            if (txtApellido.Text.Trim() == "")
            {
                MessageBox.Show("Debe ingresar un apellido", "Control");
                return;
            }
            if (txtDni.Text.Trim() == "" || !int.TryParse(txtDni.Text, out _))
            {
                MessageBox.Show("Debe ingresar un DNI", "Control");
                return;
            }
            if (txtMail.Text.Trim() == "" && txtTelefono.Text.Trim() == "")
            {
                MessageBox.Show("Debe ingresar un mail o telefono", "Control");
                return;
            }
            if (dtpFecNac.Value > DateTime.Now.AddYears(-15))
            {
                MessageBox.Show("Debe ingresar una fecha de nacimiento valida", "Control");
                return;
            }
            if (!string.IsNullOrWhiteSpace(txtNro.Text) && !int.TryParse(txtNro.Text, out _))
            {
                MessageBox.Show("Debe ingresar un nro. de calle", "Control");
                return;
            }

            if (modo.Equals(Accion.New))
            {
                await SaveCliente();
            }

            if (modo.Equals(Accion.Act))
            {
                await ModificarCliente();
                this.Dispose();
            }
        }

        private async Task SaveCliente()
        {
            CargarClienteFrmCls();

            string url = "https://localhost:7218/api/Cine/Clientes";
            string clienteJson = JsonConvert.SerializeObject(oCliente);
            var bodyJson = await ClienteSgl.GetInstance().PostAsync(url, clienteJson);

            MessageBox.Show(bodyJson);
        }

        private async Task ModificarCliente()
        {
            CargarClienteFrmCls();

            string url = "https://localhost:7218/api/Cine/ActualizarCliente";
            string clienteJson = JsonConvert.SerializeObject(oCliente);
            var bodyJson = await ClienteSgl.GetInstance().PutAsync(url, clienteJson);

            MessageBox.Show(bodyJson);
        }

        private void CargarClienteFrmCls()
        {
            oCliente.Nombre = txtNombre.Text;
            oCliente.Apellido = txtApellido.Text;
            oCliente.Dni = Convert.ToInt32(txtDni.Text);
            oCliente.FechaNac = dtpFecNac.Value;
            oCliente.Telefono = DBNull.Value.ToString();
            if (!(txtTelefono.Text.Trim() == ""))
                oCliente.Telefono = txtTelefono.Text;
            oCliente.Mail = DBNull.Value.ToString();
            if (!(txtMail.Text.Trim() == ""))
                oCliente.Mail = txtMail.Text;
            oCliente.Calle = DBNull.Value.ToString();
            if (!(txtCalle.Text.Trim() == ""))
                oCliente.Calle = txtCalle.Text;
            oCliente.Nro = 0;
            if (!(txtNro.Text.Trim() == ""))
                oCliente.Nro = Convert.ToInt32(txtNro.Text);
            oCliente.IdBarrio = Convert.ToInt32(cboBarrios.SelectedValue);
            oCliente.IdTipoCliente = Convert.ToInt32(cboTiposClientes.SelectedValue);
            oCliente.IdGeneroCliente = rbtHombre.Checked ? 1 : (rbtMujer.Checked ? 2 : 3);
            oCliente.FechaBaja = !chkBaja.Checked ? (DateTime?)null : oCliente.FechaBaja;
        }

        private void lblApellido_Click(object sender, EventArgs e)
        {

        }

        private void gpbFiltros_Enter(object sender, EventArgs e)
        {

        }

        private async void FrmClienteAM_Load(object sender, EventArgs e)
        {
            await CargarBarrrios();
            await CargarTiposClientes();

            if (modo.Equals(Accion.Act))
            {
                await this.ConsultarCliente(oCliente.Id);
            }

            chkBaja.Enabled = oCliente.FechaBaja != null;
        }

        private void lblGenero_Click(object sender, EventArgs e)
        {

        }

        private void lblNombre_Click(object sender, EventArgs e)
        {

        }

        private void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtApellido_TextChanged(object sender, EventArgs e)
        {

        }

        private void cboTiposClientes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cboBarrios_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void txtNro_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtCalle_TextChanged(object sender, EventArgs e)
        {

        }

        private void dtpFecNac_ValueChanged(object sender, EventArgs e)
        {

        }

        private void txtTelefono_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtDni_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtMail_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblTipo_Click(object sender, EventArgs e)
        {

        }

        private void lblBarrio_Click(object sender, EventArgs e)
        {

        }

        private void lblNro_Click(object sender, EventArgs e)
        {

        }

        private void lblCalle_Click(object sender, EventArgs e)
        {

        }

        private void lblFecNac_Click(object sender, EventArgs e)
        {

        }

        private void lblTelefono_Click(object sender, EventArgs e)
        {

        }

        private void lblMail_Click(object sender, EventArgs e)
        {

        }

        private void lblDni_Click(object sender, EventArgs e)
        {

        }

        private void rbtHombre_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private async void btnAceptar_Click_1(object sender, EventArgs e)
        {
            if (txtNombre.Text.Trim() == "")
            {
                MessageBox.Show("Debe ingresar un nombre", "Control");
                return;
            }
            if (txtApellido.Text.Trim() == "")
            {
                MessageBox.Show("Debe ingresar un apellido", "Control");
                return;
            }
            if (txtDni.Text.Trim() == "" || !int.TryParse(txtDni.Text, out _))
            {
                MessageBox.Show("Debe ingresar un DNI", "Control");
                return;
            }
            if (txtMail.Text.Trim() == "" && txtTelefono.Text.Trim() == "")
            {
                MessageBox.Show("Debe ingresar un mail o telefono", "Control");
                return;
            }
            if (dtpFecNac.Value > DateTime.Now.AddYears(-15))
            {
                MessageBox.Show("Debe ingresar una fecha de nacimiento valida", "Control");
                return;
            }
            if (!string.IsNullOrWhiteSpace(txtNro.Text) && !int.TryParse(txtNro.Text, out _))
            {
                MessageBox.Show("Debe ingresar un nro. de calle", "Control");
                return;
            }

            if (modo.Equals(Accion.New))
            {
                await SaveCliente();
            }

            if (modo.Equals(Accion.Act))
            {
                await ModificarCliente();
                this.Dispose();
            }
        }
    }
}
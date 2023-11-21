using CineBack.Datos;
using CineBack.Dominio;
using CineBack.Servicios;
using CineBack.Servicios.Interfaz;
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
    public enum AccionComp
    {
        New,
        Act
    }

    public partial class frmComprobanteAM : Form
    {
        private AccionComp modo;
        private IServicio serv;
        Comprobante oC = new Comprobante();
        List<Butaca> lButacas = new List<Butaca>();
        List<int> lButacasCopia = new List<int>();
        int btcsSeleccionadas = 0;

        public frmComprobanteAM(AccionComp modo, int id)
        {
            InitializeComponent();
            this.modo = modo;
            serv = new FactoryServiceImp().CrearServicio();
            dtpFecha.Enabled = false;
            txtPrecio.Enabled = false;
            txtDescuento.Enabled = false;
            oC.Id = id;

            if (modo.Equals(AccionComp.New))
            {
                this.Text = "Nuevo Comprobante";
            }

            if (modo.Equals(AccionComp.Act))
            {
                this.Text = "Actualizar Comprobante";
                cboClientes.Enabled = false;
            }
        }

        private async void frmComprobanteAM_Load(object sender, EventArgs e)
        {
           
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

        private async Task CargarFunciones()
        {
            string url = "https://localhost:7218/api/Cine/Funciones";
            var bodyJson = await ClienteSgl.GetInstance().GetAsync(url);
            List<Funcion> lFunciones = JsonConvert.DeserializeObject<List<Funcion>>(bodyJson);

            cboFunciones.DataSource = lFunciones;
            cboFunciones.ValueMember = "Id";
            cboFunciones.DisplayMember = "InfoFuncion";
            cboFunciones.AutoCompleteMode = AutoCompleteMode.Suggest;
            cboClientes.AutoCompleteSource = AutoCompleteSource.ListItems;
        }

        private async Task CargarFormasPago()
        {
            string url = "https://localhost:7218/api/Cine/FormasPago";
            var bodyJson = await ClienteSgl.GetInstance().GetAsync(url);
            List<FormaPago> lFormasPago = JsonConvert.DeserializeObject<List<FormaPago>>(bodyJson);

            cboFormasPago.DataSource = lFormasPago;
            cboFormasPago.ValueMember = "Id";
            cboFormasPago.DisplayMember = "Nombre";
            cboFormasPago.AutoCompleteMode = AutoCompleteMode.Suggest;
            cboFormasPago.AutoCompleteSource = AutoCompleteSource.ListItems;
        }

        private async Task CargarComprobante(int id)
        {
            List<Parametro> lFiltros = new List<Parametro>();
            lFiltros.Add(new Parametro("@id_comprobante", id));

            string url = "https://localhost:7218/api/Cine/CargarComprobante";
            string filtrosJson = JsonConvert.SerializeObject(lFiltros);
            var bodyJson = await ClienteSgl.GetInstance().PostAsync(url, filtrosJson);

            oC = JsonConvert.DeserializeObject<Comprobante>(bodyJson);

            dtpFecha.Value = oC.Fecha;
            cboClientes.SelectedValue = oC.Cliente.Id;
            cboFormasPago.SelectedValue = oC.FormaPago.Id;

            foreach (DetalleComprobante oDC in oC.DetsComprobante)
            {
                cboFunciones.SelectedValue = oDC.Butaca.Funcion.Id;
            }
        }

        private async Task CargarButacas()
        {
            Funcion oF = (Funcion)cboFunciones.SelectedItem;
            await CargarButacasBd(oF.Id);
            flpButacas.Controls.Clear();
            CargarButacasFlp();
        }

        private async Task CargarButacasBd(int id)
        {
            List<Parametro> lFiltros = new List<Parametro>();
            lFiltros.Add(new Parametro("@id_funcion", id));

            string url = "https://localhost:7218/api/Cine/CargarButacas";
            string filtrosJson = JsonConvert.SerializeObject(lFiltros);
            var bodyJson = await ClienteSgl.GetInstance().PostAsync(url, filtrosJson);

            lButacas = JsonConvert.DeserializeObject<List<Butaca>>(bodyJson);
        }

        private void CargarButacasFlp()
        {
            foreach (Butaca oBtc in lButacas)
            {
                Button oBtn = new Button();
                oBtn.Width = 30;
                oBtn.Height = 30;
                oBtn.BackColor = Color.Black;
                oBtn.Text = oBtc.Nro.ToString();
                oBtn.Click += Button_Click;
                oBtn.Tag = oBtc;

                switch (oBtc.Estado.Nombre)
                {
                    case "Libre":
                        oBtn.ForeColor = Color.Green;
                        break;
                    case "Ocupada":
                        oBtn.ForeColor = Color.Red;
                        break;
                    case "Reservada":
                        oBtn.ForeColor = Color.Yellow;
                        break;
                    default:
                        oBtn.ForeColor = Color.Black;
                        break;
                }

                if (modo.Equals(AccionComp.Act))
                {
                    lButacasCopia = oC.DetsComprobante.Select(DetalleComprobante => DetalleComprobante.Butaca.Id).ToList();
                }

                if (lButacasCopia.Contains(oBtc.Id))
                {
                    oBtn.BackColor = SystemColors.Control;
                }

                flpButacas.Controls.Add(oBtn);
            }
        }

        private void Button_Click(object sender, EventArgs e)
        {
            Button oBtn = (Button)sender;
            Butaca oBtc = (Butaca)oBtn.Tag;
            DetalleComprobante oDC;

            if (oBtn.ForeColor == Color.Green)
            {
                if (oBtn.BackColor != SystemColors.Control)
                {
                    //oBtn.BackColor = SystemColors.Control; //probar mas colores
                    oBtc.Estado.Nombre = "Ocupada";
                    
                    oBtc.Funcion = (Funcion)cboFunciones.SelectedItem;
                    oDC = new DetalleComprobante(Convert.ToDouble(txtPrecio.Text), oBtc);
                    //si es new agrega todo lo que quiera, si es act un if para que si es igual el count de detalles que de lcopias no agregue
                    if (modo.Equals(AccionComp.New))
                    {
                        oC.AgregarDetalle(oDC);
                        oBtn.BackColor = SystemColors.Control;
                    }

                    if (modo.Equals(AccionComp.Act))
                    {
                        if (oC.DetsComprobante.Count < lButacasCopia.Count)
                        {
                            oC.AgregarDetalle(oDC);
                            oBtn.BackColor = SystemColors.Control;
                        }

                        else
                        {
                            MessageBox.Show("¡Atención Cinéfilo!\n\nHas superado la cantidad de entradas permitidas. Por favor, revisa tu seleccion y ajusta la cantidad de entradas para continuar con tu compra.\n\n¡Gracias por elegirnos y disfruta de la película", "Control");
                            return;
                        }
                    }

                    lButacasCopia.Add(oBtc.Id);
                }

                else
                {
                    oBtn.BackColor = Color.Black;
                    oBtc.Estado.Nombre = "Libre";

                    oDC = new DetalleComprobante(Convert.ToDouble(txtPrecio.Text), oBtc);
                    oC.QuitarDetalle(oDC);

                    lButacasCopia.Remove(oBtc.Id);
                }
            }

            else
                MessageBox.Show("¡Esa butaca esta ocupada o reservada!");
        }

        
    
    

        private async Task SaveComprobante()
        {
            oC.Cliente = (Cliente)cboClientes.SelectedItem;
            oC.FormaPago = (FormaPago)cboFormasPago.SelectedItem;

            string url = "https://localhost:7218/api/Cine/Comprobante";
            string comprobanteJson = JsonConvert.SerializeObject(oC);
            var bodyJson = await ClienteSgl.GetInstance().PostAsync(url, comprobanteJson);

            MessageBox.Show(bodyJson+"hola");
        }

        private async Task ActualizarButaca()
        {
            oC.Cliente = (Cliente)cboClientes.SelectedItem;
            oC.FormaPago = (FormaPago)cboFormasPago.SelectedItem;

            string url = "https://localhost:7218/api/Cine/Butaca";
            string comprobanteJson = JsonConvert.SerializeObject(oC);
            var bodyJson = await ClienteSgl.GetInstance().PutAsync(url, comprobanteJson);

            MessageBox.Show(bodyJson);
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void flpButacas_Paint(object sender, PaintEventArgs e)
        {

        }

        private async void frmComprobanteAM_Load_1(object sender, EventArgs e)
        {
            await CargarClientes();
            await CargarFunciones();
            await CargarFormasPago();

            if (modo.Equals(AccionComp.Act))
            {
                await this.CargarComprobante(oC.Id);
                cboFormasPago.Enabled = false;
                int bandFuncion = 0;
                await CargarButacas();
                btcsSeleccionadas = flpButacas.Controls.OfType<Button>().Count(Button => Button.BackColor == SystemColors.Control);

                foreach (DetalleComprobante oDC in oC.DetsComprobante)
                {
                    if (oDC.Butaca.Funcion.Id != bandFuncion)
                    {
                        dgvDetalles.Rows.Add(new object[] { oDC.Butaca.Funcion.InfoFuncion, btcsSeleccionadas, btcsSeleccionadas * Convert.ToInt32(txtPrecio.Text), cboFormasPago.Text });
                        bandFuncion = oDC.Butaca.Funcion.Id;
                    }

                }
            }
            
        }

        private void lblPago_Click(object sender, EventArgs e)
        {

        }

        private void lblPelicula_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void txtTotal_TextChanged(object sender, EventArgs e)
        {

        }

        private void dgvDetalles_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void txtDescuento_TextChanged(object sender, EventArgs e)
        {

        }

        private void dgvDetalles_CellContentClick_2(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void cboClientes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dgvDetalles_CellContentClick_3(object sender, DataGridViewCellEventArgs e)
        {

            if (dgvDetalles.CurrentCell.ColumnIndex == 4)
            {
                dgvDetalles.Rows.RemoveAt(dgvDetalles.CurrentRow.Index);
            }
        }

        private void groupBox2_Enter_1(object sender, EventArgs e)
        {

        }

        private void btnAgregar_Click_1(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in dgvDetalles.Rows)
            {
                if (row.Cells["colFuncion"].Value.ToString().Equals(cboFunciones.Text))
                {
                    MessageBox.Show("Esta funcion ya esta agregada", "Control");
                    return;
                }
            }

            btcsSeleccionadas = flpButacas.Controls.OfType<Button>().Count(Button => Button.BackColor == SystemColors.Control);

            if (btcsSeleccionadas == 0)
            {
                MessageBox.Show("¡Ups! Parece que olvido ingresar una entrada (^_^)");
                return;
            }

            Funcion oF = (Funcion)cboFunciones.SelectedItem;

            dgvDetalles.Rows.Add(new object[] { oF.InfoFuncion, btcsSeleccionadas, btcsSeleccionadas * Convert.ToInt32(txtPrecio.Text), cboFormasPago.Text });

        }

        private async void btnAceptar_Click_1(object sender, EventArgs e)
        {
            if (dgvDetalles.Rows.Count == 0)
            {
                MessageBox.Show("Y la funcion?", "Control");
                return;
            }

            if (modo.Equals(AccionComp.New))
            {
                await SaveComprobante();

            }

            if (modo.Equals(AccionComp.Act))
            {
                await ActualizarComprobante();
            }

            await ActualizarButaca();

            await CargarButacas();

            oC.DetsComprobante.Clear();
            dgvDetalles.Rows.Clear();
            lButacasCopia.Clear();
        }

        private async void cboFunciones_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            await CargarButacas();
            Funcion oF = (Funcion)cboFunciones.SelectedItem;

            switch (oF.Sala.TipoSala.Nombre)
            {
                case "3D":
                    txtPrecio.Text = 4500.ToString();
                    break;
                case "4DX":
                    txtPrecio.Text = 5100.ToString();
                    break;
                default:
                    txtPrecio.Text = 3600.ToString();
                    break;
            }
        }

        private void cboFormasPago_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void txtSubTotal_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

using CineFront1;
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
    public partial class frmPrincipal : Form
    {
        public frmPrincipal()
        {
            InitializeComponent();
        }

        private void nuevoClienteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmClienteAM frm = new FrmClienteAM(Accion.New, 0);
            frm.ShowDialog();
        }

        

        private void nuevoComprobanteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmComprobanteAM frm = new frmComprobanteAM(AccionComp.New, 0);
            frm.ShowDialog();
        }

        private void cerrarProgramaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void cerrarSesionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmLogin sesion = new frmLogin();
            sesion.Show();
            this.Close(); 
        }

        private void soporteToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void frmPrincipal_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox7_Click(object sender, EventArgs e)
        {

        }

        private void clienteToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void sesionToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void flowLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void nuevoClienteToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            FrmClienteAM frm = new FrmClienteAM(Accion.New, 0);
            frm.ShowDialog();

        }

        private void consultarClientesToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmConsultarClientes frm = new frmConsultarClientes();
            frm.ShowDialog();
        }

        private void nuevoComprobanteToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            frmComprobanteAM frm = new frmComprobanteAM(AccionComp.New, 0);
            frm.ShowDialog();
        }

        private void consultarComprobantesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmConsultarComprobantes frm = new frmConsultarComprobantes();
            frm.ShowDialog(); 
        }
    }
}

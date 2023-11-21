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
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        int intentos = 0; 
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void Login_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnAcceder_Click(object sender, EventArgs e)
        {
            string usuario, contraseña;
            usuario = txtUsuario.Text;
            contraseña = txtContraseña.Text;

            if (usuario == "usuario" && contraseña == "contraseña")
            {
                frmPrincipal Principal = new frmPrincipal();
                Principal.Show();
                this.Hide();
            }
            else if (usuario == String.Empty || contraseña == String.Empty)
            {
                MessageBox.Show("Debe ingresar un usuario y contraseña", "ATENCION", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else 
            {
                DialogResult respuesta = MessageBox.Show("Datos ingresados incorrectos", "ATENCION",
                MessageBoxButtons.RetryCancel, MessageBoxIcon.Error);
                if (respuesta == DialogResult.Cancel)
                {
                    Application.Exit(); 
                }
                if (respuesta == DialogResult.Retry)
                {
                    intentos++;
                    txtUsuario.Clear();
                    txtContraseña.Clear();
                    if (intentos == 3)
                        MessageBox.Show("Maximo de intentos alcanzado");
                        Application.Exit();
                }


            }
            
            

           
        }
    }
}

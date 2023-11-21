namespace CineFront
{
    partial class FrmClienteAM
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmClienteAM));
            this.gpbFiltros = new System.Windows.Forms.GroupBox();
            this.chkBaja = new System.Windows.Forms.CheckBox();
            this.txtApellido = new System.Windows.Forms.TextBox();
            this.lblApellido = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.cboTiposClientes = new System.Windows.Forms.ComboBox();
            this.rbtMujer = new System.Windows.Forms.RadioButton();
            this.rbtHombre = new System.Windows.Forms.RadioButton();
            this.cboBarrios = new System.Windows.Forms.ComboBox();
            this.txtNro = new System.Windows.Forms.TextBox();
            this.txtCalle = new System.Windows.Forms.TextBox();
            this.dtpFecNac = new System.Windows.Forms.DateTimePicker();
            this.txtTelefono = new System.Windows.Forms.TextBox();
            this.txtDni = new System.Windows.Forms.TextBox();
            this.txtMail = new System.Windows.Forms.TextBox();
            this.lblTipo = new System.Windows.Forms.Label();
            this.lblGenero = new System.Windows.Forms.Label();
            this.lblBarrio = new System.Windows.Forms.Label();
            this.lblNro = new System.Windows.Forms.Label();
            this.lblCalle = new System.Windows.Forms.Label();
            this.lblFecNac = new System.Windows.Forms.Label();
            this.lblTelefono = new System.Windows.Forms.Label();
            this.lblMail = new System.Windows.Forms.Label();
            this.lblDni = new System.Windows.Forms.Label();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnAceptar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.gpbFiltros.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // gpbFiltros
            // 
            this.gpbFiltros.Controls.Add(this.chkBaja);
            this.gpbFiltros.Controls.Add(this.txtApellido);
            this.gpbFiltros.Controls.Add(this.lblApellido);
            this.gpbFiltros.Controls.Add(this.txtNombre);
            this.gpbFiltros.Controls.Add(this.lblNombre);
            this.gpbFiltros.Controls.Add(this.cboTiposClientes);
            this.gpbFiltros.Controls.Add(this.rbtMujer);
            this.gpbFiltros.Controls.Add(this.rbtHombre);
            this.gpbFiltros.Controls.Add(this.cboBarrios);
            this.gpbFiltros.Controls.Add(this.txtNro);
            this.gpbFiltros.Controls.Add(this.txtCalle);
            this.gpbFiltros.Controls.Add(this.dtpFecNac);
            this.gpbFiltros.Controls.Add(this.txtTelefono);
            this.gpbFiltros.Controls.Add(this.txtDni);
            this.gpbFiltros.Controls.Add(this.txtMail);
            this.gpbFiltros.Controls.Add(this.lblTipo);
            this.gpbFiltros.Controls.Add(this.lblGenero);
            this.gpbFiltros.Controls.Add(this.lblBarrio);
            this.gpbFiltros.Controls.Add(this.lblNro);
            this.gpbFiltros.Controls.Add(this.lblCalle);
            this.gpbFiltros.Controls.Add(this.lblFecNac);
            this.gpbFiltros.Controls.Add(this.lblTelefono);
            this.gpbFiltros.Controls.Add(this.lblMail);
            this.gpbFiltros.Controls.Add(this.lblDni);
            this.gpbFiltros.Location = new System.Drawing.Point(12, 69);
            this.gpbFiltros.Name = "gpbFiltros";
            this.gpbFiltros.Size = new System.Drawing.Size(356, 404);
            this.gpbFiltros.TabIndex = 5;
            this.gpbFiltros.TabStop = false;
            this.gpbFiltros.Enter += new System.EventHandler(this.gpbFiltros_Enter);
            // 
            // chkBaja
            // 
            this.chkBaja.AutoSize = true;
            this.chkBaja.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.chkBaja.Font = new System.Drawing.Font("Century Gothic", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.chkBaja.Location = new System.Drawing.Point(41, 353);
            this.chkBaja.Name = "chkBaja";
            this.chkBaja.Size = new System.Drawing.Size(121, 21);
            this.chkBaja.TabIndex = 12;
            this.chkBaja.Text = "Estado de Baja: ";
            this.chkBaja.UseVisualStyleBackColor = true;
            // 
            // txtApellido
            // 
            this.txtApellido.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.txtApellido.Location = new System.Drawing.Point(134, 51);
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(131, 24);
            this.txtApellido.TabIndex = 1;
            this.txtApellido.TextChanged += new System.EventHandler(this.txtApellido_TextChanged);
            // 
            // lblApellido
            // 
            this.lblApellido.AutoSize = true;
            this.lblApellido.BackColor = System.Drawing.Color.Transparent;
            this.lblApellido.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblApellido.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblApellido.Location = new System.Drawing.Point(61, 52);
            this.lblApellido.Name = "lblApellido";
            this.lblApellido.Size = new System.Drawing.Size(65, 17);
            this.lblApellido.TabIndex = 3;
            this.lblApellido.Text = "Apellido:";
            this.lblApellido.Click += new System.EventHandler(this.lblApellido_Click);
            // 
            // txtNombre
            // 
            this.txtNombre.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.txtNombre.Location = new System.Drawing.Point(135, 20);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(131, 24);
            this.txtNombre.TabIndex = 0;
            this.txtNombre.TextChanged += new System.EventHandler(this.txtNombre_TextChanged);
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.BackColor = System.Drawing.Color.Transparent;
            this.lblNombre.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblNombre.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblNombre.Location = new System.Drawing.Point(63, 20);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(65, 17);
            this.lblNombre.TabIndex = 2;
            this.lblNombre.Text = "Nombre:";
            this.lblNombre.Click += new System.EventHandler(this.lblNombre_Click);
            // 
            // cboTiposClientes
            // 
            this.cboTiposClientes.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.cboTiposClientes.FormattingEnabled = true;
            this.cboTiposClientes.Location = new System.Drawing.Point(132, 300);
            this.cboTiposClientes.Name = "cboTiposClientes";
            this.cboTiposClientes.Size = new System.Drawing.Size(131, 24);
            this.cboTiposClientes.TabIndex = 9;
            this.cboTiposClientes.SelectedIndexChanged += new System.EventHandler(this.cboTiposClientes_SelectedIndexChanged);
            // 
            // rbtMujer
            // 
            this.rbtMujer.AutoSize = true;
            this.rbtMujer.Font = new System.Drawing.Font("Century Gothic", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.rbtMujer.Location = new System.Drawing.Point(209, 326);
            this.rbtMujer.Name = "rbtMujer";
            this.rbtMujer.Size = new System.Drawing.Size(59, 21);
            this.rbtMujer.TabIndex = 11;
            this.rbtMujer.TabStop = true;
            this.rbtMujer.Text = "Mujer";
            this.rbtMujer.UseVisualStyleBackColor = true;
            // 
            // rbtHombre
            // 
            this.rbtHombre.AutoSize = true;
            this.rbtHombre.Font = new System.Drawing.Font("Century Gothic", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.rbtHombre.Location = new System.Drawing.Point(134, 326);
            this.rbtHombre.Name = "rbtHombre";
            this.rbtHombre.Size = new System.Drawing.Size(73, 21);
            this.rbtHombre.TabIndex = 10;
            this.rbtHombre.TabStop = true;
            this.rbtHombre.Text = "Hombre";
            this.rbtHombre.UseVisualStyleBackColor = true;
            this.rbtHombre.CheckedChanged += new System.EventHandler(this.rbtHombre_CheckedChanged);
            // 
            // cboBarrios
            // 
            this.cboBarrios.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.cboBarrios.FormattingEnabled = true;
            this.cboBarrios.Location = new System.Drawing.Point(134, 269);
            this.cboBarrios.Name = "cboBarrios";
            this.cboBarrios.Size = new System.Drawing.Size(131, 24);
            this.cboBarrios.TabIndex = 8;
            this.cboBarrios.SelectedIndexChanged += new System.EventHandler(this.cboBarrios_SelectedIndexChanged);
            // 
            // txtNro
            // 
            this.txtNro.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.txtNro.Location = new System.Drawing.Point(134, 238);
            this.txtNro.Name = "txtNro";
            this.txtNro.Size = new System.Drawing.Size(131, 24);
            this.txtNro.TabIndex = 7;
            this.txtNro.TextChanged += new System.EventHandler(this.txtNro_TextChanged);
            // 
            // txtCalle
            // 
            this.txtCalle.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.txtCalle.Location = new System.Drawing.Point(134, 207);
            this.txtCalle.Name = "txtCalle";
            this.txtCalle.Size = new System.Drawing.Size(131, 24);
            this.txtCalle.TabIndex = 6;
            this.txtCalle.TextChanged += new System.EventHandler(this.txtCalle_TextChanged);
            // 
            // dtpFecNac
            // 
            this.dtpFecNac.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFecNac.Location = new System.Drawing.Point(152, 114);
            this.dtpFecNac.Name = "dtpFecNac";
            this.dtpFecNac.Size = new System.Drawing.Size(131, 24);
            this.dtpFecNac.TabIndex = 3;
            this.dtpFecNac.ValueChanged += new System.EventHandler(this.dtpFecNac_ValueChanged);
            // 
            // txtTelefono
            // 
            this.txtTelefono.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.txtTelefono.Location = new System.Drawing.Point(135, 145);
            this.txtTelefono.Name = "txtTelefono";
            this.txtTelefono.Size = new System.Drawing.Size(131, 24);
            this.txtTelefono.TabIndex = 4;
            this.txtTelefono.TextChanged += new System.EventHandler(this.txtTelefono_TextChanged);
            // 
            // txtDni
            // 
            this.txtDni.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.txtDni.Location = new System.Drawing.Point(135, 82);
            this.txtDni.Name = "txtDni";
            this.txtDni.Size = new System.Drawing.Size(131, 24);
            this.txtDni.TabIndex = 2;
            this.txtDni.TextChanged += new System.EventHandler(this.txtDni_TextChanged);
            // 
            // txtMail
            // 
            this.txtMail.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.txtMail.Location = new System.Drawing.Point(135, 175);
            this.txtMail.Name = "txtMail";
            this.txtMail.Size = new System.Drawing.Size(131, 24);
            this.txtMail.TabIndex = 5;
            this.txtMail.TextChanged += new System.EventHandler(this.txtMail_TextChanged);
            // 
            // lblTipo
            // 
            this.lblTipo.AutoSize = true;
            this.lblTipo.BackColor = System.Drawing.Color.Transparent;
            this.lblTipo.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblTipo.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblTipo.Location = new System.Drawing.Point(89, 302);
            this.lblTipo.Name = "lblTipo";
            this.lblTipo.Size = new System.Drawing.Size(38, 17);
            this.lblTipo.TabIndex = 12;
            this.lblTipo.Text = "Tipo:";
            this.lblTipo.Click += new System.EventHandler(this.lblTipo_Click);
            // 
            // lblGenero
            // 
            this.lblGenero.AutoSize = true;
            this.lblGenero.BackColor = System.Drawing.Color.Transparent;
            this.lblGenero.Font = new System.Drawing.Font("Century Gothic", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblGenero.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblGenero.Location = new System.Drawing.Point(73, 327);
            this.lblGenero.Name = "lblGenero";
            this.lblGenero.Size = new System.Drawing.Size(56, 17);
            this.lblGenero.TabIndex = 11;
            this.lblGenero.Text = "Genero:";
            this.lblGenero.Click += new System.EventHandler(this.lblGenero_Click);
            // 
            // lblBarrio
            // 
            this.lblBarrio.AutoSize = true;
            this.lblBarrio.BackColor = System.Drawing.Color.Transparent;
            this.lblBarrio.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblBarrio.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblBarrio.Location = new System.Drawing.Point(81, 271);
            this.lblBarrio.Name = "lblBarrio";
            this.lblBarrio.Size = new System.Drawing.Size(48, 17);
            this.lblBarrio.TabIndex = 10;
            this.lblBarrio.Text = "Barrio:";
            this.lblBarrio.Click += new System.EventHandler(this.lblBarrio_Click);
            // 
            // lblNro
            // 
            this.lblNro.AutoSize = true;
            this.lblNro.BackColor = System.Drawing.Color.Transparent;
            this.lblNro.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblNro.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblNro.Location = new System.Drawing.Point(92, 240);
            this.lblNro.Name = "lblNro";
            this.lblNro.Size = new System.Drawing.Size(35, 17);
            this.lblNro.TabIndex = 9;
            this.lblNro.Text = "Nro:";
            this.lblNro.Click += new System.EventHandler(this.lblNro_Click);
            // 
            // lblCalle
            // 
            this.lblCalle.AutoSize = true;
            this.lblCalle.BackColor = System.Drawing.Color.Transparent;
            this.lblCalle.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblCalle.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblCalle.Location = new System.Drawing.Point(86, 209);
            this.lblCalle.Name = "lblCalle";
            this.lblCalle.Size = new System.Drawing.Size(46, 17);
            this.lblCalle.TabIndex = 8;
            this.lblCalle.Text = "Calle:";
            this.lblCalle.Click += new System.EventHandler(this.lblCalle_Click);
            // 
            // lblFecNac
            // 
            this.lblFecNac.AutoSize = true;
            this.lblFecNac.BackColor = System.Drawing.Color.Transparent;
            this.lblFecNac.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblFecNac.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblFecNac.Location = new System.Drawing.Point(-6, 113);
            this.lblFecNac.Name = "lblFecNac";
            this.lblFecNac.Size = new System.Drawing.Size(152, 17);
            this.lblFecNac.TabIndex = 7;
            this.lblFecNac.Text = "Fecha de Nacimiento:";
            this.lblFecNac.Click += new System.EventHandler(this.lblFecNac_Click);
            // 
            // lblTelefono
            // 
            this.lblTelefono.AutoSize = true;
            this.lblTelefono.BackColor = System.Drawing.Color.Transparent;
            this.lblTelefono.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblTelefono.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblTelefono.Location = new System.Drawing.Point(67, 147);
            this.lblTelefono.Name = "lblTelefono";
            this.lblTelefono.Size = new System.Drawing.Size(66, 17);
            this.lblTelefono.TabIndex = 6;
            this.lblTelefono.Text = "Telefono:";
            this.lblTelefono.Click += new System.EventHandler(this.lblTelefono_Click);
            // 
            // lblMail
            // 
            this.lblMail.AutoSize = true;
            this.lblMail.BackColor = System.Drawing.Color.Transparent;
            this.lblMail.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblMail.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblMail.Location = new System.Drawing.Point(89, 179);
            this.lblMail.Name = "lblMail";
            this.lblMail.Size = new System.Drawing.Size(38, 17);
            this.lblMail.TabIndex = 5;
            this.lblMail.Text = "Mail:";
            this.lblMail.Click += new System.EventHandler(this.lblMail_Click);
            // 
            // lblDni
            // 
            this.lblDni.AutoSize = true;
            this.lblDni.BackColor = System.Drawing.Color.Transparent;
            this.lblDni.Font = new System.Drawing.Font("Century Gothic", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblDni.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblDni.Location = new System.Drawing.Point(92, 87);
            this.lblDni.Name = "lblDni";
            this.lblDni.Size = new System.Drawing.Size(35, 17);
            this.lblDni.TabIndex = 4;
            this.lblDni.Text = "DNI:";
            this.lblDni.Click += new System.EventHandler(this.lblDni_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCancelar.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnCancelar.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnCancelar.Location = new System.Drawing.Point(141, 481);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(127, 34);
            this.btnCancelar.TabIndex = 14;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = false;
            // 
            // btnAceptar
            // 
            this.btnAceptar.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnAceptar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAceptar.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnAceptar.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnAceptar.Location = new System.Drawing.Point(12, 481);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(123, 34);
            this.btnAceptar.TabIndex = 13;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = false;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click_1);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.GrayText;
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label1.Font = new System.Drawing.Font("Impact", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.ForeColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.label1.Location = new System.Drawing.Point(73, 20);
            this.label1.Margin = new System.Windows.Forms.Padding(3, 11, 3, 11);
            this.label1.MaximumSize = new System.Drawing.Size(600, 43);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(158, 41);
            this.label1.TabIndex = 6;
            this.label1.Text = "REGISTRAR";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.BackgroundImage")));
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Location = new System.Drawing.Point(318, 20);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(362, 481);
            this.pictureBox1.TabIndex = 15;
            this.pictureBox1.TabStop = false;
            // 
            // FrmClienteAM
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(692, 528);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.gpbFiltros);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.btnCancelar);
            this.Name = "FrmClienteAM";
            this.Text = "Nuevo Cliente";
            this.Load += new System.EventHandler(this.FrmClienteAM_Load);
            this.gpbFiltros.ResumeLayout(false);
            this.gpbFiltros.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private GroupBox gpbFiltros;
        private RadioButton rbtMujer;
        private RadioButton rbtHombre;
        private ComboBox cboBarrios;
        private TextBox txtNro;
        private TextBox txtCalle;
        private DateTimePicker dtpFecNac;
        private TextBox txtTelefono;
        private TextBox txtDni;
        private TextBox txtMail;
        private TextBox txtApellido;
        private TextBox txtNombre;
        private Label lblTipo;
        private Label lblGenero;
        private Label lblBarrio;
        private Label lblNro;
        private Label lblCalle;
        private Label lblFecNac;
        private Label lblTelefono;
        private Label lblMail;
        private Label lblDni;
        private Label lblNombre;
        private Label lblApellido;
        private ComboBox cboTiposClientes;
        private Button btnAceptar;
        private Button btnCancelar;
        private CheckBox chkBaja;
        private Label label1;
        private PictureBox pictureBox1;
    }
}
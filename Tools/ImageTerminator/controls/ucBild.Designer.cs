namespace ImageTerminator
{
    partial class ucBild
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.but_DelCarPic = new System.Windows.Forms.Button();
            this.btn_LoadCarPic = new System.Windows.Forms.Button();
            this.picture = new System.Windows.Forms.PictureBox();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.bindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dset)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picture)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // but_DelCarPic
            // 
            this.but_DelCarPic.Location = new System.Drawing.Point(96, 3);
            this.but_DelCarPic.Name = "but_DelCarPic";
            this.but_DelCarPic.Size = new System.Drawing.Size(89, 23);
            this.but_DelCarPic.TabIndex = 6;
            this.but_DelCarPic.Text = "&Delete";
            this.but_DelCarPic.UseVisualStyleBackColor = true;
            this.but_DelCarPic.Click += new System.EventHandler(this.but_DelCarPic_Click);
            // 
            // btn_LoadCarPic
            // 
            this.btn_LoadCarPic.Location = new System.Drawing.Point(4, 3);
            this.btn_LoadCarPic.Name = "btn_LoadCarPic";
            this.btn_LoadCarPic.Size = new System.Drawing.Size(89, 23);
            this.btn_LoadCarPic.TabIndex = 5;
            this.btn_LoadCarPic.Text = "&Load";
            this.btn_LoadCarPic.UseVisualStyleBackColor = true;
            this.btn_LoadCarPic.Click += new System.EventHandler(this.btn_LoadCarPic_Click);
            // 
            // picture
            // 
            this.picture.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.picture.Location = new System.Drawing.Point(0, 29);
            this.picture.Name = "picture";
            this.picture.Size = new System.Drawing.Size(185, 152);
            this.picture.TabIndex = 4;
            this.picture.TabStop = false;
            // 
            // openFileDialog
            // 
            this.openFileDialog.Filter = "Images (*.jpg)|*.jpg";
            // 
            // bindingSource
            // 
            this.bindingSource.DataMember = "Bild";
            this.bindingSource.DataSource = this.dset;
            // 
            // ucBild
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Controls.Add(this.but_DelCarPic);
            this.Controls.Add(this.btn_LoadCarPic);
            this.Controls.Add(this.picture);
            this.Name = "ucBild";
            this.Size = new System.Drawing.Size(185, 181);
            this.Load += new System.EventHandler(this.ucBild_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dset)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picture)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button but_DelCarPic;
        private System.Windows.Forms.Button btn_LoadCarPic;
        private System.Windows.Forms.PictureBox picture;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.BindingSource bindingSource;
    }
}

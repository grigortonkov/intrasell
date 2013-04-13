using System.Data;
namespace ImageTerminator
{
    partial class ucDSControl
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
            this.dset = new BildDataSet();
            ((System.ComponentModel.ISupportInitialize)(this.dset)).BeginInit();
            this.SuspendLayout();
            // 
            // dset
            // 
            this.dset.DataSetName = "BildDataSet";
            this.dset.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // ucDSControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Name = "ucDSControl";
            ((System.ComponentModel.ISupportInitialize)(this.dset)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        public BildDataSet dset;

    }
}

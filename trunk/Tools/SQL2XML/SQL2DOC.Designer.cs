namespace GriTon.SQL2XML
{
    partial class SQL2DOC
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SQL2DOC));
            this.sql2XML = new GriTon.SQL2XML.Sql2XMLDataSet();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.webBrowser1 = new System.Windows.Forms.WebBrowser();
            this.label3 = new System.Windows.Forms.Label();
            this.listBoxReportFiles = new System.Windows.Forms.ListBox();
            this.btnFillTemplate = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.listBoxSQL2XMLFiles = new System.Windows.Forms.ListBox();
            this.btnExecute = new System.Windows.Forms.Button();
            this.dgParameters = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.txtResult = new System.Windows.Forms.TextBox();
            this.chkWordVisible = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.sql2XML)).BeginInit();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgParameters)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // sql2XML
            // 
            this.sql2XML.DataSetName = "Sql2XMLDataSet";
            this.sql2XML.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(698, 535);
            this.tabControl1.TabIndex = 9;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.chkWordVisible);
            this.tabPage1.Controls.Add(this.webBrowser1);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.listBoxReportFiles);
            this.tabPage1.Controls.Add(this.btnFillTemplate);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Controls.Add(this.listBoxSQL2XMLFiles);
            this.tabPage1.Controls.Add(this.btnExecute);
            this.tabPage1.Controls.Add(this.dgParameters);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(690, 509);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "XML->DOC";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // webBrowser1
            // 
            this.webBrowser1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.webBrowser1.Location = new System.Drawing.Point(0, 187);
            this.webBrowser1.MinimumSize = new System.Drawing.Size(20, 20);
            this.webBrowser1.Name = "webBrowser1";
            this.webBrowser1.Size = new System.Drawing.Size(690, 322);
            this.webBrowser1.TabIndex = 17;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(434, 5);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 13);
            this.label3.TabIndex = 16;
            this.label3.Text = "Template:";
            // 
            // listBoxReportFiles
            // 
            this.listBoxReportFiles.DataSource = this.sql2XML;
            this.listBoxReportFiles.DisplayMember = "TemplateFile.Name";
            this.listBoxReportFiles.FormattingEnabled = true;
            this.listBoxReportFiles.Location = new System.Drawing.Point(437, 21);
            this.listBoxReportFiles.Name = "listBoxReportFiles";
            this.listBoxReportFiles.Size = new System.Drawing.Size(160, 160);
            this.listBoxReportFiles.TabIndex = 15;
            this.listBoxReportFiles.ValueMember = "TemplateFile.Filename";
            this.listBoxReportFiles.SelectedIndexChanged += new System.EventHandler(this.listBoxReportFiles_SelectedIndexChanged);
            // 
            // btnFillTemplate
            // 
            this.btnFillTemplate.Enabled = false;
            this.btnFillTemplate.Location = new System.Drawing.Point(603, 62);
            this.btnFillTemplate.Name = "btnFillTemplate";
            this.btnFillTemplate.Size = new System.Drawing.Size(79, 35);
            this.btnFillTemplate.TabIndex = 14;
            this.btnFillTemplate.Text = "XML->DOC";
            this.btnFillTemplate.UseVisualStyleBackColor = true;
            this.btnFillTemplate.Click += new System.EventHandler(this.btnFillTemplate_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(168, 5);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(58, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "Parameter:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 5);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "Datenquelle:";
            // 
            // listBoxSQL2XMLFiles
            // 
            this.listBoxSQL2XMLFiles.DataSource = this.sql2XML;
            this.listBoxSQL2XMLFiles.DisplayMember = "Sql2XMLFile.Name";
            this.listBoxSQL2XMLFiles.FormattingEnabled = true;
            this.listBoxSQL2XMLFiles.Location = new System.Drawing.Point(6, 21);
            this.listBoxSQL2XMLFiles.Name = "listBoxSQL2XMLFiles";
            this.listBoxSQL2XMLFiles.Size = new System.Drawing.Size(160, 160);
            this.listBoxSQL2XMLFiles.TabIndex = 11;
            this.listBoxSQL2XMLFiles.ValueMember = "Sql2XMLFile.Filename";
            this.listBoxSQL2XMLFiles.SelectedIndexChanged += new System.EventHandler(this.listBoxSQL2XMLFiles_SelectedIndexChanged);
            // 
            // btnExecute
            // 
            this.btnExecute.Enabled = false;
            this.btnExecute.Location = new System.Drawing.Point(603, 21);
            this.btnExecute.Name = "btnExecute";
            this.btnExecute.Size = new System.Drawing.Size(79, 35);
            this.btnExecute.TabIndex = 10;
            this.btnExecute.Text = "SQL->XML";
            this.btnExecute.UseVisualStyleBackColor = true;
            this.btnExecute.Click += new System.EventHandler(this.btnExecute_Click);
            // 
            // dgParameters
            // 
            this.dgParameters.AllowUserToAddRows = false;
            this.dgParameters.AllowUserToDeleteRows = false;
            this.dgParameters.AutoGenerateColumns = false;
            this.dgParameters.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgParameters.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn3,
            this.dataGridViewTextBoxColumn2});
            this.dgParameters.DataMember = "ReportParameter";
            this.dgParameters.DataSource = this.sql2XML;
            this.dgParameters.Location = new System.Drawing.Point(171, 21);
            this.dgParameters.Name = "dgParameters";
            this.dgParameters.Size = new System.Drawing.Size(260, 160);
            this.dgParameters.TabIndex = 9;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.DataPropertyName = "Name";
            this.dataGridViewTextBoxColumn1.HeaderText = "Parameter";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            this.dataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.DataPropertyName = "Default";
            this.dataGridViewTextBoxColumn3.HeaderText = "Wert";
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.DataPropertyName = "Type";
            this.dataGridViewTextBoxColumn2.HeaderText = "Typ";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            this.dataGridViewTextBoxColumn2.Visible = false;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.txtResult);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(690, 509);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Log";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // txtResult
            // 
            this.txtResult.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtResult.Location = new System.Drawing.Point(3, 3);
            this.txtResult.Multiline = true;
            this.txtResult.Name = "txtResult";
            this.txtResult.Size = new System.Drawing.Size(684, 503);
            this.txtResult.TabIndex = 1;
            this.txtResult.Visible = false;
            // 
            // chkWordVisible
            // 
            this.chkWordVisible.AutoSize = true;
            this.chkWordVisible.Checked = true;
            this.chkWordVisible.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkWordVisible.Location = new System.Drawing.Point(604, 104);
            this.chkWordVisible.Name = "chkWordVisible";
            this.chkWordVisible.Size = new System.Drawing.Size(93, 17);
            this.chkWordVisible.TabIndex = 18;
            this.chkWordVisible.Text = "show ms word";
            this.chkWordVisible.UseVisualStyleBackColor = true;
            this.chkWordVisible.Visible = false;
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(698, 535);
            this.Controls.Add(this.tabControl1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Main";
            this.Text = "SQL->XML->DOC";
            this.Load += new System.EventHandler(this.Main_Load);
            ((System.ComponentModel.ISupportInitialize)(this.sql2XML)).EndInit();
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgParameters)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn typeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn defaultDataGridViewTextBoxColumn;
        private Sql2XMLDataSet sql2XML;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ListBox listBoxReportFiles;
        private System.Windows.Forms.Button btnFillTemplate;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox listBoxSQL2XMLFiles;
        private System.Windows.Forms.Button btnExecute;
        private System.Windows.Forms.DataGridView dgParameters;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TextBox txtResult;
        private System.Windows.Forms.WebBrowser webBrowser1;
        private System.Windows.Forms.CheckBox chkWordVisible;
    }
}
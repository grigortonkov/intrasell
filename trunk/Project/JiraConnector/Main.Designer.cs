namespace JiraConnector
{
    partial class Main
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
            this.btnLoad2 = new System.Windows.Forms.Button();
            this.txtURL = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtURL2 = new System.Windows.Forms.TextBox();
            this.txtUsername = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtURL3 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtResult = new System.Windows.Forms.TextBox();
            this.btnLoad3 = new System.Windows.Forms.Button();
            this.btnLoad1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnLoad2
            // 
            this.btnLoad2.Location = new System.Drawing.Point(621, 41);
            this.btnLoad2.Name = "btnLoad2";
            this.btnLoad2.Size = new System.Drawing.Size(75, 23);
            this.btnLoad2.TabIndex = 0;
            this.btnLoad2.Text = "Load Issues";
            this.btnLoad2.UseVisualStyleBackColor = true;
            this.btnLoad2.Click += new System.EventHandler(this.btnLoad_Click);
            // 
            // txtURL
            // 
            this.txtURL.Location = new System.Drawing.Point(82, 18);
            this.txtURL.Name = "txtURL";
            this.txtURL.Size = new System.Drawing.Size(533, 20);
            this.txtURL.TabIndex = 1;
            this.txtURL.Text = "https://jira.keba.com/issues/?filter=11188";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(23, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "JIRA Link";
            // 
            // txtURL2
            // 
            this.txtURL2.Location = new System.Drawing.Point(82, 44);
            this.txtURL2.Name = "txtURL2";
            this.txtURL2.Size = new System.Drawing.Size(533, 20);
            this.txtURL2.TabIndex = 3;
            this.txtURL2.Text = "https://jira.keba.com/sr/jira.issueviews:searchrequest-xml/11188/SearchRequest-11" +
    "188.xml?tempMax=1000";
            // 
            // txtUsername
            // 
            this.txtUsername.Location = new System.Drawing.Point(82, 96);
            this.txtUsername.Name = "txtUsername";
            this.txtUsername.Size = new System.Drawing.Size(100, 20);
            this.txtUsername.TabIndex = 4;
            this.txtUsername.Text = "tonk";
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(188, 96);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(100, 20);
            this.txtPassword.TabIndex = 5;
            this.txtPassword.Text = "Tatko123123";
            // 
            // txtURL3
            // 
            this.txtURL3.Location = new System.Drawing.Point(82, 70);
            this.txtURL3.Name = "txtURL3";
            this.txtURL3.Size = new System.Drawing.Size(533, 20);
            this.txtURL3.TabIndex = 6;
            this.txtURL3.Text = "https://jira.keba.com/rest/api/2/search?jql=assignee=tonk";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(23, 73);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "JIRA API";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(23, 47);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(55, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "JIRA XML";
            // 
            // txtResult
            // 
            this.txtResult.Location = new System.Drawing.Point(87, 146);
            this.txtResult.Multiline = true;
            this.txtResult.Name = "txtResult";
            this.txtResult.Size = new System.Drawing.Size(527, 442);
            this.txtResult.TabIndex = 9;
            // 
            // btnLoad3
            // 
            this.btnLoad3.Location = new System.Drawing.Point(621, 68);
            this.btnLoad3.Name = "btnLoad3";
            this.btnLoad3.Size = new System.Drawing.Size(75, 23);
            this.btnLoad3.TabIndex = 10;
            this.btnLoad3.Text = "Load Issues";
            this.btnLoad3.UseVisualStyleBackColor = true;
            this.btnLoad3.Click += new System.EventHandler(this.btnLoad3_Click);
            // 
            // btnLoad1
            // 
            this.btnLoad1.Location = new System.Drawing.Point(621, 16);
            this.btnLoad1.Name = "btnLoad1";
            this.btnLoad1.Size = new System.Drawing.Size(75, 23);
            this.btnLoad1.TabIndex = 11;
            this.btnLoad1.Text = "Load Issues";
            this.btnLoad1.UseVisualStyleBackColor = true;
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(761, 602);
            this.Controls.Add(this.btnLoad1);
            this.Controls.Add(this.btnLoad3);
            this.Controls.Add(this.txtResult);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtURL3);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.txtUsername);
            this.Controls.Add(this.txtURL2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtURL);
            this.Controls.Add(this.btnLoad2);
            this.Name = "Main";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnLoad2;
        private System.Windows.Forms.TextBox txtURL;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtURL2;
        private System.Windows.Forms.TextBox txtUsername;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtURL3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtResult;
        private System.Windows.Forms.Button btnLoad3;
        private System.Windows.Forms.Button btnLoad1;
    }
}


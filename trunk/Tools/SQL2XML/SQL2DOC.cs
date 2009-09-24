using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Xml;

namespace GriTon.SQL2XML
{
    public partial class SQL2DOC : Form
    {
        #region Programm 
        public SQL2DOC()
        {
            InitializeComponent();
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Main_Load(object sender, EventArgs e)
        {
            //load all XML Files in the List 

            string[] files = Directory.GetFiles(Application.StartupPath + "\\DataSource", "*.xml");
            for (int i = 0; i < files.Length; i++)
            {
                Sql2XMLDataSet.Sql2XMLFileRow fr = (Sql2XMLDataSet.Sql2XMLFileRow)
                    sql2XML.Sql2XMLFile.NewSql2XMLFileRow();

                fr.Filename = files[i];

                fr.Name = files[i].Split('\\')[files[i].Split('\\').Length - 1];
                sql2XML.Sql2XMLFile.AddSql2XMLFileRow(fr);
            }



            //load all DOT Files in the List 

            string[] filesDot = Directory.GetFiles(Application.StartupPath + "\\Templates", "*.dot");
            for (int i = 0; i < filesDot.Length; i++)
            {
                Sql2XMLDataSet.TemplateFileRow fr = (Sql2XMLDataSet.TemplateFileRow)
                    sql2XML.TemplateFile.NewTemplateFileRow();

                fr.Filename = filesDot[i];

                fr.Name = filesDot[i].Split('\\')[filesDot[i].Split('\\').Length - 1];
                sql2XML.TemplateFile.AddTemplateFileRow(fr);

            }


        }

        void showError(Exception error)
        {
            txtResult.Visible = true;
            txtResult.Text = error.ToString();
            tabControl1.TabPages[1].Select();
        }

        /// <summary>
        /// Example how to convert XML data sources
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnExecute_Click(object sender, EventArgs e)
        {
            try
            {
                SQL2XML s2x = new SQL2XML();
                //txtResult.Text = s2x.Parse("SQL2XMLExample.xml", "ID='123'");
                string resultXML = s2x.Parse(
                    (string)listBoxSQL2XMLFiles.SelectedValue,
                            getParameterString());

                txtResult.Text = resultXML;

                //save XML File and show in the browser 

                XmlDocument doc = new XmlDocument();
                doc.InnerXml = resultXML;
                String tmpXmlFilename = Application.StartupPath + "\\result.xml";
                XmlWriter write = XmlWriter.Create(tmpXmlFilename);
                doc.WriteTo(write);
                write.Close();
                webBrowser1.Navigate("file://" + tmpXmlFilename);
            }
            catch (Exception ex)
            {
                showError(ex);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        string getParameterString()
        {

            string paramString = "";

            for (int i = 0; i < sql2XML.ReportParameter.Rows.Count; i++)
            {
                Sql2XMLDataSet.ReportParameterRow pr = (Sql2XMLDataSet.ReportParameterRow)sql2XML.ReportParameter.Rows[i];
                paramString += pr.Name + "=" + pr.Default + "&";
            }

            return paramString;

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void listBoxSQL2XMLFiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            //find parameters 
            sql2XML.ReportParameter.Clear();
            SQL2XML s2x = new SQL2XML();
            ReportParameter[] paras = s2x.findParameters((string)listBoxSQL2XMLFiles.SelectedValue);
            for (int i = 0; i < paras.Length; i++)
            {
                sql2XML.ReportParameter.AddReportParameterRow(
                    paras[i].Name,
                    paras[i].Type,
                    paras[i].Default);
            }
            btnExecute.Enabled = true;
        }

        /// <summary>
        /// Fills the generated XMl with the selected word´template.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnFillTemplate_Click(object sender, EventArgs e)
        {   //generate XML File 
            try
            {
                SQL2XML s2x = new SQL2XML();

                string resultXML = s2x.Parse(
                    (string)listBoxSQL2XMLFiles.SelectedValue,
                    getParameterString());


                XML2Word.XML2WORD xml2Word = new XML2Word.XML2WORD();

                xml2Word.XMLString = resultXML;
                xml2Word.WordTemplate = (string)this.listBoxReportFiles.SelectedValue;
                xml2Word.Path = Application.StartupPath; // where to generate the files 
                xml2Word.Execute("MyFiles", false, false); //
            }
            catch (Exception ex)
            {
                showError(ex);
            }
        }

        /// <summary>
        /// internal function, when new report file is selected 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void listBoxReportFiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnFillTemplate.Enabled = true;
        }
        #endregion 

        #region API
        /// <summary>
        /// Generates a word document in the speicfied location and pos the document in Word.
        /// </summary>
        /// <param name="XMLDataSourceFilename">XML Data Source filename.</param>
        /// <param name="WordTemplateFilename">DOT filename = document template filename.</param>
        /// <param name="ReportParameters">Report Parameters connected with "&". Example: Rechnung=46&Bank=10001000</param>
        /// <param name="Documentprefix">Optional document prefix to have different name than template</param>
        /// <param name="ForcedConnectionString">Optional connection string for the query // instead the one in the datasource</param>
        public void GenerateDocument(String XMLDataSourceFilename,
            String WordTemplateFilename,
            String ReportParameters,
            String Documentprefix,
            String ForcedConnectionString) 
         {
            
            //cry if usage without parameters 

             if (XMLDataSourceFilename == null)
                 throw new ApplicationException("You shoud provide XML Data Source filename.");

             if (WordTemplateFilename == null)
                 throw new ApplicationException("You shoud provide template filename.");

             try
             {

                 #region  Part I generate XML
                 SQL2XML s2x = new SQL2XML();
                 //txtResult.Text = s2x.Parse("SQL2XMLExample.xml", "ID='123'");
                 s2x.ForcedConnectionString = ForcedConnectionString;
                 string resultXML = s2x.Parse(
                             XMLDataSourceFilename,
                             ReportParameters);

                 txtResult.Text = resultXML;

                 //save XML File and show in the browser 

                 XmlDocument doc = new XmlDocument();
                 doc.InnerXml = resultXML;
                 String tmpXmlFilename = Application.StartupPath + "\\result.xml";
                 XmlWriter write = XmlWriter.Create(tmpXmlFilename);
                 doc.WriteTo(write);
                 write.Close();
                 #endregion

                 #region  part II generate DOC and show

                 XML2Word.XML2WORD xml2Word = new XML2Word.XML2WORD();
                 xml2Word.XMLString = resultXML;
                 xml2Word.WordTemplate = WordTemplateFilename;
                 xml2Word.Path = Application.StartupPath; // where to generate the files 
                 xml2Word.Execute(Documentprefix, false, false); //

                 #endregion
             }
             catch (Exception ex)
             {
                 throw ex; 
             }
         }
        #endregion 

    }
}
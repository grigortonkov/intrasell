using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Net;
using System.IO;

namespace JiraConnector
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            loadURL(this.txtURL2.Text);
        }

        private void btnLoad3_Click(object sender, EventArgs e)
        {
            loadURL(this.txtURL3.Text);
        }


        /// <summary>
        /// Load provided URL into a XML document object
        /// </summary>
        /// <param name="url"></param>
        void loadURL(String url)
        {
            try
            {

                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.AllowAutoRedirect = true;

                string username = this.txtUsername.Text;
                string password = this.txtPassword.Text;

                string svcCredentials = Convert.ToBase64String(ASCIIEncoding.ASCII.GetBytes(username + ":" + password));

                request.Headers.Add("Authorization", "Basic " + svcCredentials);


                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream resStream = response.GetResponseStream();
                StreamReader objSR;
                objSR = new StreamReader(resStream, System.Text.Encoding.GetEncoding("utf-8"));

                //sb.AppendLine("<?xml version = \"1.0\"?>");
                //string response = sb.ToString();
                //"loading xml..."
                String resultAsJSON = objSR.ReadLine();

                //JSON example 
                string json = resultAsJSON;
                var jiraIssues = Newtonsoft.Json.Linq.JObject.Parse(json);

                //Console.WriteLine("{0} with {1} hair", (string)jiraIssues["issuetype"], (string)jiraIssues["description"]);


                JIRAIssueList issues = Newtonsoft.Json.JsonConvert.DeserializeObject<JIRAIssueList>(json);

                Console.WriteLine("Your result:" + issues.expand);

                foreach (JIRAIssue i in issues.issues)
                {
                    this.txtResult.Text = this.txtResult.Text + Environment.NewLine  + "ISSUE: " + i.key + " " + i.fields["summary"];
                }
                //XML Loading 
                // doc.LoadXml(string.Format("{0}", response));
            }
            catch (Exception ex)
            {
                this.txtResult.Text = this.txtResult.Text + "\n" + ex.Message;
            }

        }


    }
}

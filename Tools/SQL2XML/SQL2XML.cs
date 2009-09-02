using System;
using System.Data;
using System.Data.Odbc;
using System.Xml;

namespace GriTon.SQL2XML
{
    /// <summary>
    /// Author: Grigor Tonkov, www.griton.eu
    /// Changes: 01.01.2001 creation
    /// </summary>
    public class SQL2XML
    {

        /// <summary>
        /// Parses a specific data source filename, using the speicified parameters 
        /// The embeded SQL is replaced with the Table form (or single view) of the returned data.
        /// </summary>
        /// <param name="Sql2XmlFilename">Filename with report structure. See provieded  examples.</param>
        /// <param name="parameters">parameters - Example: ID='123'&DATE_FROM='12.12.2007' </param>
        /// <returns>Returns the new XML (as String)</returns>
        public string Parse(string Sql2XmlFilename, string parameters)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Sql2XmlFilename);
            string xmlWithParameters = ds.GetXml();

            for (int par = 0; par < parameters.Split('&').Length; par++)
            {
                if (parameters.Split('&')[par].Split('=').Length > 1)
                {
                    string paramName = parameters.Split('&')[par].Split('=')[0];
                    string paramVal = parameters.Split('&')[par].Split('=')[1];
                    xmlWithParameters = xmlWithParameters.Replace("@" + paramName, paramVal); //SQL Server Parameters
                    xmlWithParameters = xmlWithParameters.Replace("?" + paramName, paramVal);
                    xmlWithParameters = xmlWithParameters.Replace(":" + paramName, paramVal);
                }

            }

            XmlDocument doc = new XmlDocument();
            doc.InnerXml = xmlWithParameters;
            XmlNodeList nList = doc.GetElementsByTagName("SQLCommand");

            //For each Element of Typ SQLCommand 
            for (int i = 0; i < nList.Count; i++)
            {
                XmlNode command = nList[i];
                string connString = command.ChildNodes[0].InnerText;  //"CommandText"
                string commandText = command.ChildNodes[1].InnerText; //"ConnectionString"     
                string rowTagName = command.ChildNodes[2].InnerText;  //"RowTagName"  
                string newXML = Query2XML(connString, commandText, rowTagName);
                newXML = newXML.Replace("<NewDataSet>", "");
                newXML = newXML.Replace("</NewDataSet>", "");
                command.InnerXml = newXML;
            }

            //remove this NODE 
            XmlNodeList nListRP = doc.GetElementsByTagName("ReportParameters");
            for (int i = 0; i < nListRP.Count; i++)
            {
                nListRP[i].InnerXml = "";
            }


            string outerXML = doc.OuterXml;

            outerXML = outerXML.Replace("<ReportParameters>", ""); //remove this Tag 
            outerXML = outerXML.Replace("</ReportParameters>", "");

            outerXML = outerXML.Replace("<SQLCommand>", ""); //remove this Tag 
            outerXML = outerXML.Replace("</SQLCommand>", "");
            return outerXML;

        }


        /// <summary>
        /// Searches the file and returns a list of parameters 
        /// </summary>
        /// <param name="Sql2XmlFilename">Filename of the XML document that contains the parameters.</param>
        /// <returns>an array with report parameters</returns>
        public ReportParameter[] findParameters(string Sql2XmlFilename)
        {
            try
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Sql2XmlFilename);


                XmlDocument doc = new XmlDocument();
                doc.InnerXml = ds.GetXml();
                XmlNodeList nList = doc.GetElementsByTagName("ReportParameter");


                ReportParameter[] pars = new ReportParameter[nList.Count];
                //For each Element of Typ SQLCommand 
                for (int i = 0; i < nList.Count; i++)
                {
                    XmlNode command = nList[i];
                    string parName = command.ChildNodes[0].InnerText;     //"Name"
                    string parType = command.ChildNodes[1].InnerText;     //"Type"     
                    string parDefault = command.ChildNodes[2].InnerText;  //"Default"  

                    pars[i] = new ReportParameter(parName, parType, parDefault);
                }
                return pars;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        /// <summary>
        /// Executes the Query using the connection
        /// </summary>
        /// <param name="connString">the ODBC connections string</param>
        /// <param name="commandText">SQL Select command</param>
        /// <param name="rowTagName">tag name for the generated XML</param>
        /// <returns>the XMl of the data adapter</returns>
        private string Query2XML(string connString, string commandText, string rowTagName)
        {
            DataSet ds = new DataSet();
            OdbcConnection conn = new OdbcConnection(connString);
            OdbcDataAdapter dAdapt = new OdbcDataAdapter(commandText, conn);

            conn.Open();
            dAdapt.Fill(ds, rowTagName);
            conn.Close();

            return ds.GetXml();
            //XmlDocument doc = new XmlDocument();
            //doc.InnerXml = ds.GetXml();
            //return doc.FirstChild.InnerXml;
        }

    }
}

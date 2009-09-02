using System;
using System.Collections.Generic;
using System.Text;

namespace GriTon.SQL2XML
{
    /// <summary>
    /// Contans a report parameter
    /// </summary>
    public class ReportParameter
    {
        public  ReportParameter(string sName, string sType, string sDefault) { 
            Name = sName;
            this.Type = sType;
            Default  = sDefault; 
        }

        public string Name;
        public string Type;
        public string Default;
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IntraSell
{
	class IntraSellProxy
	{
        static string connString = "driver={MySQL ODBC 5.1 Driver};PORT=3306;DATABASE=intrasell_daten_2;SERVER=localhost;USER=webshop;PASSWORD=efox2004;PASS=efox2004";
        static IntraSell.IntraSellDB db = new IntraSellDB();
        static IntraSell.IntraSellVars vars = new IntraSellVars();
        
        public static ADODB.Recordset openRecordset(String sql)  
        {
            db.init(connString);
            ADODB.Recordset result = db.openRecordset(sql);
            db.destroy();
            return result;
        }

        public static void SETVARVALUE(string varname , string value)
        {
            vars.init(connString);
            vars.SETVARVALUE(varname, value);
            vars.destroy();
        }

        public static string firstRow(String sql)
        {
            vars.init(connString);
            object result =  vars.firstRow(sql);
            vars.destroy();
            return result.ToString(); 
        }


	}
}

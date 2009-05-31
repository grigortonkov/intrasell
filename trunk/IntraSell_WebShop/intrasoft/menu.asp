<!--#include file="../admin/includeall.inc"-->  
<%
		'Aplication settings for Generic ASP 
		Session("MyDSN") = ObjConnection
		if Session("dbExitPage") = "" then
			Session("dbExitPage") = "http://www.vegsys.com"
		end if	
		Session("dbTitle") = "IntraSell"
		'Session("dbType") = "Access" '"SQL"' 'set in global asa
		Session("dbConn") = Session("MyDSN") 
		Session("dbBorderColor") = "#6699FF"
		Session("dbMenuColor")   = "#99CCFF"
	    'END Application settings for generic ASP 	
%>

<head>
<link REL="stylesheet" HREF="<%=BASENAME%>/style.css" TYPE="text/css">
<link REL="stylesheet" HREF="<%=BASENAME%>/intrasoft/styleButtons.css" TYPE="text/css">
<title>IntraSell - Administration</title>
<script LANGUAGE="JavaScript">
<!--
/* this function will display the count-up */
function  updateFrame() {
  top.status = top.status + "+";
  if (top.status.length>20){
     top.status = "";
     //top.frames[1].location.reload(true);
     document.location.reload(true); 
    }
   interval = document.forms[0].interval.value
	timerID  = setTimeout("updateFrame()",interval*100*60);
}
//-->
</script>
</head>
<body onLoad="updateFrame();" topmargin="1" leftmargin="1">
<%call DisplayManu("menu.asp")%>
<form><input type="hidden" size="3" name="interval" value="<%=VARVALUE("REFRESH_INTERVAL")%>"></form>
<%
'******************************************************************************
' DisplayManu 
'******************************************************************************
function DisplayManu (inPageToShow)
	Response.Write "<script language=""JavaScript"" src=""" & BASENAME & "/intrasoft/menu.js""></script>" & chr (10) & chr (13)
	Response.Write "<script language=""JavaScript"">" & chr (10) & chr (13)
	Response.Write "function showToolbar () { " & chr (10) & chr (13)
	Response.Write "menu= new Menu ();" & chr (10) & chr (13)
	Dim sql, rs, rsSu
	' Loop for initialize menu items
   Dim PreKatNr: PreKatNr = 0
	sql = "SELECT * FROM webAdminMenu WHERE MenuNrParent=" & PreKatNr & " ORDER BY MenuNr"
	Set rs = ObjConnectionexecute(sql)
	WHILE NOT rs.EOF 
		if  rs ("MenuNrParent") = 0 then 
			Response.Write "menu.addItem (""menu" & 	rs("MenuNr") & """, """ & getTranslation(Server.HTMLEncode(rs("Name"))) & """, """ & getTranslation(rs("Name")) & """, """ & BASENAME & "/admin/" & server.HTMLEncode(("URL")) & """ , null );"
			Response.Write Chr(10)& Chr(13)
			sql = "SELECT * FROM webAdminMenu WHERE MenuNrParent=" & rs("MenuNr") & " ORDER BY MenuNr"
			Dim rsSub: Set rsSub = ObjConnectionexecute(sql)
			WHILE NOT rsSub.EOF 
				Response.Write "menu.addSubItem (""menu" & rs("MenuNr") & """, """ & getTranslation(rsSub("Name")) & """, """ & getTranslation(rsSub("Name")) & """, """ & BASENAME & "/admin/" & server.HTMLEncode(rsSub("URL")) & """);"
				rsSub.MoveNext
				Response.Write Chr(10)& Chr(13)
			WEND			
			rsSub.Close
			set rsSub = Nothing
		end if
	  rs.MoveNext
	  
	WEND
	rs.Close
	set rs = nothing
	'end loop of initialization
	Response.Write "menu.showMenu ();}" & chr (10) & chr (13)
	Response.Write "showToolbar();"
	Response.Write "</script>" & chr (10) & chr (13)
	
end function
%>

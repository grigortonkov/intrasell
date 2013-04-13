<%@ Language="VBScript" AspCompat="true" %>
<%Response.buffer=true
Level=1%>
<!--#include File ="includes/check.inc.aspx"-->
<HTML>
<HEAD>
		<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
		<title>aspEdit</title>
		<link rel=stylesheet type="text/css" href="styles/style.css">
	</HEAD>


<BODY>
		<div align="center">
			<!--#include File ="includes/banner.inc.aspx"-->
			[<a href="javascript:parent.close()">Close Window (File not saved!)</a>]
			<hr>
			<%
 fso = Server.CreateObject("Scripting.FileSystemObject")	
File=request.querystring("File")
response.write("<font color='white'><b>" & File & "</font></b><hr>") 
aktion=request.querystring("aktion")
Set ts = fso.OpenTextFile (Server.MapPath (File) , 1)
Response.Write "Saving:" & Server.MapPath (File)
If Aktion="save" then
		Set ts = fso.CreateTextFile (Server.MapPath (File), 1)
		ts.Write Request.Form("FileContent")
		Set ts = fso.OpenTextFile (Server.MapPath (File) , 1)
		Response.Write "File saved!<hr>"
end if

%>
			<form <%="action='editor.asp?file=" & file & "&aktion=save'"%> id=FORM1 method=post name=FORM1>
					<input id=submit1 name=submit1 type=submit value="Save File"><br>
					<%
	response.write("<TEXTAREA name=FileContent cols='136' rows='35'>")
	Response.Write Server.HTMLEncode(ts.ReadAll)
	response.write("</TEXTAREA>")
%></div>
			</form>
		
	</BODY>
</HTML>
<%
	 fso = Nothing
	 ts = Nothing
%>
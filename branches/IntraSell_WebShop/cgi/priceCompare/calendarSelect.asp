<%@ LANGUAGE = VBScript.Encode%>
<%
'this parameter is needed to set the value to the opening form 
Dim toElementName: toElementName = "'" & Request("toElementName") & "'"
%>
<HTML xmlns:IE>
<HEAD>
<meta http-equiv="Content-Language" content="de-at">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<TITLE>Calendar Control</TITLE>
<link href="../../style.css" type="text/css" rel="stylesheet">
<STYLE>
@media all 
{
  IE\:Calendar 
  {
    behavior: url(calendar_de.htc) ; 
    width : 33%;
  }
}
  A:link { color:#003399; text-decoration:none; }
  A:visited { color:#6699CC; text-decoration:none; }
  A:hover { text-decoration:underline; }
</STYLE>
<SCRIPT LANGUAGE="JavaScript">
	<!-- 
function applyDate(toElementName){
 if (cal!=null  && cal.value!=null) {
   		//alert('Heute ist:' + cal.value);
   		opener.document.all(toElementName).value = cal.value; 
   		window.close();		    
   }
}
// -->
</SCRIPT>
</HEAD>
	
<BODY BGCOLOR=#ffffff TEXT=#000000 language=De>
<CENTER>
<IE:Calendar Name="cal1" id="cal" style="BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; HEIGHT: 275px; WIDTH: 300px" _OnPropertyChange="applyDate(<%=toElementName%>);">
</IE:Calendar>
</CENTER>
  <p align="center"><input type="button" value="Datum anwenden" name="B3" OnClick="applyDate(<%=toElementName%>);"></p>
</BODY>
</HTML>
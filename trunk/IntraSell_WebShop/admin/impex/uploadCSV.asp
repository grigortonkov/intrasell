<!--#include file="../../intrasoft/menu.asp"-->
<!--#include File ="../upload/upload.inc"-->
<SCRIPT LANGUAGE="JavaScript">
function Validator(){
	var myform = document.forms("UploadLogo");
	var myfield ;
	myfield = eval ( 'myform.item(\"fName\")');
	if ( myfield.value == "" ) {
		alert(' The form is EMPTY ! \n There is nothing to Submit !') ;
		return false ;
	};
	return (true);
}
</SCRIPT>
<%
Dim count
Dim myfilename
Init
if getData("UploadButton") <> "" then 
	If Len(Request.TotalBytes) > 0 Then
		myfilename = "export.txt"  'getFileName("fName")
		Server.ScriptTimeout = 250
		If myfilename <> "" then
		    response.write  "<br>myfilename=" & myfilename
		    response.Flush 
		    'response.end
			If saveAs("fName",myfilename ) THEN
				response.write ("<br><font color='green'>Upload of File '" & myfilename & "' as file '" & myfilename &  "' was successfull.</font>")
				'set proper name in office vars 
				'objConnectionExecute("UPDATE ofVars SET Wert= '" & myfilename & "' Where Name = 'COMPANY_LOGO_IMAGE'" )
			else
 				response.write("<br><font color='red'>An Error occured with Upload of file '" & myfilename & "' !</font>")
			end if
		End if
		Response.Write("<hr>")
	end If
end if
%>
<FORM name="UploadLogo" action="uploadCSV.asp" method="post" enctype="multipart/form-data">
	<center>
		<h3><b>CSV Upload &amp; Import</b></h3>
		<p>&nbsp;</p>
		<table border="0" cellpadding="0" cellspacing="0" width="600" height="1">
			<tr>
				<td align="right" height="8"><b><i>Neue Datei (*.CSV) :</i></b></td>
				<td align='middle' height="8"><input type='file' name='fName' enctype='multipart/form-data' style='WIDTH:350px' accept='image/*'></td>
			</tr>
			<tr>
				<td colspan="2" height="1">&nbsp;(Grundlage für File CSV Import)</td>
			</tr>
			<TR>
				<td colspan="2" align="middle" height="1"><input type="submit" name="UploadButton" value="Upload File" onClick="return Validator()" style='WIDTH:150px'></td>
			</TR>
		</table>
	</center>
</FORM>
<FORM name="ImportCSV" action="importCSV.asp" method="post">
	<center>
		<table border="0" cellpadding="0" cellspacing="0" width="600" height="1" ID="Table1">
			<tr>
				<td align="right" height="8"><b><i></i></b></td>
				<td align='middle' height="8"></td>
			</tr>
			<tr>
				<td colspan="2" height="1">&nbsp;Nachdem die Datei bereits upgeloaded wurde, 
					einfach hier den Import starten:</td>
			</tr>
			<TR>
				<td colspan="2" align="middle" height="1"><input type="submit" name="ImportButton" value="Import CSV File" style='WIDTH:150px' ID="Submit1"></td>
			</TR>
		</table>
	</center>
</FORM>

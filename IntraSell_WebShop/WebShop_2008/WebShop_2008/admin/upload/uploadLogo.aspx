<!--#include virtual="/intrasoft/menu.aspx"-->
<!--#include File ="upload.inc"-->

<script language="JavaScript">
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
</script>

<%
Dim count
Dim myfilename
Dim Path :Path = "../../Company/images"
Init
if getData("UploadButton") <> "" then 
	If Len(Request.TotalBytes) > 0 Then
		myfilename = getFileName("fName")
		Server.ScriptTimeout = 250
		If myfilename <> "" then
		   'delete not possible because maybe the images is used by IIS
		   'deletefile(Server.MapPath("../../Company/images/company.gif"))
		   'response.write  "myfilename=" & myfilename
			If saveAs("fName","../../Company/images/"& myfilename ) = true then
				response.write ("<br><font color='green'>Upload of Logo file '" & myfilename & "' as file '" & myfilename &  "' was successfull.</font>")
				'set proper name in office vars 
				ObjConnectionExecute("UPDATE ofVars SET Wert= '" & myfilename & "' Where Name = 'COMPANY_LOGO_IMAGE'" )
			else
 				response.write("<br><font color='red'>An Error occured with Upload of logo file '" & myfilename & "' !</font>")
			end if
		End if
		Response.Write("<hr>")
	end If
end if
%>
<form name="UploadLogo" action="uploadLogo.aspx" method="POST" enctype="multipart/form-data">
<center>
    <h3>
        <b>Firmenlogo Upload</b></h3>
    <p>
        (Das ist die Abbildung, die links oben im Shop zu finden ist.&nbsp;Diese 
        abbildung wird als Logo für Ihre Rechnungen verwendet)</p>
    <table border="0" cellpadding="0" cellspacing="0" width="600" height="1">
        <tr>
            <td colspan="2">
                <p align="center">
                    &nbsp;Aktuelles Logo:
                    <img border="0" src="../../company/images/<%=varvalue("COMPANY_LOGO_IMAGE")%>">
            </td>
        </tr>
        <tr>
            <td align="right" height="8">
                <b><i>neues Logo ( *.gif ) :</i></b>
            </td>
            <td align='center' height="8">
                <input type='file' name='fName' enctype='multipart/form-data' style='width: 350'
                    accept='image/*'>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="1">
                &nbsp;
            </td>
        </tr>
        <td colspan="2" align="center" height="1">
            <input type="submit" name="UploadButton" value="Upload Logo" onclick="return Validator()"
                style='width: 150'>
        </td>
    </table>
</center>
</form>

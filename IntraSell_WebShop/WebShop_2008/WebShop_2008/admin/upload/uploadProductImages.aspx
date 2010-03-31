<!--#include virtual="/intrasoft/menu.aspx"-->
<!--#include File ="upload.inc"-->

<script language="JavaScript">
    
    function UpdateID(x) {
        document.forms("UploadproductImages").item("ProductId" + x).value = document.forms("UploadproductImages").item("selectProduct" + x).value;
    }

    function Validator() {
        var myform = document.forms("UploadProductImages");
        var myfield1, myfield2, mylistm, myfield3;
        myfield3 = eval('myform.item(\"NumOfProducts\")');
        var Num = new Number(myfield3.value);
        Num = Num + 1;
        for (x = 1; x < Num; x++) {
            myfield1 = eval('myform.item(\"ProductId' + x + '\")');
            myfield2 = eval('myform.item(\"fName' + x + '\")');
            if ((myfield1.value != "") || (myfield2.value != ""))
                break;
        };
        if (x == Num) { // Empty Form 
            alert(' The form is EMPTY ! \n There is nothing to Submit !');
            return false;
        };
        for (x = 1; x < Num; x++) {
            myfield1 = eval('myform.item(\"ProductId' + x + '\")');
            myfield2 = eval('myform.item(\"fName' + x + '\")');
            mylist = eval('myform.item(\"selectProduct' + x + '\")');
            if (myfield1.value != "") {
                if (isNaN(myfield1.value)) {
                    alert('Die ArtNr ist eigentlich eine Produktnummer und sollte eine Nummer sein!');
                    myfield1.focus();
                    return false
                }
                else {
                    for (var i = 0; i < mylist.length; i++)
                        if (myfield1.value == mylist[i].value) break;
                    if (i == mylist.length) { // no such Product ID
                        alert('Es gibt kein Produkt mit der Nummer = \"' + myfield1.value + '\" in der Datenbank!');
                        myfield1.focus();
                        return false;
                    };
                };
                if (myfield2.value == "") {
                    alert('Sie müssen eine Imagedatei für die Zeile #' + x + ' auswählen!');
                    myfield2.focus();
                    return false;
                };
            }
            else { // empty field 'ProductId'
                if (myfield2.value != "") {
                    alert('Entweder ArtNr oder eine Auswahl ist erforderlich in der Zeile # ' + x + ' !');
                    myfield1.focus();
                    return false;
                };
            }
        }
        return (true);
    }
</script>

<%

Dim NumOfProducts
NumOfProducts = 10
Dim sql
Dim rs
Dim count
Dim fName
Dim myfilename
Dim Path: Path = "../../productImages"
Init
if getData("UploadButton") <> "" then 
	If Len(Request.TotalBytes) > 0 Then
		For count = 1 to NumOfProducts	
			fName="fName" & count
			myfilename = getFileName(fName)
			pId = getData("ProductId" & count) 
			Server.ScriptTimeout = 250
			If myfilename <> "" then
				sql = "SELECT ArtNr, Bezeichnung FROM [grArtikel] WHERE ArtNr=" & pId
				set rs = ObjConnectionExecute(sql)		
				If saveAs(fName,"") = true then
					response.write ("<br><font color='green'>Upload of picture of product '" & rs("Bezeichnung") & "' in File '" & myfilename & "' was successfull.</font>")
					sql = "UPDATE [grArtikel] SET picture='" & myfilename & "' WHERE ArtNr=" & pId
					ObjConnectionExecute(sql)							
				else
 					response.write("<br><font color='red'>An Error occured with Upload of picture of product '" & rs("Bezeichnung") & "' in File '" & myfilename & "' !</font>")
				end if
			End if
		Next
		Response.Write("<hr>")
	end If
end if
%>
<form name="UploadproductImages" action="uploadproductImages.aspx" method="POST"
enctype="multipart/form-data">
<input type="hidden" name="NumOfProducts" value="<%=NumOfProducts%>">
<center>
    <h3>
        <b>Produktbilder Upload Formular</b></h3>
    <table border="0" cellpadding="0" cellspacing="0" width="800" height="1">
        <tr height="12%">
            <td align="center" height="4" valign="middle" width="26">
                <b>#
            </td>
            <td align="center" colspan="2" height="4" valign="middle" width="643">
                <b>Füllen Sie die ArtNr des Produktes aus oder wählen Sie ein Produkt aus der Liste!
                    <!--Fill in ProductID or select a Product from the list-->
                </b>
            </td>
            <td align="center" height="4" valign="middle" width="242">
                <b>Wählen sie eine Datei (pflicht)</b>
            </td>
        </tr>
        <%For count = 1 to NumOfProducts
	Response.Write "<tr><td align='right'>" & count& ".</td><td align='center'><input name='ProductId" & count & "' style='width:50'></td>" & CHR(13) & CHR(10)
	Response.Write "<td align='center'><select name='selectProduct" & count &"' style='width:250' onChange='UpdateID(" & count & ")'>" & CHR(13) & CHR(10)
	sql = "SELECT ArtNr, Bezeichnung FROM [grArtikel] WHERE ArtNr >= 1000 ORDER BY Bezeichnung"
	set rs = ObjConnectionExecute(sql)
	Response.Write "<option value=-1 SELECTED>Wählen Sie ein Produkt aus</option>" & CHR(13) & CHR(10)
	while not rs.EOF 
		Response.Write "<option value=" & rs("ArtNr") & ">" & rs("Bezeichnung") & "</option>" & CHR(13) & CHR(10)
		rs.MoveNext
	wend
	rs.close
	set rs = nothing
	Response.Write "</select>" & CHR(13) & CHR(10)
	Response.Write "<td align='center'><input type='file' name='fName" & count & "' enctype='multipart/form-data' style='width:300' accept='image/*'></td></tr>" & CHR(13) & CHR(10)
Next
        %>
        <tr>
            <td colspan="4" height="1" width="915">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="26" width="26">
                &nbsp;
            </td>
            <td colspan="3" align="center" height="26" width="887">
                <input type="submit" name="UploadButton" value="Upload allle Bilder" onclick="return Validator()"
                    style='width: 150'>
            </td>
    </table>
</center>
</form>

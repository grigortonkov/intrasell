<%@ Language=VBScript %>
<%Response.buffer=true
Level=1%>
<!--#include File ="includes/check.inc"-->
<HTML>
<HEAD>
		<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
		<title>aspEdit</title>
		<link rel=stylesheet type="text/css" href="styles/style.css">
	</HEAD>


<BODY><!--#include File ="includes/banner.inc"--><!--#include File ="includes/upload.inc"-->
		<div align="center">
			<%
Set fso = Server.CreateObject("Scripting.FileSystemObject")	
Path=request.querystring("Path")
If Right(Path,1)="/" AND Path<>"/" Then Path=Left(Path,Len(Path)-1)
response.write("<font color='white'><b>" & Path & "</font></b><br>")
Var =InstrRev(Path,"/")
dirup=left(Path,Var)
response.write ("[<a href='browser.asp?path=" & dirup & "'>Directory up</a>]") 
%>
 [<a href="browser.asp?path=/">Root Directory</a>]<br>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<form name="FormName" <%="action='browser.asp?path=" & path & "&aktion=createfolder'"%>method="post">
							<div align="center">
								<input type="text" name="newSubF" size="24"><br>
								<input type="submit" name="submitButtonName" value="Create Subfolder"></div>
						</form>
					</td>
					<td>
						<form name="FormName" <%="action='browser.asp?path=" & path & "&aktion=createfile'"%>method="post">
							<div align="center">
								<input type="text" name="newFile" size="24"><br>
								<input type="submit" name="submitButtonName" value="Create File"></div>
						</form>
					</td>
				</tr>
			</table>
			<hr>
			<% 
aktion=request.querystring("aktion")
Set ts=fso.GetFolder(Server.MapPath(Path))
Select Case aktion
Case "upload"		
	If Len(Request.TotalBytes) > 0 Then
	Response.Write("File(s) will be uploaded onto the directory " & Path)
	Init
	For x=1 to int(request.querystring("NumOfUploads"))	
		fName="fName" & x
		Server.ScriptTimeout = 250
		If getFileName(fName)<>"" then
			If saveAs(fName,"") = true then
				response.write ("<br>Upload of File " & getFileName(fName) & " (Content-Type: " & getContentType(fName) & ") was successfull.")
			else
 				response.write("<br>An Error occured with File " & getFileName(fName) & "!")
			end if
		End if
	Next
	Response.Write("<hr>")
	End If
Case "deletefile"	
	fso.DeleteFile(Server.MapPath(request.querystring("file")))
	response.write("File deleted.<hr>")
Case "deletefolder"
	fso.DeleteFolder(Server.MapPath(request.querystring("folder")))
	response.write("Subfolder deleted.<hr>")
Case "createfile"
	If right(Path,1)<>"/" then Path= Path & "/"
	fso.CreateTextFile(Server.MapPath(Path & request.form("newFile")))
	response.write("File created.<hr>")
Case "createfolder"
	If right(Path,1)<>"/" then Path= Path & "/"
	fso.CreateFolder(Server.MapPath(Path & request.form("newSubF")))
	response.write("Subfolder created.<hr>")
End select



%>
			<table border="0" cellpadding="0" cellspacing="1" width="100%">
				<tr>
					<td colspan="7" bgcolor="#31618c">
						<div align="center">
							<b>Subfolder</b></div>
					</td>
				</tr>
<%For each SubF in ts.Subfolders
If right(Path,1)="/" then
	WholeSubF=Path & SubF.Name
else
	WholeSubF=Path & "/" & SubF.Name
end if%>
				<tr>
					<td colspan="3"><%="<a href='browser.asp?path=" & WholeSubF & "'>" & SubF.Name & "</a>"%></td>
					<td width="15%">
						<div align="right">
							<%Response.Write SubF.DateLastModified%></div>
					</td>
					<td width="5%"></td>
					<td width="5%">
						<div align="center">
							</div>
					</td>
					<td width="5%">
						<div align="center">
							<font size="-2"><a <%="href='browser.asp?path=" & path & "&aktion=deletefolder&folder=" & WholeSubF & "'"%>>delete</a></font></div>
					</td>
					<%next%>
				</tr>
				<tr>
					<td colspan="7" bgcolor="#31618c">
						<div align="center">
							<b>Files</b></div>
					</td>
				</tr>
				<%For each File in ts.files
If right(Path,1)="/" then
	WholeFile=Path & File.Name
else
	WholeFile=Path & "/" & File.Name
end if

%>
				<tr>
					<td><%=File.Name%></td>
					<td width="25%">
						<div align="center">
							<%=File.Type%></div>
					</td>
					<td width="5%">
						<div align="right">
<%if File.Size <1024 Then
    Response.Write File.Size & " B"
ElseIf File.Size < 1048576 Then
    Response.Write Round(File.Size / 1024.1) & " KB"
Else
    Response.Write Round((File.Size/1024)/1024.1) & " MB"
End if
Var=InstrRev(File.Name,".")
FileType=Right(File.Name,Len(File.Name)-Var)
%></div>
					</td>
					<td width="15%">
						<div align="right">
							<%Response.Write File.DateLastModified%></div>
					</td>
					<td width="5%">
						<div align="center">
							<%
If FileType="mdb" then
	response.write ("<font size='-2'><a href='dbeditor.asp?path=" & WholeFile & "' target='_blank'>edit DB</a></font>")
else
	response.write ("<font size='-2'><a href='editor.asp?path=" & path & "&file=" & WholeFile & "' target=_blank'>edit</a></font>")
end if
%></div>
					</td>
					<td width="5%">
						<div align="center">
							<%
response.write ("    <font size='-2'><a href='" & WholeFile & "' target=_blank'>open/download</a></font>")
%></div>
					</td>
					<td width="5%">
						<div align="center">
							<font size="-2"><a <%="href='browser.asp?path=" & path & "&aktion=deletefile&file=" & WholeFile & "'"%>>delete</a></font></div>
					</td>
				</tr>
				<%next%>

			</table>
			<hr>
			<p><b>Upload:<br>
<%
If request.querystring("NumOfUploads")="" Or int(request.querystring("NumOfUploads"))<1 then NumOfUploads=1 Else NumOfUploads=int(request.querystring("NumOfUploads"))
%>

				</b>[<a <%="href='browser.asp?path=" & path & "&numofuploads=" & numofuploads+5 & "'"%>>More Uploads</a>][<a <%="href='browser.asp?path=" & path & "&numofuploads=" & numofuploads-5 & "'"%>>Less Uploads</a>]<br>
				
				Files will be uploaded onto the current directory, files with the same name will be overwritten</p><FORM name=frmTest <%="action='browser.asp?path=" & path & "&aktion=upload&NumOfUploads=" & NumOfUploads & "'"%> method=post enctype="multipart/form-data">
<%For x=1 to NumOfUploads
	response.write("<INPUT type='file' name='fName" & x & "'><BR>")
Next
%>
<INPUT TYPE=SUBMIT NAME=cmdSubmit VALUE="Start Upload">
</FORM>
		</div>
	</BODY>
</HTML>
<%
	Set fso = Nothing
	Set ts = Nothing
%>
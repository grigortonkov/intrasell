<!--#include file="menu.aspx"-->
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../style.css">
    <title>Query Tool</title>
</head>
<body>
    <%
        'dim objConnection
        'Set objConnection=server.createobject("adodb.connection")
        '    objConnection.Open "DSN=IPP;Uid=IPP;Pwd=sercon"
 

        '===========================================================================
        ' General ASP Functions
        ' This is collection of usefull ASP functions and procedures.
        ' Written and edited by Grigor Tonkov 2001 (R)
        ' See intrasoft.soft-ware.de for last changes. 
        '
        '============================================================================
        ' History
        '____________________________________________________________________________
        ' DATE         WHAT
        ' 20-08-2002 Sub Row added toe the SELECT queries 
        ' 04-04-2002 Some comments and vars for showSQL and PageTitle
        '____________________________________________________________________________

        '**Start Encode**
 
        '<!-- This page can handle all possible SQL queries-->
     
        Dim delete_query as String
        Dim SQLString as String 
        dim Export, Filename, rs, exportToFile, i, ShowSQL
        Dim showDelete as Boolean
 
        delete_query = Request("delete_query") 'is ispressed delete in the first column
        SQLString = Request("SQLString") 'the sql select query 
        Export = Request("Export") 'if export is clicked 
        Filename = Request("Filename") 'the filename for export
     
        ShowSQL = Request("ShowSQL") 'if toe form for export and sql to be shown
        If ShowSQL = "" Then ShowSQL = True
     
        showDelete = Request("showDelete") = "true" 'if toe form for export and sql to be shown
        'If showDelete = "" Then showDelete = True
      
        Dim MyPageTitle = Request("PageTitle") 'the page title for the result
     
         
        'response.write "delete_query=" & delete_query      
        If SQLString <> "" Then
            'Response.Write "Execute: " & SQLString
            rs = objConnection.Execute(SQLString)
        End If
    %>
    <h1 align="center">
        <%If Len(MyPageTitle) <= 0 Then%>Query &amp; File Export Tool
        <%Else%>
        <%=MyPageTitle%>
        <%End If%>
    </h1>
    <% If ShowSQL Then%>
    <form method="POST" action="runSQLSelect.aspx" enctype="application/x-www-form-urlencoded">
    <textarea name="SQLString" rows="6" cols="100"><% 
                                                       If SQLString <> "" Then
                                                           Response.Write(SQLString)
                                                       Else
                                                           If Len(delete_query) > 0 Then
                                                               Response.Write(delete_query)
                                                           Else
                                                               Response.Write("SELECT * FROM ")
                                                           End If
                                                       End If%>
  
  </textarea>
    <br />
    <%
        ''
        '' diese funktion erlaubt löschen von allen ausgew. sätze
        ''
        If InStr(UCase(SQLString), "FROM") > 0 And showDelete Then%>
    <%Dim deleteAllSQL : deleteAllSQL = "DELETE " & Mid(SQLString, InStr(UCase(SQLString), "FROM"))%>
    <font color="red"><a href="runSQlSelect.asp?SQLString=<%=deleteAllSQL%>">DELETE ALL
        SELECTED ROWS!</a> </font>
    <%End If%>
    <p>
        <input type="submit" name=".submit" value="<<< QUERY or EXPORT* >>>">&nbsp; Export
        to File:<input type="checkbox" name="Export" value="ON">
        Create File:
        <input type="text" name="Filename" size="37" value="export.txt"></p>
    </form>
    <p>
        * to export set Filename and click Export To File!</p>
    <%End If 'show SQL%>
    <%

        Dim fs, exportFile
 
        ' es handelt sich um SELECT Abfrage 
        If UCase(Left(SQLString, 4)) = "SELE" Then
            'CREATE EXPORT FILE 
            exportToFile = False
            If UCase(Request("Export")) = "ON" Then exportToFile = True
  
            'If Creation of export filename wished 
            If exportToFile Then
               
                fs = CreateObject("Scripting.FileSystemObject")
                Filename = Server.MapPath("\") + "\" & Request("Filename")
                'response.write  "Export to: " & filename 
                exportFile = fs.CreateTextFile(Filename, True)
            End If
            'END CREATE EXPORT FILE 
            'response.write "Fields =" & rs.fields.count
            Response.Write("<table border =""1""><TR>")
            Response.Write("<Th>")
            If showDelete Then
                Response.Write("Delete")
            End If
            Response.Write("</Th>")
            For i = 1 To rs.fields.count
                Response.Write("<Th>" & rs.fields(i - 1).name & " </Th>")
            Next
            Response.Write("</TR>")

            Dim htmlline, fileLine, table_name
            Dim sumRow(100) 'max 20 fields  
    
            Dim alternateRowColor : alternateRowColor = "#FFFFFF"
            While Not rs.EOF
 	
                If alternateRowColor = "#FFFFCC" Then
                    alternateRowColor = "#FFFFFF"
                Else
                    alternateRowColor = "#FFFFCC"
                End If
                htmlline = "<TR>"
                table_name = Trim(Right(SQLString, Len(SQLString) - InStr(SQLString, "FROM") - 4))

                If InStr(table_name, " ") > 0 Then
                    table_name = Left(table_name, InStr(table_name, " ") - 1)
                End If
   
                delete_query = "DELETE%20FROM%20" & table_name & "%20WHERE%20" & _
                                Trim(rs.fields(0).name) & "=" & Trim(rs.fields(0).value)
                htmlline = htmlline & "<TD>"
                If showDelete Then
                    htmlline = htmlline & "<A HREF=admin.asp?delete_query=" & delete_query & "> DELETE </A>"
                End If
                htmlline = htmlline & "</TD>"
                fileLine = ""
  			   
                For i = 1 To rs.fields.count
                    htmlline = htmlline & "<TD  bgcolor=""" & alternateRowColor & """>" & rs.fields(i - 1).value & " </TD>"
                    fileLine = fileLine & rs.fields(i - 1).value & ";"
                    If IsNumeric(rs.fields(i - 1)) Then sumRow(i) = sumRow(i) + rs.fields(i - 1).value
                Next
          		          	
                htmlline = htmlline & "</TR>"
	
                If exportToFile Then
                    exportFile.WriteLine(fileLine)
                Else
                    Response.Write(htmlline)
                End If
          		 		 			
                rs.movenext()
            End While
            'SHOW SUM ROW 
            If Not exportToFile Then
                htmlline = "<tr><td bgcolor=""#FFFFAA"">SUM ROW</td>"
                For i = 1 To rs.fields.count
                    If Len(sumRow(i)) > 10 Then 'it is not number 
                        sumRow(i) = ""
                    End If
                    htmlline = htmlline & "<Th bgcolor=""#FFFFAA""><p align=""right""><b>" & sumRow(i) & "</b></Th>"
                Next
                htmlline = htmlline & "</tr>"
                Response.Write(htmlline)
            End If
            'END SHOW SUM ROW 
    
            Response.Write("</table>")
            rs.close()
            rs = Nothing
 
            If exportToFile Then
    %>
    <font color="#008080">Export to file [<%=fileName%>] succeessfull! </font>
    <%
        exportFile.close()
    End If 'exportToFile

End If
    %>
</body>
</html>

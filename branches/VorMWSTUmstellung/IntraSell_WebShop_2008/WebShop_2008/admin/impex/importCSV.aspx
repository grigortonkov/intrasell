<!--#include virtual="/intrasoft/menu.aspx"-->
<!--#include file="functionsimpex.aspx"-->
<%


'=======================================================================================
' WEBSHOP IMPORT
'=======================================================================================
 
 Dim ImportData, countUpdates, countNew, countErrors
  localFile  = Server.MapPAth("export.txt")
  Response.Write localFile
  'Response.End 
 ' reorder CSV file to internal structure 
   Dim objFile, objStream, objFileOut, objStreamOut
 		set objFile = Server.CreateObject( "Scripting.FileSystemObject")
 		'Response.Write "localFile=" & localFile 
		set objStream = objFile.OpenTextFile( localFile )
		 
		
		objStream.ReadLine ' Only if first line is with field titles !
		dim outputline , strLine
		Dim countlines: countlines=0
		
		'On error resume next 
		while not objStream.AtEndOfStream ' until end of file 		
		 
		   countlines = countlines +1 
		   if (countlines mod 10) = 0 then Response.Write "C":Response.Flush
		   if (countlines mod 100) = 0 then Response.Write countlines & " lines converted! ":Response.Flush
		    
			status = "OK"
			strLine = replace(objStream.ReadLine,"'","") 
              
              
                if len(strLine) > 10 then ' line is not empty
						Dim importResult
 						importResult =  importPreiseLine(strLine)
     					 
     					 if importResult ="INSERT" then 
     					   countNew = countNew + 1
     					   response.write "N"
     					 end if 
     		
     					 if importResult  = "UPDATE" then 
     					  countUpdates  = countUpdates  + 1
     					  response.write "U"
     					 end if 
     					 
     					 if importResult = "ERROR" then  
     					    countErrors  = countErrors + 1
     					    response.write "R"
     					 end if  
     		 end if           
			Response.Flush
		wend 
	Response.Write "<br />Total " & countlines & " lines converted!"			 
 objStream.close 


%>
<font color="#008080">Fertig! Die Produkte / Preise wurden aktualisiert. </font>
&nbsp;
<table border="1" width="26%" cellspacing="0">
    <tr>
        <th width="104%" colspan="2">
            <b>Statistik / Ergebnis</b>
        </th>
    </tr>
    <tr>
        <td width="67%">
            Neue Produkte
        </td>
        <td width="37%">
            <%=countNew%>
        </td>
    </tr>
    <tr>
        <td width="67%">
            Änderungen Preise
        </td>
        <td width="37%">
            <%=CountUpdates%>
        </td>
    </tr>
    <tr>
        <td width="67%">
            <font color="#FF0000">Fehler</font>
        </td>
        <td width="37%">
            <%=CountErrors%>
        </td>
    </tr>
</table>

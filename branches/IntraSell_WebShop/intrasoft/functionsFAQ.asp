<%   
'===========================================================================
' General ASP Functions
' This is collection of usefull ASP functions and procedures.
' Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'
'
'============================================================================
' History
'____________________________________________________________________________
' DATE         WHAT
'____________________________________________________________________________
'FAQ List oriented help  on every page
'shows help according the FAQ lists
' if Seite is empty or nothing defined in the FAQ Table hten the function returns nothing
'**Start Encode**
Function showFAQList (Seite) 
dim html 
if Seite ="" or ucase(Seite)="FAQ" then 
 showFAQList = "<!-- FAQ ist leer-->"
 exit function 
end if 

Dim SQLString, rs
  		SQLString ="SELECT * FROM webFAQ WHERE Page Like 'ALL%' or Page Like '" & Seite & "'"    
		'Response.Write sqlString 
		Set rs = objConnection.Execute(SQLString) 
		
    if rs.eof then 
     exit function 
     
     html = "Keine Fragen wurden soweit gestellt."
     
     end if    
     
		'html = html &   "<hr>"
		html = "Fragen und Antworten zur Seite [" & Seite & "]"
		html = html &  "<br>"
       		
	Dim frage, count
	count = 0	
 	while not rs.EOF 
        count = count +1 
        Frage = rs("Frage") 
        if len(Frage)>60 then Frage = left(Frage,60) & " ..."
		html = html &   "<a href=""default.asp?PageToShow=FAQ&FAQPage=" & Seite &"#" & left(Frage,10) & """>"
		html = html &  "<li>"
		html = html &  Frage
		'html = html &  "<br>"
		html = html &  "</a>"  
 	    rs.movenext
 	WEND 
 	rs.close 
 	showFAQList = html 
 ' END CONTENT	
END Function


'Shoqs full listing of FAQ for any Page 
function showFAQ(seite)
Dim  SQLString 
Dim rs
SQLString ="SELECT * FROM webFAQ WHERE Page Like 'ALL%' or Page Like '" & Seite & "'" 
%>
<h1>Fragen und Antworten</h1>
<p align="center">Da finden Sie die von unseren Besuchern meistgestellten Fragen.</p>
<h2>Fragen (Übersicht)</h2>
<%
 Set rs = objConnection.Execute(SQLString) 
 Dim count, Frage
	count = 0
 	while not rs.EOF 
    count = count +1 
	Frage = rs("Frage")
%>  
  <a href="#<%=left(Frage,10)%>">
  <li>
  <%=Left(Frage,60)%>
  <br>
  </a> 
<%
 	rs.movenext
 	WEND 
 ' END CONTENT	 	
%>
  <hr>
<h2>Antworten</h2>
<% 	 	
 ' DIE TEXTE ZEIGEN	   
     Set rs = objConnection.Execute(SQLString) 
 count = 0
 	while not rs.EOF 
    count = count +1
    Frage = rs("Frage") 
%>
 
 <li> 
  <a name="<%=left(Frage,10)%>">
  Frage: <font color="blue"><%=Frage%> </font><br>
  Antwort:<font color="green"> 
  <%=rs.fields("Antwort")%>
   </font> 
  <hr>
<%
 	  rs.movenext
 	WEND 
 rs.close 	
end function  	
%>

























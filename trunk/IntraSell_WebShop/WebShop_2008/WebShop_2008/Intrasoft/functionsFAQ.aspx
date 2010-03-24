<script language="VB" runat="server">   
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
        rs = objConnectionExecute(SQLString)
		
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
		html = html &   "<a href=""default.aspx?PageToShow=FAQ&FAQPage=" & Seite &"#" & left(Frage,10) & """>"
		html = html &  "<li>"
		html = html &  Frage
		'html = html &  "<br>"
		html = html &  "</a>"  
 	    rs.movenext
        End While
 	rs.close 
 	showFAQList = html 
 ' END CONTENT	
END Function


'Shoqs full listing of FAQ for any Page 
    Function showFAQ(ByVal seite) As String
        Dim SQLString
        Dim rs
        SQLString = "SELECT * FROM webFAQ WHERE Page Like 'ALL%' or Page Like '" & seite & "'"
        
        Dim html As String : html = ""
        
        html = html & "<h1>Fragen und Antworten</h1>"
        html = html & "<p align=""center"">Hier finden Sie von unseren Besuchern meistgestellten Fragen.</p>"
        html = html & "<h2>Fragen (Übersicht)</h2>"
 
        rs = objConnectionExecute(SQLString)
        Dim count, Frage
        count = 0
        While Not rs.EOF
            count = count + 1
            Frage = rs("Frage")
  
            html = html & "<a href=""#" & Left(Frage, 10) & """>"
            html = html & "<li>"
            html = html & Left(Frage, 60)
            html = html & "<br>"
            html = html & "</a> "
 
            rs.movenext()
        End While
        ' END CONTENT	 	
 
        html = html & "<hr>"
        html = html & "<h2>Antworten</h2>"
 	 	
        ' DIE TEXTE ZEIGEN	   
        rs = objConnectionExecute(SQLString)
        count = 0
        While Not rs.EOF
            count = count + 1
            Frage = rs("Frage")

            html = html & "<li> "
            html = html & "<a name=""" & Left(Frage, 10) & """>"
            html = html & "Frage: <font color=""blue"">" & Frage & "</font><br>"
            html = html & "Antwort:<font color=""green"">"
            html = html & rs.fields("Antwort")
            html = html & "</font> "
            html = html & "<hr>"
 
            rs.movenext()
        End While
        rs.close()
        
        showFAQ = html
    End Function
</script>
























<script language="VB" runat="server">  

    '****************************************************************
    ' Module reference contains functions that are needed 
    ' for the reference business functionality
    ' Warning: these functions are used in cgi and admin but the implementation 
    ' connected with referals is here! 
    '****************************************************************
    '
    '****************************************************************
    ' get internal referer Id
    ' returns -1 if nothing found 
    ' else returns the IDNR 
    '****************************************************************
    Function getInternalIDNRFromForeignRefererId(ByVal foreignRefererId)
        'defaultings 
        If foreignRefererId = "" Then
            foreignRefererId = "0"
        End If
   
        Dim sql, rs
        sql = "select * from webreferers where refererId=" & foreignRefererId
        rs = ObjConnectionExecute(sql)
        If rs.eOF Then
            getInternalIDNRFromForeignRefererId = -1
        Else
            getInternalIDNRFromForeignRefererId = rs("IDNR").Value
            'Response.Write "Sie sind auf dieser Seite aufgrund Referer " & foreignRefererId & "/" & rs("IDNR").Value
        End If
   
    End Function

    '****************************************************************
    ' creates an entry in the database when the user buys something
    '****************************************************************
    Function createReference(ByVal OrderType, ByVal OrderNummer, ByVal RefererId)
        If RefererId <= 0 Then Exit Function
   
        Dim sql
        sql = "INSERT INTO webOrderReferenz (RefererId, OrderNummer, OrderType, Bezahlt) " & _
         "Values (" & RefererId & "," & OrderNummer & ",'" & OrderType & "',-1)"
          
        ObjConnectionExecute(sql)
          
    End Function

    '****************************************************************
    ' isRefererAllowed
    '****************************************************************
    Function isRefererAllowed(ByVal RefererId)
        Dim sql, rs
        sql = "Select * from webreferers Where idnr=" & RefererId
        rs = ObjConnectionExecute(sql)
        isRefererAllowed = Not rs.EOF
    End Function

    '****************************************************************
    ' getExternalRefererId
    ' returns -1 when not defined
    '****************************************************************
    Function getExternalRefererId(ByVal idnr)
        Dim sql, rs
        sql = "Select * from webreferers Where idnr=" & idnr
        'response.write sql
        rs = ObjConnectionExecute(sql)
        If Not rs.EOF Then
            getExternalRefererId = rs("refererId").Value
        Else
            getExternalRefererId = -1
        End If

    End Function


    '****************************************************************
    ' needed for the my account 
    '****************************************************************
    Function showMyReferedSells(ByVal RefererId, ByVal OrderType, ByVal fromDatem, ByVal toDate)
        Dim sql, rs
        Dim tableName : tableName = getNameForTableProducts(OrderType)
        Dim tableNameOrder : tableNameOrder = getNameForTable(OrderType)

        sql = "SELECT webOrderReferenz.RefererId, " & tableNameOrder & ".Datum, " & tableNameOrder & ".Nummer, " & _
         " Sum([" & tableName & "].[PreisATS]*[Stk]) AS Umsatz ,  " & _
            " Sum([" & tableName & "].[PreisATS]*[Stk]*[GewinnReferenz]) AS Gewinn " & _
         " FROM [grArtikel-Kategorien] RIGHT JOIN (grArtikel RIGHT JOIN " & _
         " ((webOrderReferenz LEFT JOIN " & tableNameOrder & " ON webOrderReferenz.OrderNummer = " & tableNameOrder & ".Nummer) " & _
         " LEFT JOIN [" & tableName & "] ON " & tableNameOrder & ".Nummer = [" & tableName & "].RechNr) ON " & _
         " grArtikel.ArtNr = [" & tableName & "].ArtNR) ON [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr " & _
         " WHERE RefererID= " & RefererId & _
         " GROUP BY webOrderReferenz.RefererId, " & tableNameOrder & ".Datum, " & tableNameOrder & ".Nummer"
        'Response.Write "<br>sql=" & sql    
        rs = ObjConnectionExecute(sql)

 

        Response.Write("<h1><font color='#000000'>")
        Response.Write("My Refered Orders/Sells</font></h1>")
        Response.Write("<TABLE border=1 cellPadding=2 cellSpacing=0 width=400>")
  
        Response.Write("<TR>")
        Response.Write(" <TH width=102>")
        Response.Write("<P align=center>RId</P></TH>")
        Response.Write("<TH width='99'>")
        Response.Write("<P align=center>Datum</P></TH>")
        Response.Write("<TH width='106'>")
        Response.Write("<P align=center>Umsatzsumme</P></TH>")
        Response.Write("<TH width='92'>")
        Response.Write("<P align=center>Ihr Gewinn</P></TH>")
        Response.Write("</TR>")
        
        While Not rs.EOF
 
            Response.Write("<TR>")
            Response.Write("<TD align=right width=102>" & rs("RefererId").Value & "</TD>")
     
            Response.Write("<TD align=right width=99>" & rs("Datum").Value & "</TD>")
            Response.Write("<TD align=right width=106>")
            
            If Not (rs("Umsatz").Value) Is Nothing Then
                Response.Write(FormatNumber(rs("Umsatz").Value, 2) & " €</TD>")
            End If
            
            Response.Write("<TD align=right width=92>")
            If Not (rs("Gewinn").Value) Is Nothing Then
                Response.Write(FormatNumber(rs("Gewinn").Value, 2) & " €</TD>")
            End If
   
            Response.Write("</TR>")
            rs.moveNext()
        End While
 
        Response.Write("</TABLE>")
 
        rs.close()
    End Function




    ''' <summary>
    ''' Show the top products for some referer 
    ''' </summary>
    ''' <param name="idnr"></param>
    ''' <remarks></remarks>
    Sub showRefererProducts(ByVal idnr)

        Dim Sql : Sql = "select * from webReferersProducts where IDNR=" & idnr
        Dim rsTop, inRow

        Dim html As String
        
        html = html & "<h1 align='center'>Meine sechs Produkte</h1>"
        html = html & "Hallo! Hier sind meine sechs lieblings Produkte! Ich kann Dir diese Produkte heiss empfehlen! <br>"
        html = html & "Liebe Grüsse! <br>"
        html = html & TABLEVALUE("ofAdressen", "idnr", idnr, "Name")

 
        rsTop = ObjConnectionExecute(Sql)
        If rsTop.BOF And rsTop.EOF Then
        Else
            inRow = 0
     
            html = html & "<center>"
            html = html & "<table  border=1 width=100% cellspacing=10 cellpadding=0 bordercolor=#F7F7F7>"
  
            While Not rsTop.EOF
                If inRow = 0 Then html = html & "<tr>"
                
                html = html & "<td>"
      
                inRow = inRow + 1
                Call makeProductPageSmall(rsTop("ArtNr").Value, "")
                rsTop.moveNext()
         
                html = html & "</td>"
       
                If inRow > 2 Then ' 3 in a ROW
                    inRow = 0
         
                    html = html & "</tr>"
         
                End If
            End While
     
            html = html & "</tr>"
            html = html & "</table></center>"
 
        End If
        rsTop.close()
        Response.Write(html)
    End Sub
</script>


<script language="VB" runat="server">  
    '*************************************************************************
    ' printAddress
    ' addressType = "LI","AR", "" basis
    ' showMessages BOOLEAN
    '*************************************************************************
    Function printAddressLieferant(ByVal idnr As Long) As String
        Dim rsKUND
        Dim sql As String
        Dim html As String
        Dim message As String = ""

        sql = "Select * from lieferantenAdressen where IDNR=" & idnr
        rsKUND = objConnectionExecute(sql)

        'Response.Write showMessages
        If rsKUND.EOF Then
            printAddressLieferant = "Error" : Exit Function
        End If

        Dim PLZ, Ort, Landname
        PLZ = TableValue("grPLZ", "IDNR", rsKUND("PLZ").Value, "PLZ")
        Ort = TableValue("grPLZ", "IDNR", rsKUND("PLZ").Value, "Ort")
        Landname = TableValue("grLand", "IdNr", rsKUND("Land").Value, "Name")

        html = ""
        If Trim(rsKUND("Firma").Value) <> "" Then
            html = html & rsKUND("Firma").Value & "<br />"
        End If
        html = html & rsKUND("Anrede").Value & " " & rsKUND("Name1").Value & " " & rsKUND("Name").Value & "<br />"
        html = html & rsKUND("Adresse").Value & " <br />"
        html = html & PLZ & "-" & Ort & " <br />"
        html = html & Landname & " <br />"
        html = html & "Mobil:" & rsKUND("Mobil").Value & " <br />"
        html = html & "Tel:" & rsKUND("Tel").Value & " <br />"
        html = html & "Fax:" & rsKUND("Fax").Value & " <br />"
        html = html & "Email:<a href='mailto:" & rsKUND("Email") & "'>" & rsKUND("Email").Value & "</a><br />"
        html = html & "Web:<a href='" & rsKUND("Web").Value & "'>" & rsKUND("Web").Value & "</a><br />"

        printAddressLieferant = html
    End Function

    '===============================================================================
    ' creates list with all lieferants of the products in the database 
    ' additional parameter
    ' branche

    Sub makeMerchantManufacturerList(ByVal showHersteller)
        Dim html As String
        
        'add parameter 
        Dim branche : branche = Request("branche")
        'response.Write "branche =" & branche
        Dim nurAktiveProdukteZeigen : nurAktiveProdukteZeigen = True


        Dim sql, rs
        If showHersteller Then
            sql = "SELECT IDNR, Firma, Web, Count(ArtNr) AS [ProduktAnzahl] " & _
            "FROM grArtikel INNER JOIN lieferantenAdressen ON grArtikel.herstellerNR = lieferantenAdressen.IDNR " & _
            "where " & DEFAULT_PRODUCT_SEARCH_WHERE
 
        Else
            sql = "SELECT IDNR, Firma, Web, Count(grArtikel.ArtNr) AS [ProduktAnzahl] " & _
            " FROM grArtikel, lieferantenAdressen, [lieferantenArtikel-Preise] " & _
            " WHERE  grArtikel.artNR = [lieferantenArtikel-Preise].ArtikelNr " & _
            " AND lieferantenAdressen.IDNR = [lieferantenArtikel-Preise].LieferantNr " & _
            " AND IDNR in (select lieferantNr from pricecomparehaendler where isActive=-1) " & _
            " AND " & DEFAULT_PRODUCT_SEARCH_WHERE

        End If
        
        
        If IsNumeric(branche & "") Then
            If showHersteller Then
                sql = sql & " AND herstellerNr in (select idnr from ofAdressen where branche=" & branche & ")"
            Else
                sql = sql & " AND lieferantenNr in (select idnr from ofAdressen where branche=" & branche & ")"
            End If
        End If
        
        
        sql = sql & " GROUP BY IDNR, Firma, Web " & _
        " HAVING (Count(ArtNr))>0 " & _
        " ORDER BY Firma"
        
        rs = objConnectionExecute(sql)
        
        html = html & "<table width='100%' border='0' cellspacing='0' cellpadding='3' ID='Table1'>"
        html = html & "<tr bgcolor=#dddddd>"
        html = html & "<th width='200'>"
        If showHersteller Then
            html = html & getTranslation("Hersteller")
        Else
            html = html & getTranslation("H&auml;ndler")
        End If
        
        html = html & "</th>"
        html = html & "<th width='100'>" & getTranslation("Produktanzahl") & "</th>"
        html = html & "<th width='200'>" & getTranslation("Aktion") & "</th>"
        html = html & "<th>" & getTranslation("Webadresse") & "</th>"
        html = html & "</tr>"
 
        Dim rowColor
        While Not rs.EOF
            If rowColor = "#F7F7F7" Then
                rowColor = "#FFFFFF"
            Else
                rowColor = "#F7F7F7"
            End If
 
            html = html & "<tr>"
            html = html & "<td bgcolor='" & rowColor & "'>"
            If showHersteller Then
                html = html & makeManufacturerView(rs("idnr").Value)
            Else 'Lieferant
                html = html & makeMerchantView(rs("idnr").Value)
            End If
 
            html = html & "</td>"
            html = html & "<td bgcolor='" & rowColor & "'><p align='right'>" & rs("Produktanzahl").Value & "</td>"
            html = html & "<td bgcolor='" & rowColor & "'><a href='default.aspx?pageToShow=" & iff(showHersteller, "Manufacturer", "Merchant") & "Products&idnr=" & rs("IdNR").Value & _
            ">[" & getTranslation("als Ergebnisliste") & "]</a> oder"
            html = html & "<br /><a href='default.aspx?pageToShow=ProductMap&" & iff(showHersteller, "Manufacturer", "Merchant") & "=" & rs("Firma").Value & _
            ">[" & getTranslation("in Kategoriebaum") & "]</a></p></td>"
            html = html & "<td bgcolor='" & rowColor & "'><p align='center'><a href='" & rs("Web").Value & "'>" & rs("Web").Value & "</p></td>"
            html = html & "</tr>"
 
            rs.MoveNext()
        End While
        rs.close()
       
        html = html & "</table>"
 
        
        Response.Write(html)
    End Sub


    ''' <summary>
    ''' IIF Wrapper 
    ''' </summary>
    ''' <param name="cond"></param>
    ''' <param name="t1"></param>
    ''' <param name="t2"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function iff(ByVal cond As Boolean, ByVal t1 As String, ByVal t2 As String) As String
        If cond Then
            iff = t1
        Else
            iff = t2
        End If
    End Function
    
</script>


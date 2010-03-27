<script language="VB" runat="server">  

''' <summary>
''' creates form for product comparisment 
''' </summary>
''' <param name="ArtNr1"></param>
''' <returns></returns>
''' <remarks></remarks>
    Function compareProductsSelectForm(ByVal ArtNr1)
        Dim html As String
        Const COUNT_CHARS_TO_COMPARE as Integer = 30
        html = "<form action=""default.aspx?pageToShow=compareTwoProducts"">"
        html = html + "<input name=""artNr1"" type=""hidden"" value=""" & ArtNr1 & """>"
        html = html + "<input name=""pageToShow"" type=""hidden"" value=""compareTwoProducts"">"
        Dim sql As String, rs
        sql = "Select artNr, Bezeichnung from grArtikel where ArtNr <> " & ArtNr1 & _
              " AND produktAktiv<>0 and ArtKatNR in (Select  ArtKatNR from grArtikel where ArtNr = " & ArtNr1 & ") " & _
              " ORDER BY Bezeichnung"
        rs = objConnectionExecute(sql)
 
        html = html & "vergleichen mit <select name=""ArtNr2"">"
        Dim compareWithName As String 
        
        While Not rs.EOF
            compareWithName = rs("Bezeichnung").Value 
   
            If Len(compareWithName) > COUNT_CHARS_TO_COMPARE Then
                compareWithName = Left(compareWithName, COUNT_CHARS_TO_COMPARE) & " ..."
            End If
       
            html = html & "<option value=""" & rs("ArtNr").Value     & """>" & compareWithName
            rs.moveNExt()
        End While
 
        html = html & "</select>"
        html = html & "<input type=""submit"" value=""go"">"
        html = html & "</form>"

        compareProductsSelectForm = html
    End Function

    ''' <summary>
    ''' compareTwoProducts
    ''' </summary>
    ''' <param name="ArtNr1"></param>
    ''' <param name="ArtNr2"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function compareTwoProducts(ByVal ArtNr1, ByVal ArtNr2)
        Dim prodArray(1)
        Response.Write(ArtNr1 & "-" & ArtNr2)
        prodArray(0) = ArtNr1
        prodArray(1) = ArtNr2
 
        Response.Write(compareProducts(prodArray))
    End Function

    ''' <summary>
    ''' compareManyProducts
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function compareManyProducts()
        'Response.Write request("artNrToCompare") & "<br>"
        Dim arraySize : arraySize = UBound(Split(Request("artNrToCompare"), ","))
        Dim prodArray()
        ReDim prodArray(CInt(arraySize))
        Dim artNr, i : i = 0
        For Each artNr In Split(Request("artNrToCompare"), ",")
            prodArray(i) = artNr
            i = i + 1
        Next
        Response.Write(compareProducts(prodArray))
    End Function


    ''' <summary>
    ''' ArtNrArray -  array with product numbers 
    ''' </summary>
    ''' <param name="ArtNrArray"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function compareProducts(ByVal ArtNrArray)
        Dim thProps : thProps = " width=""200"" bgcolor=""#C0C0C0"" "
        Dim artKatNR, artNr, i
        Dim allCompareFeaturesAreEmpty

 
        If UBound(ArtNrArray) < 1 Then
            Response.Write("<p class=""error"">" & getTranslation("Sie muessen zwei oder mehrere Produkte auswaehlen um ein Vergleich machen zu koennen!") & "</p>")
            Exit Function
        End If
        artKatNR = tableValue("grArtikel", "ArtNR", ArtNrArray(1), "ArtKatNR")
 
        Dim tableWidth As Integer : tableWidth = 200 + 200 * (UBound(ArtNrArray) + 1)
        Response.Write("<table width=""" & tableWidth & """ border=0>")
        Response.Write("<tr>")
        Response.Write("<th " & thProps & ">Feature</th>")
        i = 0
        For Each artNr In ArtNrArray
            i = i + 1
            Response.Write("<th " & thProps & ">" & getTranslation("Produkt") & " " & i & "</th>")
        Next
        Response.Write("</tr>")
        Response.Write("<tr><th " & thProps & ">" & getTranslation("Bezeichnung") & "</th>")
        For Each artNr In ArtNrArray
            Response.Write("<td><a href=""default.aspx?artNr=" & artNr & """>" & tableValue("grArtikel", "ArtNR", artNr, "Bezeichnung") & "</a></td>")
        Next
        Response.Write("</tr>")


        Response.Write("<tr><th " & thProps & ">" & getTranslation("Hersteller") & "</th>")
        For Each artNr In ArtNrArray
            Response.Write("<td>" & tableValue("lieferantenAdressen", "idnr", tableValue("grArtikel", "ArtNR", artNr, "herstellerNr"), "Firma") & "</td>")
        Next
        Response.Write("</tr>")
  
 
        Response.Write("<tr><th " & thProps & ">" & getTranslation("Lagerinfo") & "</th>")
        For Each artNr In ArtNrArray
            'Response.Write "<td>" & tableValue("grArtikel","ArtNR",artnr,"Bezeichnung1")& "</td>"
            Response.Write("<td>" & getLieferantLagerInfo(artNr) & "</td>")
        Next
        Response.Write("</tr>")


        Response.Write("<tr><th " & thProps & ">" & getTranslation("Preis") & "</th>")
        Dim preis
        Dim mwst
        For Each artNr In ArtNrArray
            mwst = tableValue("grArtikel", "ArtNR", artNr, "MWST")
            preis = makeBruttoPreis(getPreis(getLOGIN(), artNr, 1), mwst, Session("Land"))
            Response.Write("<td align=left><b>" & FormatNumber(preis, 2) & "</b></td>")
        Next
        Response.Write(" </tr>")
 

        'compare the keywords 
        Dim sql, rs
        sql = "SELECT KeywordID, Name " & _
        " FROM [grArtikel-KeyWords] " & _
        " WHERE " & makeArtKatNrInPartParentCats("ArtKatNr", artKatNR, 5)
        '" WHERE ArtKatNr=" & ArtKatNR  '& _ 
        '" ORDER BY [grArtikel-KeyWords].[Order]"


        'response.write sql
        rs = objConnectionExecute(sql)
        Dim keywordId, kwCurrent
        Dim kwHTML : kwHTML = ""
 
        While Not rs.EOF
            keywordId = rs("keywordId")
            allCompareFeaturesAreEmpty = True
     
            kwHTML = "<tr>"
            kwHTML = kwHTML & "<th " & thProps & ">" & Server.HtmlEncode(rs("Name") & "") & "</th>"
            For Each artNr In ArtNrArray
                kwHTML = kwHTML & "<td>"
                kwCurrent = getKeyWord(keywordId, artNr)
                kwHTML = kwHTML & kwCurrent
                kwHTML = kwHTML & "</td>"
						
                If Len(kwCurrent) > 1 Then allCompareFeaturesAreEmpty = False ' somthing to show 
            Next
				
            kwHTML = kwHTML & "</tr>"
		
            If Not allCompareFeaturesAreEmpty Then
                Response.Write(kwHTML)
            End If
		    
            rs.moveNExt()
        End While
 
        'IMAGE 
        Response.Write("<tr><th " & thProps & ">" & getTranslation("Bild") & "</th>")
        For Each artNr In ArtNrArray
            Response.Write("<td>" & makeimgTag(tableValue("grArtikel", "ArtNR", artNr, "picture"), tableValue("grArtikel", "ArtNR", artNr, "Bezeichnung"), 200) & "</td>")
        Next
        Response.Write("</tr>")

        'BESCHREIBOUNG
        Response.Write("<tr><th " & thProps & ">" & getTranslation("Beschreibung") & "</th>")
        For Each artNr In ArtNrArray
            Response.Write("<td>" & tableValue("grArtikel", "ArtNR", artNr, "Beschreibung") & "</td>")
        Next
        Response.Write("</tr>")
        Response.Write("</table>")
    End Function

    'help function for compareProducts function 
    Function getKeyWord(ByVal keywordId, ByVal ArtNr)
        Dim sql, rs
        sql = "select * from [grArtikel-KeywordsToProducts] where ArtNr=" & ArtNr & "  AND  KeywordId = " & keywordId
        rs = objConnectionExecute(sql)
        If Not rs.EOF Then
            getKeyWord = rs("Value")
        Else
            getKeyWord = ""
        End If
        rs.close()
    End Function
</script>


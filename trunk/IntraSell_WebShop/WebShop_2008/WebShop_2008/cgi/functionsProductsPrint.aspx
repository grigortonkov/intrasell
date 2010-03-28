<script language="VB" runat="server">  
'===============================================================================
' creates form for product print
' NOT IN USE 
    '===============================================================================
    
    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="ArtNr1"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function printProductsSelectForm(ByVal ArtNr1) As String
        Dim html As String
        Const COUNT_CHARS_TO_COMPARE = 30
        html = "<form action=""default.aspx?pageToShow=compareTwoProducts"">"
        html = html + "<input name=""artNr1"" type=""hidden"" value=""" & ArtNr1 & """>"
        html = html + "<input name=""pageToShow"" type=""hidden"" value=""compareTwoProducts"">"
        Dim sql As String, rs
        sql = "Select artNr, Bezeichnung from grArtikel where ArtNr <> " & ArtNr1 & _
              " AND ArtKatNR in (Select  ArtKatNR from grArtikel where ArtNr = " & ArtNr1 & ") ORDER BY Bezeichnung"
        rs = objConnectionExecute(sql)
 
        html = html & "vergleichen mit <select name=""ArtNr2"">"
        Dim compareWithName
        While Not rs.EOF
            compareWithName = rs("Bezeichnung").Value
   
            If Len(compareWithName) > COUNT_CHARS_TO_COMPARE Then
                compareWithName = Left(compareWithName, COUNT_CHARS_TO_COMPARE) & " ..."
            End If
       
            html = html & "<option value=""" & rs("ArtNr").Value & """>" & compareWithName
            rs.moveNExt()
        End While
 
        html = html & "</select>"
        html = html & "<input type=""submit"" value=""go"">"
        html = html & "</form>"

        printProductsSelectForm = html
    End Function

 
'===============================================================================
' print an array of ArtNrToCompare Parameters
'===============================================================================
    Function printManyProducts()
        'Response.Write request("artNrToCompare") & "<br>"
        Dim arraySize : arraySize = UBound(Split(Request("artNrToCompare"), ","))
        Dim prodArray()
        ReDim prodArray(CInt(arraySize))
        Dim artNr, i : i = 0
        For Each artNr In Split(Request("artNrToCompare"), ",")
            prodArray(i) = artNr
            i = i + 1
            Response.Write(makeProductPage(artNr, "_print"))
        Next
     
        If i = 0 Then
            Call drawErrorBox("Keine Auswahl!", getTranslation("Bitte Produkte von der Liste waehlen!"), "", "")
        End If
    End Function

</script>
<script language="VB" runat="server">  


    Const NAME_FOR_GUTSCHEIN_PRODUCT = "CALCULATE_GUTSCHEIN"


    ''' <summary>
    ''' getArtNrForGutschein
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getArtNrForGutschein()
        Dim sql, rs
        sql = "select artnr from grArtikel where bezeichnung like '" & NAME_FOR_GUTSCHEIN_PRODUCT & "'"
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            getArtNrForGutschein = rs("Artnr").Value
        Else
            getArtNrForGutschein = ""
        End If
        rs.close()
        rs = Nothing
    End Function


    ''' <summary>
    ''' getPreisForGutschein
    ''' </summary>
    ''' <param name="gutscheinNummer"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getPreisForGutschein(ByVal gutscheinNummer)
        Dim sql, rs
        sql = "select Summe from buchGutschein where Nummer like '" & gutscheinNummer & "'"
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            getPreisForGutschein = rs("Summe").Value
        Else
            getPreisForGutschein = 0
        End If
        rs.close()
        rs = Nothing
    End Function


    ''' <summary>
    ''' setGutscheinState
    ''' </summary>
    ''' <param name="gutscheinNummer"></param>
    ''' <param name="newState"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function setGutscheinState(ByVal gutscheinNummer, ByVal newState)
        Dim sql As String
        sql = "update buchGutschein set status = '" & newState & "' where Nummer like '" & gutscheinNummer & "'"
        objConnectionExecute(sql)
    End Function

</script>


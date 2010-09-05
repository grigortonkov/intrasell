<script language="VB" runat="server">  

''' <summary>
''' getTranslationDok
''' </summary>
''' <param name="TableName"></param>
''' <param name="Key"></param>
''' <param name="FieldName"></param>
''' <param name="TextToTranslate"></param>
''' <param name="Language_Code"></param>
''' <returns></returns>
''' <remarks></remarks>
    Public Function getTranslationDok( _
                             ByVal TableName As String, _
                             ByVal Key as String, _
                             ByVal FieldName as String , _
                             ByVal TextToTranslate As String , _
                             ByVal Language_Code As String)
        If showDebug() Then
            Response.Write("<br>" & Chr(13) & " TableName = [" & TableName & "]")
            Response.Write("<br>" & Chr(13) & " Key = [" & Key & "]")
            Response.Write("<br>" & Chr(13) & " FieldName = [" & FieldName & "]")
            Response.Write("<br>" & Chr(13) & " TextToTranslate = [" & TextToTranslate & "]")
            Response.Write("<br>" & Chr(13) & " Language_Code = [" & Language_Code & "]")
        End If
        If (TextToTranslate & "" = "") Then
            getTranslationDok = ""
        Else
            Try 
                getTranslationDok = IntraSellDictionary().getTranslationDok(TableName, Key, FieldName, TextToTranslate, Language_Code)
            Catch ex As Exception 
                getTranslationDok = "Error in getTranslationDok:" + ex.Message
            End Try
        End If
    End Function


    Public Function makeLanguageSelectionBar()
        Dim html
        html = ""
        html = html + "<a href='default.aspx?language=DEU'>Deutsch</a>&nbsp"
        html = html + "<a href='default.aspx?language=ENG'>English</a>&nbsp"
        makeLanguageSelectionBar = html
    End Function
</script>


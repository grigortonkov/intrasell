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
    
    Public Function getTranslationDok(ByVal TableName As String, _
                         ByVal Key As String, _
                         ByVal FieldName As String, _
                         ByVal TextToTranslate As String, _
                         ByVal Language_Code As String) As String
        
        Dim temp As String
        Dim CACHE_NAME As String = "VARVALUE_" & TableName & "_" & Key & "_" & FieldName & "_" & TextToTranslate & "_" & Language_Code
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, getTranslationDok_NoCache(TableName, Key, FieldName, TextToTranslate, Language_Code))
        End If
        
        Return temp
        
    End Function
    
    Public Function getTranslationDok_NoCache( _
                             ByVal TableName As String, _
                             ByVal Key As String, _
                             ByVal FieldName As String, _
                             ByVal TextToTranslate As String, _
                             ByVal Language_Code As String) As String
        If showDebug() Then
            Response.Write("<br />" & Chr(13) & " TableName = [" & TableName & "]")
            Response.Write("<br />" & Chr(13) & " Key = [" & Key & "]")
            Response.Write("<br />" & Chr(13) & " FieldName = [" & FieldName & "]")
            Response.Write("<br />" & Chr(13) & " TextToTranslate = [" & TextToTranslate & "]")
            Response.Write("<br />" & Chr(13) & " Language_Code = [" & Language_Code & "]")
        End If
        If (TextToTranslate & "" = "") Then
            getTranslationDok_NoCache = ""
        Else
            Try
                getTranslationDok_NoCache = IntraSellDictionary().getTranslationDok(TableName, Key, FieldName, TextToTranslate, Language_Code)
            Catch ex As Exception
                getTranslationDok_NoCache = "Error in getTranslationDok:" + ex.Message
            End Try
        End If
    End Function


    Public Function makeLanguageSelectionBar() As String
        Dim html As String
        html = ""
        html = html + "<a href='default.aspx?language=DEU'>Deutsch</a>&nbsp"
        html = html + "<a href='default.aspx?language=ENG'>English</a>&nbsp"
        makeLanguageSelectionBar = html
    End Function
</script>
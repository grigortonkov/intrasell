<script language="VB" runat="server"> 
    ''' <summary>
    ''' writeLog
    ''' </summary>
    ''' <param name="filename"></param>
    ''' <param name="logline"></param>
    ''' <remarks></remarks>
    Sub writeLog(ByVal filename As String, ByVal logline As String)
        Const USE_LOGING = True
        ' on error resume next 
        If USE_LOGING Then
            Dim fs, exportFile
            Dim loglineHeader
            loglineHeader = Now() & "; " & Request.ServerVariables("REMOTE_ADDR") & "; "
   		
            fs = CreateObject("Scripting.FileSystemObject")
            filename = Server.MapPath("\logfiles") + "\" & filename
   		
            If Request("debug") = "true" Then
                Response.Write("Export to: " & filename)
                Response.Flush()
            End If
   		
            If FileExists(filename) Then
                exportFile = fs.OpenTextFile(filename, 8) ' For appending
            Else
                exportFile = fs.CreateTextFile(filename, False)
            End If
            exportFile.WriteLine(loglineHeader & logline)
            exportFile.Close()
        End If

        If Err.Number > 0 Then
            Response.Write("Fehler:" & Err.Description)
            Err.Clear()
        End If

        On Error GoTo 0
    End Sub


    ''' <summary>
    ''' writeFile
    ''' </summary>
    ''' <param name="filename"></param>
    ''' <param name="content"></param>
    ''' <remarks></remarks>
    Sub writeFile(ByVal filename, ByVal content)
        ' on error resume next 

        Dim fs, exportFile

        fs = CreateObject("Scripting.FileSystemObject")
        filename = Server.MapPath("\logfiles") + "\" & filename
        If showDebug() Then Response.Write("Export to: " & filename) : Response.Flush()
   		
        If FileExists(filename) Then
            DeleteFile(filename)
        End If

        exportFile = fs.CreateTextFile(filename, False)

   		
        exportFile.Write(content)
        exportFile.Close()
 
        If Err.Number > 0 Then
            Response.Write("Fehler:" & Err.Description)
            Err.Clear()
        End If

        On Error GoTo 0

    End Sub

    
    ''' <summary>
    ''' Function makeLogEntry
    ''' </summary>
    ''' <param name="ArtNR"></param>
    ''' <param name="LieferantNR"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeLogEntry(ByVal ArtNR, ByVal LieferantNR)
        Dim sql, rs
        sql = " INSERT INTO priceComparePriceClicks (ArtNr, LieferantNr, ArtikelPreis, [Timestamp] , ArtikelLagerinfo,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER,HTTP_REFERER) " & _
              " select ArtikelNR, lieferantNR, EKpreis, " & TOSQLDATE(Date.Today) & " ,LagerInfo " & _
               ",'" & Request.ServerVariables("REMOTE_ADDR") & " ','" & _
          Request.ServerVariables("REMOTE_HOST") & "','" & _
          Request.ServerVariables("REMOTE_USER") & "','" & _
             Request.ServerVariables("HTTP_REFERER") & "'" & _
              " FROM [lieferantenArtikel-Preise] where LieferantNr=" & LieferantNR & " and ArtikelNr = " & ArtNR
          
        'response.Write sql: response.Flush
        ObjConnectionExecute(sql)
          
    End Function
    
</script>


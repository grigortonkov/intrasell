<script language="VB" runat="server">   
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================

    '******************************************************************************
    ' createSession - function 
    ' needs the table webSessions in the database
    '******************************************************************************
    Function createSession()
        Dim sid
	
        ''hidden because shown before html tag response.Write "<!--" 'start html kommentar um ev. getSID errors zu verstecken 
        sid = getSID()
        ''hidden because shown before html tag response.Write "-->" 
        If sid = "" Then 'generate new
            createSession = createNewSession()
        End If
    End Function

    Function createNewSession() As String
        Dim sid, SQL
        sid = NextId("webSessions", "SID")
        SQL = "Insert Into webSessions (SID, IP, CreationDate, CreationTime) Values " & _
              "(" & sid & ",'" & Request.ServerVariables("REMOTE_HOST") & "'," & SQLNOW(0) & "," & SQLNOW(0) & ")"
        objConnectionExecute(SQL)
        Session("SID") = sid
        createNewSession = sid
    End Function

    '******************************************************************************
    ' returns session id according the set session or by the IP adress
    '******************************************************************************
    Function getSID() As String
        Dim sql As String
        Dim sid
        If Session("SID") <> "" Then
            sid = Session("SID")
        Else
            Dim rs
            'Get one sesssion if ip matches in the 10 minutes last
            sql = "Select SID from webSessions " & _
                  " where CreationTime>=(" & SQLNOW(-10 * 1 / (24 * 60)) & ") and IP Like '" & _
                  Request.ServerVariables("REMOTE_HOST") & "' " & _
                  " and loggedOut=0 " & _
                  " ORDER BY creationDate DESC"
            'Response.Write sql:Response.Flush
            rs = objConnectionExecute(sql)
            If Not rs.EOF Then
                sid = rs("SID")
                If showDebug() Then Response.Write("<br><font color=red>Your Session is " & rs("SID") & "!</font>")
            Else
                If showDebug() Then Response.Write("<font color=red>Your Session is wrong! Please activate the cookies!</font>")
            End If
            rs.close()
            rs = Nothing
        End If
  
        'set last time
        If sid <> "" Then
            sql = "UPDATE webSessions SET lastregisteredTime = " & SQLNOW(0) & " WHERE SID=" & sid
            objConnectionExecute(sql)
        End If
        getSID = sid
    End Function


    '******************************************************************************
    ' returns logged client id according the set session or by the IP adress
    '******************************************************************************
    Function getLOGIN()
        Const LOG_IN = "LOG_IN"
 
        If Session(LOG_IN) <> "" Then
            getLOGIN = Session(LOG_IN)
        Else
            Dim sql, rs
            sql = "Select sid, kundenIdnr, ip from webSessions where CreationTime>=(" & SQLNOW(-0.05) & ") and IP Like '" & _
                  Request.ServerVariables("REMOTE_HOST") & "' ORDER BY creationDate DESC"
            'Response.Write sql
            rs = objConnectionExecute(sql)
            If Not rs.eOF Then
                If rs("kundenIdnr") > 0 Then 'do not return 0 
                    getLOGIN = rs("kundenIdnr")
                End If
                If showDebug() Then Response.Write("<font color=red>Your Session is " & rs("SID") & "!</font>")
            Else
                If showDebug() Then Response.Write("<font color=red>Your Session is wrong! Please activate the cookies!</font>")
            End If
            rs.close()
            rs = Nothing
        End If
     
    End Function

    Sub LogOut()
        ObjconnectionExecute("update webSessions set loggedOut=-1 where SID=" & getSID())
        Session("LOG_IN") = ""
        Session("SID") = ""
    End Sub
</script>


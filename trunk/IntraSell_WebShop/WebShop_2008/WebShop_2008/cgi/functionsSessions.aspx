<script language="VB" runat="server">   
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================

''' <summary>
''' createSession - function, needs the table webSessions in the database
''' </summary>
''' <returns></returns>
''' <remarks></remarks>
    Function createSession()
        Dim sid
	
        ''hidden because shown before html tag response.Write "<!--" 'start html kommentar um ev. getSID errors zu verstecken 
        sid = getSID()
        ''hidden because shown before html tag response.Write "-->" 
        If sid = "" Then 'generate new
            createSession = createNewSession()
        End If
    End Function

''' <summary>
''' createNewSession
''' </summary>
''' <returns></returns>
''' <remarks></remarks>
    Function createNewSession() As String
        Dim sid, SQL
        sid = NextId("webSessions", "SID")
        SQL = "Insert Into webSessions (SID, IP, CreationDate, CreationTime) Values " & _
              "(" & sid & ",'" & Request.ServerVariables("REMOTE_HOST") & "'," & SQLNOW(0) & "," & SQLNOW(0) & ")"
        objConnectionExecute(SQL)
        Session("SID") = sid
        createNewSession = sid
    End Function

    ''' <summary>
    ''' returns session id according the set session or by the IP adress
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getSID() As String
        Dim sql As String
        Dim sid
        Dim remoteHost As String = Request.ServerVariables("REMOTE_HOST")
        
        If Not Session("SID") Is Nothing Then
            sid = Session("SID")
        Else
            Dim rs
            'Get one sesssion if ip matches in the 10 minutes last
            sql = "Select SID from webSessions " & _
                  " where CreationTime>=(" & SQLNOW(-10 * 1 / (24 * 60)) & ") and IP Like '" & _
                  remoteHost & "' " & _
                  " and loggedOut=0 " & _
                  " ORDER BY creationDate DESC"
            'Response.Write sql:Response.Flush
            rs = objConnectionExecute(sql)
            If Not rs.EOF Then
                sid = rs("SID").Value
                If showDebug() Then Response.Write("<br/><font color=red>Your Session is " & rs("SID").Value & "!</font>")
            Else
                If showDebug() Then Response.Write("<br/><font color=red>Your Session is wrong! Please activate the cookies!</font>")
            End If
            rs.close()
            rs = Nothing
        End If
  
        'set last time
        If Not sid Is Nothing Then
            sql = "UPDATE webSessions SET lastregisteredTime = " & SQLNOW(0) & " WHERE SID=" & sid
            objConnectionExecute(sql)
        End If
        getSID = sid
    End Function


    ''' <summary>
    ''' returns logged client id according the set session or by the IP adress
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getLOGIN() As String
        Const LOG_IN = "LOG_IN"
        Dim remoteHost As String = Request.ServerVariables("REMOTE_HOST")
        If not Session(LOG_IN) is Nothing  then 
            If  Session(LOG_IN).ToString <> "" Then
                getLOGIN = Session(LOG_IN)
            End If 
        Else
            Dim sql, rs
            sql = "Select sid, kundenIdnr, ip from webSessions where CreationTime>=(" & SQLNOW(-0.05) & ") and IP Like '" & _
                  remoteHost & "' ORDER BY creationDate DESC"
            'Response.Write sql
            rs = objConnectionExecute(sql)
            If Not rs.eOF Then
                If rs("kundenIdnr").Value.ToString() <> "" Then 'do not return 0 
                    getLOGIN = rs("kundenIdnr").Value
                End If
                If showDebug() Then Response.Write("<font color=red>Your Session is " & rs("SID").Value & "!</font>")
            Else
                If showDebug() Then Response.Write("<font color=red>Your Session is wrong! Please activate the cookies!</font>")
            End If
            rs.close()
            rs = Nothing
        End If
     
    End Function

    ''' <summary>
    ''' LogOut
    ''' </summary>
    ''' <remarks></remarks>
    Sub LogOut()
        ObjconnectionExecute("update webSessions set loggedOut=-1 where SID=" & getSID())
        Session("LOG_IN") = ""
        Session("SID") = ""
    End Sub
</script>


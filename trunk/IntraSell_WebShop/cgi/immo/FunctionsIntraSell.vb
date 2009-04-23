Public Class FunctionsIntraSell
    Public objConnection As Microsoft.Data.Odbc.OdbcConnection
    Public command As Microsoft.Data.Odbc.OdbcCommand
    Dim db As IntraSellDB


    '*************************************************************************
    'AUTHENITFICATION
    ' Sets the session vars LOG_IN and LAND
    ' returns the IDNR of client if auth okay
    'returns "" if not ok 
    '*************************************************************************
    Function authenticate(ByVal Email As String, ByVal Password As String) As String
        objConnection.Open()
        db = New IntraSellDB() : db.objConnection = Me.objConnection
        'Find Client 
        Email = Trim(Left(Email, 50))
        Password = Trim(Left(Password, 16))
        Dim sql As String = "SELECT idnr from ofAdressen Where Status<>'Neu' and Email Like '" & Email & "' AND Passwort Like '" & Password & "'"
        Dim rsP As Microsoft.Data.Odbc.OdbcDataReader = command.ExecuteReader()

        If Not rsP.Read() Then
            authenticate = ""
            Exit Function
        End If
        authenticate = rsP("IDNR")
        'Session("LOG_IN") = authenticate
        'Session("LAND") = getClientLand(authenticate) 
        'Session("LAND") = getClientDestinationLand(authenticate)
        'update session
        'SQL = "update webSessions set kundenIdnr=" & rsP("IDNR") & " where SID=" & getSid()
        'db.ObjConnectionExecute(SQL)
        rsP.Close()
    End Function
End Class

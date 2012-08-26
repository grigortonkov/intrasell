Option Strict On
Option Explicit On

Imports MySql.Data.MySqlClient

Public Class IntraSellKunden



    Public CurrentDB As MySqlConnection
    Private vars As IntraSellVars
    'for compatibility reasons
    Const dbOpenDynaset = 0



    Public Sub init(ByVal connString As String)

        If Not FunctionsDB.CurrentDB.State = ConnectionState.Open Then
            FunctionsDB.CurrentDB.ConnectionString = connString '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
            FunctionsDB.connOpen()
        End If

        vars = New IntraSellVars
        vars.init(connString)

    End Sub

    Public Sub destroy()
        FunctionsDB.connClose()

        vars.destroy()
        vars = Nothing

    End Sub

 

    'checks if the user needs mwst in the rechnung according the kundengruppe
    Public Function needsMWST(ByVal IdNr As Integer) As Boolean
        needsMWST = True

        Dim rs As MySqlDataReader
        Dim sql As String
        sql = "select * from [ofAdressen-Settings] where Idnr=" & IdNr & " AND Kundengruppe in " & _
              " (select Gruppe from [ofAdressen-KundenGruppen] Where RechungenMitMWST=0)"
        rs = openRecordset(sql)
        If Not rs.Read Then
            needsMWST = True
        Else
            needsMWST = False
        End If
        rs.Close()
        rs = Nothing

    End Function



    Public Function calculateUmsatzKunde(ByVal IdNr As Integer) As Double
        'If IdNr Is Nothing Then calculateUmsatzKunde = 0 : Exit Function
        Dim rs As MySqlDataReader, sql As String
        sql = " SELECT buchRechnung.KundNr, Sum([PreisATS]*[stk]) AS UmsatzKunde" & _
              " FROM buchRechnung LEFT JOIN [buchRech-Artikel] ON buchRechnung.Nummer = [buchRech-Artikel].RechNr " & _
              " WHERE buchRechnung.KundNr = " & IdNr & _
              " GROUP BY buchRechnung.KundNr"
        rs = openRecordset(sql)
        If Not rs.Read Then
            calculateUmsatzKunde = 0
        Else
            calculateUmsatzKunde = CDbl(rs("umsatzKunde"))
        End If

    End Function




End Class

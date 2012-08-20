Option Explicit On
Imports MySql.Data.MySqlClient

Public Class IntraSellKunden



    Public CurrentDB As MySqlConnection
    Private vars As IntraSellVars
    'for compatibility reasons
    Const dbOpenDynaset = 0



    Public Sub init(ByVal connString)

        FunctionsDB.ConnStringODBC = connString
        FunctionsDB.connOpen()
        CurrentDB = FunctionsDB.CurrentDB

        vars = New IntraSellVars
        vars.init(connString)

    End Sub

    Public Sub destroy()
        FunctionsDB.connClose()

        vars.destroy()
        vars = Nothing

    End Sub





    Public Function neueAdresse()

    End Function





    'checks if the user needs mwst in the rechnung according the kundengruppe
    Public Function needsMWST(ByVal IdNr As String) As Boolean
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



    Public Function calculateUmsatzKunde(ByVal IdNr As Long)
        If IsNull(IdNr) Then calculateUmsatzKunde = 0 : Exit Function
        Dim rs, sql
        sql = " SELECT buchRechnung.KundNr, Sum([PreisATS]*[stk]) AS UmsatzKunde" & _
              " FROM buchRechnung LEFT JOIN [buchRech-Artikel] ON buchRechnung.Nummer = [buchRech-Artikel].RechNr " & _
              " WHERE buchRechnung.KundNr = " & IdNr & _
              " GROUP BY buchRechnung.KundNr"
        rs = openRecordset(sql)
        If rs.EOF Then
            calculateUmsatzKunde = 0
        Else
            calculateUmsatzKunde = rs("umsatzKunde")
        End If

    End Function




End Class

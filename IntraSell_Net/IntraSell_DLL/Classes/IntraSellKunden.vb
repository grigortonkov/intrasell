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
              " FROM buchRechnung LEFT JOIN [buchRech-Artikel] ON buchRechnung.Nummer = [buchRech-Artikel].Nummer " & _
              " WHERE buchRechnung.KundNr = " & IdNr & _
              " GROUP BY buchRechnung.KundNr"
        rs = openRecordset(sql)
        If Not rs.Read Then
            calculateUmsatzKunde = 0
        Else
            calculateUmsatzKunde = CDbl(rs("umsatzKunde"))
        End If

    End Function

 

    'returns the idnr of the combiation PLZ/ORT/LAND
    Shared Function getPLZCreateIfNeeded(ByVal Land As String, ByVal Ort As String, ByVal PLZ As String) As String
        Dim LAND_PLZ_SEPARATOR As String = " "

        Dim NextIDNRPLZ, sql As String
        Dim rsPLZORT As MySqlDataReader
        sql = "SELECT * FROM grPLZ where PLZ='" & PLZ & "' AND Land =" & Land & " AND Ort Like '" & Left(Ort, 5) & "%'"
        rsPLZORT = openRecordset(sql)

        If Not rsPLZORT.Read Then 'save PLZ ORT 
            rsPLZORT.Close()
            If VarValue_Default("PLZ_IDNR_AUTONUMBER", "TRUE") = "TRUE" Then
                sql = " INSERT INTO grPLZ (PLZ ,Ort, Land) values ('" & PLZ & "' ,'" & Ort & "', " & Land & ")"
            Else 'PLZ_IDNR Field is not autonumber 
                'NextIDNRPLZ = NextID("grPLZ", "IDNR")
                'update am 26.12.2005 for PLZ Text field
                'update 07.03.2006 because PLZ 10000 is bigger than PLz 9999 but the text search is not sorting after number

                Dim sameKeyCnt As String = CStr(firstRow("select count(*) as cnt FROM grPLZ where PLZ='" & PLZ & "' AND Land =" & Land))
                If IsNumeric(sameKeyCnt) Then
                    If sameKeyCnt = "0" Then sameKeyCnt = ""
                    sql = " INSERT INTO grPLZ (IDNR, PLZ ,Ort, Land) values ('" & Land & LAND_PLZ_SEPARATOR & PLZ & sameKeyCnt & "', '" & PLZ & "', '" & Ort & "', " & Land & ")"
                Else
                    sql = " INSERT INTO grPLZ (IDNR, PLZ ,Ort, Land) values ('" & Land & LAND_PLZ_SEPARATOR & PLZ & "', '" & PLZ & "', '" & Ort & "', " & Land & ")"
                End If

            End If

            'Response.write SQL : Response.Flush
            RunSQL(sql)
            NextIDNRPLZ = getPLZCreateIfNeeded(Land, Ort, PLZ)
        Else
            NextIDNRPLZ = CStr(rsPLZORT("idnr"))
            rsPLZORT.Close()
        End If
        Return NextIDNRPLZ
    End Function


End Class

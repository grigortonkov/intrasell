Imports IntraSell_DLL

Module ModuleMahnwesen


    Public Const MAHNSTUFE_1 = "MAHNSTUFE_1"
    Public Const MAHNSTUFE_2 = "MAHNSTUFE_2"
    Public Const MAHNSTUFE_3 = "MAHNSTUFE_3"


    Public Function CalculateMahnStufe(ByVal RechNummer As String) As String

        Dim altTage As Integer
        Dim sql
        Dim rs As MySql.Data.MySqlClient.MySqlDataReader
        Dim countMahnungen
        Dim RechDatum As Date = (firstRow("select Datum from buchVorgang where Typ='AR' and Nummer = " & RechNummer))

        Dim Umsatz As Decimal = CDbl(firstRow("select SummeBrutto from buchVorgang where Typ='AR' and Nummer = " & RechNummer))


        sql = "select count(*) as countMahnungen from buchMahnungshistorie where nummer =" & RechNummer
        rs = openRecordset(sql)


        If Not rs.read Then
            countMahnungen = 0
        Else
            countMahnungen = rs("countmahnungen")
        End If
        CalculateMahnStufe = Nothing

        altTage = DateDiff(DateInterval.Day, RechDatum, Date.Today)
        If altTage >= 7 And countMahnungen = 0 Then
            CalculateMahnStufe = MAHNSTUFE_1
        End If

        If altTage >= 14 And countMahnungen = 1 Then
            CalculateMahnStufe = MAHNSTUFE_2
        End If


        If altTage >= 21 And countMahnungen = 2 Then
            CalculateMahnStufe = MAHNSTUFE_3
        End If

        rs.close()

    End Function


    ''' <summary>
    ''' die Mahnstufe wird gesetzt
    ''' </summary>
    ''' <param name="RechNummer"></param>
    ''' <param name="Stufe"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function SetzeMahnStufe(ByVal RechNummer As String, ByVal Stufe As String) As Boolean

        Dim ds As dsMahnungen = New dsMahnungen
        Dim r As dsMahnungen.buchmahnungshistorieRow = ds.buchmahnungshistorie.AddbuchmahnungshistorieRow("AR", RechNummer, Stufe, Today)
        Dim ta As dsMahnungenTableAdapters.buchmahnungshistorieTableAdapter = New dsMahnungenTableAdapters.buchmahnungshistorieTableAdapter
        ta.Update(ds)
        SetzeMahnStufe = True
    End Function




    'Private Sub btnMahnbriefeDrucken_Click()


    '    If Me.FilterOn Then
    '        Dim rs, sql
    '        rs = Me.RecordsetClone
    '        Dim Text



    '        While Not rs.EOF

    '            Text = Forms![MAhnwesen]![ofTextBausteine]![Text]

    '            If IsNull(Text) Or Text = "" Then
    '                MsgBox("Schreiben Sie den Mahntext vorher!", vbCritical)
    '                Exit Sub
    '            End If



    '            Text = Replace(Text, "[Umsatz]", rs("Summe"))
    '            Text = Replace(Text, "[Datum]", rs("Datum"))

    '         Call OpenKorrespondenz_inWord(rs("KundNr"), Me.lstMahnstufe, Text, Date, True)
    '            'set as gemahnt
    '            sql = "insert into buchMahnungshistorie (Nummer, MahnStufe) values (" & _
    '                    rs("Nummer") & ",'" & rs("Mahnstufe") & "')"
    '            DoCmd.SetWarnings(False)
    '            DoCmd.RunSQL(sql)
    '            DoCmd.SetWarnings(True)
    '            rs.MoveNext()
    '        End While
    '        rs.Close()
    '        rs = Nothing

    '    Else
    '        MsgBox("Wählen Sie eine Mahnstufe vorher aus!")
    '    End If

    '    Me.Requery()
    '    MsgBox("Die Mahnbriefe wurden an Word weitergeleitet, ausgedruckt und auch als Word Dateien gespeichert. Fertig!")
    'End Sub


End Module

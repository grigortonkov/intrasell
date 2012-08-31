Option Explicit On
Imports IntraSell_DLL


Module ModuleKassabuch

    '=================================================================
    ' fügt einen eintrag ins kassabuch
    '=================================================================
    Public Sub makeKassaBuchEintrag(ByVal Datum As Date, _
     ByVal Konto As String, _
     ByVal Beschreibung As String, _
     ByVal Betrag As Double)
        Dim betragfield = "BetragEingang"
        Dim sql As String

        If Betrag < 0 Then betragfield = "BetragAusgang"
        Betrag = Math.Abs(Betrag)

        sql = "INSERT INTO buchKassabuch (Datum, Konto, Beschreibung," & betragfield & ")  " & _
                   " Values (" & makeSQLDate(Datum) & ",'" & Konto & "','" & Beschreibung & "'," & Replace(Betrag, ",", ".") & ")"

        Call writeLog("TRY " & sql)
        RunSQL(sql)
        Call writeLog("DONE " & sql) 
    End Sub


End Module

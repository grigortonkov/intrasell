Attribute VB_Name = "moduleKassabuch"
Option Compare Database
'=================================================================
' fügt einen eintrag ins kassabuch
'=================================================================
Public Sub makeKassaBuchEintrag(ByVal Datum As Date, _
 ByVal Konto As String, _
 ByVal Beschreibung As String, _
 ByVal Betrag As Double)
    Dim betragfield: betragfield = "BetragEingang"
    Dim sql As String
    
    If Betrag < 0 Then betragfield = "BetragAusgang"
    Betrag = Abs(Betrag)
    
    sql = "INSERT INTO buchKassabuch (Datum, Konto, Beschreibung," & betragfield & ")  " & _
               " Values (" & makeSQLDate(Datum) & ",'" & Konto & "','" & Beschreibung & "'," & Replace(Betrag, ",", ".") & ")"
                 DoCmd.SetWarnings False
                 Call writeLog("TRY " & sql)
                 DoCmd.RunSQL sql
                 Call writeLog("DONE " & sql)
                 DoCmd.SetWarnings True
End Sub


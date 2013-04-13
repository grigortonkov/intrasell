Attribute VB_Name = "functions_AddIn_EUROFIB"

Option Compare Database
Option Explicit

Const DSN_EUROFIB = "DSN=EUROFIB"
Sub TEST()
 DoCmd.OpenForm "tradeBoardLieferantenAngebotFoto", , , "AngebotNr=67"
End Sub

Public Sub CheckBHLimit(KundNr)

    'MsgBox "Das ist eine Prüfung d. Saldo von der FIBU Software! Noch nicht fertig!"
    
    Dim limit As Currency
    limit = getKundenLimit(KundNr)
    Dim saldo As Currency
    saldo = getKundenSaldo(KundNr)
    
    If limit < saldo Then 'limit erreicht
            MsgBox "Vorsicht Kreditlimit wurde überschritten! " & Chr(13) & _
            " Saldo: " & saldo & ", Limit: " & limit, vbCritical
    Else
            MsgBox "Saldo: " & saldo & ", Limit: " & limit, vbInformation
    End If
End Sub
    
    
    
    
Sub odbcQuery()

        Dim rs
        Dim rsKommentar_numRows
        Set rs = CreateObject("ADODB.Recordset")
         
        rs.ActiveConnection = "DSN=EUROFIB"
        rs.Source = "SELECT * from auslieferung.sesfibu.abc_analyse"
        'rs.CursorType = 0
        'rs.CursorLocation = 2
        'rs.LockType = 1
        rs.Open
        While Not rs.EOF
                Debug.Print rs("abc_klient") & "-" & rs("abc_sa")
                rs.MoveNext
        Wend
        
        rs.Close
End Sub

Function executeScalar(ByVal sql As String)
 On Error GoTo err
 
        Dim rs: Set rs = CreateObject("ADODB.Recordset")
         
        rs.ActiveConnection = DSN_EUROFIB
        rs.Source = sql
        'rs.CursorType = 0
        'rs.CursorLocation = 2
        'rs.LockType = 1
        rs.Open
        executeScalar = 0
        If Not rs.EOF Then
         If IsNull(rs(0)) Then
             executeScalar = 0
         Else
             executeScalar = rs(0)
         End If
        End If
        
        rs.Close
        Exit Function
err:
      MsgBox err.Description
End Function

Function getKontoNr(ByVal IDNR As String) As String
    getKontoNr = "" & firstRow("select BHReferenz from ofAdressen where idnr=" & IDNR)
End Function
'
Function getKundenLimit(ByVal IDNR As String) As Double
   Dim sql As String
        sql = "select kod_klimit from sesfibu.debitoren  where  kod_konto = '" & getKontoNr(IDNR) & "'"
        Debug.Print sql
        getKundenLimit = executeScalar(sql)
End Function

'
Function getKundenSaldo(ByVal IDNR As String) As Double
Dim sql As String
sql = "SELECT sum(sal_betrag_soll - sal_betrag_haben) as saldo, " & _
         " sum(sal_fwbetrag_soll - sal_fwbetrag_haben) As fw_saldo " & _
         " FROM sesfibu.salden " & _
         " WHERE /*( sesfibu.salden.sal_klient = :klient ) AND " & _
         "       ( sesfibu.salden.sal_bujahr = :bujahr ) AND*/ " & _
         "       ( sesfibu.salden.sal_konto = '" & getKontoNr(IDNR) & "' )"

'Check das aktuelle und das letzte Geschäftsjahr
sql = "SELECT sum(sal_betrag_soll - sal_betrag_haben) as saldo, " & _
         " sum(sal_fwbetrag_soll - sal_fwbetrag_haben) As fw_saldo " & _
         " FROM sesfibu.salden " & _
         " WHERE /*( sesfibu.salden.sal_klient = :klient ) AND*/ " & _
         "       ( sesfibu.salden.sal_bujahr = '" & Right(Year(Date), 1) & "' OR   sesfibu.salden.sal_bujahr = '" & Right(Year(Date) - 1, 1) & "' ) AND " & "       ( sesfibu.salden.sal_konto = '" & _
         getKontoNr(IDNR) & "' )"
         
      Debug.Print sql
      
     getKundenSaldo = executeScalar(sql)
End Function

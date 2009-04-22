Attribute VB_Name = "moduleKundengruppe"
Option Compare Database
Option Explicit

'checks if the user needs mwst in the rechnung according the kundengruppe
Public Function needsMWST(IDNR)
   Dim rs As Recordset
   Dim sql As String
   sql = "select * from [ofAdressen-Settings] where Idnr=" & IDNR & " AND Kundengruppe in " & _
                " (select  Gruppe from [ofAdressen-KundenGruppen] Where RechungenMitMWST=false)"
   Set rs = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   If rs.EOF Then
      needsMWST = True
   Else
      needsMWST = False
   End If
   rs.Close
   Set rs = Nothing
   
End Function



Public Function calculateUmsatzKunde(ByVal IDNR)
If IsNull(IDNR) Then calculateUmsatzKunde = 0: Exit Function
  Dim rs, sql
  sql = " SELECT buchRechnung.KundNr, Sum([PreisATS]*[stk]) AS UmsatzKunde" & _
  " FROM buchRechnung LEFT JOIN [buchRech-Artikel] ON buchRechnung.Nummer = [buchRech-Artikel].RechNr " & _
  " WHERE buchRechnung.KundNr = " & IDNR & _
  " GROUP BY buchRechnung.KundNr"
  Set rs = CurrentDb.openRecordset(sql)
If rs.EOF Then
calculateUmsatzKunde = 0
Else
   calculateUmsatzKunde = rs("umsatzKunde")
End If
  
End Function


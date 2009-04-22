VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IntraSellKundengruppe"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
 
Option Explicit

'for compatibility reasons
Const dbOpenDynaset = 0
Public CurrentDB As Connection

'checks if the user needs mwst in the rechnung according the kundengruppe
Public Function needsMWST(Idnr)
   Dim rs As Recordset
   Dim sql As String
   sql = "select * from [ofAdressen-Settings] where Idnr=" & Idnr & " AND Kundengruppe in " & _
         " (select Gruppe from [ofAdressen-KundenGruppen] Where RechungenMitMWST=0)"
   Set rs = openRecordset(sql)
   If rs.EOF Then
      needsMWST = True
   Else
      needsMWST = False
   End If
   rs.Close
   Set rs = Nothing
   
End Function



Public Function calculateUmsatzKunde(ByVal Idnr)
If IsNull(Idnr) Then calculateUmsatzKunde = 0: Exit Function
  Dim rs, sql
  sql = " SELECT buchRechnung.KundNr, Sum([PreisATS]*[stk]) AS UmsatzKunde" & _
        " FROM buchRechnung LEFT JOIN [buchRech-Artikel] ON buchRechnung.Nummer = [buchRech-Artikel].RechNr " & _
        " WHERE buchRechnung.KundNr = " & Idnr & _
        " GROUP BY buchRechnung.KundNr"
  Set rs = CurrentDB.openRecordset(sql)
If rs.EOF Then
calculateUmsatzKunde = 0
Else
   calculateUmsatzKunde = rs("umsatzKunde")
End If
  
End Function




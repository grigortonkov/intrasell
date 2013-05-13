VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IntraSellKunden"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

Option Explicit

Public CurrentDB As Connection
Private vars As IntraSellVars
'for compatibility reasons
Const dbOpenDynaset = 0
  
  

Public Sub init(ByVal connString)

    functionsDB.ConnStringODBC = connString
    functionsDB.connOpen
    Set CurrentDB = functionsDB.CurrentDB
    
    Set vars = New IntraSellVars
    vars.init (connString)
    
End Sub

Public Sub destroy()
    functionsDB.connClose
    
    vars.destroy
    Set vars = Nothing
    
End Sub


'checks if the user needs mwst in the rechnung according the kundengruppe
Public Function needsMWST(ByVal IdNr As String) As Boolean
   needsMWST = True
   
   If IdNr = "" Or IsNull(IdNr) Then
     Exit Function
   End If
   
   Dim rs As Recordset
   Dim sql As String
   sql = "select * from [ofAdressen-Settings] where Idnr=" & IdNr & " AND Kundengruppe in " & _
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



Public Function calculateUmsatzKunde(ByVal IdNr As Long)
    If IsNull(IdNr) Then calculateUmsatzKunde = 0: Exit Function
      Dim rs, sql
      sql = " SELECT buchRechnung.KundNr, Sum([PreisATS]*[stk]) AS UmsatzKunde" & _
            " FROM buchRechnung LEFT JOIN [buchRech-Artikel] ON buchRechnung.Nummer = [buchRech-Artikel].RechNr " & _
            " WHERE buchRechnung.KundNr = " & IdNr & _
            " GROUP BY buchRechnung.KundNr"
      Set rs = CurrentDB.openRecordset(sql)
    If rs.EOF Then
    calculateUmsatzKunde = 0
    Else
       calculateUmsatzKunde = rs("umsatzKunde")
    End If
  
End Function




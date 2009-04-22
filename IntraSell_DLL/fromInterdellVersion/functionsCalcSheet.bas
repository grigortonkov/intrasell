Attribute VB_Name = "functionsCalcSheet"

Option Compare Database
Option Explicit

'neuen Calc Sheet erstellen
Function erstelleNeuenCalcSheet(ByVal AuftragNr As Long, ByVal Vorgangtyp As String)

'delete old
    DoCmd.SetWarnings False
    DoCmd.RunSQL "delete from calcSheet where AuftragNr=" & AuftragNr
    DoCmd.SetWarnings True
    
'TODO: insert positionen von Angebot
'TODO: insert positionen von Rechnung

Dim rs, sql
sql = "select * from calcSheetPositionen order by Position"
Set rs = CurrentDb.openRecordset(sql)

While Not rs.EOF


    'calculate Col1
    Dim newID: newID = nextId("calcSheet", "ID")
    Dim Col1: Col1 = calculateCol(rs("Col1") & "", AuftragNr, Vorgangtyp)
    Dim Col2: Col2 = calculateCol(rs("Col2") & "", AuftragNr, Vorgangtyp, Col1)
    Dim Col3: Col3 = calculateCol(rs("Col3") & "", AuftragNr, Vorgangtyp, Col1, Col2)

   If Col1 >= 0 Or Col2 >= 0 Or Col3 > 0 Then
               sql = "insert into calcSheet(Id, AuftragNr, VorgangTyp, Position, Col1, Col2, Col3, Bezeichnung, ErstelltAm) " & _
                "values (" & newID & "," & AuftragNr & ",'" & Vorgangtyp & "', " & rs("Position") & _
                  ",'" & Col1 & "'" & _
                  ",'" & Col2 & "'" & _
                  ",'" & Col3 & "'" & _
                  ",'" & rs("Bezeichnung") & "'" & _
                  ", Now())"
            
               DoCmd.SetWarnings False
               DoCmd.RunSQL sql
               DoCmd.SetWarnings True
    End If
    
   rs.MoveNext
 
Wend

rs.Close

End Function


Function recalcCalcSheet(ByVal AuftragNr As Long, ByVal Vorgangtyp As String)
    Dim rs, sql
sql = "select s.*, pos.col1 as sql1, pos.col2 as sql2, pos.col3 as sql3 " & _
     " from calcSheet s, calcSheetPositionen pos " & _
     " where s.position = pos.position and s.VorgangTyp='" & Vorgangtyp & "' and s.AuftragNr= " & AuftragNr & _
     " and pos.Position <> 400 and pos.Position <> 600 and pos.Position <> 700" & _
     " order by s.Position"
Set rs = CurrentDb.openRecordset(sql)

While Not rs.EOF
        
        'calculate Col1
        Dim Col1: Col1 = Replace(rs("col1"), ",", ".")
        If LCase(Left(rs("sql1"), 6)) = "select" Then
                 Col1 = calculateCol(rs("sql1") & "", AuftragNr, Vorgangtyp)
                RunSQL "update calcSheet set col1= '" & Col1 & "' where id=" & rs("ID")
        End If
        
        Dim Col2: Col2 = Replace(rs("col2"), ",", ".")
        If LCase(Left(rs("sql2"), 6)) = "select" Then
                Col2 = calculateCol(rs("sql2") & "", AuftragNr, Vorgangtyp, Col1)
                RunSQL "update calcSheet set Col2= '" & Col2 & "' where id=" & rs("ID")
        End If
        
        Dim Col3: Col3 = Replace(rs("col3"), ",", ".")
        If LCase(Left(rs("sql3"), 6)) = "select" Then
                Col3 = calculateCol(rs("sql3") & "", AuftragNr, Vorgangtyp, Col1, Col2)
                RunSQL "update calcSheet set Col3= '" & Col3 & "' where id=" & rs("ID")
        End If
        
           rs.MoveNext
         
Wend

rs.Close
End Function

Function RunSQL(ByVal sql As String)
    DoCmd.SetWarnings False
    DoCmd.RunSQL sql
    DoCmd.SetWarnings True
End Function

'eine Spalte calculieren
'returns -1 when no calculation possible
Function calculateCol(ByVal sql As String, ByVal AuftragNr As String, ByVal Vorgangtyp As String, _
Optional Col1 = "", Optional Col2 = "") As String

Dim colSQL As String
If UCase(Left(sql, 6)) = "INSERT" Or UCase(Left(sql, 6)) = "UPDATE" Then
        colSQL = Replace(sql, "[AuftragNr]", AuftragNr)
        colSQL = Replace(colSQL, "buchAuftrag-Artikel", getVorgangArtikelTableForType(Vorgangtyp))
        colSQL = Replace(colSQL, "buchAuftrag", getVorgangTableForType(Vorgangtyp))
        
        CurrentDb.execute colSQL
        calculateCol = -1 'do not calculate
        Exit Function
End If


'Numerische Werte
If IsNumeric(sql) Then
  calculateCol = sql
  Exit Function
End If
 
sql = Replace(sql, "Col1", Replace(Col1, ",", "."), , , vbBinaryCompare)
sql = Replace(sql, "Col2", Replace(Col2, ",", "."), , , vbBinaryCompare)

 
 
        colSQL = Replace(sql, "[AuftragNr]", AuftragNr)
        colSQL = Replace(colSQL, "buchAuftrag", getVorgangTableForType(Vorgangtyp))
        
        If colSQL <> "" Then
         Dim tmpVal
            tmpVal = firstRow(colSQL) & ""
            If IsNull(tmpVal) Or tmpVal & "" = "" Then
                calculateCol = 0
             Else
                calculateCol = tmpVal
            End If
        End If
        
        Exit Function
 On Error GoTo 0
 
 calculateCol = 0

End Function

'example mehtode  = 30 Tage
Public Function getZahlungZielTage(Optional methode As String = "0") As Integer
    Dim Tage As String
    If InStr(methode, " ") <= 0 Then getZahlungZielTage = 0:    Exit Function
    
    Tage = Split(methode, " ")(0)
    
    If IsNumeric(Tage) Then
       getZahlungZielTage = Tage
    Else
       getZahlungZielTage = 0
    End If
    
    
End Function


Attribute VB_Name = "FunctionsIntraSell"
'Option Compare Database
Option Explicit
Public Function getRSForReport() As String
getRSForReport = "ofAdressen"
End Function

Function getFirma(Adresse_ref) As String
On Error Resume Next
  Dim part(1 To 30) As String
  Dim partNR, i, pos, Adresse
  partNR = 1
  
  Adresse = Adresse_ref

1:
   pos = InStr(Adresse, " ")
   If (pos = 0) Then pos = Len(Adresse)
   part(partNR) = Left(Adresse, pos - 1)
   Adresse = Right(Adresse, Len(Adresse) - pos)
   partNR = partNR + 1
   
  If Len(Adresse) And pos > 0 Then GoTo 1
  
  
  Dim PLZpos
  PLZpos = 0
  For i = 1 To partNR
   If Len(Trim(part(i))) = 4 Then
    If Asc(Left(part(i), 1)) < 57 And Asc(Left(part(i), 1)) > 47 Then PLZpos = i
   End If
  Next
  
If PLZpos > 4 Then
   For i = 1 To PLZpos - 3
    getFirma = getFirma & " " & part(i)
   Next i
 Else: getFirma = "n.a."
End If
End Function


Function getStrasse(Adresse_ref) As String
  Dim part(1 To 40) As String
  Dim partNR, i, pos, Adresse
  partNR = 1
  
  Adresse = Adresse_ref

1:
   pos = InStr(Adresse, " ")
   If (pos = 0) Then pos = Len(Adresse)
   part(partNR) = Left(Adresse, pos - 1)
   Adresse = Right(Adresse, Len(Adresse) - pos)
   partNR = partNR + 1
   
  If Len(Adresse) And pos > 0 Then GoTo 1
  
  
  Dim PLZpos
  PLZpos = 0
  For i = 1 To partNR
   If Len(Trim(part(i))) = 4 Then
    If Asc(Left(part(i), 1)) < 57 And Asc(Left(part(i), 1)) > 47 Then PLZpos = i
   End If
  Next
  
If PLZpos > 2 Then getStrasse = part(PLZpos - 2) & " " & part(PLZpos - 1) Else getStrasse = "n.a."
End Function


Function getPLZ(Adresse) As Integer
On Error Resume Next
  Dim part(1 To 20) As String
  Dim partNR, i, pos
  partNR = 1
  
1:
   pos = InStr(Adresse, " ")
   If (pos = 0) Then pos = Len(Adresse)
   part(partNR) = Left(Adresse, pos - 1)
   Adresse = Right(Adresse, Len(Adresse) - pos)
   partNR = partNR + 1
   
  If Len(Adresse) And pos > 0 Then GoTo 1
  
  
  Dim PLZpos
  PLZpos = 0
  For i = 1 To partNR
   If Len(Trim(part(i))) = 4 Then
    If Asc(Left(part(i), 1)) < 57 And Asc(Left(part(i), 1)) > 47 Then PLZpos = i
   End If
  Next
  
If PLZpos <> 0 Then getPLZ = Val(part(PLZpos)) Else getPLZ = 0
End Function



Public Function ImportETB(filename, Branche)
 
 Dim rs As Recordset
 Dim Text, TextFilter2, line As String
 Dim Path
 
 Set rs = CurrentDB.openRecordset("impETB")
 
 Open filename For Input As #1

Do While Not EOF(1) ' Schleife bis Dateiende.
    Input #1, line
    'Debug.Print line
    Text = Text & " " & line
Loop
Close #1    ' Datei schließen.

Dim pos, debugg, ende
ende = 0
pos = 1


Do While (Len(Text) > 0) And (ende < 40) And (pos <> 0)
'the first result is on the second <b>
 pos = InStr(Text, "<B>")
 Text = Right(Text, Len(Text) - pos + 1)

 pos = InStr(Text, "</TD>")
 If pos > 0 Then
  TextFilter2 = TextFilter2 & Left(Text, pos - 1) & "<BR>"
  Text = Right(Text, Len(Text) - pos + 1)
  Else
    GoTo Leave
  End If
 ende = ende + 1
Loop

Leave:


' Second filter : read the out file and creates the fields
Dim Name, Firma, Adresse, PLZ, tel1, Tel2, tel3

Text = TextFilter2


'Filter
  ende = 1
 
   ' find the "Suchergebnisse"
     pos = InStr(Text, "</B>")
     If pos > 0 Then Text = Right(Text, Len(Text) - pos - 3)
 
  Do While (Len(Text) > 0) And (ende < 40) And (pos <> 0)
  ' find the Name
     pos = InStr(Text, "<B>")
     Text = Right(Text, Len(Text) - pos - 2)
     
     pos = InStr(Text, "</B>")
     Name = Left(Text, pos - 1)
     Text = Right(Text, Len(Text) - pos - 3)
     
  'find the Adresse
  pos = InStr(Text, "<")
  Adresse = Left(Text, pos - 1)
  Text = Right(Text, Len(Text) - pos - 3)
  

Dim isDigit, curNr
curNr = 0
tel1 = ""
Tel2 = ""
tel3 = ""
  'find the numbers
NumberAgain:
 pos = InStr(Text, "<B>")
 Text = Right(Text, Len(Text) - pos + 1)
    
 isDigit = Right(Left(Text, 4), 1)
 
 If (isDigit = "0") Or (isDigit = " ") Then
  pos = InStr(Text, "</B>")
  
  If pos <> 0 Then
  
  ' for three diff. tels
    If (isDigit = "0") Then
     curNr = curNr + 1
     If (curNr = 1) Then tel1 = Right(Left(Text, pos - 1), pos - 4)
     If (curNr = 2) Then Tel2 = Right(Left(Text, pos - 1), pos - 4)
     If (curNr = 3) Then tel3 = Right(Left(Text, pos - 1), pos - 4)
    End If
  
  End If
  
  If (Len(Text) - pos - 3) > 0 Then
  Text = Right(Text, Len(Text) - pos - 3)
  Else
   Exit Function
  End If
  GoTo NumberAgain
 End If
 
 
 ' add the data to impETB tabelle
 If Adresse = "" Then Adresse = "n.a."
 
 rs.AddNew
  rs!Branche = Branche
  rs!Name = Left(Trim(Name), 50)
  If Len(Trim(getFirma(Adresse))) < 100 Then
   rs!Firma = Trim(getFirma(Adresse)): If rs!Firma = "" Then rs!Firma = "X"
   Else
   rs!Firma = Left(Trim(getFirma(Adresse)), 100)
   End If
  
  rs!Adresse = Left(getStrasse(Adresse), 100)
  
  rs!PLZ = getPLZ(Trim(Adresse))
  
  If tel1 <> "" Then rs!tel1 = Trim(tel1)
  If Tel2 <> "" Then rs!Tel2 = Trim(Tel2)
  If tel3 <> "" Then rs!tel3 = Trim(tel3)
  
  Forms![impETB]![Debugbox] = rs!Name & " " & rs!Firma & " " & rs!Adresse & " " & rs!tel1
  Forms![impETB].Repaint
  
 rs.Update
 
 'MsgBox Name & Adresse & Tel1

 ende = ende + 1
Loop

End Function

Function clearTags(Text, tag)
 Dim p1, p2
 Dim noTags
 Dim istag
 
 istag = False

beg:
 p1 = InStr(Text, tag)
 
      If p1 = 0 Then
         If Not istag Then noTags = Text
         clearTags = noTags
         Exit Function
      End If
      
      istag = True
      noTags = noTags + Left(Text, p1 - 1)
      Text = Right(Text, Len(Text) - p1 - Len(tag))
  GoTo beg
  
End Function

Private Function getTelefon(Text)
   Dim tel1, Tel2, tel3, pos1, pos2, pos3, l
   
   pos1 = InStr(Text, "Tel.")
   pos2 = InStr(Text, "0676")
   pos3 = InStr(Text, "0664")
   l = Len(Text)
   
   If pos1 <> 0 Then
       tel1 = Right(Text, l - pos1 - 4)
       If InStr(tel1, " ") <> 0 Then tel1 = Left(tel1, InStr(tel1, " "))
      End If
 getTelefon = tel1
End Function


Private Function saveInserat(Inserat, Rubrik)

 Dim rs As Recordset
 Set rs = CurrentDB.openRecordset("impKorrekt")
    If Inserat <> "" Then
        rs.AddNew
         rs!Rubrik = Rubrik
         rs!Inserat = Inserat
         rs!Tel = getTelefon(Inserat)
         rs.Update
     End If
 rs.Close
 
End Function


Public Function ImportKorrekt(Path, filename)
 

 Dim Text, line As String
 Dim Inserat, Rubrik
 Dim pos, ende, dummy
 
 
 Rubrik = Left(filename, InStr(filename, "_") - 1)
 
    Open Path & filename For Input As #1

        Do While Not EOF(1) ' Schleife bis Dateiende.
            Input #1, line
            Text = Text & " " & line
        Loop
    Close #1

        ende = 0
        pos = 1

    line = "<td WIDTH=""175"" VALIGN=""TOP"">"

    pos = InStr(Text, line): If pos = 0 Then Exit Function
    
    Text = Right(Text, Len(Text) - pos + 1)
    
    Text = clearTags(Text, "<td WIDTH=""175"" VALIGN=""TOP"">")
    Text = clearTags(Text, "</td>")
    Text = clearTags(Text, " </table>")
    Text = clearTags(Text, "</body>")
    Text = clearTags(Text, "</html>")
    

     Do While (Len(Text) > 0) And (ende < 40)
    
              pos = InStr(Text, "<hr>")
                
                If pos > 0 Then
                        Inserat = Left(Text, pos - 1)
                        Text = Right(Text, Len(Text) - pos - 3)
                        dummy = saveInserat(Inserat, Rubrik)
              
                       Else
                             Exit Function
                End If
    
               ende = ende + 1
     Loop
End Function


Function PLZUpdate()
     Dim plzId: plzId = Forms("grPLZ")!IdNr
     Dim Land: Land = Forms("grPLZ").Land
     Dim txtFormToupdate: txtFormToupdate = Forms("grPLZ").txtFormToupdate
        
            DoCmd.Close acForm, "grPLZ"
            Forms(txtFormToupdate)![Land] = Land
            Forms(txtFormToupdate)![PLZ] = plzId
            Forms(txtFormToupdate)![PLZ].Requery
            Forms(txtFormToupdate)![Ort].Requery
            'Forms(Me.txtFormToupdate).Land.Update
            Forms(txtFormToupdate)![Land].Requery
           ' Forms(Me.txtFormToupdate).Recalc
           'On Error Resume Next
            'DoCmd.GoToRecord acDataForm, Me., acPrevious
            'DoCmd.GoToRecord acDataForm, Me.txtFormToupdate, acNext
    
End Function

Public Function cleanPLZ(ByVal plzAsStr As String) As String
 On Error Resume Next
  If IsNull(plzAsStr) Then cleanPLZ = 0: Exit Function
  cleanPLZ = 0
  Dim i: i = 0
  Dim clPLZ: clPLZ = ""
  Dim letter
  For i = 1 To Len(plzAsStr)
  letter = Mid(plzAsStr, i, 1)
  'Debug.Print Asc(letter)
        If Asc(letter) >= 48 And Asc(letter) <= 57 Then
            clPLZ = clPLZ & letter
        End If
  Next
  cleanPLZ = clPLZ
End Function



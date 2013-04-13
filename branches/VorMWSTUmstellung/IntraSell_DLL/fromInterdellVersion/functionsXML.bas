Attribute VB_Name = "functionsXML"
Option Compare Database
Option Explicit




Function QueryToXML(ByVal sql As String, Optional baseTagName As String = "") As String
  Dim rs
  Dim line As String
  Dim FeldName As String
  Dim FeldWert As String
  
  Dim i As Integer
  Set rs = CurrentDb.openRecordset(sql)
         
    line = ""
    
    While Not rs.EOF
        If baseTagName <> "" Then
            line = line & "<" & baseTagName & ">"
        End If
        
        'A CDATA section starts with "<![CDATA[" and ends with "]]>":
        For i = 1 To rs.Fields.Count
        FeldName = Replace(rs.Fields(i - 1).Name, " ", "")
        FeldName = Replace(FeldName, "_", "")
        
        If InStr(FeldName, "<") <= 0 And InStr(FeldName, ">") <= 0 Then
        
        FeldWert = rs.Fields(i - 1).Value & ""
        
        If FeldWert = "" Then
            FeldWert = "_"
        End If
        
                    If FeldWert <> "" Then 'nur dann einf�gen wenn daten vorhanden sind
                        'Start Tag
                        line = line & "<" & FeldName & ">"
                        If IsNumeric(FeldWert) And Not IsDate(FeldWert) _
                        And Not (InStr(FeldName, "Nr") > 0 Or _
                                 InStr(FeldName, "PLZ") > 0 Or _
                                 FeldName = "IDNR" Or _
                                 FeldName = "Nr" Or _
                                 FeldName = "ID" Or _
                                 FeldName = "Pos" Or _
                                 FeldName = "Position" Or _
                                 FeldName = "Nummer" Or _
                                 FeldName = "BHReferenz" Or _
                                 FeldName = "LandNr" Or _
                                 FeldName = "Land" Or _
                                 FeldName = "Tel" Or _
                                 FeldName = "Fax" Or _
                                 FeldName = "MitarbeiterId" Or _
                                 FeldName = "ArtikelIdentifikation" Or _
                                 FeldName = "VorgangNummer" Or _
                                 FeldName = "AnfrageNr") Then
                           'Als Sandard Zahl Formatieren, aber nurr dann wenn keine Differenz ensteht
                           
                           If FeldWert * 1 = 1 * Format(FeldWert, "Standard") Then
                              line = line & Format(FeldWert, "Standard") '2 nachkommastellige Zahl
                           Else
                              line = line & encodeForXML(FeldWert) '3 nachkommastellen Zahl
                           End If
                           
                        Else
                            If InStr(FeldName, "Preis") > 0 And IsNumeric(FeldWert) Then
                                If FeldWert * 1 = 1 * Format(FeldWert, "Standard") Then
                                    line = line & Format(FeldWert, "Standard")
                                     Else
                                    line = line & encodeForXML(FeldWert) '3 nachkommastellen Zahl
                                 End If
                            Else
                                line = line & encodeForXML(FeldWert)
                            End If
                        End If
                        
                        'End Tag
                        line = line & "</" & FeldName & ">" & Chr(13) & Chr(10)
                     End If
                     
         End If
        Next
                
                      ' "<![CDATA[" & _ '  "]]>" & _

        If baseTagName <> "" Then
            line = line & "</" & baseTagName & ">"
        End If
           
        rs.MoveNext
    Wend
        rs.Close
        
    
    QueryToXML = line
End Function



Function encodeForXML(ByVal txt As String) As String
        txt = "<![CDATA[" & txt & "]]>"
        encodeForXML = txt
End Function

Function encodeForXML_wrong(ByVal txt As String) As String
   txt = Replace(txt, "�", "&Auml;", , , vbBinaryCompare)
   txt = Replace(txt, "�", "&auml;", , , vbBinaryCompare)
   txt = Replace(txt, "�", "&Ouml;", , , vbBinaryCompare)
   txt = Replace(txt, "�", "&ouml;", , , vbBinaryCompare)
   txt = Replace(txt, "�", "&Uuml;", , , vbBinaryCompare)
   txt = Replace(txt, "�", "&uuml;", , , vbBinaryCompare)
   
   txt = Replace(txt, "�", "&suml;", , , vbBinaryCompare)
   txt = Replace(txt, "&", "&szlig;", , , vbBinaryCompare)
 
   encodeForXML_wrong = txt
    
End Function




'makes XML file from query or table
Public Function saveXML(ByVal content As String, ByVal filename As String) As Boolean
    saveXML = False
      'If Creation of export filename wished
    Dim fs, exportFile
    
    Dim fileLine: fileLine = "<?xml version = ""1.0""  encoding=""Unicode"" ?>"
   
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set exportFile = fs.CreateTextFile(filename, True, True)

    fileLine = fileLine & content
    
    exportFile.WriteLine fileLine
    exportFile.Close
    saveXML = True
End Function

'filename = File1; File2
'recipients = Email1; Email2; ...
Public Sub openForMerge(ByVal Filenames As String, _
                                vorlagenBereich As String, _
                                recipients As String, _
                                recipientsIDNR As String)
        DoCmd.OpenForm "tradeBoardVorlagenMerge"
        Forms("tradeBoardVorlagenMerge").XMLFilename = Filenames
        Forms("tradeBoardVorlagenMerge").Emails = recipients
        Forms("tradeBoardVorlagenMerge").Bereich = vorlagenBereich
        Forms("tradeBoardVorlagenMerge").IDNRForMailtext = recipientsIDNR
        Forms("tradeBoardVorlagenMerge").cbDateiname.Requery
End Sub


VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IntraSellDictionary"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
 Option Compare Binary
Option Explicit

Public charSet_ENG As String
Public charSet_CYRUNICODE As String
Public charSet_CYRASCII As String
Public CURRENT_LANGUAGE_CODE As String 'if set then we use this code as language and not the one from customer or settings


Public CurrentDB As Connection
Private vars As IntraSellVars
Private preise As IntraSellPreise

Public Sub init(ByVal connString)
    functionsDB.ConnStringODBC = connString '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
    functionsDB.connOpen
    Set CurrentDB = functionsDB.CurrentDB
    
    Set vars = New IntraSellVars
    vars.init (connString)
    
    Set preise = New IntraSellPreise
    preise.init (connString)
End Sub

Public Sub destroy()
    functionsDB.connClose
    preise.destroy
    vars.destroy
    
End Sub


 'once at program start
Public Sub loadCharsets()
   Dim sql, rs
   Set rs = CurrentDB.openRecordset("select set from ofDictionarySets where CHARSET like 'ENG'", , dbSeeChanges)
   charSet_ENG = rs("Set")
      Set rs = CurrentDB.openRecordset("select * from ofDictionarySets where CHARSET like 'CYRASCII'", , dbSeeChanges)
   charSet_CYRASCII = rs("Set")
      Set rs = CurrentDB.openRecordset("select * from ofDictionarySets where CHARSET like 'CYRUNICODE'", , dbSeeChanges)
   charSet_CYRUNICODE = rs("Set")
End Sub




Public Function getTranslation(ByVal german As String) As String

  Dim currentLanguage: currentLanguage = vars.varValue("LANGUAGE")
   getTranslation = german
   Dim rs
   
   Dim sql
   sql = "select * from ofDictionary where DEU Like '" & german & "'"
   Set rs = CurrentDB.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   
   If Not rs.EOF Then
      If Len(rs(currentLanguage)) > 0 Then getTranslation = rs(currentLanguage)
            'decoding for bulgarian
           If currentLanguage = "BUL" Then
               If Len(rs(currentLanguage)) > 0 Then getTranslation = stringToCyr(rs(currentLanguage))
            End If
      
   Else
    If currentLanguage = "DEU" Then
             
            sql = "Insert into ofDictionary (DEU) values('" & german & "')"
            openRecordset sql
      End If
   End If
   rs.Close
End Function


Function getTranslationDeu(ByVal foreignLang As String) As String
  
  Dim currentLanguage: currentLanguage = vars.varValue("LANGUAGE")
  
   If currentLanguage = "BUL" Then foreignLang = stringToLat(foreignLang)
   getTranslationDeu = foreignLang
   
   Dim sql
   Dim rs
   
   sql = "select * from ofDictionary where " & vars.varValue("LANGUAGE") & " Like '" & foreignLang & "'"
   Set rs = CurrentDB.openRecordset(sql, , dbSeeChanges)
   
   If Not rs.EOF Then
      If Len(rs(currentLanguage)) > 0 Then getTranslationDeu = rs("DEU")
   End If
   rs.Close
End Function

Function charToCyr(ByVal latChar As String)
   charToCyr = charFromTo(latChar, charSet_ENG, charSet_CYRUNICODE)
End Function

Function charToLat(ByVal latChar As String)
   charToLat = charFromTo(latChar, charSet_CYRUNICODE, charSet_ENG)
End Function


Public Function stringToCyr(ByVal latString As String)
 Dim cyrString As String
  cyrString = ""
  Dim i As Integer
  
  For i = 1 To Len(latString)
    cyrString = cyrString + charToCyr(Mid(latString, i, 1))
  Next
  stringToCyr = cyrString
End Function

Public Function stringToLat(ByVal cyrString As String)
  Dim latString As String
  
  latString = ""
  Dim i As Integer
  
  For i = 1 To Len(cyrString)
    latString = latString + charToLat(Mid(cyrString, i, 1))
  Next
  stringToLat = latString
End Function



Function charFromTo(ByVal latChar As String, ByVal fromSet As String, ByVal toSet As String)
     Dim Pos
    Pos = InStr(1, fromSet, latChar, vbBinaryCompare)
    charFromTo = latChar
    If Pos > 0 Then charFromTo = Mid(toSet, Pos, 1)
End Function


Public Function stringFromTo(ByVal latString As String, ByVal fromSet As String, ByVal toSet As String)
  Dim cyrString: cyrString = ""
   Dim i As Integer
  For i = 1 To Len(latString)
    cyrString = cyrString + charFromTo(Mid(latString, i, 1), fromSet, toSet)
  Next
  stringFromTo = cyrString
End Function



'Liefert die Übersetzung oder wenn keine vorhanden original text
Public Function getTranslationDok(ByVal TableName As String, _
                         ByVal Key As String, _
                         ByVal FieldName As String, _
                         ByVal textToTranslate As String, _
                         ByVal language_Code As String)
                         
   getTranslationDok = private_getTranslationDok(TableName, Key, FieldName, textToTranslate, language_Code)
End Function
                         
Public Function private_getTranslationDok(ByVal TableName As String, _
                         ByVal Key As String, _
                         ByVal FieldName As String, _
                         ByVal textToTranslate As String, _
                         ByVal language_Code As String)
                         
                         
     
    Dim sql As String
    sql = "select Translation from translations t where t.TableName='" & TableName & _
     "' and t.FieldName ='" & FieldName & "' and t.Key='" & Key & "' and t.Language_Code='" & language_Code & "'"
    Dim rs
    Set rs = openRecordset(sql, "")
    
    If Not rs.EOF Then
       private_getTranslationDok = rs("Translation")
    Else
       private_getTranslationDok = textToTranslate
    End If
 
    Set rs = Nothing
    
End Function


Public Function getLanguageForVorgang(ByVal Vorgangtyp As String, ByVal VorgangNummer As Long)
     
     If Len(CURRENT_LANGUAGE_CODE) = 3 Then
            getLanguageForVorgang = CURRENT_LANGUAGE_CODE
            Exit Function
     End If
     
     
     Dim VonForm  As String:   VonForm = preise.getVorgangTableForType(Vorgangtyp)
 
     Dim def_language_Code As String: def_language_Code = vars.varValue("LANGUAGE_DOK_" & Forms("Main").MitarbeiterID)
     
     Dim kund_language_Code As String
     If Vorgangtyp = "LAU" Then
        kund_language_Code = vars.firstRow("select adr.language_code from " & VonForm & " a, [ofadressen-settings] adr " & _
                          " where a.lieferantNr = adr.IDNR and a.Nummer=" & VorgangNummer)
     Else
        kund_language_Code = vars.firstRow("select adr.language_code from " & VonForm & " a, [ofadressen-settings] adr " & _
                          " where a.KundNr = adr.IDNR and a.Nummer=" & VorgangNummer)
     End If
     
     If Len(kund_language_Code) = 3 Then
        getLanguageForVorgang = kund_language_Code
     Else
        getLanguageForVorgang = def_language_Code
     End If
     
     
End Function



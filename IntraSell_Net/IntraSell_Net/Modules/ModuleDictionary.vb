
Option Compare Binary
Option Explicit On
Imports IntraSell_DLL

Module ModuleDictionary


    Public charSet_ENG As String
    Public charSet_CYRUNICODE As String
    Public charSet_CYRASCII As String
    Public CURRENT_LANGUAGE_CODE As String 'if set then we use this code as language and not the one from customer or settings

    Private dictionary As IntraSellDictionary

    Public Function IntraSellDictionary() As IntraSellDictionary
        If dictionary Is Nothing Then   ' init

            dictionary = New IntraSellDictionary
            If Err.Number <> 0 Then
                MsgBox("Die IntraSell DLL konnte nicht gefunden werden!" & Err.Description, vbCritical)
                Err.Number = 0

                Exit Function
            End If
            On Error GoTo 0
            'init
            dictionary.init(ConnStringIntraSellData)
        End If

        IntraSellDictionary = dictionary
    End Function


    'once at program start
    Public Sub loadCharsets()
        Dim rs As MySql.Data.MySqlClient.MySqlDataReader
        rs = openRecordset("select set from ofDictionarySets where CHARSET like 'ENG'")
        charSet_ENG = rs("Set")
        rs = openRecordset("select * from ofDictionarySets where CHARSET like 'CYRASCII'")
        charSet_CYRASCII = rs("Set")
        rs = openRecordset("select * from ofDictionarySets where CHARSET like 'CYRUNICODE'")
        charSet_CYRUNICODE = rs("Set")
    End Sub


    Public Function translate(formToTranslate As String)
        If VarValue("LANGUAGE") = "DEU" Then Exit Function

        If Len(charSet_CYRUNICODE) <= 5 Then Call loadCharsets()

        Debug.Print("translate " & formToTranslate)
        Dim frm As Form
        Dim guiElement As Control
        Dim subGuiElement

        frm = Forms(formToTranslate)

        'For Each guiElement In frm.Controls

        '    If guiElement.ControlType = acSubform Then
        '        'Debug.Print "check " & guiElement.Name
        '        Dim sfn : sfn = guiElement.SourceObject
        '        If Not IsNull(guiElement.SourceObject) Then
        '            For Each subGuiElement In guiElement.Form.Controls
        '                If subGuiElement.ControlType = acLabel Or subGuiElement.ControlType = acCommandButton Then
        '                    subGuiElement.Caption = getTranslation(subGuiElement.Caption)
        '                End If
        '            Next
        '        End If
        '        'Debug.Print "sfn " & sfn

        '    End If
        '    If guiElement.ControlType = acLabel Or guiElement.ControlType = acCommandButton Or guiElement.ControlType = acPage Then
        '        Dim cap : cap = guiElement.Caption
        '        guiElement.Caption = getTranslation(cap)
        '    End If
        'Next
        translate = True
    End Function

    Public Function getTranslation(ByVal german As String) As String

        Dim currentLanguage : currentLanguage = VarValue("LANGUAGE")
        getTranslation = german
        Dim rs As MySql.Data.MySqlClient.MySqlDataReader

        Dim sql
        sql = "select * from ofDictionary where DEU Like '" & german & "'"
        rs = openRecordset(sql)

        If rs.Read Then
            If Len(rs(currentLanguage)) > 0 Then getTranslation = rs(currentLanguage)
            'decoding for bulgarian
            If currentLanguage = "BUL" Then
                If Len(rs(currentLanguage)) > 0 Then getTranslation = stringToCyr(rs(currentLanguage))
            End If

        Else
            If currentLanguage = "DEU" Then
                sql = "Insert into ofDictionary (DEU) values('" & german & "')"
                RunSQL(sql)
            End If
        End If
        rs.Close()
    End Function


    Function getTranslationDeu(ByVal foreignLang As String) As String

        Dim currentLanguage As String = VarValue("LANGUAGE")

        If currentLanguage = "BUL" Then foreignLang = stringToLat(foreignLang)
        getTranslationDeu = foreignLang

        Dim sql
        Dim rs As MySql.Data.MySqlClient.MySqlDataReader
        foreignLang = Replace(foreignLang, "'", "*")
        sql = "select * from ofDictionary where " & VarValue("LANGUAGE") & " Like '" & foreignLang & "'"
        rs = openRecordset(sql)

        If rs.Read Then
            If Len(rs(currentLanguage)) > 0 Then getTranslationDeu = rs("DEU")
        End If
        rs.Close()
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
        Dim cyrString : cyrString = ""
        Dim i As Integer
        For i = 1 To Len(latString)
            cyrString = cyrString + charFromTo(Mid(latString, i, 1), fromSet, toSet)
        Next
        stringFromTo = cyrString
    End Function



    Public Sub OpenTransForm(TableName As String, Key As String, FieldName As String, textToTranslate As String)
        'OpenForm("translations")
        'Forms("translations").fTableName = TableName
        'Forms("translations").fKey = Key
        'Forms("translations").fFieldName = FieldName
        'Forms("translations").textToTranslate = textToTranslate
        'Forms("translations").btnFilter_Click()
    End Sub

    'Liefert die Übersetzung oder wenn keine vorhanden original text
    Public Function getTranslationDok(ByVal TableName As String, _
                             ByVal Key As String, _
                             ByVal FieldName As String, _
                             ByVal textToTranslate As String, _
                             ByVal language_Code As String)

        getTranslationDok = IntraSellDictionary.getTranslationDok(TableName, Key, FieldName, textToTranslate, language_Code)
    End Function


    Public Function getLanguageForVorgang(ByVal VorgangTyp As String, ByVal VorgangNummer As Long)

        Dim VORGANG_TYP_LAU As String = "LAU"
        If Len(CURRENT_LANGUAGE_CODE) = 3 Then
            Return CURRENT_LANGUAGE_CODE
            Exit Function
        End If


        Dim VonForm As String = getVorgangTableForType(VorgangTyp)

        Dim def_language_Code As String = VarValue_Default("LANGUAGE_DOK_" & ModuleGlobals.MitarbeiterID, "DEU")

        Dim kund_language_Code As String
        If VorgangTyp = VORGANG_TYP_LAU Then
            kund_language_Code = firstRow("select adr.language_code from " & VonForm & " a, `ofadressen-settings` adr " & _
                              " where a.lieferantNr = adr.IDNR and a.Nummer=" & VorgangNummer)
        Else
            kund_language_Code = firstRow("select adr.language_code from " & VonForm & " a, `ofadressen-settings` adr " & _
                              " where a.KundNr = adr.IDNR and a.Nummer=" & VorgangNummer)
        End If

        If Len(kund_language_Code) = 3 Then
            Return kund_language_Code
        Else
            Return def_language_Code
        End If


    End Function

    'Public Function getLanguageForVorgang_(ByVal Vorgangtyp As String, ByVal VorgangNummer As Long)
    '    getLanguageForVorgang_ = IntraSellDictionary.getLanguageForVorgang(Vorgangtyp, VorgangNummer, ModuleGlobals.MitarbeiterID)
    'End Function

End Module

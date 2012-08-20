
Option Explicit On
Imports MySql.Data.MySqlClient
Imports IntraSell_DLL

Module ModuleXML



    Function QueryToXML(ByVal sql As String, Optional baseTagName As String = "") As String
        Dim rs As MySqlDataReader
        Dim line As String
        Dim FeldName As String
        Dim FeldWert As String

        Dim i As Integer
        rs = openRecordset(sql)

        line = ""


        While rs.Read
            If baseTagName <> "" Then
                line = line & "<" & baseTagName & ">"
            End If

            'A CDATA section starts with "<![CDATA[" and ends with "]]>":
            For i = 1 To rs.FieldCount
                FeldName = Replace(rs(i - 1).Name, " ", "")
                FeldName = Replace(FeldName, "_", "")

                If InStr(FeldName, "<") <= 0 And InStr(FeldName, ">") <= 0 Then

                    FeldWert = rs(i - 1).Value & ""

                    If FeldWert = "" Then
                        FeldWert = "_"
                    End If

                    If Trim(FeldWert) <> "" Then 'nur dann einfügen wenn daten vorhanden sind
                        'Start Tag
                        If Not IsNumeric(FeldName) Then
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
                                'Als Sandard Zahl Formatieren, aber nurr dann wenn keine Differenz entsteht

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
                        End If 'nicht numeric
                    End If

                End If
            Next

            ' "<![CDATA[" & _ '  "]]>" & _

            If baseTagName <> "" Then
                line = line & "</" & baseTagName & ">"
            End If

        End While
        rs.Close()


        QueryToXML = line
    End Function



    Function encodeForXML(ByVal txt As String) As String
        If Left(txt, 1) = "_" Then 'führende "_" entfernen
            txt = Mid(txt, 2)
        End If
        txt = "<![CDATA[" & txt & "]]>"
        encodeForXML = txt
    End Function

    Function encodeForXML_wrong(ByVal txt As String) As String
        txt = Replace(txt, "Ä", "&Auml;", , , vbBinaryCompare)
        txt = Replace(txt, "ä", "&auml;", , , vbBinaryCompare)
        txt = Replace(txt, "Ö", "&Ouml;", , , vbBinaryCompare)
        txt = Replace(txt, "ö", "&ouml;", , , vbBinaryCompare)
        txt = Replace(txt, "Ü", "&Uuml;", , , vbBinaryCompare)
        txt = Replace(txt, "ü", "&uuml;", , , vbBinaryCompare)

        txt = Replace(txt, "ß", "&suml;", , , vbBinaryCompare)
        txt = Replace(txt, "&", "&szlig;", , , vbBinaryCompare)

        encodeForXML_wrong = txt

    End Function




    'makes XML file from query or table
    Public Function saveXML(ByVal content As String, ByVal fileName As String) As Boolean
        saveXML = False
        'If Creation of export filename wished
        Dim fs, exportFile

        Dim fileLine : fileLine = "<?xml version = ""1.0""  encoding=""Unicode"" ?>"

        fs = CreateObject("Scripting.FileSystemObject")
        exportFile = fs.CreateTextFile(fileName, True, True)

        fileLine = fileLine & content

        exportFile.Writeline(fileLine)
        exportFile.Close()
        saveXML = True
    End Function

    'filename = File1; File2
    'recipients = Email1; Email2; ...
    Public Sub openForMerge(ByVal Filenames As String, _
                                    vorlagenBereich As String, _
                                    recipients As String, _
                                    recipientsIDNR As String)
        OpenForm("tradeBoardVorlagenMerge")
        'Forms("tradeBoardVorlagenMerge").XMLFilename = Filenames
        'Forms("tradeBoardVorlagenMerge").Emails = recipients
        'Forms("tradeBoardVorlagenMerge").Bereich = vorlagenBereich
        'Forms("tradeBoardVorlagenMerge").IDNRForMailtext = recipientsIDNR
        'Forms("tradeBoardVorlagenMerge").cbDateiname.Requery()
    End Sub


End Module

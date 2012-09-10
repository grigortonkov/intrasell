'Option Strict On
Option Explicit On

Module ModuleMail

    'cAttach can be file1;file2;file3

    Public Sub mailWithOutlook(ByVal cSubject As String, _
    ByVal cName As String, _
    ByVal cAttach As String, _
    ByVal cBody As String, _
    ByVal cBodyHTML As String, _
    ByVal SofortSenden As Boolean)

        Dim fn As Object
        Dim objOutlookMsg
        Dim objOutlookRecip
        Dim objOutlookAttach

        Dim objOutlook
        objOutlook = CreateObject("Outlook.Application")

        'create object
        objOutlookMsg = objOutlook.createitem(0)
        'objOutlookRecip = objOutlookMsg.Recipients
        objOutlookAttach = objOutlookMsg.Attachments

        objOutlookMsg.display()
        If cName <> "" Then
            objOutlookMsg.Recipients.Add(cName)
        End If

        If cAttach <> "" Then
            For Each fn In Split(cAttach, ";")
                If fn <> "" Then
                    objOutlookAttach.Add(fn)
                End If
            Next
        End If

        objOutlookMsg.Subject = cSubject
        If cBody <> "" Then objOutlookMsg.Body = cBody
        If cBodyHTML <> "" Then objOutlookMsg.htmlBody = cBodyHTML

        If SofortSenden Then 
            objOutlookMsg.send()
            objOutlook = Nothing
        End If

    End Sub

    Function getMailBody(ByVal fileName)
        Dim fso, ts
        fso = CreateObject("Scripting.FileSystemObject")
        ts = fso.OpenTextFile(fileName) ', ForReading)
        getMailBody = ts.ReadAll
    End Function

    Public Sub sendAusdruckPerEmail(ByVal Vorgangtyp As String, _
                                         ByVal Vorgang_Nummer As String, _
                                         ByVal FormatNummer As String, _
                                         ByVal Dateiname As String, _
                                         ByVal SofortSenden As Boolean)
        ' a file named vorgangtyp_vorgangnummer.htm is created
        Dim OutputFilename : OutputFilename = DbFolder() & Vorgangtyp & "_" & Vorgang_Nummer & "." & Right(Dateiname, 3)
        Call OpenAusdruck_InWord_Filename_RTF(Vorgangtyp, Vorgang_Nummer, FormatNummer, Dateiname)
        Dim htmlBody : htmlBody = getMailBody(OutputFilename)
        'send with outlook
        Dim Email As String = getKundenEmail(Vorgangtyp, Vorgang_Nummer)
        If String.IsNullOrWhiteSpace(Email) Then
            Email = InputBox("Email:", "Email")
        End If

        Dim Subject As String = getDruckForType(Vorgangtyp) & " Nr. " & Vorgang_Nummer
        Call mailWithOutlook(Subject, Email, "", "", htmlBody, SofortSenden)

    End Sub

End Module

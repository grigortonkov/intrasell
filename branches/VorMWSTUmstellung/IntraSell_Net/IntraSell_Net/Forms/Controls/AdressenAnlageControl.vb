﻿Imports IntraSell_DLL
Imports IntraSell_Net.dsAdressenTableAdapters

Public Class AdressenAnlageControl
    Public Event OnNewIdnrCreated(ByVal IDNR As Integer)


    Private Sub AdressenProfil_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Me.GrbranchenTableAdapter.Fill(Me.DsBranchen.grbranchen)
    End Sub

    Private Sub AdresseTextBox_TextChanged(sender As System.Object, e As System.EventArgs) Handles AdresseTextBox.TextChanged
        If InStr(Me.AdresseTextBox.Text, "FIRMA") > 0 Then
            Exit Sub
        End If
        Dim newIdnr = AdresseAnlegen(AdresseTextBox.Text)
        If newIdnr >= 0 Then
            RaiseEvent OnNewIdnrCreated(newIdnr)
            Me.AdresseTextBox.ForeColor = Color.Green
        Else
            Me.AdresseTextBox.ForeColor = Color.Red
        End If
    End Sub

    'die Adresse IDNR wenn eine neue Adresse angelegt wird , sonst -1 
    Function AdresseAnlegen(text As String) As Integer
        'Die Adresse als Kunden Anlegen 'Beispiel-Adresse 
        'ADEG C & C Großmarkt Inh ADEG Wolfsberg
        'Unterburg , Eberndorfer Str 38
        '9122 Sankt Kanzian am Klopeiner See (K)
        '04239 21 60

        'Loesche Leere Zeilen 
        Dim tClean As String = ""
        For Each s In Split(text, vbNewLine)
            If Len(s) >= 3 Then
                tClean = tClean & s & vbNewLine
            End If
        Next
        text = tClean

        If Split(text, vbNewLine).Length >= 4 Then
            Dim Firma As String = Split(text, vbNewLine)(0)
            Dim Adresse As String = Split(text, vbNewLine)(1)
            Dim PLZORT As String = Split(text, vbNewLine)(2)
            Dim PLZ As String = Split(PLZORT, " ")(0)
            Dim Ort As String = Trim(Replace(PLZORT, PLZ, ""))
            Dim Tel As String = Split(text, vbNewLine)(3)
            If Not IsNothing(FindeZeile(text, "Telefon")) Then
                Tel = FindeZeile(text, "Telefon")
            End If
            Dim Email As String = FindeZeile(text, "E-Mail")
            Dim Web As String = FindeZeile(text, "Internet")
            Dim Fax As String = FindeZeile(text, "Fax")
            Dim Mobil As String = FindeZeile(text, "Mobil")
            If Len(Tel) <= 6 Then 'es ist keine Tel Nummer 
                Return -1
                Exit Function
            End If

            'Pruefe ob die Adresse existiert und Anlage wenn nicht 
            Dim sql As String = "select idnr from ofAdressen where tel='" & Tel & "'"
            Dim idnr As String = firstRow(sql)

            'Adresse anlegen 
            Dim target As ofadressenTableAdapter = New ofadressenTableAdapter()

            'INSERT 
            Dim Land As Nullable(Of Integer) = 43
            Dim PLZIDNR = IntraSellKunden.getPLZCreateIfNeeded(Land, Ort, PLZ)

            If IsNumeric(idnr) Then
                target.UpdateKlein(Firma:=Firma, Adresse:=Adresse, Email:=Email, PLZ:=PLZIDNR, Ort:=Ort, Fax:=Fax, Mobil:=Mobil, Tel:=Tel, Web:=Web, Original_IDNR:=idnr)
                Return idnr
            Else

               

                idnr = nextId("ofAdressen", "IDNR")
                Dim Status As String = "Neu"
                Dim Name As String = ""
                Dim Vorname As String = ""



                Dim Fax2 As String = String.Empty


                Dim actual As Integer

              

                actual = target.InsertKlein(idnr, Status, Name, Vorname, Firma, Adresse, Land, PLZIDNR, Ort, Tel, Mobil, Email, Web)
                sql = "select IDNR from ofAdressen where tel='" & Tel & "'"
                idnr = firstRow(sql)
                If Not BrancheComboBox.SelectedValue Is Nothing Then
                    'Neue Branche setzen 
                    sql = "Update ofAdressen set Branche=" & BrancheComboBox.SelectedValue & _
                          " where IdNR=" & idnr
                    RunSQL(sql)
                End If


                If IsNumeric(idnr) Then
                    Return idnr
                Else
                    Return -1
                End If
            End If
        End If
        Return -1
    End Function


    Private Sub AdresseTextBox_Click(sender As System.Object, e As System.EventArgs) Handles AdresseTextBox.Click
        If InStr(Me.AdresseTextBox.Text, "FIRMA") >= 0 Then
            Me.AdresseTextBox.Text = ""
        End If
    End Sub

    Private Sub Label1_Click(sender As System.Object, e As System.EventArgs) Handles Label1.Click
        'open herold    
        System.Diagnostics.Process.Start("http://www.herold.at")
    End Sub

    Private Function FindeZeile(text As String, begriff As String) As String
        For Each s In Split(text, vbNewLine)
            If s.Contains(begriff) Then
                Dim res As String = s.Replace(begriff, "")
                res = res.Replace(vbTab, "")
                res = res.Replace("Vorschau", "")
                Return Trim(res)
            End If
        Next
        Return String.Empty
    End Function

End Class
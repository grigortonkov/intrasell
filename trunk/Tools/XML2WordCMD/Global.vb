Module [Global]

    'arguments
    ' Argument1 : XML File
    ' Argument2 : Word Template 
    ' Argument3 : Generation Path
    ' Argument4 : Filename Prefix
    Public Sub Main(ByVal CmdArgs() As String)
        Dim frm As New XML2WordForm()

        If CmdArgs.Length <> 4 Then
            MessageBox.Show("This Programm needs 4 arguments!")
            Exit Sub
        End If
        Try
            Dim xml2Word As XML2Word.clMain = New XML2Word.clMain()

            frm.TextBox1.Text = CmdArgs(0)
            frm.TextBox2.Text = CmdArgs(1)
            frm.TextBox3.Text = CmdArgs(2)
            frm.TextBox4.Text = CmdArgs(3)

            xml2Word.XMLFile = CmdArgs(0)
            xml2Word.WordTemplate = CmdArgs(1)
            xml2Word.Path = CmdArgs(2)
            xml2Word.Execute(CmdArgs(3))


        Catch
            MsgBox(Err.Description)
            frm.ShowDialog()
        End Try

    End Sub

End Module

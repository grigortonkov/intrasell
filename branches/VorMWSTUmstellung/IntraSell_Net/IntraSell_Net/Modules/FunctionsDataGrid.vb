Class FunctionsDataGrid

    ' Trennzeichen in der CSV Datei
    Private Const COLUMN_SEPERATOR As String = ";"
    Private _dt As DataTable


    Public Property Table() As DataTable
        Get
            Return _dt
        End Get
        Set(value As DataTable)
            _dt = value
        End Set
    End Property

    ''' <summary>
    ''' Testpfad in dem die CSV Datei gespeichert wird.
    ''' </summary>
    Private ReadOnly Property Filename() As String
        Get
            Return IO.Path.Combine(Application.StartupPath, "grid_csv.csv")
        End Get
    End Property

    ''' <summary>
    ''' Inhalt des DataGridView in eine durch ein Komma 
    ''' getrennte CSV Datei exportieren
    ''' </summary>
    Public Function ExportDataGridContentToCSVFile( _
      Optional Filename As String = Nothing) As Boolean


        If Filename Is Nothing Then
            Dim o As New OpenFileDialog
            o.Filter = "CSV Dateien (*.csv)|*.csv|Alle Dateien (*.*)|*.*"
            o.CheckFileExists = False
            If o.ShowDialog() = System.Windows.Forms.DialogResult.OK Then
                Filename = o.FileName
            Else
                Return False
                Exit Function
            End If

        End If

        ' Die Variable Created übernimmt den Kontrollwert,
        ' ob die Datei angelegt wurde.

        Dim Created As Boolean = False
        ' Fehlerüberwachung einschalten

        Dim count As Integer = _dt.Columns.Count - 1
        Try
            ' StreamWriter initialisieren
            Using sw As IO.StreamWriter = New IO.StreamWriter( _
              Filename, False, System.Text.Encoding.Unicode)

                ' Spalten anlegen
                For n As Integer = 0 To count
                    sw.Write(_dt.Columns(n))
                    If (n < count) Then
                        sw.Write(COLUMN_SEPERATOR)
                    End If
                Next

                ' Neue Zeile schreiben und...
                sw.Write(sw.NewLine())

                ' ... den Inhalt des Grids in eine Komma 
                ' getrennte Datei speichern.
                For Each dr As DataRow In _dt.Rows()
                    For n As Integer = 0 To count
                        If Not Convert.IsDBNull(dr(n)) Then
                            sw.Write(dr(n).ToString())
                        End If
                        If (n < count) Then
                            sw.Write(COLUMN_SEPERATOR)
                        End If
                    Next

                    ' Neue Zeile anlegen.
                    sw.Write(sw.NewLine())
                Next
            End Using

            ' Wurde die Datei angelegt wird die Kontrollvariable 
            ' Created mit True initialisiert
            If IO.File.Exists(Filename) Then Created = True

        Catch ex As IO.IOException
            ' Eventuell auftretenden Fehler abfangen
            MessageBox.Show(ex.Message(), "Info - IOException")
        Catch ex As Exception
            MessageBox.Show(ex.Message(), "Info - Exception")
        End Try

        ' Funktionsrückgabe

        MsgBox("Die Datei " & Filename & " wurde erfolgreich erstellt!", vbOKOnly)
        Return Created
    End Function
End Class

Public Class AbstractForm

    ''' <summary>
    ''' wenn true dann wird beim starten die Position auf einem neuen Record gesetzt 
    ''' </summary>
    ''' <remarks></remarks>
    Public BeginNewFlag = False
    ''' <summary>
    ''' ob der user eine  neue Position angefordert hat
    ''' </summary>
    ''' <remarks></remarks>
    Protected AddingNewFlag As Boolean = False
    ''' <summary>
    ''' ds to check if saved or not 
    ''' </summary>
    ''' <remarks></remarks>
    Protected ds As DataSet


    ''' <summary>
    ''' Check if user input is saved
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub Vorgang_Closing(ByVal sender As System.Object, ByVal e As FormClosingEventArgs) Handles MyBase.FormClosing
        'Check if unsaved 
        ds.EndInit()
        If Not ds.GetChanges Is Nothing Then
            Dim response = MsgBox("Möchten Sie die Änderungen speichern?", vbYesNoCancel)

            If response = vbYes Then
                BindingNavigatorSaveItem.PerformClick()
                e.Cancel = True
            End If
            If response = vbCancel Then
                e.Cancel = True
            End If
            If response = vbNo Then

            End If
        End If
    End Sub


End Class
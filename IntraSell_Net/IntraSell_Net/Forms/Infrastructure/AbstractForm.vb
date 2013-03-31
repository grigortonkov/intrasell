Public Class AbstractForm

    Public BeginNewFlag = False 'wenn true dann wird beim starten die Position auf einem neuen Record gesetzt 
    Protected AddingNewFlag As Boolean = False 'ob der user eine  neue Position angefordert hat

    Private Sub AbstractForm_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub OfAdressenBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles OfAdressenBindingNavigatorSaveItem.Click

    End Sub

    Private Sub BindingNavigatorAddNewItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorAddNewItem.Click

    End Sub
End Class
Attribute VB_Name = "functionsPLZ"
Option Compare Database

Sub neuePLZ(frm As Form, Land As String)
        DoCmd.OpenForm "grPLZ", acNormal, , , acFormAdd ', acDialog
        Set Forms("grPLZ").FormToUpdate = frm
        Forms("grPLZ").Land = Land
End Sub

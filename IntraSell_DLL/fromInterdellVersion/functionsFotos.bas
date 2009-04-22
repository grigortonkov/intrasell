Attribute VB_Name = "functionsFotos"

Option Compare Database
Option Explicit

Sub fotoFormShow(ByVal TableName As String, ByVal Filter As String)


DoCmd.OpenForm "ofFotos"
Forms("ofFotos").RecordSource = "ofFotos"
Forms("ofFotos").Filter = "TabelleName ='" & TableName & "' and Filter='" & Filter & "'"
Forms("ofFotos").FilterOn = True

Forms("ofFotos").baseTabelleName = TableName
Forms("ofFotos").baseFilter = Filter
Call Forms("ofFotos").btnZeigen_Click
End Sub


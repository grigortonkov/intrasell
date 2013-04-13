Attribute VB_Name = "functionsListBoxes"
Option Compare Database

'returns the list value
Public Function getListValue(ByVal row As Integer, ByVal col As Integer, ByRef list As ListBox) As String
     Dim index As Integer: index = (row) * list.ColumnCount + col
     getListValue = Split(list.RowSource, ";")(index)
End Function

VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IntraSellKunden"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Sub init(ByVal connString)
    functionsDB.ConnStringODBC = connString '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
    functionsDB.connOpen
    Set CurrentDB = functionsDB.CurrentDB
End Sub



Public Function neueAdresse()

End Function

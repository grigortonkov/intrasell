VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IntraSellConst"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Function VORGANG_TYP_LI() '110235E0
   VORGANG_TYP_LI = "LI"
End Function

Public Function VORGANG_TYP_AR() '11023670
  VORGANG_TYP_AR = "AR"
End Function

Public Function VORGANG_TYP_AN() '11023700
   VORGANG_TYP_AN = "AN"
End Function

Public Function VORGANG_TYP_AU() '11023790
   VORGANG_TYP_AU = "AU"
End Function

Public Function VORGANG_TYP_LAU() '11023820
   VORGANG_TYP_LAU = "LAU"
End Function

Attribute VB_Name = "functionsDial"
Option Compare Database

' Benötigte API-Deklaration
Private Declare Function tapiRequestMakeCall Lib "tapi32.dll" ( _
  ByVal lpszDestAddress As String, _
  ByVal lpszAppName As String, _
  ByVal lpszCalledParty As String, _
  ByVal lpszComment As String) As Long
        
        
Private Const TAPIERR_NOREQUESTRECIPIENT = -2&
Private Const TAPIERR_REQUESTQUEUEFULL = -3&
Private Const TAPIERR_INVALDESTADDRESS = -4&


' Windows-Wählhilfe starten und Telefonnummer wählen
Public Sub Dial(ByVal sPhoneNumber As String, _
  ByVal sRecipient As String, _
  Optional ByVal sComment As String = "")
  
  Dim sBuffer As String
  Dim nResult As Long
 
  ' Wählhilfe starten und Telefonnummer wählen
    nResult = tapiRequestMakeCall(sPhoneNumber, _
    "Intrasell", sRecipient, sComment)
    
  ' Rückgabewert auswerten
  If nResult <> 0 Then
    ' Fehler!
    Select Case nResult
      Case TAPIERR_NOREQUESTRECIPIENT
        MsgBox "Diw Windows Wählhilfe ist nicht installiert" & _
          " oder konnte nicht gestartet werden!"
                                     
      Case TAPIERR_REQUESTQUEUEFULL
        MsgBox "Die Anrufschlange ist voll!"
                                    
      Case TAPIERR_INVALDESTADDRESS
        MsgBox "Ungültige Telefonnummer!"
                
      Case Else
        MsgBox "Sonstiger Fehler!"
                
    End Select
  End If
End Sub


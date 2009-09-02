Option Strict Off
Option Explicit On
Module [Global]
	
	Public oWord As Word.Application
	Public nRef As Short
	
	Public Function GetPath(ByRef sPath As String) As String
		
		Dim lPos As Integer
		
		lPos = InStrRev(sPath, "\")
		If lPos > 0 Then
			GetPath = Left(sPath, lPos)
		Else
			GetPath = ""
		End If
		
	End Function
End Module
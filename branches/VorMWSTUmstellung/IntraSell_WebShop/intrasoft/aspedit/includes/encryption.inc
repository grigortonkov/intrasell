<%
Function EnCode(Eingabe)
	Key=int(len(Eingabe)+2)
	Encode = ""
	For i = 1 to Len(Eingabe)
		Encode=Encode & (Chr(key Xor Asc(Mid(Eingabe, i, 1))))
	next
End Function

Function DeCode(Eingabe)
	Key=int(len(Eingabe)+2)
	DeCode = ""
	For i = 1 to Len(Eingabe)
		Decode=Decode & (Chr(key Xor Asc(Mid(Eingabe, i, 1))))
	next
End Function
%>
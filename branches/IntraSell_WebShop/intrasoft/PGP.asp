<%
'===========================================================================
' General ASP Functions
' This is collection of usefull ASP functions and procedures.
' Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'
'
'============================================================================
' History
'____________________________________________________________________________
' DATE         WHAT
'____________________________________________________________________________

'publicKey and privateKey are 16 charachters long
Const KEY_LENGTH = 16


Function CreateRandomKey()
Dim key 
randomize
FOR i = 1 TO KEY_LENGTH 
 key = key &  Chr(ASC("A") +Rnd(24)*1000 MOD 24)
NEXT
CreateRandomKey = key
End Function



'reverts simply a string
Function revertString(key)
  Dim revertKey
  Dim i 
  'Simple implementation
  i = Len(key)
  While Len(revertKey) < Len(key)
  revertKey = revertKey + Right(Left(key, i), 1)
  i = i - 1
  Wend
  revertString = revertKey
End Function




' converts public to private and/or back
'Parameters: key - the key; toPrivate - TRUE makes public to private
Function convertKey(key, toPrivate)
If Len(key) <> KEY_LENGTH Then
 convertKey = "Error: the Key is not 16 characters long! This is NOT a valid Key!"
 Exit Function
End If

 Dim revertedKey, newKey, i
 
  revertedKey = revertString(key) 
 i = 1
while len(newKey) < len(revertedKey)
 if toPrivate THEN 
  newKey = newKey + Chr(Asc(Mid(revertedKey,i,1)) +1)
 ELSE
  newKey = newKey + Chr(Asc(Mid(revertedKey,i,1)) -1)
 END IF  
 
i = i + 1
wend



convertKey = newKey
End Function


'Encrypts an message
Public Function Encrypt(publicKey, message)
Dim privateKey
Dim encryptedMessage, revertMessage


If Len(publicKey) <> KEY_LENGTH Then
 Encrypt = "Error: the public Key is not 16 characters long! This is NOT a valid Key!"
 Exit Function
End If

privateKey = convertKey(publicKey, TRUE)

revertMessage = revertString(message)
encryptedMessage = ""


Dim pos, newCode 
pos = 1
Dim codedSymbol

While Len(encryptedMessage) < Len(revertMessage)
  newCode = Asc(Mid(revertMessage, pos, 1)) + Asc(Mid(privateKey, pos Mod KEY_LENGTH + 1, 1))
 if newCode > 0 AND newCode < 255 THEN
  codedSymbol = Chr(newCode)
 ELSE 
  codedSymbol ="X"
 END IF
encryptedMessage = encryptedMessage + codedSymbol
pos = pos + 1
Wend

Encrypt = encryptedMessage
End Function


'Decrypts an message
Public Function Decrypt(privateKey, message)
Dim encryptedMessage


If Len(privateKey) <> KEY_LENGTH Then
 Decrypt = "Error: the publicKey is not 16 charachters long!"
 Exit Function
End If

encryptedMessage = ""


Dim pos : pos = 1
Dim codedSymbol, newCode

While Len(encryptedMessage) < Len(message)
 newCode = Asc(Mid(message, pos, 1)) - Asc(Mid(privateKey, pos Mod KEY_LENGTH + 1, 1))
 IF newCode > 0 THEN
 codedSymbol = Chr(newCode)
 ELSE
 codedSymbol ="X" 
 END IF
  encryptedMessage = encryptedMessage + codedSymbol
pos = pos + 1
Wend

encryptedMessage = revertString(encryptedMessage)

Decrypt = encryptedMessage
End Function


Sub TestSub()
Dim em, dm
Dim privateK, pubK

pubK = "1290341021297364"
pubK = CreateRandomKey()
privateK = convertKey(pubK, TRUE)

Response.write "<br>Public Key: " + pubK
Response.write "<br>Private Key (derived from public): " + privateK
Response.write "<br>Public Key (derived from private): " + convertKey(privateK, FALSE)


 ' Debug.Print convertKey("1234561234561234")
  em = Encrypt(pubK, "Schardone Han Krum")
  Response.write "<br>Encrypted Message: " + em

  dm = Decrypt(privateK, em)
  Response.write "<br>Decrypted Message: " + dm
End Sub

%>
<html>

<head>
<title></title>
</head>

<body>
</body>
</html>

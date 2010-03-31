<script language="VB" runat="server">   
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


    ''' <summary>
    ''' CreateRandomKey
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function CreateRandomKey()
        Dim key
        Randomize()
        For i = 1 To KEY_LENGTH
            key = key & Chr(Asc("A") + Rnd(24) * 1000 Mod 24)
        Next
        CreateRandomKey = key
    End Function



    
    ''' <summary>
    ''' reverts simply a string
    ''' </summary>
    ''' <param name="key"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function revertString(ByVal key)
        Dim revertKey
        Dim i
        'Simple implementation
        i = Len(key)
        While Len(revertKey) < Len(key)
            revertKey = revertKey + Right(Left(key, i), 1)
            i = i - 1
        End While
        revertString = revertKey
    End Function

 
    ' converts public to private and/or back
    'Parameters: key - the key; toPrivate - TRUE makes public to private
    Function convertKey(ByVal key, ByVal toPrivate)
        If Len(key) <> KEY_LENGTH Then
            convertKey = "Error: the Key is not 16 characters long! This is NOT a valid Key!"
            Exit Function
        End If

        Dim revertedKey, newKey, i
 
        revertedKey = revertString(key)
        i = 1
        While Len(newKey) < Len(revertedKey)
            If toPrivate Then
                newKey = newKey + Chr(Asc(Mid(revertedKey, i, 1)) + 1)
            Else
                newKey = newKey + Chr(Asc(Mid(revertedKey, i, 1)) - 1)
            End If
 
            i = i + 1
        End While

        convertKey = newKey
    End Function


    'Encrypts an message
    Public Function Encrypt(ByVal publicKey, ByVal message)
        Dim privateKey
        Dim encryptedMessage, revertMessage


        If Len(publicKey) <> KEY_LENGTH Then
            Encrypt = "Error: the public Key is not 16 characters long! This is NOT a valid Key!"
            Exit Function
        End If

        privateKey = convertKey(publicKey, True)

        revertMessage = revertString(message)
        encryptedMessage = ""


        Dim pos, newCode
        pos = 1
        Dim codedSymbol

        While Len(encryptedMessage) < Len(revertMessage)
            newCode = Asc(Mid(revertMessage, pos, 1)) + Asc(Mid(privateKey, pos Mod KEY_LENGTH + 1, 1))
            If newCode > 0 And newCode < 255 Then
                codedSymbol = Chr(newCode)
            Else
                codedSymbol = "X"
            End If
            encryptedMessage = encryptedMessage + codedSymbol
            pos = pos + 1
        End While

        Encrypt = encryptedMessage
    End Function


    'Decrypts an message
    Public Function Decrypt(ByVal privateKey, ByVal message)
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
            If newCode > 0 Then
                codedSymbol = Chr(newCode)
            Else
                codedSymbol = "X"
            End If
            encryptedMessage = encryptedMessage + codedSymbol
            pos = pos + 1
        End While

        encryptedMessage = revertString(encryptedMessage)

        Decrypt = encryptedMessage
    End Function


    Sub TestSub()
        Dim em, dm
        Dim privateK, pubK

        pubK = "1290341021297364"
        pubK = CreateRandomKey()
        privateK = convertKey(pubK, True)

        Response.Write("<br>Public Key: " + pubK)
        Response.Write("<br>Private Key (derived from public): " + privateK)
        Response.Write("<br>Public Key (derived from private): " + convertKey(privateK, False))


        ' Debug.Print convertKey("1234561234561234")
        em = Encrypt(pubK, "Schardone Han Krum")
        Response.Write("<br>Encrypted Message: " + em)

        dm = Decrypt(privateK, em)
        Response.Write("<br>Decrypted Message: " + dm)
    End Sub

</script>


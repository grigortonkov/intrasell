Imports IntraSell_DLL

Module ModuleBarcode


    Public Const BARCODE_LENGTH = 16

    'creates new barcode
    'if already one product with LE exists then the next ITEM is selected
    Public Function generateNewBarcode(ByVal ArtNr As String, ByVal LieferantNR As String) As String
        Dim ANR, lNr, itemID
        Dim newBarcode

        ANR = Right("0000000" & ArtNr, 7)
        lNr = Right("0000" & LieferantNR, 4)
        itemID = "00001"



        Dim sql As String, rs As MySql.Data.MySqlClient.MySqlDataReader
        sql = "select Barcode from [grArtikel-ItemTrackingHistory] where vorgangstyp='LE' and  Barcode like '" & ANR & lNr & "*' order by Barcode desc"   'lager eingang
        rs = openRecordset(sql)

        If rs.Read Then
            Dim nbc = rs("Barcode") + 1
            newBarcode = Right("0000000" & nbc, 16)
        Else
            newBarcode = ANR & lNr & itemID
        End If

        generateNewBarcode = newBarcode
    End Function

    Public Function getArtNrFromBC(ByVal BC As String) As String
        getArtNrFromBC = Left(BC, 7)
    End Function


    Public Function getLieferantNrFromBC(ByVal BC As String) As String
        getLieferantNrFromBC = Mid(BC, 8, 4)
    End Function



    Public Function isBarcodeOK(ByVal BC As String, ByVal Silent As Boolean) As Boolean
        isBarcodeOK = True
        If Len(BC) <> BARCODE_LENGTH Then
            isBarcodeOK = False
            If Not Silent Then MsgBox("Die Barcode muss " & BARCODE_LENGTH & " Stellen haben!", vbCritical)
            'show in satus text
            Debug.Print("Die Barcode muss " & BARCODE_LENGTH & " Stellen haben!", vbCritical)
        End If
    End Function

    Function makeBCHistory(ByVal BC As String, ByVal Vorgangtyp As String, ByVal VorgangNummer As String, ByVal Status As String) As Boolean
        makeBCHistory = False
        If BC & "" = "" Then Exit Function

        makeBCHistory = True


        Dim sqlBC As String

        sqlBC = "Insert into [grArtikel-ItemTrackingHistory] (Barcode, Vorgangstyp, VorgangsNummer, Status, [Timestamp]) " & _
                " Values ('" & BC & "','" & Vorgangtyp & "'," & VorgangNummer & ",'" & Status & "', now())"
        Call writeLog("TRY " & sqlBC)
        RunSQL(sqlBC)
        Call writeLog("DONE " & sqlBC)

    End Function



    Public Function checkIfVorgangProperScanned(ByVal Vorgangstyp As String, ByVal Vorgangsnummer As String) As String
        Dim sql, rs, rsAlle

        sql = "select count(*) as c from [" & getVorgangArtikelTableForType(Vorgangstyp) & "] where not Bezeichnung like '*CALCULATE*' and (ArtikelIdentifikation is null or ArtikelIdentifikation="""") and rechnr = " & Vorgangsnummer
        rs = openRecordset(sql)

        sql = "select count(*) as c from [" & getVorgangArtikelTableForType(Vorgangstyp) & "] where  not Bezeichnung like '*CALCULATE*' and  rechnr = " & Vorgangsnummer
        rsAlle = openRecordset(sql)

        If Not rs.EOF Then
            If rs("c") = 0 Then
                checkIfVorgangProperScanned = "alle Pos. OK"
            Else
                checkIfVorgangProperScanned = rs("c") & " von " & rsAlle("c") & " Pos.offen"
            End If

        Else
            checkIfVorgangProperScanned = "keine Pos."
        End If


        rs.Close()
        rsAlle.Close()

    End Function

    Function getBarcodeNachSeriennummer(ByVal txtSeriennummer As String)

        Dim sql, rs
        sql = "select  Barcode from [grArtikel-ItemTrackingHistory] where SerienNrOriginal like '" & txtSeriennummer & "'"
        rs = openRecordset(sql)
        If Not rs.EOF Then
            getBarcodeNachSeriennummer = rs("Barcode")
        Else
            getBarcodeNachSeriennummer = ""
        End If

    End Function



End Module

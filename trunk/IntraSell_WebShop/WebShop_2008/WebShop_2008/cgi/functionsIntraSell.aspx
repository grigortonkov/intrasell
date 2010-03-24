<script language="VB" runat="server">   

    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================

    '*****************************************************************
    ' the file contains the business functions needed for IntraSell
    ' get name for the table with orders
    '*****************************************************************

    '**Start Encode**

    Const CALCULATE_POSTCOSTS = "CALCULATE_POSTCOSTS"
    Const CALCULATE_PAYMODECOSTS = "CALCULATE_PAYMODECOSTS"
    Const CALCULATE_GUTSCHEIN = "CALCULATE_GUTSCHEIN"
    Const CALCULATE_MIN_ORDER_VALUE = "CALCULATE_MIN_ORDER_VALUE" 'EAN of the Product that contains the Price when order value is less than defined
    Const CALCULATE_BASKET_DISCOUNT = "CALCULATE_BASKET_DISCOUNT"

    Function getNameFor(ByVal OrderType)
        getNameFor = getDruckForType(OrderType)
    End Function

    '*****************************************************************
    'get name for the table with orders
    '*****************************************************************
    Function getNameForTable(ByVal OrderType)
        getNameForTable = getVorgangTableForType(OrderType)
    End Function

    '*****************************************************************
    'get name for the table with products
    '*****************************************************************
    Function getNameForTableProducts(ByVal OrderType)
        getNameForTableProducts = getVorgangArtikelTableForType(OrderType)
    End Function


    '*************************************************************************
    ' returns the sum of the POST expenses
    ' searches for POST-AT-1
    ' NACHNAHME-AT
    ' NACHNAHME-DE etc. 
    '*************************************************************************
    Function calculatePaymentModeSpends(ByVal PaymentMode, _
                                        ByVal Country, _
                                        ByVal Gewicht, _
                                        ByVal Umsatz)
        Dim sql, rsP
        sql = "SELECT * FROM [grArtikel-Vertriebskosten] Where Methode = '" & PaymentMode & "' and Destination like '" & Country & "'"
        rsP = objConnectionExecute(sql)
        If rsP.EOF Then
            calculatePaymentModeSpends = 0
        Else
            calculatePaymentModeSpends = rsP("Fixekosten") + rsP("VariableKostenNachGewicht") * Gewicht + rsP("VariableKostenNachUmsatz") * Umsatz
        End If
        rsP.close()
    End Function

    '******************************************************************************
    ' returns the ArtNR of the POST expenses
    ' searches for POST-AT-1
    ' NACHNAHME-AT
    ' NACHNAHME-DE etc. 
    ' if no payment mode artnr is found returns -1
    '******************************************************************************
    Function getPaymentModeSpendsArtNr(ByVal PaymentMode, ByVal Country)
        getPaymentModeSpendsArtNr = tableValue("grArtikel", "EAN", "'" & CALCULATE_PAYMODECOSTS & "'", "ArtNr")
    End Function

    '******************************************************************************
    ' returns the amount of the POST expenses
    ' searches for POST-AT-1
    ' POST-AT-2
    ' EXPRESSPOST-AT-2 usw.
    ' POST-DE-1 etc. 
    '
    ' Express- true false 
    '******************************************************************************
    Function calculatePostSpends(ByVal PostModeDestionation, ByVal Kg, ByVal PostMode)
        Kg = Kg + 0
        If Kg Is Nothing Then Kg = 0
        If (Kg) Is Nothing Then
            Kg = 0
        Else
            Kg = Math.Round(Kg, 2)
        End If
	
        Dim sql, rsP
        sql = "SELECT destination, Fixekosten, VariableKostenNachGewicht " & _
              " FROM [grArtikel-Vertriebskosten] Where destination like '" & PostModeDestionation & "'" & _
              " and Methode Like '" & PostMode & "' AND GewichtVon<=" & Replace(Kg, ",", ".") & " AND GewichtBis> " & Replace(Kg, ",", ".")
        'Response.Write sql
        rsP = objConnectionExecute(sql)
        If rsP.EOF Then
            calculatePostSpends = 0
        Else
            calculatePostSpends = rsP("Fixekosten") + rsP("VariableKostenNachGewicht") * Kg
        End If
        rsP.close()
    End Function

    '*************************************************************************
    ' returns the number of the post expenses product nr 
    ' Express - true or false 
    '*************************************************************************
    Function getPostSpendsArtNr(ByRef Country, ByRef Kg, ByRef PayMode)
        getPostSpendsArtNr = tableValue("grArtikel", "EAN", "'" & CALCULATE_POSTCOSTS & "'", "ArtNr")
    End Function

    '*************************************************************************
    ' returns the wight of all prodcuts 
    '*************************************************************************

    Function getWeightOfProduct(ByVal ArtNR)
        Dim weight : weight = 0
        'on error resume next 
        'Response.Write TABLEVALUE("grArtikel","ArtNR", ArtNR, "gewicht")
        'Response.Flush
        Dim weightString : weightString = TABLEVALUE("grArtikel", "ArtNR", ArtNR, "gewicht") & ""
        'weightString = replace(weightString,",",".")
        If Not IsNumeric(weightString) Then
            getWeightOfProduct = 0
            Exit Function
        End If
        weight = 1 * CDbl(weightString)
        If weight < 0 Or weight = "" Or Len(weight) = 0 Then weight = 0
        getWeightOfProduct = weight
        If showdebug() Then Response.Write("Weight=" & weight)
    End Function

    '*************************************************************************
    ' getWeightOfOrder
    '*************************************************************************
    Function getWeightOfOrder(ByVal OrderType, ByVal Nummer)
        Dim sql, rs
        sql = "SELECT ArtNR, Stk from [" & getVorgangArtikelTableForType(OrderType) & "] Where RechNr=" & Nummer
        rs = objConnectionExecute(sql)
        Dim totalKG : totalKG = 0
	 
        While Not rs.EOF
            totalKG = totalKG + CDbl(rs("Stk")) * getWeightOfProduct(rs("ArtNR"))
            rs.MoveNext()
        End While
        rs.close()
        getWeightOfOrder = totalKG
    End Function

    '*************************************************************************
    ' getWeightOfOrder
    '*************************************************************************
    Function getWeightOfBasket(ByVal Sid)
        Dim sql, rs
        sql = "SELECT SID, ArtNr, Quantity FROM webWarenkorb " & _
           "WHERE SID=" & Sid & " AND Quantity > 0 "
			  
        rs = objConnectionExecute(sql)
        Dim totalKG : totalKG = 0
	 
        While Not rs.EOF
            totalKG = totalKG + rs("Quantity") * getWeightOfProduct(rs("ArtNR"))
            rs.MoveNext()
        End While
        rs.close()
        getWeightOfBasket = totalKG
    End Function


    '*************************************************************************
    ' isWarenkorbEmpty
    ' SID - Session ID
    '*************************************************************************	
    Function isWarenkorbEmpty(ByVal SID)
        Dim sql, rsWK
        sql = "SELECT * FROM webWarenkorb Where SID=" & SID
        rsWK = objConnectionExecute(sql)
        isWarenkorbEmpty = rsWK.EOF
    End Function


    '*************************************************************************
    ' liefert mindestbestellmenge für eine Bestellung 
    '*************************************************************************	
    Function getMinOrderValue()
        getMinOrderValue = VARVALUE_DEFAULT(CALCULATE_MIN_ORDER_VALUE, "100") '100 Euro ist mindestbestellwert
    End Function

    Function getMinOrderValue_charge_artnr()
        getMinOrderValue_charge_artnr = tablevalue("grArtikel", "EAN", "'" & CALCULATE_MIN_ORDER_VALUE & "'", "ArtNr")
    End Function

    Function getMinOrderValue_charge()
        'wrong getMinOrderValue_charge = tablevalue("grArtikel","EAN", "'" & CALCULATE_MIN_ORDER_VALUE & "'", "PreisATS")
        getMinOrderValue_charge = makeNettoPreis(getMinOrderValue_charge_artnr(), "1", 0)
    End Function


    '*************************************************************************
    ' kalkuliert rabatt für eine Bestellung 
    ' Added at 18.04.2005 for xscorpion 
    ' returns -1 if no discount calculation is set
    '*************************************************************************	
    Function getBasketDiscount_artnr()
        Dim discArt
        discArt = tablevalue("grArtikel", "EAN", "'" & CALCULATE_BASKET_DISCOUNT & "'", "ArtNr")
        If IsNumeric(discArt) Then
            getBasketDiscount_artnr = discArt
        Else
            getBasketDiscount_artnr = -1
        End If
    End Function

    '*************************************************************************
    ' kalkuliert rabatt für eine Bestellung 
    ' Added at 18.04.2005 for xscorpion 
    '*************************************************************************	
    Function getBasketDiscount_Value(ByVal totalValueOfBasket)

        getBasketDiscount_Value = 0
        Dim sql, rs
        totalValueOfBasket = Math.Round(totalValueOfBasket)
        sql = "select * from [grArtikel-OrderRabatt] where GesamtPreisVon <= " & totalValueOfBasket & " and GesamtPreisBis >=" & totalValueOfBasket
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            getBasketDiscount_Value = totalValueOfBasket * rs("Rabatt") / 100
        End If
    
    End Function

    '*************************************************************************
    ' function deleteOrder(OrderType, Nummer)
    '*************************************************************************

    Function deleteOrder(ByVal OrderType, ByVal Nummer)
        Dim tableNameOrders
        tableNameOrders = getNameForTable(OrderType)
        Dim sql : sql = "DELETE FROM " & tableNameOrders & " WHERE Nummer=" & Nummer
        objConnectionExecute(sql)
        deleteOrder = True
    End Function

    '*************************************************************************
    ' function createEmptyOrder(KDNR, SID)
    '*************************************************************************
    Function createEmptyOrder(ByVal OrderType)
        Dim AuftragNr, Notiz, sql, kdnr
        Dim rsK
        Dim tableNameOrders As String
        
        'kdnr - select smallest from ofAdressen
        sql = "SELECT min(IDNR) as minIDNR from ofAdressen" : rsK = objConnectionExecute(sql)
        If rsK.EOF Then
            Response.Write("Sorry! You have no ofAdressen entries in the table!!!! Please create some inition Client!")
            Exit Function
        End If
        kdnr = rsK("minIDNR") : rsK.close()
	 
   
        tableNameOrders = getNameForTable(OrderType)
        AuftragNr = NextId(tableNameOrders, "Nummer")
        Notiz = "new"

        sql = "INSERT INTO " & tableNameOrders & " (Nummer, KundNr, Datum)  " & _
              "Values(" & AuftragNr & "," & kdnr & ", CURRENT_TIMESTAMP)"
        objConnectionExecute(sql)
        createEmptyOrder = AuftragNr
    End Function

    '*************************************************************************
    ' returns the destination land for this customer 
    ' remove this function to functionprices.asp
    '*************************************************************************
    Function getClientDestinationLand(ByVal IdNr)
        Dim plzLAND, clientPLZ
        plzLAND = TABLEVALUE("[ofAdressen-Weitere]", "IDNR", IdNr, "LAND")
        'response.write "<br>PLZLand =" & PLZLand
        If IsNumeric(plzLAND) Then
            If plzLAND = 43 Then getClientDestinationLand = "AT"
            If plzLAND = 49 Then getClientDestinationLand = "DE"
            If plzLAND = 359 Then getClientDestinationLand = "BG"
            If plzLAND = 1 Then getClientDestinationLand = "US"
        Else
            getClientDestinationLand = getClientLand(IdNr)
        End If
    End Function


    ''' <summary>
    ''' showCurrentUser
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function showCurrentUser()
        If getLOGIN() <> "" Then
            Response.Write("User: " & TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Email"))
        End If
    End Function

    ''' <summary>
    ''' GetClientEmail
    ''' </summary>
    ''' <param name="CID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function GetClientEmail(ByVal CID)
        Dim sql
        Dim rsC
        If CID <> "" Then
            sql = "Select Email from ofAdressen where IDNR=" & CID
            rsC = objConnectionExecute(sql)
            If rsC.EOF = True Then
                GetClientEmail = ""
            Else
                GetClientEmail = rsC("Email")
            End If
        Else
            GetClientEmail = ""
        End If
    End Function
 
    
    ''' <summary>
    ''' GetShopEMail
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function GetShopEMail()
        GetShopEMail = VARVALUE("Email")
    End Function



    ''' <summary>
    '''  returns -1 if not defined 
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getFreiHausLieferungUmsatz()

        Dim freiHausLieferungAbUmsatz
        freiHausLieferungAbUmsatz = VARVALUE("MIN_UMSATZ_FREI_HAUS")
        If Not IsNumeric(freiHausLieferungAbUmsatz) Then freiHausLieferungAbUmsatz = -1
  
        getFreiHausLieferungUmsatz = 1 * freiHausLieferungAbUmsatz
    End Function


    ''' <summary>
    ''' getPaketNummer
    ''' </summary>
    ''' <param name="orderType"></param>
    ''' <param name="rechNR"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getPaketNummer(ByVal orderType, ByVal rechNR)
        Dim tableOrders, tableOrdersProducts
        tableOrders = getNameForTable(orderType)
        tableOrdersProducts = "[" & getNameForTableProducts(orderType) & "]"

        Dim rs, sql
        sql = "select * from buchVorgaengeEigenschaften where vorgangTyp = '" & orderType & "' and Nummer = " & rechNR & " and [Name] like 'Paketnummer'"
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            Dim allePakete 'as string  
            While Not rs.eof 'do
                allePakete = allePakete & ", " & rs("Value")
                rs.MoveNext()
            End While
            allePakete = Right(allePakete, Len(allePakete) - 2)
            getPaketNummer = allePakete
        Else
            getPaketNummer = ""
        End If
  
    End Function

    ''' <summary>
    ''' according land return symbol 
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getCurrencySymbol()
        getCurrencySymbol = "&euro;"
        If Session("Land") = "US" Then
            getCurrencySymbol = "$"
        End If
    End Function
    
    
    ''' <summary>
    ''' createUpdateLager
    ''' </summary>
    ''' <param name="ArtNr"></param>
    ''' <param name="LagerOrt"></param>
    ''' <param name="Stk"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function createUpdateLager(ByVal ArtNr, ByVal LagerOrt, ByVal Stk)
        Dim sql
        sql = "select * from [grArtikel-Lagerbestand] " & _
        " where lagerOrt=" & LagerOrt & " and ArtNr=" & ArtNr
        Dim existRs
        existRs = ObjConnectionExecute(sql)
        If existRs.eof Then
            sql = "insert into  [grArtikel-Lagerbestand] (ArtNr,LagerOrt,Lagerbestand) " & _
              " values (" & ArtNr & "," & LagerOrt & "," & Stk & ")"
        Else 'exists update 
            sql = "update [grArtikel-Lagerbestand] set Lagerbestand = Lagerbestand + " & Stk & _
              " where lagerOrt=" & LagerOrt & " and ArtNr=" & ArtNr
        End If
        Call ObjConnectionExecute(sql)
    End Function
</script>


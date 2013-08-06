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

    ''' <summary>
    ''' CALCULATE_POSTCOSTS
    ''' </summary>
    ''' <remarks></remarks>
    Const CALCULATE_POSTCOSTS As String = "CALCULATE_POSTCOSTS"
    
    ''' <summary>
    ''' CALCULATE_PAYMODECOSTS
    ''' </summary>
    ''' <remarks></remarks>
    Const CALCULATE_PAYMODECOSTS As String = "CALCULATE_PAYMODECOSTS"
    
    ''' <summary>
    ''' CALCULATE_GUTSCHEIN
    ''' </summary>
    ''' <remarks></remarks>
    Const CALCULATE_GUTSCHEIN As String = "CALCULATE_GUTSCHEIN"
    
    ''' <summary>
    ''' CALCULATE_MIN_ORDER_VALUE
    ''' </summary>
    ''' <remarks></remarks>
    Const CALCULATE_MIN_ORDER_VALUE As String = "CALCULATE_MIN_ORDER_VALUE" 'EAN of the Product that contains the Price when order value is less than defined
   
   ''' <summary>
   ''' CALCULATE_BASKET_DISCOUNT
   ''' </summary>
   ''' <remarks></remarks>
    Const CALCULATE_BASKET_DISCOUNT As String = "CALCULATE_BASKET_DISCOUNT"

    Function getNameFor(ByVal OrderType As String) As String
        getNameFor = getDruckForType(OrderType)
    End Function

    '*****************************************************************
    'get name for the table with orders
    '*****************************************************************
    Function getNameForTable(ByVal OrderType As String) As String
        getNameForTable = getVorgangTableForType(OrderType)
    End Function

    '*****************************************************************
    'get name for the table with products
    '*****************************************************************
    Function getNameForTableProducts(ByVal OrderType As String) As String
        getNameForTableProducts = getVorgangArtikelTableForType(OrderType)
    End Function


    '*************************************************************************
    ' returns the sum of the POST expenses
    ' searches for POST-AT-1
    ' NACHNAHME-AT
    ' NACHNAHME-DE etc. 
    '*************************************************************************
    Function calculatePaymentModeSpends(ByVal PaymentMode As String, _
                                        ByVal Country As String, _
                                        ByVal Gewicht As Double, _
                                        ByVal Umsatz as Double) As Double
        Dim sql, rsP
        sql = "SELECT * FROM [grArtikel-Vertriebskosten] Where Methode = '" & PaymentMode & "' and Destination like '" & Country & "'"
        rsP = objConnectionExecute(sql)
        If rsP.EOF Then
            calculatePaymentModeSpends = 0
        Else
            calculatePaymentModeSpends = rsP("Fixekosten").Value + rsP("VariableKostenNachGewicht").Value * Gewicht + rsP("VariableKostenNachUmsatz").Value * Umsatz
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
    Function getPaymentModeSpendsArtNr(ByVal PaymentMode As String, ByVal Country As String) As Double
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
    ' ArtNr - wenn gesetz wird nur nach Art berechnet 
    '******************************************************************************
    Function calculatePostSpends(ByVal PostModeDestionation As String, ByVal Kg As Object, ByVal PostMode As String, Optional ByVal ArtNr As String = "") As Double
 
        If Kg Is Nothing Then
            Kg = 0
        Else
            Kg = Math.Round(Kg, 2)
        End If
    
        Dim sql As String, rsP
        sql = "SELECT Destination, Fixekosten, VariableKostenNachGewicht " & _
              " FROM [grArtikel-Vertriebskosten] Where destination like '" & PostModeDestionation & "'" & _
              " AND Methode Like '" & PostMode & "' AND GewichtVon<=" & Replace(Kg, ",", ".") & " AND GewichtBis> " & Replace(Kg, ",", ".")
        If ArtNr <> "" Then
            sql = sql & " AND ArtNr = '" & ArtNr & "'"
        Else
            sql = sql & " AND ArtNr Is Null"
        End If
        'Response.Write sql
        rsP = objConnectionExecute(sql)
        If rsP.EOF Then
            calculatePostSpends = 0
        Else
            calculatePostSpends = rsP("Fixekosten").Value + rsP("VariableKostenNachGewicht").Value * Kg
        End If
        rsP.close()
    End Function

    'Postkosten für den gesamten Warenkorb berechnen 
    Function calculatePostSpendsForWK(ByVal PostModeDestionation As String, ByVal Kg As Object, ByVal PostMode As String) As Double
        Dim sql As String = " SELECT ArtNr, Quantity, Notiz, (select a.Gewicht from grArtikel a where a.ArtNr=wk.ArtNr) as Gewicht " & _
                            " FROM webWarenkorb wk " & _
                            " Where SID=" & getSID() & " AND wk.Quantity>0  AND (AuftragNr is null or AuftragNr=0)"
        
        Dim rsWK = objConnectionExecute(sql)
        
        Dim allSpends As Decimal = 0
        Dim gewicht As Decimal = 0
        Dim addGeneralBasketPostExpenses As Boolean = False
        Dim specialExpenses As Decimal = 0
        While Not rsWK.EOF
            gewicht = 0
            If IsNumeric(rsWK("Gewicht").Value) Then gewicht = rsWK("Gewicht").Value
            specialExpenses = calculatePostSpends(PostModeDestionation, rsWK("Quantity").Value * gewicht, PostMode, rsWK("ArtNr").Value)
            If specialExpenses = 0 Then
                addGeneralBasketPostExpenses = True
            End If
            allSpends = allSpends + specialExpenses
            rsWK.MoveNext()
        End While
        
        If addGeneralBasketPostExpenses Then
            allSpends = allSpends + calculatePostSpends(PostModeDestionation, Kg, PostMode)
        End If
        
        Return allSpends
        
    End Function
    
        
    '*************************************************************************
    ' returns the number of the post expenses product nr 
    ' Express - true or false 
    '*************************************************************************
    Function getPostSpendsArtNr(ByRef Country As String, ByRef Kg As Double, ByRef PayMode As String) As String
        getPostSpendsArtNr = tableValue("grArtikel", "EAN", "'" & CALCULATE_POSTCOSTS & "'", "ArtNr")
    End Function

    '*************************************************************************
    ' returns the wight of all prodcuts 
    '*************************************************************************

    Function getWeightOfProduct(ByVal ArtNR As String) As Double
        Dim weight As Decimal : weight = 0
        'on error resume next 
        'Response.Write TABLEVALUE("grArtikel","ArtNR", ArtNR, "gewicht")
        'Response.Flush
        Dim weightString As String : weightString = TABLEVALUE("grArtikel", "ArtNR", ArtNR, "gewicht") & ""
        'weightString = replace(weightString,",",".")
        If Not IsNumeric(weightString) Then
            getWeightOfProduct = 0
            Exit Function
        End If
        weight = 1 * CDbl(weightString)
        If weight < 0 Then weight = 0
        getWeightOfProduct = weight
        If showdebug() Then Response.Write("Weight=" & weight)
    End Function

    ''' <summary>
    ''' getWeightOfOrder
    ''' </summary>
    ''' <param name="OrderType"></param>
    ''' <param name="Nummer"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getWeightOfOrder(ByVal OrderType As String, ByVal Nummer As String) As Double
        Dim sql As String, rs
        sql = "SELECT ArtNR, Stk from [" & getVorgangArtikelTableForType(OrderType) & "] Where RechNr=" & Nummer
        rs = objConnectionExecute(sql)
        Dim totalKG As Double : totalKG = 0
     
        While Not rs.EOF
            totalKG = totalKG + CDbl(rs("Stk").Value) * getWeightOfProduct(rs("ArtNR").Value)
            rs.MoveNext()
        End While
        rs.close()
        getWeightOfOrder = totalKG
    End Function

    ''' <summary>
    ''' getWeightOfOrder
    ''' </summary>
    ''' <param name="Sid"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getWeightOfBasket(ByVal Sid As String) As Double
        Dim sql As String, rs
        sql = "SELECT SID, ArtNr, Quantity FROM webWarenkorb " & _
           "WHERE SID=" & Sid & " AND Quantity > 0 "
              
        rs = objConnectionExecute(sql)
        Dim totalKG As Double : totalKG = 0
     
        While Not rs.EOF
            totalKG = totalKG + rs("Quantity").Value * getWeightOfProduct(rs("ArtNR").Value)
            rs.MoveNext()
        End While
        rs.close()
        getWeightOfBasket = totalKG
    End Function



    ''' <summary>
    ''' isWarenkorbEmpty
    ''' SID - Session ID
    ''' </summary>
    ''' <param name="SID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function isWarenkorbEmpty(ByVal SID As String) As Boolean
        Dim sql As String, rsWK
        sql = "SELECT * FROM webWarenkorb Where SID=" & SID
        rsWK = objConnectionExecute(sql)
        isWarenkorbEmpty = rsWK.EOF
    End Function



    ''' <summary>
    ''' liefert mindestbestellmenge für eine Bestellung 
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getMinOrderValue() As Double
        getMinOrderValue = VARVALUE_DEFAULT(CALCULATE_MIN_ORDER_VALUE, "100") '100 Euro ist mindestbestellwert
    End Function

    ''' <summary>
    ''' getMinOrderValue_charge_artnr
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getMinOrderValue_charge_artnr() As String
        getMinOrderValue_charge_artnr = tablevalue("grArtikel", "EAN", "'" & CALCULATE_MIN_ORDER_VALUE & "'", "ArtNr")
    End Function

    ''' <summary>
    ''' getMinOrderValue_charge
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getMinOrderValue_charge() As Double
        'wrong getMinOrderValue_charge = tablevalue("grArtikel","EAN", "'" & CALCULATE_MIN_ORDER_VALUE & "'", "PreisATS")
        getMinOrderValue_charge = makeNettoPreis(getMinOrderValue_charge_artnr(), "1", 0)
    End Function


    '*************************************************************************
    ' kalkuliert rabatt für eine Bestellung 
    ' Added at 18.04.2005 for xscorpion 
    ' returns -1 if no discount calculation is set
    '*************************************************************************    
    Function getBasketDiscount_artnr() As String
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
    Function getBasketDiscount_Value(ByVal totalValueOfBasket As Double) As Double

        getBasketDiscount_Value = 0
        Dim sql, rs
        totalValueOfBasket = Math.Round(totalValueOfBasket)
        sql = "select * from [grArtikel-OrderRabatt] where GesamtPreisVon <= " & totalValueOfBasket & " and GesamtPreisBis >=" & totalValueOfBasket
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            getBasketDiscount_Value = totalValueOfBasket * rs("Rabatt").Value / 100
        End If
    
    End Function

    '*************************************************************************
    ' function deleteOrder(OrderType, Nummer)
    '*************************************************************************

    Function deleteOrder(ByVal OrderType As String, ByVal Nummer As String) As Boolean
        Dim tableNameOrders = getNameForTable(OrderType)
        Dim sql : sql = "DELETE FROM " & tableNameOrders & " WHERE Nummer=" & Nummer
        objConnectionExecute(sql)
        deleteOrder = True
    End Function

    '*************************************************************************
    ' function createEmptyOrder(KDNR, SID)
    '*************************************************************************
    Function createEmptyOrder(ByVal OrderType As String) As String
        Dim AuftragNr As String
        Dim Notiz As String, sql As String, kdnr As String
        Dim rsK
        Dim tableNameOrders As String
        
        'kdnr - select smallest from ofAdressen
        sql = "SELECT min(IDNR) as minIDNR from ofAdressen" : rsK = objConnectionExecute(sql)
        If rsK.EOF Then
            Response.Write("Sorry! You have no ofAdressen entries in the table!!!! Please create some inition Client!")
            Exit Function
        End If
        kdnr = rsK("minIDNR").Value
        rsK.close()
     
   
        tableNameOrders = getNameForTable(OrderType)
        AuftragNr = NextId(tableNameOrders, "Nummer")
        Notiz = "new"

        sql = "INSERT INTO " & tableNameOrders & " (Nummer, KundNr, Datum)  " & _
              "Values(" & AuftragNr & "," & kdnr & ", CURRENT_TIMESTAMP)"
        objConnectionExecute(sql)
        createEmptyOrder = AuftragNr
    End Function


    ''' <summary>
    ''' remove this function to functionprices.asp
    ''' </summary>
    ''' <param name="IdNr"></param>
    ''' <returns>returns the destination land for this customer </returns>
    ''' <remarks></remarks>
    Function getClientDestinationLand(ByVal IdNr As Long) As String
        Dim plzLAND As String, clientPLZ
        plzLAND = TABLEVALUE("[ofAdressen-Weitere]", "IDNR", IdNr, "LAND")
        'response.write "<br />PLZLand =" & PLZLand
        If IsNumeric(plzLAND) Then
            'If plzLAND = 43 Then getClientDestinationLand = "AT"
            'If plzLAND = 49 Then getClientDestinationLand = "DE"
            'If plzLAND = 359 Then getClientDestinationLand = "BG"
            'If plzLAND = 1 Then getClientDestinationLand = "US"
            getClientDestinationLand = FirstValue("select ISO2 from grLand where IdNr = " & plzLAND)
        Else
            getClientDestinationLand = getClientLand(IdNr)
        End If
    End Function


    ''' <summary>
    ''' showCurrentUser
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Sub showCurrentUser()
        If getLOGIN() <> "" Then
            Response.Write("User: " & TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Email"))
        End If
    End Sub

    ''' <summary>
    ''' GetClientEmail
    ''' </summary>
    ''' <param name="CID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function GetClientEmail(ByVal CID As Object) As String
        Dim sql
        Dim rsC
        If Not CID Is Nothing Then
            sql = "Select Email from ofAdressen where IDNR=" & CID
            rsC = objConnectionExecute(sql)
            If rsC.EOF = True Then
                GetClientEmail = ""
            Else
                GetClientEmail = rsC("Email").Value
            End If
        Else
            GetClientEmail = ""
        End If
    End Function
 
    ''' <summary>
    ''' GetClientEmail
    ''' </summary>
    ''' <param name="CID"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function GetClientPassword(ByVal CID As Object) As String
        Dim sql
        Dim rsC
        If Not CID Is Nothing Then
            sql = "Select Passwort from ofAdressen where IDNR=" & CID
            rsC = objConnectionExecute(sql)
            If rsC.EOF = True Then
                GetClientPassword = ""
            Else
                GetClientPassword = rsC("Passwort").Value
            End If
        Else
            GetClientPassword = ""
        End If

    End Function
    
    ''' <summary>
    ''' GetShopEMail
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function GetShopEMail() As String
        GetShopEMail = VARVALUE_DEFAULT("Email", "office@IhreFirma.at")
    End Function



    ''' <summary>
    '''  returns -1 if not defined 
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getFreiHausLieferungUmsatz() As Decimal

        Dim freiHausLieferungAbUmsatz As String = VARVALUE("MIN_UMSATZ_FREI_HAUS")
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
    Function getPaketNummer(ByVal orderType As String, ByVal rechNR As String) As String
        Dim tableOrders, tableOrdersProducts As String
        tableOrders = getNameForTable(orderType)
        tableOrdersProducts = "[" & getNameForTableProducts(orderType) & "]"

        Dim rs
        Dim sql As String
        sql = "select * from buchVorgaengeEigenschaften where vorgangTyp = '" & orderType & "' and Nummer = " & rechNR & " and [Name] like 'Paketnummer'"
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            Dim allePakete 'as string  
            While Not rs.eof 'do
                allePakete = allePakete & ", " & rs("Value").Value
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
    Function getCurrencySymbol() As String
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
    Function createUpdateLager(ByVal ArtNr As String, ByVal LagerOrt As String, ByVal Stk As Double) As String
        Dim sql As String
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
    
    
    Function UseEAN() As Boolean
        Return UCase(VARVALUE("UseEAN")) = "TRUE"
    End Function
    
    
    '==============================================================================
    ' Nur registrierte Kunden dürfen einkaufen und die preise sehen!
    '==============================================================================
    Function isPurchasingAllowed() As Boolean
        isPurchasingAllowed = True
   
        'set deault    
        If UCase(varvalue_default("ALLOW_PURCHASING_ONLY_FOR_CUSTOMERS", "false")) = "TRUE" Then
            If isLoggedIn() Then
                If tableValue("ofAdressen", "IdNR", getLOGIN(), "Status") = getTranslation("Kunde") Then
                    isPurchasingAllowed = True 'angemeldet
                Else
                    isPurchasingAllowed = False
                End If
            Else
                isPurchasingAllowed = False 'nicht angemeldet
            End If
        End If
    End Function
    
</script>


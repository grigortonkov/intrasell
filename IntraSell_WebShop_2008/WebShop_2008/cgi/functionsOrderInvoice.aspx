<%
    'DEFAULT WERTE
    DEFAULT_PAYMODE = VARVALUE_DEFAULT("DEFAULT_PAYMODE", "Nachnahme")
    DEFAULT_POSTMODE = VARVALUE_DEFAULT("DEFAULT_POSTMODE", "Express")
    DEFAULT_POSTMODE_DESTINATION = VARVALUE_DEFAULT("DEFAULT_POSTMODE_DESTINATION", "AT")
%>

<script language="VB" runat="server">  
    Public DEFAULT_PAYMODE As String
    Public DEFAULT_POSTMODE As String
    Public DEFAULT_POSTMODE_DESTINATION As String
    
    '*************************************************************************
    ' Shows an Vorgang (Auftrag, REchnung, Lieferschein usw and the Artiels in EDIT Form)
    '*************************************************************************

    Function CheckToSQL(ByVal check)
        If UCase(check) = "ON" Then
            CheckToSQL = "-1"
        Else
            CheckToSQL = "0"
        End If
    End Function

    '*************************************************************************
    '*************************************************************************
    Function SQLToCheck(ByVal sqlcheck)
        If sqlcheck = True Then
            SQLToCheck = " Checked "
        Else
            SQLToCheck = " "
        End If
    End Function


    '*************************************************************************
    'printFirmaAddress
    '*************************************************************************
    Function printFirmaAddress() As String
        printFirmaAddress = VARVALUE("Firma") & "<br />" & _
                              VARVALUE("PLZOrt") & "<br />" & _
                              VARVALUE("Strasse") & "<br />" & _
                              "Bank: " & VARVALUE("Bank") & "<br />" & _
                              "Konto: " & VARVALUE("Konto") & "<br />" & _
                              "Tel: " & VARVALUE("Telefon") & "<br />" & _
                              "Fax: " & VARVALUE("Fax") & "<br />"
    End Function
    
    
    
    '****************************************************************************
    ' Caclulate Warenkorb summe 
    '****************************************************************************
    Function calculateWarenkorbSum() As String

        Dim Land As String = Session("Land")
 
        Dim sql As String, rsWK
        Dim SID As String = getSID()
        sql = "SELECT webWarenkorb.SID, webWarenkorb.Quantity, grArtikel.ArtNr, grArtikel.Bezeichnung " & _
           " FROM webWarenkorb INNER JOIN grArtikel ON webWarenkorb.ArtNr = grArtikel.ArtNr" & _
           " Where SID=" & SID & " AND webWarenkorb.Quantity > 0 "
        rsWK = objConnectionExecute(sql)
        If rsWK.EOF And rsWK.BOF Then ' empty basket
            calculateWarenkorbSum = 0
        Else
            Dim Pos As Integer = 0
            Dim Subtotal As Double = 0
            Dim SubtotalMWST As Double = 0
        
            Dim ArtNr, Stk As Double
            Dim bruttoPreis As Double
            ''NOT USED Dim einzelpreis
            While Not rsWK.EOF
                Pos = Pos + 1
                ArtNr = rsWK("ArtNR").Value
                Stk = CInt(rsWK("Quantity").Value)
                ''NOT USED einzelpreis = makeNettoPreis(ArtNR,Stk,sid)
                ''NOT USED subtotal = subtotal +einzelpreis * stk
                bruttoPreis = makeBruttoPreis2(rsWK("ArtNR").Value, Stk, Session("Land"))
                'Response.Write "stk = [" & stk & "]"
                'Response.Write "bruttoPreis = [" & bruttoPreis & "]"
                SubtotalMWST = CDbl(SubtotalMWST) + CDbl(bruttoPreis) * CDbl(Stk)
                rsWK.MoveNext()
            End While
            rsWK.close()

            calculateWarenkorbSum = FormatNumber(SubtotalMWST, 2)
        End If
    End Function

    'expects 
    'request("QuantityText")
    'request("ArtNR")    or request("ProduktId")
    'request ("AddOneMore")
    'request("NextPageToShow")
    'REturns true if putting ok else false 
    Function PutInWarenkorb(ByRef message As String) As Boolean
        Dim q As String = Request("QuantityText")
        Dim ArtNr As String = Request("ProduktId")
        If ArtNr = "" Then ArtNr = Request("ArtNR")
        PutInWarenkorb = PutInWarenkorbByArtNr(ArtNr, q, True, getSID(), message)
    End Function



    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 

    ' ArtNr         - Artikel Nummer 
    ' q             - Quantity
    ' checkIfActive - einfügen auch wenn produkt nicht aktiv ist 
    ' wkSID         - Warenkorb Nummer 
    ' message - error texts 
    '===========================================================================
    Function PutInWarenkorbByArtNr(ByVal ArtNr As String, ByVal q As String, ByVal checkIfActive As Boolean, ByVal wkSID As String, ByRef message As String)
        Dim rsW
        Dim addOneMore
        Dim PreKatNr, SQL As String
        Dim errorFound As Boolean = False 
        'Dim message: 

        If q = "" Then q = "1"

        If (Request("AddOneMore") = "TRUE") Then addOneMore = True Else addOneMore = False

        PreKatNr = Request("PreKatNr")

        'Die Notiz enthält die gewünschte Modifikationen 
        Dim Notiz As String = getTranslation("Artikel") & "#" & ArtNr & getTranslation(" wurde gewuenscht ") & Request("Notiz") & "." & Chr(10) & Chr(13)
        Dim NotizForPosition As String = getTranslation("Artikel") & " #" & ArtNr & ": " & Request("Notiz")
        If Request("Notiz") = "" Then Notiz = "" : NotizForPosition = ""
        ' wenn mehrere Spezifikation definiert 
        If Trim(Replace(Request("Notiz"), ",", "")) = "" Then Notiz = "" : NotizForPosition = ""

        If Notiz <> "" Then Session("Notiz") = Session("Notiz") & " " & Notiz


        'check if artikel existiert 
        SQL = "select artnr from grArtikel where ProduktAktiv<>0 and ProduktAktivOnline <>0 and artnr=" & ArtNr
        rsW = objConnectionExecute(SQL)
        If rsW.EOF Then
            If checkIfActive Then 'add even the product is not active 
                message = getTranslation("Wir bieten Produkt mit der Nr.") & " Nr=[" & ArtNr & "] nicht an."
                errorFound = True
            End If
        End If
        rsW.close()
        'end check 


        'do not allow putting in Warenkorb for special products 
        Dim nichtBestellbar As Boolean = False
        SQL = "select Modifikationen, NichtBestellbar from grArtikel where artnr=" & ArtNr
        rsW = objConnectionExecute(SQL)
        If Not rsW.EOF Then
            If IsDebug() Then Response.Write(rsW("NichtBestellbar").Value)
            nichtBestellbar = Not (CInt(rsW("NichtBestellbar").Value) = 0)
            If nichtBestellbar Then 'add even the product is not active 
                message = getTranslation("Artikel ist derzeit nicht bestellbar! Wir bitten um Ihr Verständnis! ")
                message = message & "<br/> Nr=[" & ArtNr & "]"
                message = message & "<br/> <a href=""?ArtNr=" & ArtNr & """> zur Artikelseite </a>"
                errorFound = True
            End If
        End If
 
        'end check 


        'do not allow putting in Warenkorb for   products that have Special choice but no selection done ! 
        If Not rsW.EOF Then
            'if (InStr(rsW("Modifikationen") & "", SPECIALCHOICECONSTANT) > 0) then 
            If Len(rsW("Modifikationen").Value & "") > 0 Then
                'Response.Write "Notiz='" & Notiz &"'" : Response.End
                If Notiz = "" Then 'add even the product is not active 
                    message = getTranslation("Wichtig: Bitte je eine Selektion in den Komboboxen in der Artikel Detailseite vornehmen! ")
                    message = message & "<br/> Modifikationen = [" + rsW("Modifikationen").Value + "]!"
                    message = message & "<br/> Nr=[" & ArtNr & "]"
                    message = message & "<br/> <a href=""?ArtNr=" & ArtNr & """> zur Artikelseite </a>"
                    errorFound = True
                End If
            End If
        End If
        rsW.close()
        'end check 

        'check if Preis > 0 then do not show 
        Dim preisATS As Double = getPreis(getLOGIN(), ArtNr, q)
        If CDbl(preisATS) <= 0 Then
            message = getTranslation("Wir bieten derzeit Produkt mit dieser Nummer nicht!")
            message = message & "<br/> Nr=[" & ArtNr & "]"
            message = message & "<br/> <a href=""?ArtNr=" & ArtNr & """> zur Artikelseite </a>"
            errorFound = True
        End If
        'end check preis 
        
        If errorFound then 
            Response.Write(drawMsgBox("Fehler", message, "default.aspx?ArtNr=" & ArtNr, "", "ZURÜCK"))
            Return False 
        End If 

        message = getTranslation("Sie haben ein Produkt in den Warenkorb eingefügt.")

        SQL = "SELECT Sid, ArtNr, Quantity FROM webWarenkorb WHERE SID =" & wkSID & " AND ArtNr = " & ArtNr & " AND (AuftragNr is null or AuftragNr=0)"
        rsW = objConnectionExecute(SQL)
        If (rsW.EOF And rsW.BOF) Or Not Notiz = "" Then 'Falls notiz vorhanden ist dann will der Kunde produkt mit bestimmter Farbe etc. 
            SQL = "INSERT INTO webWarenkorb (SID, ArtNr, Quantity, Datum, Notiz) " & _
                  " VALUES (" & wkSID & "," & ArtNr & "," & q & ", " & SQLNOW(0) & ", '" & NotizForPosition & "')"
            objConnectionExecute(SQL)
        Else
            addOneMore = True ' put always in Basket, do not ask anymore!!! -Grigor
            If addOneMore Or rsW("Quantity").Value = 0 Then
                message = getTranslation("Sie haben eine Position im Warenkorb aktualisiert.")
                SQL = "UPDATE webWarenkorb set Quantity='" & CStr(rsW("Quantity").Value + q) & "'" & _
                      " WHERE ArtNr = " & ArtNr & _
                      " AND SID=" & wkSID
                rsW = objConnectionExecute(SQL)
            End If
        End If
        Response.Write("<br />" & message & " Nr=[" & ArtNr & "]")
        Return True 
    End Function



    'shows all possbile POST Services according the destination 
    Function showPossiblePostMethodsAccordungDestination(ByVal destination, ByVal postModeCurrent, ByVal paymode, Optional warenkorpStep = "3") As String 
        Dim html As String
        Dim sql As String, rsZM
        Dim sidM As String = getSID()
        html = getTranslation("Transportauswahl für Ziel") & " [" & destination & "]<br />"
            
        'dim rsZM, selected
        sql = "select methode, destination from [grArtikel-Vertriebskosten] " & _
              " where destination = '" & destination & "' and typ like 'TRANSPORT' group by methode, destination order by methode"
        rsZM = objConnectionExecute(sql)
            
        If rsZM.EOF Then
            html = getTranslation("Keine Postmethoden sind für diese Destination definiert!") & " [" & destination & "] <br />" & _
                   getTranslation("Help: Wählen Sie eine gültige PLZ im Shipping Calculator!")
        End If
        Dim PostCosts As Double, PostExpensesMWST As Double
        Dim postMode As String
        Dim postSpendsArtNr 
        Dim selected As String
        Dim IDNR: IDNR = getLogin()
        Dim OnlyOnePossibility As Boolean = firstvalue("select count(*) from (" & sql & ") a") = 1
        
        While Not rsZM.EOF
            postMode = rsZM("Methode").Value
            postSpendsArtNr = getPostSpendsArtNr(destination, getWeightOfBasket(sidM), postMode)
            PostCosts = calculatePostSpendsForWK(destination, getWeightOfBasket(sidM), postMode)
            PostExpensesMWST = CDbl(calculateBruttoPreis(PostCosts, postSpendsArtNr, IDNR)) 'PostCosts
            'PostExpensesMWST = makeBruttoPreis(PostCosts,2, Session("Land"))
            'checked = "" 
            If OnlyOnePossibility or UCase(postMode) = UCase(postModeCurrent) Then selected = "checked" Else selected = ""
            'Response.Write selected
            html = html & _
              "<input " & selected & " type='radio' class='submit' value='" & rsZM("methode").Value & "' " & _
               " name='PostModeDestination' onClick=""document.location='default.aspx?pageToShow=warenkorbStep"  & warenkorpStep & "&paymode=" & paymode & "&postmode=" & rsZM("methode").Value & "';"">" & _
              rsZM("methode").Value & " - " & getTranslation("Preis") & ": " & FormatNumber(PostExpensesMWST, 2) & "<br />"
            
            rsZM.MoveNExt()
        End While
        rsZM.close()
        showPossiblePostMethodsAccordungDestination = html
    End Function


    '****************************************************************************
    ' showBasket
    '****************************************************************************
    Public Function showBasket() As String 
        Dim BasketSQL As String
        Dim cntItems As Double
        Dim html As String
        
        BasketSQL = "SELECT * FROM webWarenkorb Where (SID=" & getSid() & " and Quantity>0 and AuftragNr is null)"
    
        Dim rsBasket : rsBasket = objConnectionExecute(BasketSQL)
        If rsBasket.EOF And rsBasket.BOF Then
            html = getTranslation("Warenkorb") & ": " & getTranslation("LEER")
        Else
            cntItems = 0
            While Not rsBasket.EOF
                cntItems = cntItems + rsBasket("Quantity").Value
                rsBasket.MoveNext()
            End While
            html = html & getTranslation("Warenkorb") & ": " & cntItems & " " & getTranslation("Stueck")
            If isPurchasingAllowed() Then
                'html = html &   ", Total: " & calculateWarenkorbSum()
            End If
        End If
    
        'Response.Flush
        showBasket = html
    End Function



    '*************************************************************************
    ' createOrderFromBasket
    ' creates order and send directly an email 
    ' SID - Session ID
    '
    ' old_SHIPPING_ID - ID of the ofAdressen-Weiter that the user wants to use in this order 
    ' old_INVOICE_ID
    ' added check if destination land ist the same like Session(LAND)
    ' if no then back to Warenkorb2
    '*************************************************************************
    Function createOrderFromBasket(ByVal KDNR As String, ByVal SID As Object, ByVal PayMode As String, ByVal PostMode As String, _
                                   ByVal Destination As String, ByVal notizOrder As String, ByVal GutscheinNummer As String, _ 
                                   ByVal OrderType As String, Optional old_SHIPPING_ID As String = "" , _
                                   Optional old_INVOICE_ID As String = "") As String
        'TODO: Implementiere Transaction 
        
        Dim Land As String = getClientDestinationLand(KDNR) ' getClientLand(KDNR)
        Dim Language As String = Session("Language")
 
        Dim tableName As String = "buchAuftrag"
        If OrderType = "AN" Then
            tableName = "buchAngebot"
        End If
        'Response.Write "PostMode=" & PostMode 
        'exit function 
        'land is ok 
        'Create auftrag (Order)
        Dim AuftragNr, Notiz As String
        Dim SQL As String
        AuftragNr = NextId(tableName, "Nummer")

        ' Issue 59:  eigene Kundengruppe und Vorgangnummernkreis für online Bestellungen  

        Dim onlineKundNr : onlineKundNr = FIRSTVALUE("select Idnr from [ofadressen-settings] where Kundengruppe = 'Online'")
        If IsNumeric(onlineKundNr) Then
            AuftragNr = IntraSellPreise.getNewVorgangNummer(OrderType, onlineKundNr)
        Else
            Response.Write("Warnung: Bitte eine Kundengruppe namens ""Online"" mit einem eigenen Nummernkreis definieren und einem Kunden zuweisen!")
        End If

        Notiz = "Internet Bestellung"
        If notizOrder = "" Then notizOrder = Notiz
        Dim Mandant : Mandant = FIRSTVALUE("select mandant from ofAdressen where mandant is not null and idnr=" & KDNR & " union select mandantNr from [ofAdressen-Kundengruppen] where Gruppe = 'Online'")
        SQL = "INSERT INTO " & tableName & " (Nummer, KundNr, notiz, ZahlungsBedungung, TransportMethode, ZahlungsMethode, Datum, Bezahlt, Ausgedrukt, anElba, MandantNr)  " & _
           "Values(" & AuftragNr & "," & KDNR & ",'" & notizOrder & "','" & PayMode & "','" & PostMode & "','" & PayMode & "', " & SQLNOW(0) & ", 0, 0, 0, " & Mandant & ")"
        objConnectionExecute(SQL)

        'Move Warenkorb To Auftrag, fuer jede Position die eine Seriennummer erfordert wird eigene Zeile eingefuegt 
        SQL = " SELECT " & AuftragNr & " as AuftragNr, ArtNr, Quantity, Notiz " & _
         " FROM webWarenkorb " & _
         " Where SID=" & SID & " AND webWarenkorb.Quantity>0  AND (AuftragNr is null or AuftragNr=0)"
        
        Dim rsWK = objConnectionExecute(SQL)
        Dim subtotal As Double = 0
   
        While Not rsWK.EOF
    
            Dim stkToOrder As Double = CDbl(rsWK("Quantity").Value)
            Dim needsSerialNr As String = tablevalue("grArtikel", "ArtNR", rsWK("ArtNr").Value, "Seriennummer")
            Dim einzelpreis As Double = getPreis(KDNR, rsWK("ArtNr").Value, stkToOrder)
            Dim positionNotiz As String = rsWK("Notiz").Value
            Dim bezeichnung As String = tablevalue("grArtikel", "ArtNR", rsWK("ArtNr").Value, "bezeichnung")
            
            bezeichnung = getTranslationDok("grArtikel", rsWK("ArtNR").Value, "Bezeichnung", bezeichnung, Language)
            bezeichnung = Replace(bezeichnung, "'", "")
            
            If Not positionNotiz & "" = "" Then
                bezeichnung = positionNotiz & "; " & bezeichnung
            End If
        
            subtotal = subtotal + einzelpreis * stkToOrder
        
            If showdebug() Then
                Response.Write("<br/>Subtotal = " & subtotal)
                Response.Write("<br/>Einzelpreis = " & einzelpreis)
                Response.Write("<br/>StkToOrder = " & stkToOrder)
            End If
       
            If needsSerialNr & "" = "true" Or needsSerialNr & "" = "-1" Or needsSerialNr & "" = "1" Then ' für jeden Eintrag eine eigene Zeile Erstellen
                Dim ii As Integer
                For ii = 1 To stkToOrder
                    SQL = " INSERT INTO [" & tableName & "-Artikel] (RechNr, ArtNr, Stk, Bezeichnung, PreisATS, ArtikelIdentifikation)" & _
                          " VALUES (" & rsWK("AuftragNr").Value & "," & rsWK("ArtNr").Value & "," & 1 & ",'" & bezeichnung & "', 0, '" & positionNotiz & "')"
                    objConnectionExecute(SQL)
                Next
            Else
                SQL = " INSERT INTO [" & tableName & "-Artikel] (RechNr, ArtNr, Stk, Bezeichnung, PreisATS, ArtikelIdentifikation)" & _
                      " VALUES (" & rsWK("AuftragNr").Value & "," & rsWK("ArtNr").Value & "," & stkToOrder & ",'" & bezeichnung & "',0, '" & positionNotiz & "')"
                objConnectionExecute(SQL)
            End If
            
            rsWK.moveNext()
            
        End While
        rsWK.close()
        ' response.write "<br />" & sql
        ' Response.Flush
 
        Dim KG As Double = getWeightOfOrder(OrderType, AuftragNr)

        If (1 * calculateWarenkorbSum() < getFreiHausLieferungUmsatz()) Or (getFreiHausLieferungUmsatz() = -1) Then 'CALCULATE_COSTS 
            'POST SPENDS
            If UCase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" Then
                        
                If KG >= 0 Then
                    Dim postNr As String = getPostSpendsArtNr(Land, KG, PostMode)
                    Dim postSpends As Decimal = calculatePostSpendsForWK(Destination, KG, PostMode)
                    Dim PostExpensesMWST As Decimal = Math.Round(calculateBruttoPreis(postSpends, postNr, KDNR), 2) 'makeBruttoPreis(postSpends, 2, Land)
                    Dim ArtBezeichnungForPostSpends As String
                    'ArtBezeichnungForPostSpends = CALCULATE_POSTCOSTS & "," & PostMode & ", Dest:" & Destination & ", Kg:" & KG
                    ArtBezeichnungForPostSpends = tableValue("grArtikel", "EAN", "'" & CALCULATE_POSTCOSTS & "'", "Bezeichnung") & "," & PostMode & ", Dest:" & Destination & ", Kg:" & KG
                                                                                                                        
                    If IsNumeric(postNr) Then
                        SQL = " INSERT INTO [" & tableName & "-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" & _
                              " VALUES (" & AuftragNr & ", " & postNr & ", 1," & Replace(postSpends, ",", ".") & "," & _
                              Replace(PostExpensesMWST, ",", ".") & ",'" & ArtBezeichnungForPostSpends & "')"
                        'response.write "<br />" & sql
                        objConnectionExecute(SQL)
                    Else
                        Response.Write("<br />" & getTranslation("Versandkosten wurden nicht verrechnet!")) 'getTranslation("Post expenses were not calculated!")    
                    End If 'PostNr found
                Else
                    Response.Write("<br />" & getTranslation("Versandkosten wurden nicht verrechnet da Gewicht weniger als 0 ist!")) ' getTranslation("Post expenses were not calculated KG<=0!")         
                End If ' KG>0 
            End If
                 
            'PAYMODE Expenses
            If UCase(VARVALUE_DEFAULT(CALCULATE_PAYMODECOSTS, "TRUE")) = "TRUE" Then
                If PayMode <> "" Then
               
                    Dim payModeExpenses As Decimal = calculatePaymentModeSpends(PayMode, Land, KG, subtotal)
                    Dim paymodeNr As String = getPaymentModeSpendsArtNR(PayMode, Land)
                    Dim payModeExpensesMWST As Decimal = Math.Round(calculateBruttoPreis(payModeExpenses, paymodeNr, KDNR), 2) 'makeBruttoPreis(payModeExpenses, 2, Land)
                    Dim ArtBezeichnungForPayMode As String
                    'ArtBezeichnungForPayMode = CALCULATE_PAYMODECOSTS & "," & PayMode & PayMode
                    ArtBezeichnungForPayMode = tableValue("grArtikel", "EAN", "'" & CALCULATE_PAYMODECOSTS & "'", "Bezeichnung") & "," & PayMode & PayMode
                                                            
                                                            
                    If IsNumeric(paymodeNr) Then
                        If CLng(paymodeNr) > 0 Then
                            SQL = " INSERT INTO [" & tableName & "-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" & _
                                    " VALUES (" & AuftragNr & ", " & paymodeNr & ", 1," & Replace(payModeExpenses, ",", ".") & "," & Replace(payModeExpensesMWST, ",", ".") & _
                                    ", '" & ArtBezeichnungForPayMode & "')"
                            objConnectionExecute(SQL)
                        End If
                    Else
                        Response.Write("<br />" & getTranslation("Zahlungskosten wurden nicht verrechnet!")) 'getTranslation("Payment mode was not calculated!")    
                    End If
                End If
            End If
            'PAYMODE Expenses
        End If 'CALCULATE_COSTS 
        
        
        'GUTSCHEIN HANDLING
        If GutscheinNummer <> "" Then
            Dim gutscheinSumme As Double = -1 * getPreisForGutschein(GutscheinNummer)
            Dim gutscheinArtNr As Integer = getArtNrForGutschein()
            Dim gutscheinSummeMWST As Double = makeBruttoPreis(gutscheinSumme, 2, Land)
            Dim ArtBezeichnungForGutschein As String = CALCULATE_GUTSCHEIN & "Gutschein Nr:" & GutscheinNummer
            If gutscheinArtNr > 0 Then
 
                         
                SQL = " INSERT INTO [" & tableName & "-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" & _
                 " VALUES (" & AuftragNr & ", " & gutscheinArtNr & ", 1," & Replace(gutscheinSumme, ",", ".") & "," & _
                  Replace(gutscheinSummeMWST, ",", ".") & ",'" & ArtBezeichnungForGutschein & "')"
                objConnectionExecute(SQL)
            Else
                Response.Write("<br />" & getTranslation("Gutschein konnte nicht abgerechnet werden!"))
            End If
        End If
        'GUTSCHEIN HANDLING
        
        
        'MINDESTBESTELLMENGE 
        If CDbl(getMinOrderValue()) > makeBruttoPreis(CDbl(subtotal), 2, Land) Then 'leider kauft der kunde zu wenig
              
            If LCase(VARVALUE_DEFAULT("SHOP_MIN_ORDER_VALUE_ACCEPT", "false")) = "false" Then
                Response.Write("<br /><font color='red'>" & getTranslation("Die Mindestbestellmenge wurde nicht erreicht!") & "<br /> " & _
                                         getTranslation("Wir akzeptieren Bestellungen ab ") & getMinOrderValue() & " brutto. " & _
                                         getTranslation("Ihre Bestellung hat einen Wert von ") & calculateWarenkorbSum() & " brutto.</font><br/>")
                'delete created order 
                SQL = "delete from [" & tableName & "-Artikel] where RechNr = " & AuftragNr
                objConnectionExecute(SQL)
                SQL = "delete from [" & tableName & "] where Nummer = " & AuftragNr
                objConnectionExecute(SQL)
                Exit Function
                'Response.end 
            End If
               
            Dim mindestBestellmengeArtNr As String = getMinOrderValue_charge_artnr()
            Dim mindestBestellmengeSumme As Double = getMinOrderValue_charge()
            Dim mindestBestellmengeMWST As Double = makeBruttoPreis2(getMinOrderValue_charge_artnr(), 1, Land)
            Dim mindestBestellmengeBez As String = tablevalue("grArtikel", "ArtNr", mindestBestellmengeArtNr, "Bezeichnung")
                       
            If mindestBestellmengeArtNr > 0 Then
 
                         
                SQL = " INSERT INTO [" & tableName & "-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" & _
                 " VALUES (" & AuftragNr & ", " & mindestBestellmengeArtNr & ", 1," & Replace(mindestBestellmengeSumme, ",", ".") & "," & _
                  Replace(mindestBestellmengeMWST, ",", ".") & ",'" & mindestBestellmengeBez & "')"
                objConnectionExecute(SQL)
            Else
                Response.Write("<br />" & getTranslation("Mindestbestellmenge konnte nicht abgerechnet werden!"))
            End If
        End If
        'END MINDESTBESTELLMENGE
        
        
        'WARENKORB RABATT 
        If getBasketDiscount_artnr() <> -1 Then 'rabatt is möglich
            Dim rabattArtNr : rabattArtNr = getBasketDiscount_artnr()
            Dim rabattBez As String = tablevalue("grArtikel", "ArtNr", rabattArtNr, "Bezeichnung")
            Dim rabatt_MWST As Double = -1 * getBasketDiscount_Value(subtotal)
            Dim rabatt_Value As Double = -1 * getBasketDiscount_Value(subtotal)
                  
                  
            SQL = " INSERT INTO [" & tableName & "-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" & _
                 " VALUES (" & AuftragNr & ", " & rabattArtNr & ", 1," & Replace(rabatt_Value, ",", ".") & "," & _
                  Replace(rabatt_MWST, ",", ".") & ",'" & rabattBez & "')"
            'response.Write sql              
            objConnectionExecute(SQL)
        End If
        'END WARENKORB RABATT 
    
         
        'UPDATE Artikel mit PREIS und BEZEICHNUNG
        Dim sqlArt As String : sqlArt = "SELECT * from [" & tableName & "-Artikel]  WHERE RechNr=" & AuftragNr
        Dim rsArt : rsArt = objConnectionExecute(sqlArt)
        Dim sqlUpdatePreis As String
        
        While Not rsArt.EOF
            Dim ArtNr : ArtNr = rsArt("ArtNr").Value
            Dim Stk As Double : Stk = rsArt("Stk").Value
            Dim ArtikelPreisNetto As Double = getPreis(KDNR, ArtNr, Stk) ' makeNettoPreis(ArtNr, Stk, KdNR) 
            Dim ArtikelPreisBrutto As Double = Math.Round(calculateBruttoPreis(ArtikelPreisNetto, ArtNr, KDNR), 3) 'auf 3 Nachkommastelle runden , sonst probleme mit der Gesamtrechnung 'makeBruttoPreis2(ArtNR,Stk,Land)
            Dim ArtikelPreisEK As Double = getEKPreis(ArtNr)
            Dim PosBezeichnung As String = rsArt("Bezeichnung").Value
            Dim ArtikelEAN As String = tableValue("grArtikel", "ArtNR", ArtNr, "EAN")
            Dim ArtikelBezeichnung As String
            
            'Add LieferNr. to Bezeichung for mecom
            Dim LieferantenArtikelNr As String = tableValue("[lieferantenArtikel-Preise]", "ArtikelNR", ArtNr, "ArtikelNrLieferant")
    
            If InStr(LieferantenArtikelNr, "vorhanden") <= 0 Then 'ist vorhanden
                ArtikelBezeichnung = ArtikelBezeichnung & " [" & LieferantenArtikelNr & "]"
            End If
    
    
            'Lieferanten Nummer 
            Dim LieferantNR
            Dim sqlL, rsL
            sqlL = "select * from lieferantenAdressen where firma like '" & getBestLieferant(ArtNr) & "'"
            rsL = objConnectionExecute(sqlL)
            If Not rsL.EOF Then
                LieferantNR = rsL("IDNR").Value
            Else
                LieferantNR = 0
            End If
            rsL.close()
            'End Lieferanten Nummer 

            If ArtikelEAN <> CALCULATE_POSTCOSTS And _
               ArtikelEAN <> CALCULATE_PAYMODECOSTS And _
               ArtikelEAN <> CALCULATE_GUTSCHEIN And _
               ArtikelEAN <> CALCULATE_BASKET_DISCOUNT And _
               ArtikelEAN <> CALCULATE_MIN_ORDER_VALUE Then
                ' Update preises 
                PosBezeichnung = Replace(PosBezeichnung, "’", "%")
                PosBezeichnung = Replace(PosBezeichnung, "'", "%")
                sqlUpdatePreis = "UPDATE [" & tableName & "-Artikel] " & _
                  " SET  PreisATS =  " & Replace(ArtikelPreisNetto, ",", ".") & _
                  "    , PreisEuro =  " & Replace(ArtikelPreisNetto, ",", ".") & _
                  "    , PreisATS_Brutto = " & Replace(ArtikelPreisBrutto, ",", ".") & _
                  "    , EKPreis = " & Replace(ArtikelPreisEK, ",", ".") & _
                  "    , LieferantNr =" & LieferantNR & _
                  " WHERE RechNr=" & AuftragNr & " AND ArtNr=" & ArtNr & " AND Bezeichnung like '" & PosBezeichnung & "'"
                '" , Bezeichnung = '" & ArtikelBezeichnung & "'" & _ 
                'response.write "<br />" & sqlUpdatePreis
                'Response.Flush
                objConnectionExecute(sqlUpdatePreis)
            End If
            rsArt.moveNext()
        End While
        rsArt.close()
        rsArt = Nothing

        'UPDATE SUMME VOM AUFTRAG
        Dim sqlUpdateAuftrag As String
        Dim sqlSumme As String = "SELECT SUM(Stk*PreisATS)  as summe ,  " & _
                                    " SUM(Stk*(PreisATS_Brutto-PreisATS)) as summeMwst, " & _
                                    " SUM(Stk*PreisATS_Brutto) as summeBrutto  " & _
                                    " FROM [" & tableName & "-artikel] where RechNr = " & AuftragNr
        Dim rsSumme : rsSumme = objConnectionExecute(sqlSumme)
    
        Dim Summe As Double = rsSumme("summe").Value & ""
        Dim SummeMWST As Double = rsSumme("SummeMWST").Value & ""
        Dim SummeBrutto As Double = rsSumme("SummeBrutto").Value & ""
        sqlUpdateAuftrag = "UPDATE " & tableName & _
                           " SET Summe =" & Replace(Summe, ",", ".") & _
                           ", SummeMWST =" & Replace(SummeMWST, ",", ".") & _
                           ", SummeBrutto =" & Replace(SummeBrutto, ",", ".") & _
                           " WHERE Nummer = " & AuftragNr
        objConnectionExecute(sqlUpdateAuftrag)
        'END UPDATE SUMME 
    
        'SET KUNDNr2 für abweichende Lieferadresse 
        Dim sqlLI As String, rsLI
        Dim addressType As String = TypeOfAddress.SHIPPING
        Dim kundNr2 As String = old_SHIPPING_ID
        
        If kundNr2 = "" then 
            sqlLI = "Select ID from [ofAdressen-Weitere] where typ= '" & addressType & "' and IDNR=" & KDNR
            'Response.Write sqlLI 
            rsLI = objConnectionExecute(sqlLI)
            If Not rsLI.EOF Then
                kundNr2 = rsLI("ID").Value
            End If
            rsLI.close()
        End If 
    
        If kundNr2 <> "" then 
         sqlUpdateAuftrag = "UPDATE " & tableName & _
                            " SET KundNr2 =" & kundNr2 & _
                            " WHERE Nummer = " & AuftragNr
          if showDebug() then Response.Write (sqlUpdateAuftrag)
          objConnectionExecute(sqlUpdateAuftrag)
        End If 
    
        'End SET kundnr2 

        'send an email 
        'on error resume next 
        createOrderFromBasket = AuftragNr
  
        'insert reference ' see reference module 
        Call createReference(OrderType, AuftragNr, Session("REFERER_ID"))
        Call createOrderFromBasketFinish(KDNR, AuftragNr)
    End Function


    ''' <summary>
    ''' createOrderFromBasketFinish
    ''' </summary>
    ''' <param name="KDNR"></param>
    ''' <param name="AuftragNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function createOrderFromBasketFinish(ByVal KDNR, ByVal AuftragNr)
   
        If LCase(VARVALUE_DEFAULT("SHOP_SEND_MAILS_AFTER_ORDER", "true")) = "true" Then
            Dim mailtext
            Dim Name : Name = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Name")
            mailtext = MAKE_EMAIL_ORDER(KDNR, AuftragNr)
            'send mail to client      
            sendMailFromWithSending(GetClientEmail(KDNR), getTranslation("Ihre Bestellung #") & AuftragNr, mailtext, VARVALUE_DEFAULT("EMAIL_AUTOCONFIRM", "office@griton.eu"))
            'send same mail to shop manager
            sendMailFromWithSending(VARVALUE_DEFAULT("EMAIL_SHOP_MANAGER", VARVALUE("EMAIL")), getTranslation("Ihre Bestellung #") & AuftragNr, mailtext, VARVALUE_DEFAULT("EMAIL_AUTOCONFIRM", "office@griton.eu"))
            'send same mail to shop manager
            sendMailFromWithSending(VARVALUE_DEFAULT("ADMIN_EMAIL", "grigor.tonkov@gmail.com"), getTranslation("Ihre Bestellung #") & AuftragNr, mailtext, VARVALUE_DEFAULT("EMAIL_AUTOCONFIRM", "office@griton.eu"))
            'send to the fax 
            'sendMailFromWithSending "sales@XSCORPION.COM",  "480-393-4348", mailtext, "faxout@faxthruemail.com"
        End If
   
    End Function

    
    ''' <summary>
    ''' getVorgangEigenschaft
    ''' </summary>
    ''' <param name="VorgangTyp"></param>
    ''' <param name="Nummer"></param>
    ''' <param name="Name"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getVorgangEigenschaft(ByVal VorgangTyp, ByVal Nummer, ByVal Name) As String

        Dim sql As String = "select [Value] as val  from buchVorgaengeEigenschaften where VorgangTyp = '" & VorgangTyp & "'" & _
                                    " and Nummer ='" & Nummer & "' and [Name] ='" & Name & "'"
        Dim rs : rs = ObjConnectionExecute(sql)

        If Not rs.EOF Then
            If Not rs("val") Is Nothing Then
                getVorgangEigenschaft = rs("val").Value
            Else
                getVorgangEigenschaft = ""
            End If
        Else
            getVorgangEigenschaft = ""
        End If
            rs.Close()
        
    End Function

</script>


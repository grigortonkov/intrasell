
<%
'DEFAULT WERTE
public DEFAULT_PAYMODE : DEFAULT_PAYMODE = VARVALUE_DEFAULT("DEFAULT_PAYMODE", "Nachnahme")  
public DEFAULT_POSTMODE : DEFAULT_POSTMODE = VARVALUE_DEFAULT("DEFAULT_POSTMODE", "Express")  
public DEFAULT_POSTMODE_DESTINATION : DEFAULT_POSTMODE_DESTINATION = VARVALUE_DEFAULT("DEFAULT_POSTMODE_DESTINATION" , "AT")  


'*************************************************************************
' Shows an Vorgang (Auftrag, REchnung, Lieferschein usw and the Artiels in EDIT Form)
'*************************************************************************

function CheckToSQL (check)
	if ucase(check)="ON" then 
		CheckToSQL = "-1"
	else
		CheckToSQL = "0"
	end if
end function

'*************************************************************************
'*************************************************************************
function SQLToCheck (sqlcheck)
	if sqlcheck=True then 
		SQLToCheck = " Checked "
	else
		SQLToCheck = " "
	end if
end function


'*************************************************************************
'printFirmaAddress
'*************************************************************************
 	function printFirmaAddress()
	    	printFirmaAddress = VARVALUE("Firma") & "<br>" & _ 
				VARVALUE("PLZOrt") & "<br>" & _ 
				VARVALUE("Strasse") & "<br>" & _ 
				"Bank: " & VARVALUE("Bank") & "<br>" & _ 
				"Konto: " & VARVALUE("Konto") & "<br>" & _ 
				"Tel: " & VARVALUE("Telefon") & "<br>" & _ 
				"Fax: " & VARVALUE("Fax") & "<br>" 
	end function 
	
	
	
'*************************************************************************
' printAddress
' addressType = "LI","AR", "" basis
' showMessages BOOLEAN
'*************************************************************************
function printAddress(byval kdnr, byval addressType, byval showMessages) 'returns Lieferschein, Basis or Invoice address
Dim rsKUND
Dim sql
Dim html 
Dim message: message= ""

if addressType = "" then 
	sql = "Select * from ofAdressen where IDNR=" & kdnr
else
	sql = "Select * from [ofAdressen-Weitere] where typ= '" & addressType &  "' and IDNR=" & kdnr
end if 
set rsKUND = objConnectionExecute(sql)

'Response.Write showMessages
if rsKUND.EOF then 
     if showMessages then 'show mesasge 
        message = getTranslation("Die gleiche Adresse wie im Profil.")
     end if 
     'printAddress = printAddress(kdnr,"",showMessages)
     'exit function 
     sql = "Select * from ofAdressen where IDNR=" & kdnr
     set rsKUND = objConnectionExecute(sql)
end if 

Dim PLZ, Ort, Landname
PLZ = TableValue("grPLZ","IDNR", "'" & rsKUND ("PLZ") & "'", "PLZ")
Ort = TableValue("grPLZ","IDNR", "'" & rsKUND ("PLZ") & "'", "Ort")
LandName = TableValue("grLand","IdNr", rsKUND ("Land"), "Name")

html = "<b>" & message & "</b><br><br>"

                if trim(rsKUND("Firma")&"") <> "" then
			      html = html & rsKUND("Firma") & "<br>"
			    end if
			    
				html = html & rsKUND ("Anrede") & " " & rsKUND ("Name")  & " " & rsKUND ("VorName") & "<br>"
				html = html & rsKUND ("Adresse") & " <br>"
				html = html & PLZ & "-" & Ort & " <br>"
				html = html & LandName & " <br>"
				html = html & "Tel:" & rsKUND ("Tel") & " <br>"
				html = html & "Email:<a href='mailto:" & rsKUND ("Email") & "'>" & rsKUND ("Email") & "</a><br>"

printAddress = html
end function

	
'****************************************************************************
' Caclulate Warenkorb summe 
'****************************************************************************
function calculateWarenkorbSum() 

 Dim Land: land = Session("Land")
 
 Dim sql, rsWK
 Dim sid: sid = getSID()
	sql = "SELECT webWarenkorb.SID, webWarenkorb.Quantity, grArtikel.ArtNr, grArtikel.Bezeichnung " & _ 
		  " FROM webWarenkorb INNER JOIN grArtikel ON webWarenkorb.ArtNr = grArtikel.ArtNr" & _
		  " Where SID=" & sid & " AND webWarenkorb.Quantity > 0 "
	set rsWK = objConnectionExecute(sql)
	if rsWK.EOF and rsWK.BOF then ' empty basket
	
		calculateWarenkorbSum = 0
	else	
		Dim pos: pos = 0		
		Dim Subtotal : Subtotal = 0
		Dim SubtotalMWST : SubtotalMWST = 0
		
		Dim ArtNr, stk
		Dim bruttoPreis
		''NOT USED Dim einzelpreis
		while not rsWK.EOF 
			 pos = pos + 1 
			 ArtNR = rsWK("ArtNR")			
			 stk = cint(rsWK("Quantity"))			 
			 ''NOT USED einzelpreis = makeNettoPreis(ArtNR,Stk,sid)
			 ''NOT USED subtotal = subtotal +einzelpreis * stk
			 bruttoPreis = makeBruttoPreis2(rsWK("ArtNR"), stk, Session("Land"))
			 'Response.Write "stk = [" & stk & "]"
			 'Response.Write "bruttoPreis = [" & bruttoPreis & "]"
		     SubtotalMWST =   cdbl(SubtotalMWST) +  cdbl(bruttoPreis) * cdbl(stk)
		     rsWK.MoveNext 
		WEND
		rsWK.close 

		calculateWarenkorbSum = formatNumber(SubtotalMWST,2)
 	end if
end function

'expects 
'request("QuantityText")
'request("ArtNR")	or request("ProduktId")
'request ("AddOneMore")
'request("NextPageToShow")
function PutInWarenkorb()
	Dim q: q=request("QuantityText")
	Dim ArtNr: ArtNr=Request("ProduktId")
	if ArtNR="" then ArtNr=request("ArtNR")
    PutInWarenkorb = PutInWarenkorbByArtNr(ArtNr, q, true, getSID())
end function 



'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 

' ArtNr         - Artikel Nummer 
' q             - Quantity
' checkIfActive - einfügen auch wenn produkt nicht aktiv ist 
' wkSID         - Warenkorb Nummer 
'===========================================================================
function PutInWarenkorbByArtNr(byVal ArtNr, byVal q, byVal checkIfActive, byVal wkSID)
Dim rsW
Dim addOneMore
Dim PreKatNr, SQL


'Dim message: 

if q = "" then q = "1"

iF (request ("AddOneMore")="TRUE") then addOneMore =TRUE else addOneMore =FALSE

PreKatNr = request ("PreKatNr")

'Die Notiz enthält die gewünschte Modifikationen 
Dim Notiz: Notiz = getTranslation("Artikel")  & "#" & ArtNr & getTranslation(" wurde gewuenscht ") & Request("Notiz") & "." & Chr(10)& Chr(13)
Dim NotizForPosition: NotizForPosition = getTranslation("Artikel")  & " #" & ArtNr & ": " & Request("Notiz") 
if Request("Notiz") = "" then Notiz = "": NotizForPosition = ""
' wenn mehrere Spezifikation definiert 
if trim(replace(Request("Notiz"),",","")) = "" then Notiz = "": NotizForPosition = "" 

if Notiz <> "" then Session("Notiz")=Session("Notiz")& " " & Notiz


'check if artikel existiert 
sql ="select artnr from grArtikel where ProduktAktiv<>0 and ProduktAktivOnline <>0 and artnr=" & ArtNr 
set rsW = objConnectionExecute(SQL)
if rsW.EOF then 
    if checkIfActive then 'add even the product is not active 
        message =  getTranslation("Wir haben kein Produkt mit dieser Nr.") & " Nr=[" & ArtNR & "]."
        Response.Write message
        Response.Write "<br>"
        rsW.close 
		exit function 
    end if 
end if 
rsW.close 
'end check 


'do not allow putting in Warenkorb for special products 
sql ="select NichtBestellbar from grArtikel where artnr=" & ArtNr 
set rsW = objConnectionExecute(SQL)
if not rsW.EOF then 
    Response.Write rsW("NichtBestellbar")
    if not (cint(rsW("NichtBestellbar"))=0) then 'add even the product is not active 
        message =  getTranslation("Artikel ist derzeit nicht bestellbar! Wir bitten um Ihr Verständnis! ") & " Nr=[" & ArtNR & "]!"
        Response.Write message
        Response.Write "<br>"
        rsW.close 
		exit function 
    end if 
end if 
rsW.close 
'end check 


'do not allow putting in Warenkorb for   products that have Special choice but no selection done ! 


sql ="select Modifikationen from grArtikel where artnr=" & ArtNr 
set rsW = objConnectionExecute(SQL)
if not rsW.EOF then 
    'if (InStr(rsW("Modifikationen") & "", SPECIALCHOICECONSTANT) > 0) then 
    if len(rsW("Modifikationen") & "") > 0 then 
     'Response.Write "Notiz='" & Notiz &"'" : Response.End
     if Notiz="" then 'add even the product is not active 
        message =  getTranslation("Wichtig: Bitte eine Selektion in den Komboboxen in der Artikel Detailseite vornehmen! ") 
        message =  message & " Modifikationen = [" +  rsW("Modifikationen")  + "]!"        
        message =  message & " Nr=[" & ArtNR & "]" 
        message =  message & "<br/><a href=""?ArtNr=" & ArtNR & """> zur Artikelseite </a>" 
         
        Response.Write message
        Response.Write "<br>"
        rsW.close 
		exit function 
		end if 
    end if 
end if 
rsW.close 
'end check 

'check if Preis > 0 then do not show 
Dim preisATS: PreisATS = getPreis(getLOGIN(), ArtNr, q)
if cdbl(preisATS) <=0 then 
	message =  getTranslation("Wir bieten derzeit Produkt mit dieser Nummer nicht!") &  " Nr=[" & ArtNR & "]"
	Response.Write message
    'rsW.close 
    exit function 
end if 
'end check preis 

message = getTranslation("Sie haben ein Produkt in den Warenkorb eingefügt.")

SQL = "SELECT Sid, ArtNr, Quantity FROM webWarenkorb WHERE SID =" & wkSID &" AND ArtNr = " & ArtNr   & " AND (AuftragNr is null or AuftragNr=0)"
set rsW = objConnectionExecute(SQL)
if (rsW.EOF and rsW.BOF) or not Notiz = "" then 'Falls notiz vorhanden ist dann will der Kunde produkt mit bestimmter Farbe etc. 
	SQL = "INSERT INTO webWarenkorb (SID, ArtNr, Quantity, Datum, Notiz) " & _
	      " VALUES (" & wkSID & "," & ArtNr & "," & q & ", " & SQLNOW(0) & ", '"  & NotizForPosition & "')"
	objConnectionExecute(SQL)
else
	addOneMore = true ' put always in Basket, do not ask anymore!!! -Grigor
	if addOneMore or rsW("Quantity") = 0 then
	    message = getTranslation("Sie haben eine Position im Warenkorb aktualisiert.")
		SQL = "UPDATE webWarenkorb set Quantity='" & CStr( rsW("Quantity") + q ) & "'" & _ 
		      " WHERE ArtNr = " &  ArtNr & _ 
		      " AND SID=" & wkSID 
		set rsW = objConnectionExecute(SQL)
	end if
end if	
Response.Write "<br>" & message &  " Nr=[" & ArtNR & "]"
end function 	



'shows all possbile POST Services according the destination 
function showPossiblePostMethodsAccordungDestination(byval destination, byVal postModeCurrent, byVal paymode)
   dim html 
   dim sql, rsZM
   dim sidM: sidM = getSID()
          html = getTranslation("Transportauswahl für Ziel") & " [" & destination & "]<br>" 
            
            'dim rsZM, selected            
            sql = "select methode, destination from [grArtikel-Vertriebskosten] " & _
                  " where destination = '" & destination & "' and typ like 'TRANSPORT' group by methode, destination order by methode"
            set rsZM = objConnectionExecute(sql) 
            
            if rsZM.EOF then
               html = getTranslation("Keine Postmethoden sind für diese Destination definiert!") & " [" & destination & "] <br>" & _
                      getTranslation("Help: Wählen Sie eine gültige PLZ im Shipping Calculator!")
            end if 
            Dim PostCosts, PostExpensesMWST
            Dim postMode
            'Dim checked
            
            while not rsZM.EOF 
                   postMode = rsZM("Methode") 
              
               	   PostCosts = calculatePostSpends(destination, getWeightOfBasket(sidM), PostMode)	
               	   PostExpensesMWST = PostCosts
 				   'PostExpensesMWST = makeBruttoPreis(PostCosts,2, Session("Land"))
              
              
             
              'checked = "" 
					if ucase(postMode) = ucase(postModeCurrent) then selected = "checked" else selected=""
						'Response.Write selected
						html = html  & _
								"<input " & selected & " type='radio' class='submit' value='" & rsZM("methode") & "' " & _ 
								 " name='PostModeDestination' onClick=""document.location='default.asp?pageToShow=warenkorbStep1&paymode=" & paymode & "&postmode=" & rsZM("methode") & "';"">" & _
								rsZM("methode") & " - " & getTranslation("Preis") & ": " & formatNumber(PostExpensesMWST,2) & "<br>"
			
						rsZM.MoveNExt
					wend
 rsZM.close 
 showPossiblePostMethodsAccordungDestination = html 
end function 


'****************************************************************************
' showBasket
'****************************************************************************
public function showBasket()	
	Dim BasketSQL
	Dim cntItems
	Dim html 
	BasketSQL = "SELECT * FROM webWarenkorb Where (SID=" & getSid() & " and Quantity>0)"
	
	dim rsBasket: set rsBasket = objConnectionExecute(BasketSQL)
	if rsBasket.EOF and rsBasket.BOF then 
		html = getTranslation("Warenkorb") & ": " & getTranslation("LEER")
	else
		cntItems = 0
		while not rsBasket.EOF 
			cntItems = cntItems + rsBasket("Quantity")
			rsBasket.MoveNext
		wend
		html = html &  getTranslation("Warenkorb") & ": " & cntItems & " " & getTranslation("Stueck") 
		if isPurchasingAllowed() then 
			'html = html &   ", Total: " & calculateWarenkorbSum()
		end if 
	end if
	
	'Response.Flush
	showBasket = html 
end function 	



'*************************************************************************
' createOrderFromBasket
' creates order and send directly an email 
' SID - Session ID
'
'
' added check if destination land ist the same like Session(LAND)
' if no then back to Warenkorb2
'*************************************************************************
function createOrderFromBasket(KDNR, SID, PayMode, PostMode, Destination, notizOrder, GutscheinNummer)
Dim Land : Land = getClientDestinationLand(kdnr) ' getClientLand(KDNR)
 
'Response.Write "PostMode=" & PostMode 
'exit function 
'land is ok 
'Create auftrag (Order)
Dim AuftragNr, Notiz, sql  
AuftragNr = NextId("buchAuftrag","Nummer")

' Issue 59:  eigene Kundengruppe und Vorgangnummernkreis für online Bestellungen  

dim onlineKundNr:onlineKundNr = FIRSTVALUE("select Idnr from [ofadressen-settings] where Kundengruppe = 'Online'")
if isnumeric(onlineKundNr) then 
	AuftragNr = IntraSellPreise.getNewVorgangNummer("AU", onlineKundNr)
else
    Response.Write "Warnung: Bitte eine Kundengruppe namens ""Online"" mit einem eigenen Nummernkreis definieren und einem Kunden zuweisen!"
end if 

Notiz = "Internet Bestellung"
if notizOrder = "" then notizOrder = notiz
sql = "INSERT INTO buchAuftrag (Nummer, KundNr, notiz, ZahlungsBedungung, TransportMethode, ZahlungsMethode, Datum)  " & _ 
	  "Values(" & AuftragNr & "," & KDNR  & ",'" & notizOrder &"','" & PayMode & "','" & PostMode & "','" & PayMode & "', " & SQLNOW(0) & ")"
objConnectionExecute(sql)

   'Move Warenkorb To Auftrag, fuer jede Position die eine Seriennummer erfordert wird eigene Zeile eingefuegt 
   sql =  " SELECT " & AuftragNr & " as AuftragNr, ArtNr, Quantity, Notiz " & _ 
		  " FROM webWarenkorb " & _
		  " Where SID=" & SID & " AND webWarenkorb.Quantity>0  AND (AuftragNr is null or AuftragNr=0)"
   Dim rsWK: set rsWK = objConnectionExecute(sql) 
   Dim subtotal: subtotal = 0 
   
   While Not rsWK.EOF	
	
		Dim stkToOrder : stkToOrder = cdbl(rsWK("Quantity"))
		Dim needsSerialNr: needsSerialNr = tablevalue("grArtikel", "ArtNR", rsWK("ArtNr"), "Seriennummer")  
		Dim einzelpreis: einzelpreis = cdbl(makeNettoPreis(rsWK("ArtNr"), stkToOrder, SID))
		einzelpreis = getPreis(KDNR, rsWK("ArtNr"), stkToOrder)
        Dim bezeichnung: bezeichnung = tablevalue("grArtikel", "ArtNR", rsWK("ArtNr"), "bezeichnung")
        Dim positionNotiz : positionNotiz = rsWK("Notiz") 
        
        bezeichnung = replace(bezeichnung, "'", "")
        bezeichnung = getTranslationDok("grArtikel" , rsWK("ArtNR"), "Bezeichnung", bezeichnung , Language)
        if not positionNotiz & "" = "" then 
           bezeichnung = positionNotiz & "; " & bezeichnung
        end if 
        
        subtotal = subtotal + einzelpreis*stkToOrder
        
       if showdebug() then 
		Response.Write "subtotal = " & subtotal 	 
		Response.Write "einzelpreis = " & einzelpreis 	
		Response.Write "stkToOrder = " & stkToOrder 	
       end if 
       
			if needsSerialNr&"" = "true" or needsSerialNr&"" = "-1"  or needsSerialNr&"" = "1" then ' für jeden Eintrag eine eigene Zeile Erstellen
			    Dim ii  
			    for ii = 1 to stkToOrder 
						sql = " INSERT INTO [buchAuftrag-Artikel] (RechNr, ArtNr, Stk, Bezeichnung, PreisATS, ArtikelIdentifikation)" &_ 
						      " VALUES (" & rsWK("AuftragNr")  & "," & rsWK("ArtNr")  & "," & 1  & ",'" & bezeichnung & "', 0, '" & positionNotiz & "')"
						objConnectionExecute(sql)      
				next 	      
			else
			         	sql = " INSERT INTO [buchAuftrag-Artikel] (RechNr, ArtNr, Stk, Bezeichnung, PreisATS, ArtikelIdentifikation)" &_ 
						      " VALUES (" & rsWK("AuftragNr")  & "," & rsWK("ArtNr")  & "," & stkToOrder  & ",'" & bezeichnung & "',0, '" & positionNotiz & "')"
						objConnectionExecute(sql)      
			end if 
			
			rsWK.moveNext
						      
   wend      
   rsWK.close       
  ' response.write "<br>" & sql
  ' Response.Flush
  
  

  
Dim KG: KG = getWeightOfOrder("AU", AuftragNr)  

  if (1*calculateWarenkorbSum() < getFreiHausLieferungUmsatz())  or (getFreiHausLieferungUmsatz()=-1) then 'CALCULATE_COSTS 
			'POST SPENDS
				if ucase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" then 
						
						
						if KG >= 0 then 
							Dim postNr : postNr = getPostSpendsArtNr(Land, KG, PostMode)
							Dim postSpends: postSpends = calculatePostSpends(Destination, Kg, PostMode)   
							Dim PostExpensesMWST: PostExpensesMWST = makeBruttoPreis(postSpends,2, Land)    
							Dim ArtBezeichnungForPostSpends
							'ArtBezeichnungForPostSpends = CALCULATE_POSTCOSTS & "," & PostMode & ", Dest:" & Destination & ", Kg:" & KG
							 ArtBezeichnungForPostSpends = tableValue("grArtikel", "EAN", "'" & CALCULATE_POSTCOSTS & "'", "Bezeichnung") & "," & PostMode & ", Dest:" & Destination & ", Kg:" & KG
							                                
							    postSpends = replace(postSpends, ",",".") 
							    PostExpensesMWST = replace(PostExpensesMWST, ",",".") 
							                                
							if isNumeric(postNr) then 
								 sql = " INSERT INTO [buchAuftrag-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" &_ 
								       " VALUES (" & AuftragNr & ", " & postNr  & ", 1," & postSpends & ","  & _
								        PostExpensesMWST & ",'" & ArtBezeichnungForPostSpends & "')"      
								 'response.write "<br>" & sql
								 objConnectionExecute(sql)
							 else 
								Response.write  "<br>" & getTranslation("Versandkosten wurden nicht verrechnet!") 'getTranslation("Post expenses were not calculated!")    
							 end if 'PostNr found
						else
						    Response.write  "<br>" & getTranslation("Versandkosten wurden nicht verrechnet da Gewicht weniger als 0 ist!") ' getTranslation("Post expenses were not calculated KG<=0!")    	 
						end if ' KG>0 
				 end if 
				 
			 'PAYMODE Expenses
			  if ucase(VARVALUE(CALCULATE_PAYMODECOSTS)) = "TRUE" then 
					if PayMode <> "" then 
			   
					  Dim payModeExpenses:  payModeExpenses = calculatePaymentModeSpends(PayMode, Land, KG, Subtotal)	
					  Dim paymodeNr: paymodeNr  =  getPaymentModeSpendsArtNR(PayMode, Land)	 
					  Dim payModeExpensesMWST: payModeExpensesMWST = makeBruttoPreis(payModeExpenses,2, Land)
					  Dim ArtBezeichnungForPayMode
					      'ArtBezeichnungForPayMode = CALCULATE_PAYMODECOSTS & "," & PayMode & PayMode
					      ArtBezeichnungForPayMode = tableValue("grArtikel", "EAN", "'" & CALCULATE_PAYMODECOSTS & "'", "Bezeichnung") & "," & PayMode & PayMode
							                                
							payModeExpenses = replace(payModeExpenses,",",".") 
							payModeExpensesMWST = replace(payModeExpensesMWST,",",".") 
							                                
					  if isNumeric(paymodeNr) then     
						if clng(paymodeNr) > 0 then 
								sql = " INSERT INTO [buchAuftrag-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" &_ 
								" VALUES (" & AuftragNr & ", " & paymodeNr  & ", 1," & payModeExpenses & "," & payModeExpensesMWST &  _ 
								", '" & ArtBezeichnungForPayMode & "')"
								objConnectionExecute(sql)
						end if      
					  else 
					      Response.write  "<br>" & getTranslation("Zahlungskosten wurden nicht verrechnet!")'getTranslation("Payment mode was not calculated!")    
					  end if     
					end if 
			   end if 
			 'PAYMODE Expenses
  end if 'CALCULATE_COSTS 
  
  
  			 'GUTSCHEIN HANDLING
			  if gutscheinNummer <> "" then 
					  Dim gutscheinSumme : gutscheinSumme = -1*getPreisForGutschein(gutscheinNummer)	
					  Dim gutscheinArtNr : gutscheinArtNr = getArtNrForGutschein()	
					  Dim gutscheinSummeMWST: gutscheinSummeMWST = makeBruttoPreis(gutscheinSumme,2, Land)
					  Dim ArtBezeichnungForGutschein: ArtBezeichnungForGutschein = CALCULATE_GUTSCHEIN  & "Gutschein Nr:" & gutscheinNummer   
					  if gutscheinArtNr > 0 then 
					     gutscheinSumme = replace(gutscheinSumme,",",".") 
					     gutscheinSummeMWST = replace(gutscheinSummeMWST,",",".")
					     
					      sql = " INSERT INTO [buchAuftrag-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" &_ 
					            " VALUES (" & AuftragNr & ", " & gutscheinArtNr  & ", 1," & gutscheinSumme & "," & _ 
					             gutscheinSummeMWST & ",'" & ArtBezeichnungForGutschein & "')"
					      objConnectionExecute(sql)
					  else 
					      Response.write  "<br>" & getTranslation("Gutschein konnte nicht abgerechnet werden!")   
					  end if     
			   end if 
			 'GUTSCHEIN HANDLING
			 
			 
			 
			'MINDESTBESTELLMENGE 
  			if cdbl(getMinOrderValue()) > cdbl(subtotal) then 'leider kauft der kunde zu wenig
  			
  			if VARVALUE_DEFAULT("SHOP_MIN_ORDER_VALUE_ACCEPT", "false") = "false" then 
  			 Response.write  "<br><font color='red'>" & getTranslation("Mindestbestellmenge wurde nicht erreicht!") & "<br> " & _
  			                          getTranslation("Wir akzeptieren Bestellungen ab ") & getMinOrderValue() & " netto. " & _
  			                          getTranslation("Ihre Bestellung hat einen Wert von ") & cdbl(subtotal) & " netto.</font><br/>"
  			 exit function   
  			 'Response.end 
  			end if 
  			 
  					  Dim mindestBestellmengeArtNr : mindestBestellmengeArtNr = getMinOrderValue_charge_artnr()	
  					  Dim mindestBestellmengeSumme : mindestBestellmengeSumme = getMinOrderValue_charge()						  
					  Dim mindestBestellmengeMWST  : mindestBestellmengeMWST  = makeBruttoPreis2(getMinOrderValue_charge_artnr(), 1, Land) 
                      Dim mindestBestellmengeBez   : mindestBestellmengeBez   = tablevalue("grArtikel","ArtNr", mindestBestellmengeArtNr, "Bezeichnung")
 					  
 					  if mindestBestellmengeArtNr > 0 then 
					     mindestBestellmengeSumme = replace(mindestBestellmengeSumme,",",".") 
					     mindestBestellmengeMWST = replace(mindestBestellmengeMWST,",",".")
					     
					      sql = " INSERT INTO [buchAuftrag-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" &_ 
					            " VALUES (" & AuftragNr & ", " & mindestBestellmengeArtNr  & ", 1," & mindestBestellmengeSumme & "," & _ 
					             mindestBestellmengeMWST & ",'" & mindestBestellmengeBez & "')"
					      objConnectionExecute(sql)
					   else 
					      Response.write  "<br>" & getTranslation("Mindestbestellmenge konnte nicht abgerechnet werden!")      
					   end if   
 			end if      
			'END MINDESTBESTELLMENGE 	
			
			
		
  			'WARENKORB RABATT 
  			if getBasketDiscount_artnr() <> -1 then 'rabatt is möglich
  				Dim rabattArtNr: rabattArtNr = getBasketDiscount_artnr()   
  				Dim rabattBez: rabattBez = tablevalue("grArtikel","ArtNr", rabattArtNr, "Bezeichnung")
  				Dim rabatt_MWST : rabatt_MWST = -1*getBasketDiscount_Value(subtotal)
  				Dim rabatt_Value : rabatt_Value = -1*getBasketDiscount_Value(subtotal)
  				
  				
  					sql = " INSERT INTO [buchAuftrag-Artikel] (RechNr, ArtNR, Stk, PreisATS, PreisATS_Brutto, Bezeichnung)" &_ 
					            " VALUES (" & AuftragNr & ", " & rabattArtNr  & ", 1," & replace(rabatt_Value,",",".") & "," & _ 
					             replace(rabatt_MWST,",",".") & ",'" & rabattBez & "')"
					'response.Write sql              
					objConnectionExecute(sql)
					     
			end if 
			'END WARENKORB RABATT 
    
		 
'UPDATE Artikel mit PREIS und BEZEICHNUNG
Dim sqlArt: sqlArt=  "SELECT * from [buchAuftrag-Artikel]  WHERE RechNr=" & AuftragNr 
dim rsArt: set rsArt =  objConnectionExecute(sqlArt)
Dim sqlUpdatePreis
while not rsArt.EOF 
    Dim ArtNr : ArtNr = rsArt("ArtNr")
    Dim Stk : Stk = rsArt("Stk")
	Dim ArtikelPreisNetto: artikelPreisNetto = getPreis(KDNR, ArtNr, Stk)' makeNettoPreis(ArtNr, Stk, KdNR) 
	Dim ArtikelPreisBrutto: artikelPreisBrutto = Round(calculateBruttoPreis(ArtikelPreisNetto, ArtNr, KDNR),2) 'makeBruttoPreis2(ArtNR,Stk,Land)
	Dim ArtikelPreisEK: artikelPreisEK = getEKPreis(ArtNR)
	Dim PosBezeichnung: PosBezeichnung  = rsArt("Bezeichnung") 
	Dim ArtikelEAN: ArtikelEAN = tableValue("grArtikel","ArtNR",ArtNr,"EAN")  
	
	Dim ArtikelBezeichnung
	'ArtikelBezeichnung = tableValue("grArtikel", "ArtNR", ArtNR, "Bezeichnung")
	'ArtikelBezeichnung = replace(ArtikelBezeichnung, "'", "")
	'ArtikelBezeichnung = getTranslationDok("grArtikel" , ArtNR, "Bezeichnung", ArtikelBezeichnung , Language)
	
	'Add LieferNr. to Bezeichung for mecom
	Dim LieferantenArtikelNr: LieferantenArtikelNr = tableValue("[lieferantenArtikel-Preise]","ArtikelNR",ArtNR,"ArtikelNrLieferant")
	
	if inStr(LieferantenArtikelNr,"vorhanden") <= 0 then 'ist vorhanden
		ArtikelBezeichnung = ArtikelBezeichnung & " [" & LieferantenArtikelNr & "]"
	end if 
	
	
	'Lieferanten Nummer 
	Dim LieferantNR
	Dim sqlL, rsL 
	sqlL = "select * from lieferantenAdressen where firma like '" &  getBestLieferant(ArtNr)  & "'"
	set rsL = objConnectionExecute(sqlL) 
	if not rsL.EOF then 
	    LieferantNR = rsL("IDNR")
	else 
	    LieferantNR = 0
	end if 
	rsL.close
    'End Lieferanten Nummer 

	if ArtikelEAN <> CALCULATE_POSTCOSTS and _
	   ArtikelEAN <> CALCULATE_PAYMODECOSTS and _ 
	   ArtikelEAN <> CALCULATE_GUTSCHEIN and _ 
	   ArtikelEAN <> CALCULATE_BASKET_DISCOUNT and _ 
	   ArtikelEAN <> CALCULATE_MIN_ORDER_VALUE then 
			' Update preises 
			PosBezeichnung = Replace(PosBezeichnung,"’","%")
			PosBezeichnung = Replace(PosBezeichnung,"'","%")
			sqlUpdatePreis ="UPDATE [buchAuftrag-Artikel] " & _
				 " SET  PreisATS =  "  & replace(artikelPreisNetto,",",".") & _ 
				 "    , PreisEuro =  "  & replace(artikelPreisNetto,",",".") & _
				 "    , PreisATS_Brutto = "  &  replace(artikelPreisBrutto,",",".") & _ 
				 "    , EKPreis = "  &  replace(artikelPreisEK,",",".") & _ 
				 "    , LieferantNr =" & LieferantNR & _ 			 
				 " WHERE RechNr=" & AuftragNr & " AND ArtNr=" & ArtNr & " AND Bezeichnung like '" & PosBezeichnung  & "'" 
				 '" , Bezeichnung = '" & ArtikelBezeichnung & "'" & _ 
			'response.write "<br>" & sqlUpdatePreis
			'Response.Flush
			objConnectionExecute(sqlUpdatePreis)
	end if 		
	rsArt.moveNext
wend 
rsArt.close 
set rsArt = nothing

	'UPDATE SUMME VOM AUFTRAG
	Dim sqlUpdateAuftrag
	Dim sqlSumme: sqlSumme = "SELECT SUM(Stk*PreisATS)  as summe ,  " & _ 
                             " SUM(Stk*(PreisATS_Brutto-PreisATS))  as summeMwst, " & _ 
                             " SUM(Stk*PreisATS_Brutto)  as summeBrutto  " & _ 
                             " FROM [buchAuftrag-artikel] where RechNr = " & AuftragNr 
	Dim rsSumme : rsSumme = objConnectionExecute(sqlSumme) 
	
	Dim Summe : Summe = rsSumme("summe") & "" 
	Dim SummeMWST : SummeMWST = rsSumme("SummeMWST") & "" 
	Dim SummeBrutto : SummeBrutto = rsSumme("SummeBrutto") & "" 
	sqlUpdateAuftrag = "UPDATE buchAuftrag " & _ 
	                   " SET Summe =" &  replace(Summe,",",".") & _
	                   ", SummeMWST =" &  replace(SummeMWST,",",".") & _
	                   ", SummeBrutto =" &  replace(SummeBrutto,",",".") & _
	                   " WHERE Nummer = " & AuftragNr 
	objConnectionExecute(sqlUpdateAuftrag)
	'END UPDATE SUMME 
	
	'SET KUNDNr2 für abweichende Lieferadresse 
	dim sqlLI, rsLI
	dim addressType: addressType = "LI"
	dim kundNr2 
	
	sqlLI  = "Select ID from [ofAdressen-Weitere] where typ= '" & addressType &  "' and IDNR=" & kdnr
	'Response.Write sqlLI 
	set rsLI = objConnectionExecute(sqlLI) 
	if not rsLI.EOF then 
	    kundNr2 = rsLI("ID")
        sqlUpdateAuftrag = "UPDATE buchAuftrag " & _ 
	                   " SET KundNr2 =" &  kundNr2 & _
	                   " WHERE Nummer = " & AuftragNr  
	    'Response.Write sqlUpdateAuftrag                 	    
        objConnectionExecute(sqlUpdateAuftrag)
	end if 
	rsLI.close
	
	'End SET kUndn22 

   'send an email 
   'on error resume next 
   createOrderFromBasket = AuftragNr
  
   'insert reference ' see reference module 
   call createReference("AU", AuftragNr, Session("REFERER_ID"))
   call createOrderFromBasketFinish (KDNR, AuftragNr)
end function 


function createOrderFromBasketFinish(byVal KDNR, byVal AuftragNr)
   
   if VARVALUE_DEFAULT("SHOP_SEND_MAILS_AFTER_ORDER", "true") = "true" then 
			Dim mailtext 
			Dim Name : Name = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Name")   
			mailtext = MAKE_EMAIL_ORDER(KDNR, AuftragNr)				
			'send mail to client      
			sendMailFromWithSending GetClientEmail (KDNR) , getTranslation("Ihre Bestellung #") & AuftragNr, mailtext , VARVALUE_DEFAULT("EMAIL_AUTOCONFIRM", "office@griton.eu" )
			'send same mail to shop manager
			sendMailFromWithSending VARVALUE_DEFAULT("EMAIL_SHOP_MANAGER", VARVALUE("EMAIL")), getTranslation("Ihre Bestellung #") & AuftragNr , mailtext , VARVALUE_DEFAULT("EMAIL_AUTOCONFIRM", "office@griton.eu")
			'send same mail to shop manager
			sendMailFromWithSending VARVALUE_DEFAULT("ADMIN_EMAIL", "grigor.tonkov@gmail.com"), getTranslation("Ihre Bestellung #") & AuftragNr , mailtext , VARVALUE_DEFAULT("EMAIL_AUTOCONFIRM", "office@griton.eu")
			'send to the fax 
   
			'sendMailFromWithSending "sales@XSCORPION.COM",  "480-393-4348", mailtext, "faxout@faxthruemail.com"
   end if 
   
end function 

function getVorgangEigenschaft(VorgangTyp, Nummer, Name) 

    dim sql: sql = "select [Value] as val  from buchVorgaengeEigenschaften where VorgangTyp = '" & VorgangTyp & "'" & _ 
                   " and Nummer ='" & Nummer & "' and [Name] ='" & Name & "'" 
    dim rs: set rs = ObjConnectionExecute(sql) 

if not rs.EOF then
 getVorgangEigenschaft  = rs("val")
else 
 getVorgangEigenschaft  = ""
end if 



end function

%>
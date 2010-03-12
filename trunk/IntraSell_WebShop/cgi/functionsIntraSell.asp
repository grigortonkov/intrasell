<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================

'*****************************************************************
' the file contains the business functions needed for IntraSell
' get name for the table with orders
'*****************************************************************

'**Start Encode**

const CALCULATE_POSTCOSTS        = "CALCULATE_POSTCOSTS"
const CALCULATE_PAYMODECOSTS     = "CALCULATE_PAYMODECOSTS"
const CALCULATE_GUTSCHEIN        = "CALCULATE_GUTSCHEIN"
const CALCULATE_MIN_ORDER_VALUE  = "CALCULATE_MIN_ORDER_VALUE" 'EAN of the Product that contains the Price when order value is less than defined
const CALCULATE_BASKET_DISCOUNT  = "CALCULATE_BASKET_DISCOUNT"

function getNameFor(OrderType)
	getNameFor=getDruckForType(OrderType)
end function 

'*****************************************************************
'get name for the table with orders
'*****************************************************************
function getNameForTable(byVal OrderType)
	getNameForTable = getVorgangTableForType(OrderType)
end function 

'*****************************************************************
'get name for the table with products
'*****************************************************************
function getNameForTableProducts(byVal OrderType)
	getNameForTableProducts=getVorgangArtikelTableForType(OrderType)
end function 


'*************************************************************************
' returns the sum of the POST expenses
' searches for POST-AT-1
' NACHNAHME-AT
' NACHNAHME-DE etc. 
'*************************************************************************
function calculatePaymentModeSpends(byVal PaymentMode, _
                                    byVal Country, _
                                    byVal Gewicht, _ 
                                    byVal Umsatz)
 Dim sql, rsP
	sql = "SELECT * FROM [grArtikel-Vertriebskosten] Where Methode = '" & PaymentMode & "' and Destination like '" & Country & "'"
	set rsP = objConnectionExecute(sql)
	if rsP.EOF then 
		calculatePaymentModeSpends = 0
	else 
	    calculatePaymentModeSpends = rsP("Fixekosten")+ rsP("VariableKostenNachGewicht")*Gewicht + rsP("VariableKostenNachUmsatz")*umsatz 
	end if
    rsP.close 
end function 

'******************************************************************************
' returns the ArtNR of the POST expenses
' searches for POST-AT-1
' NACHNAHME-AT
' NACHNAHME-DE etc. 
' if no payment mode artnr is found returns -1
'******************************************************************************
function getPaymentModeSpendsArtNr(PaymentMode, Country) 
	    getPaymentModeSpendsArtNr= tableValue("grArtikel","EAN","'" & CALCULATE_PAYMODECOSTS & "'","ArtNr")
end function 

'******************************************************************************
' returns the amount of the POST expenses
' searches for POST-AT-1
' POST-AT-2
' EXPRESSPOST-AT-2 usw.
' POST-DE-1 etc. 
'
' Express- true false 
'******************************************************************************
function calculatePostSpends(ByVal PostModeDestionation, ByVal Kg, ByVal PostMode)        
 	Kg = Kg + 0
	if KG = null then kg = 0
	if isnull (Kg) then 
		Kg = 0
	else 
		Kg = Round (Kg, 2)
	end if
	
	Dim sql, rsP
	sql = "SELECT destination, Fixekosten, VariableKostenNachGewicht " & _ 
	      " FROM [grArtikel-Vertriebskosten] Where destination like '" & PostModeDestionation & "'" & _
	      " and Methode Like '" & PostMode & "' AND GewichtVon<=" & replace(KG,",",".") & " AND GewichtBis> " & replace(KG,",",".")
 	'Response.Write sql
 	set rsP = objConnectionExecute(sql)
	if rsP.EOF then 
		 calculatePostSpends= 0
    else 
	    calculatePostSpends = rsP("Fixekosten") + rsP("VariableKostenNachGewicht")*KG
	end if
	rsP.close 
end function 

'*************************************************************************
' returns the number of the post expenses product nr 
' Express - true or false 
'*************************************************************************
function getPostSpendsArtNr(ByRef Country, ByRef Kg, ByRef PayMode)
	getPostSpendsArtNr = tableValue("grArtikel","EAN","'" & CALCULATE_POSTCOSTS & "'","ArtNr")
end function 

'*************************************************************************
' returns the wight of all prodcuts 
'*************************************************************************

function getWeightOfProduct(ArtNR)
     dim weight:weight=0
    'on error resume next 
	 'Response.Write TABLEVALUE("grArtikel","ArtNR", ArtNR, "gewicht")
	 'Response.Flush
	 dim weightString:weightString =  TABLEVALUE("grArtikel","ArtNR", ArtNR, "gewicht") & ""
	 'weightString = replace(weightString,",",".")
	 if not isNumeric(weightString) then 
		getWeightOfProduct = 0 
		exit function 
	 end if 
	 weight = 1*cdbl(weightString)
	 if weight < 0 or weight = "" or len(weight)=0 then weight = 0
	 getWeightOfProduct = weight
	 if showdebug() then response.Write "Weight=" & weight
end function 

'*************************************************************************
' getWeightOfOrder
'*************************************************************************
function getWeightOfOrder(byVal OrderType, byVal Nummer)
	Dim sql, rs 
	sql ="SELECT ArtNR, Stk from [" & getVorgangArtikelTableForType(OrderType) & "] Where RechNr=" & Nummer
	set rs = objConnectionExecute(sql)
	dim totalKG:totalKG = 0 
	 
	while not rs.EOF 
		totalKG = totalKG  + cdbl(rs("Stk")) * getWeightOfProduct(rs("ArtNR"))
		rs.MoveNext 
	wend
	rs.close  
	getWeightOfOrder = totalKG
end function 

'*************************************************************************
' getWeightOfOrder
'*************************************************************************
function getWeightOfBasket(byVal Sid)
	Dim sql, rs 
	sql = "SELECT SID, ArtNr, Quantity FROM webWarenkorb " & _
		  "WHERE SID=" & Sid & " AND Quantity > 0 "
			  
	set rs = objConnectionExecute(sql)
	dim totalKG: totalKG = 0 
	 
	while not rs.EOF 
		totalKG = totalKG  + rs("Quantity") * getWeightOfProduct(rs("ArtNR"))
		rs.MoveNext 
	wend
	rs.close 
	getWeightOfBasket = totalKG
end function 


'*************************************************************************
' isWarenkorbEmpty
' SID - Session ID
'*************************************************************************	
function isWarenkorbEmpty(byVal SID)
	dim sql, rsWK
	sql = "SELECT * FROM webWarenkorb Where SID=" & SID 
	set rsWK = objConnectionExecute(sql)
	isWarenkorbEmpty =  rsWK.EOF
end function 	


'*************************************************************************
' liefert mindestbestellmenge für eine Bestellung 
'*************************************************************************	
function getMinOrderValue() 
    getMinOrderValue = VARVALUE_DEFAULT(CALCULATE_MIN_ORDER_VALUE, "100") '100 Euro ist mindestbestellwert
end function     

function getMinOrderValue_charge_artnr() 
    getMinOrderValue_charge_artnr = tablevalue("grArtikel","EAN", "'" & CALCULATE_MIN_ORDER_VALUE & "'", "ArtNr")
end function    

function getMinOrderValue_charge() 
    'wrong getMinOrderValue_charge = tablevalue("grArtikel","EAN", "'" & CALCULATE_MIN_ORDER_VALUE & "'", "PreisATS")
    getMinOrderValue_charge = makeNettoPreis(getMinOrderValue_charge_artnr(), "1", 0)
end function     


'*************************************************************************
' kalkuliert rabatt für eine Bestellung 
' Added at 18.04.2005 for xscorpion 
' returns -1 if no discount calculation is set
'*************************************************************************	
function getBasketDiscount_artnr() 
 dim discArt
    discArt = tablevalue("grArtikel","EAN", "'" & CALCULATE_BASKET_DISCOUNT & "'", "ArtNr")
    if isNumeric(discArt) then 
		getBasketDiscount_artnr = discArt
    else
        getBasketDiscount_artnr = -1
    end if 
end function    

'*************************************************************************
' kalkuliert rabatt für eine Bestellung 
' Added at 18.04.2005 for xscorpion 
'*************************************************************************	
function getBasketDiscount_Value(byval totalValueOfBasket) 

    getBasketDiscount_Value = 0 
    dim sql, rs 
    totalValueOfBasket = round(totalValueOfBasket)
    sql = "select * from [grArtikel-OrderRabatt] where GesamtPreisVon <= " & totalValueOfBasket & " and GesamtPreisBis >=" & totalValueOfBasket
    set rs =  objConnectionExecute(sql)
    if not rs.eof then 
			getBasketDiscount_Value = totalValueOfBasket * rs("Rabatt")/100
    end if 
    
end function   

'*************************************************************************
' function deleteOrder(OrderType, Nummer)
'*************************************************************************

function deleteOrder(OrderType, Nummer)
   dim tableNameOrders 
       tableNameOrders = getNameForTable(OrderType)
   dim sql : sql  = "DELETE FROM " & tableNameOrders & " WHERE Nummer=" & Nummer
   objConnectionExecute(sql)
   deleteOrder = true   
end function 

'*************************************************************************
' function createEmptyOrder(KDNR, SID)
'*************************************************************************
function createEmptyOrder(OrderType)
	Dim AuftragNr, Notiz , sql  , kdnr
	
	 'kdnr - select smallest from ofAdressen
	 sql = "SELECT min(IDNR) as minIDNR from ofAdressen": set rsK = objConnectionExecute(sql)
	 if rsK.EOF then
	    response.write "Sorry! You have no ofAdressen entries in the table!!!! Please create some inition Client!"
	  	exit function 
	 end if 
	 kdnr = rsK("minIDNR"): rsK.close 
	 
   
    tableNameOrders = getNameForTable(OrderType)
	AuftragNr = NextId(tableNameOrders ,"Nummer")
	Notiz = "new"

	sql = "INSERT INTO " & tableNameOrders  & " (Nummer, KundNr, Datum)  " & _ 
	  	   "Values(" & AuftragNr & "," & KDNR  & ", CURRENT_TIMESTAMP)"
	objConnectionExecute(sql)	  	   
   createEmptyOrder = AuftragNr 
end function 

'*************************************************************************
' returns the destination land for this customer 
' remove this function to functionprices.asp
'*************************************************************************
Function getClientDestinationLand(IdNr)
  Dim plzLAND, clientPLZ
   plzLAND = TABLEVALUE("[ofAdressen-Weitere]", "IDNR", IdNr, "LAND")
   'response.write "<br>PLZLand =" & PLZLand
  If isNumeric(plzLand) then 
		If plzLAND = 43 Then getClientDestinationLand = "AT"
		If plzLAND = 49 Then getClientDestinationLand = "DE"
		If plzLAND = 359 Then getClientDestinationLand = "BG"
		If plzLAND = 1 Then getClientDestinationLand = "US"
   else 
     	getClientDestinationLand = getClientLand(idnr)
   end If 
End Function



'*****************************************************************
'  showCurrentUser
'*****************************************************************
function showCurrentUser()
    if getLOGIN() <> "" then 
		Response.write "User: " & TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Email")
    end if
end function 

'*****************************************************************
'*****************************************************************
FUNCTION GetClientEmail (CID)
Dim sql
Dim rsC
	if CID <> "" then 
		sql = "Select Email from ofAdressen where IDNR=" & CID
		set rsC = objConnectionExecute (sql)
		if rsC.EOF=true then
			GetClientEmail=""
		else
			GetClientEmail = rsC ("Email")
		end if
	else
		GetClientEmail=""
	end if
End Function

'*****************************************************************
'*****************************************************************
FUNCTION GetShopEMail() 
		GetShopEMail = VARVALUE("Email")
END FUNCTION



' returns -1 if not defined 
function getFreiHausLieferungUmsatz()

  dim freiHausLieferungAbUmsatz
  freiHausLieferungAbUmsatz = VARVALUE("MIN_UMSATZ_FREI_HAUS")
  if not isNumeric(freiHausLieferungAbUmsatz) then freiHausLieferungAbUmsatz = -1
  
  getFreiHausLieferungUmsatz = 1*freiHausLieferungAbUmsatz
end function 


function getPaketNummer(byval orderType, byVal rechNR)
	Dim tableOrders, tableOrdersProducts
	tableOrders= getNameForTable(orderType)
	tableOrdersProducts= "[" & getNameForTableProducts(orderType) & "]"

  dim rs, sql 
  sql = "select * from buchVorgaengeEigenschaften where vorgangTyp = '" & orderType & "' and Nummer = " & rechNR & " and [Name] like 'Paketnummer'"
  set rs = objConnectionExecute(sql) 
  if not rs.eof then
  dim allePakete 'as string  
    while not rs.eof 'do
      allePakete = allePakete & ", " & rs("Value")
      rs.MoveNext 
    wend   
    allePakete = right(allePakete, len(allePakete) - 2)
    getPaketNummer = allePakete
  else 
      getPaketNummer = ""   
  end if 
  
end function 

'according land return symbol 
function getCurrencySymbol()
   getCurrencySymbol = "&euro;"
   if Session("Land") = "US" then 
      getCurrencySymbol = "$"
   end if 
end function 
%>
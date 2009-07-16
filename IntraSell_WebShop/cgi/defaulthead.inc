<%@ LANGUAGE = VBScript.Encode%>
<%'@ LANGUAGE = VBScript.Encode  TRANSACTION = Required %>
<%OPTION explicit%>
<%'ON ERROR RESUME NEXT%>
<!--#include virtual="/intrasoft/connOpen.asp"-->
<!--#include virtual="/intrasoft/functions.asp"-->
<!--#include virtual="/intrasoft/functionsGUI.asp"-->
<!--#include virtual="/intrasoft/functionsFAQ.asp"-->
<!--#include virtual="/intrasoft/functionsCache.asp"-->
<!--#include virtual="/intrasoft/functionsDictionary.asp"-->
<!--#include virtual="/intrasoft/functionsLogs.asp"-->
<!--#include file="functionsSessions.asp"-->
<!--#include file="functionsCategories.asp"-->
<!--#include file="functionsProducts.asp"-->
<!--#include file="functionsProductsQuery.asp"-->
<!--#include file="functionsProductsLists.asp"-->
<!--#include file="functionsExtras.asp"-->
<!--#include file="functionsPrices.asp"-->
<!--#include file="functionsProfile.asp"-->
<!--#include file="functionsSkins.asp"-->
<!--#include file="mailtexts.asp"-->
<!--#include file="functionsIntraSellDLL.asp"-->
<!--#include file="functionsIntraSell.asp"-->
<!--#include file="functionsOrderInvoice.asp"-->
<!--#include file="functionsOrderInvoiceDisplay.asp"-->
<!--#include file="functionsOrderInvoicePrintASP.asp"-->
<!--#include file="functionsOrderInvoicePrint.asp"-->
<!--#include file="functionsTemplate.asp"-->
<!--#include file="functionsBanners.asp"-->
<!--#include file="functionsToolbar.asp"-->
<!--#include file="functionsNewsletter.asp"-->
<!--#include file="functionsUserPoints.asp"-->
<!--#include file="functionsGutschein.asp"-->
<!--#include file="priceCompare/functionsInterface.asp"-->
<!--#include virtual="/admin/module_ref/functionsReferers.asp"-->
<!--#include file="functionsLieferanten.asp"-->
<!--#include file="functionsProductsImages.asp"-->
<!--#include file="functionsProductsCompare.asp"-->
<!--#include file="functionsProductsPrint.asp"-->
<!--#include file="functionsStatistics.asp"-->
<!--#include file="functionsPayment.asp"-->
<!--#include file="functionsUserSearches.asp"-->
<!--#include file="functionsDictionary.asp"-->


<%
 call createSession() 
 
 'check user input and stop execution if intrusion detected 
 Dim cleanedInputName
 'Check query string parameters
 for each cleanedInputName in request.querystring
   if request(cleanedInputName) <> cleanUserInput(request(cleanedInputName)) then 
       response.write "<font color=red>Is this qs Intrusion!? pName='" & cleanedInputName & "' != '" & request(cleanedInputName) & "'</font>" 
       response.end     
   end if 
 next 
 'Check form string parameters
 for each cleanedInputName in request.form
   if trim(request(cleanedInputName)) <> trim(cleanUserInput(request(cleanedInputName))) then 
       response.write "<font color=red>Is this form Intrusion!? pName='" & cleanedInputName & "' != '" & request(cleanedInputName) & "'</font>"   
       response.end     
   end if 
 next 
 'end check for intrusion 
 
 
 Dim pageToShow :pageToShow = cleanUserInput(request("pageToShow"))
 Dim sid: sid = "123985702397562938659238659238475601940532450239485702"
 Dim artKatNrToShow: artKatNrToShow=cleanUserInput(request("PreKatNr")) 
 Dim artNrToShow: artNrToShow=request("artNr") : if artNrToShow = "" then artNrToShow = request("ProduktID")
 Dim artOrder: artOrder=cleanUserInput(request("orderBy"))
 Dim message: message=cleanUserInput(request("message")) 'if any page sends message to client 
 
 'set in vars 
   if len(varvalue("DEFAULT_SHOP_LAND")) <> 2 then 'not set 
       call setvarvalue("DEFAULT_SHOP_LAND","AT")
   end if 
 'end set 
 
 Dim PAGETITLE, PAGEDESCRIPTION, PAGEKEYWORDS 
 Public SHOP_TITLE

 'LAND 
 Dim land: land = cleanUserInput(request("L"))
 if land&""="" then land = Session("LAND")
 if land&""="" then land = varvalue("DEFAULT_SHOP_LAND")

  
 'if Session("LAND") <> cleanUserInput(request("L")) and len(cleanUserInput(request("L"))) >1 then Session("LAND") = land
 'if Session("LAND") = "" then  Session("LAND") = land
	'für land wechsel
	if Session("LAND") <> land then 
        if showDebug() then response.write "Land Wechsel! Land ist nun " & land & "."
 		Session("LAND") = land  
	end if 
 'END LAND 

'LANGUAGE 
 Dim language: language = cleanUserInput(request("language"))
 if language&""="" then language = Session("LANGUAGE")
 if language&""="" then language = varvalue("DEFAULT_SHOP_LANGUAGE")

	'für Language wechsel
	if Session("LANGUAGE") <> language then 
        if showDebug() then response.write "Language Wechsel! Language ist nun " & language  & "."
 		Session("LANGUAGE") = language  
	end if 
 'END LANGUAGE 
 
 
'set referer Id 
 Dim refererId: refererId = request("r"): if refererId = "" then refererId = "0" ' get referer id from sent request
 if Session("REFERER_ID") <= 0 then Session("REFERER_ID") = getInternalIDNRFromForeignRefererId(refererId) 'get internal referer 
    
    
 if artKatNRtoShow & "" <> "" then 
        SESSION("CURRENT_PRODUCT_CATEGORY") = artKatNRtoShow
 else 
        SESSION("CURRENT_PRODUCT_CATEGORY") = 0      
 end if    
 
 'Response.Write "pagetoShow:" & pagetoShow    
 'if pageToShow = "TopTen" or pageToShow = "TopClicks" or pageToShow = "" Then
 '		SESSION("CURRENT_PRODUCT_CATEGORY") = ""
 'end if  
 
 
 if artNrToShow    <> "" and pageToShow = "" then pageToShow  = "ProductView"  
 if artKatNrToShow <> "" and pageToShow = "" then pageToShow  = "ProductList" ' Kat template will be parsed and the list will be created 

 If PageToShow = "" then PageToShow ="FirstPage" 
 If PageToShow ="FirstPage" then 
		PageToShow = "ProductList"
		If artKatNrToShow & "" = "" then artKatNrToShow = 0     
 end if 
    
 'SET ARTKATNR from grArtikel of not SET !
 if artNrToShow <> "" then 
       SESSION("CURRENT_PRODUCT_CATEGORY") = tablevalue("grArtikel", "ArtNR", artNrToShow, "ARTKATNR")
       'PAGETITLE = tablevalue("grArtikel", "ArtNR", artNrToShow, "Bezeichnung")
       PAGETITLE = makeProductPageWithTemplate(artNrToShow, "[Firma] / [Bezeichnung] / [EAN] / kaufen Sie ab [makeBruttoPreis] €")
       PAGEDESCRIPTION = tablevalue("grArtikel", "ArtNR", artNrToShow, "Beschreibung")
 end if 

if SESSION("CURRENT_PRODUCT_CATEGORY") <> "" and IsNumeric(SESSION("CURRENT_PRODUCT_CATEGORY")) then 
    if clng(SESSION("CURRENT_PRODUCT_CATEGORY")) > 0 then 
	    PAGETITLE = PAGETITLE & " > " & tablevalue("[grArtikel-Kategorien]", "ArtKatNR", SESSION("CURRENT_PRODUCT_CATEGORY"), "Name")
    end if 
end if 
 
 if PAGETITLE <> "" then 
     PAGETITLE = PAGETITLE & " @ " 
 end if 
 
 
 'response.write Request.ServerVariables("URL") 
 'Session ("BASENAME") = "http://" & Request.ServerVariables("SERVER_NAME")  & left(Request.ServerVariables("URL"), len(Request.ServerVariables("URL")) - len("/default.asp"))

SHOP_TITLE = PAGETITLE & VARVALUE("DOMAIN") & " eStore in " & Session("LAND")
SHOP_TITLE = PAGETITLE & Request.ServerVariables("HTTP_HOST") & " : " & Session("LAND")


%>

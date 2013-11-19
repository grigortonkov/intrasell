<%
  dim bodyPageTemplate, body_part1, body_part2
  Dim filenameForBodyTemplate 
  
  filenameForBodyTemplate = Server.MapPath("skins/skin" & SKINNUMBER & "/pages/template_" & PageToShow & ".htm")
  if fileExists(filenameForBodyTemplate) then
		bodyPageTemplate = readTextFile(filenameForBodyTemplate)
		bodyPageTemplate = parseTemplate(bodyPageTemplate,SESSION("CURRENT_PRODUCT_CATEGORY"))
		'response.write bodyPageTemplate: response.end
		if InStr(bodyPageTemplate,TAG_BODY) > 0 then 'BODY TAG IS OK
			body_part1 = left(bodyPageTemplate,InStr(bodyPageTemplate,TAG_BODY)-1) 
			body_part2 = mid(bodyPageTemplate,InStr(bodyPageTemplate,TAG_BODY) + len(TAG_BODY)) 
		else 'BODY IS MISSING
		    body_part1 = bodyPageTemplate
		    pageToShow = "NOTHING"
		end if 
  else
    if lcase(request("debug")) = "true" then 
		response.write "No Template File was found for this page! Page=" & filenameForBodyTemplate		
    end if  
  end if 

%>

<!--BODY START-->
<%=body_part1%>
<%if Message <> "" then%>
		<h3><%=getTranslation("Nachricht")%>: <%=message%></h3>
<%end if%>

    <!--#include file="priceCompare/defaultBody.inc"--> 	
    <!--#include file="immo/defaultBody.inc"--> 	

    <%   
    'Response.write "PageToshow:" & PageToShow
     
    Select Case pageToShow %>    
    <%case "ProductList", "" 'we have category Browse%>
         <%response.write makeRelLinksAbsolute(parseTemplate(findTemplate(artKatNrToShow), artKatNrToShow))%> 
         
    <%case "ProductView"%>
		<%=makeProductPage(artNrToShow, request("pagePart"))%> 
		<%call addToUserVisitedProducts(artNrToShow)%> 		        	
    <%case "ProductQuery" 		'we have searching %>
    	<%Call DisplaySearchResults (Request ("qu"))%>
    <%case "Produktliste" 		'we have searching %>
    	<%Call requerySQL ()%>
    <%case "DetailSearchForm" 		'we have detail searching %>
    	<%Call DisplayDetailSearchForm ()%>
    <%case "DetailSearchResult" 		'we have detail searching %>
    	<%Call DisplayDetailSearchResults()%>        
    <%case "productSearchOnKeywords"%>    
        <!--#include file="productSearchOnKeywords.asp"-->        

    <%Case "warenkorbStep1", "warenkorb" %>
  		<!--#include file="basket/warenkorbStep1.asp"-->
  	<%Case "warenkorbStep2"%>
  		<!--#include file="basket/warenkorbStep2.asp"-->
  	<%Case "warenkorbStep3"%>
  		<!--#include file="basket/warenkorbStep3.asp"-->
  	<%Case "warenkorbStep4"%>
  		<!--#include file="basket/warenkorbStep4.asp"-->
  	 <%Case "PutInWarenkorb"%>
  		<% call PutInWarenkorb()%>  
  	 <%Case "RestoreWarenkorb"%>
  		<!--#include file="basket/restoreWarenkorb.asp"-->
	 <%Case "FAQ"%>
  		<%call showFAQ(request("FAQPage"))%>
  	
  	 <%'ACCOUNT PAGES%>	
  	 <%Case "Rechnungs"%>
  		<!--#include file="account/Rechnungs.asp"-->
  	 <%Case "RechnungsArtikel"%>
  		<!--#include file="account/RechnungsArtikel.asp"-->
  		
  	 <%Case "ChangePassword" %>
  		<!--#include file="account/ChangePassword.asp"-->  	 
  	 
  	 <%Case "ChangeEmail" %>
  		<!--#include file="account/ChangeEmail.asp"-->  	 
  		  	 
  	 <%Case "MyAccount"%>
  		<!--#include file="account/MyAccount.asp"-->
   	
   	 <%Case "MyProfile" %>
  		<!--#include file="account/MyProfile.asp"-->  	 
  		
   	 <%Case "MyProfileSimple" %>
  		<!--#include file="account/MyProfileSimple.asp"-->
  		  	   		
  	 <%Case "NewAccount" %>
  		<!--#include file="account/profileCreate.asp"-->
  	 <%Case "NewAccountSimple" %>
  		<!--#include file="account/profileCreateSimple.asp"-->
  	
  	 <%Case "ProfileSave"%>
  		<!--#include file="account/profileSave.asp"-->  	
  	 <%Case "ProfileSaveSimple"%>
  		<!--#include file="account/profileSaveSimple.asp"-->  
  
      <%Case "MyAccountActivate"%>
  		<!--#include file="account/MyAccountActivate.asp"-->
  				
  	 <%Case "createUpdateDeliveryAddresses"%>
  		<!--#include file="account/createUpdateDeliveryAddresses.asp"-->  	
  	 <%Case "createUpdateAddressSpecial"%>
  		<!--#include file="account/createUpdateAddressSpecial.asp"-->    		  		
  		
  		
  	 <%Case "TopTen"%>
  		<%call makeTOPTEN()%>
  	 <%Case "TopClicks"%>
  		<%response.write statisticTopClicks()%>
  		
  	 <%Case "MerchantList"%>
  		<%call makeMerchantManufacturerList(false)%>
  	 <%Case "ManufacturerList"%>
  		<%call makeMerchantManufacturerList(true)%>  
  		
  	 <%Case "MerchantProducts"%>
  		<%call DisplaySearchResultsOnMerchantSearch(request("idnr"), false)%>  		  	  	
  	 <%Case "ManufacturerProducts"%>
  		<%call DisplaySearchResultsOnMerchantSearch(request("idnr"), true)%>  	
  			  		
  	 <%Case "ProductMap"%>
  	    <% if request("Manufacturer") <> "" then response.write getTranslation("Produkte von ") &  request("Manufacturer")%>
  	    <% if request("Merchant") <> "" then response.write getTranslation("Produkte von ") &  request("Merchant")%>
  	    <%response.write  makeCategoriesTree(BASE_ARTKATNR, 10, request("Manufacturer"), request("Merchant"))%>
  	 
  	 <%Case "compareTwoProducts"%>
  	    <%response.write  compareTwoProducts(requesT("ArtNr1"),request("ArtNr2"))%>
  	 <%Case "compareManyProducts"%>
        <%response.write  compareManyProducts()%>
  	 <%Case "printManyProducts"%>
  	    <%call  printManyProducts()%>
  	 <%Case "MyReferedSells"%>
  		<%call  showMyReferedSells(getLOGIN(),request("OrderType"), 0, 0)%>
  		
  	 <%Case "Newsletter"%>
  		<% call registerForNewsletter(request("EmailForNewsletter"), request("Interest"))%>  

  	 <%Case "Bookmarks"%>
  		<!--#include file="account/userBookmarks.asp"-->
  	 <%Case "MyBookmarks"%>
  		<!--#include file="account/showBookmark.asp"-->
  	 <%Case "SaveBookmark"%>
  		<!--#include file="account/saveBookmark.asp"-->
  	 <%Case "SaveUserQuery"%>
  		<!--#include file="account/saveUserQuery.asp"-->
  	 <%Case "ShowUserQuery"%>
  		<!--#include file="account/showUserQuery.asp"-->

  	 <%Case "ShowUserSearch"%>
  		<!--#include file="account/showUserSearches.asp"-->
  		  		  		  		 
  	 <%Case "DoEmailAFriend"%>
  		<!--#include file="calls/DoSendToFriend_included.asp"-->
  	
  	<%Case "TestEmailOrder"%>
  		<!--#include file="account/testEmailOrder.asp"-->

  	<%Case "Ecard"%>
  		<!--#include file="ecard/index.asp"-->
  	<%Case "EcardView"%>
  		<!--#include file="ecard/view.asp"-->
  	<%Case "EcardSend"%>
  		<!--#include file="ecard/send.asp"-->  		
  		
  			  		
  	 <%Case "FirstPage","","WebPage"  ' default page%>
  		<%dim webPage : if request("WebPage") <> "" then webPage= request("WebPage")  else webPage="FirstPage" %>
  		<%=convertToHTML(parseTemplate(tableValue("webPages","[Title]","'" & webPage & "'","html"),0))%> 
  		
  		
  	 
  	 <%
 End Select 		
 Dim ArtNrToRedirekt: ArtNrToRedirekt = request("ArtNr")
 if ArtNrToRedirekt = "" then ArtNrToRedirekt = request("ProduktId")
 if request("NextPageToShow")<> "" then response.redirect "default.asp?pageToShow=" & request("NextPageToShow") & "&ArtNR=" & ArtNrToRedirekt & "&message=" & message
   		
	%>
	
<%=body_part2%>
<!--BODY END-->
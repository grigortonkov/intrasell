<%

    filenameForBodyTemplate = Server.MapPath("skins/skin" & SKINNUMBER & "/pages/template_" & PageToShow & ".htm")
    
    If fileExists(filenameForBodyTemplate) Then
        bodyPageTemplate = readTextFile(filenameForBodyTemplate)
        bodyPageTemplate = parseTemplate(bodyPageTemplate, Session("CURRENT_PRODUCT_CATEGORY"))
        bodyPageTemplate = makeRelLinksAbsolute(bodyPageTemplate)
        'response.write bodyPageTemplate: response.end
        If InStr(bodyPageTemplate, TAG_BODY) > 0 Then 'BODY TAG IS OK
            body_part1 = Left(bodyPageTemplate, InStr(bodyPageTemplate, TAG_BODY) - 1)
            body_part2 = Mid(bodyPageTemplate, InStr(bodyPageTemplate, TAG_BODY) + Len(TAG_BODY))
        Else 'BODY IS MISSING
            body_part1 = bodyPageTemplate
            pageToShow = "NOTHING"
        End If
    Else
        If showDebug() Then
            Response.Write("No template file was found for this page! Page=" & filenameForBodyTemplate)
        End If
    End If

%>
<!--BODY START-->
<%=body_part1%>
<%  If Message <> "" Then%>
<h3>
    <%=getTranslation("Nachricht")%>:
    <%=message%></h3>
<%  End If%>
<%
    '<!--#include file="priceCompare/defaultBody.inc"-->
    '<!--#include file="immo/defaultBody.inc"-->
 
    if showDebug() then 
      Response.write ( "PageToshow:" & PageToShow )
    end if  
     
    Select Case pageToShow%>
<%  Case "ProductList", "" 'we have category Browse%>
<%  Response.Write (makeRelLinksAbsolute(parseTemplate(findTemplate(artKatNrToShow), artKatNrToShow)))%>
<%  Case "ProductView"%>
<%  Response.Write (makeRelLinksAbsolute(makeProductPage(artNrToShow, request("pagePart"))))%>
<%  Call addToUserVisitedProducts(artNrToShow)%>
<%  Case "ProductQuery"       'we have searching %>
<%  Call DisplaySearchResults(Request("qu"))%>
<%  Case "Produktliste"       'we have searching %>
<%  Call requerySQL()%>
<%  Case "DetailSearchForm"       'we have detail searching %>
<%  Call DisplayDetailSearchForm()%>
<%  Case "DetailSearchResult"         'we have detail searching %>
<%  Call DisplayDetailSearchResults()%>
<%  Case "productSearchOnKeywords"%>
<!--#include file="productSearchOnKeywords.aspx"-->
<%  Case "warenkorbStep1", "warenkorb"%>
<!--#include file="basket/warenkorbStep1.aspx"-->
<%  Case "warenkorbStep2"%>
<!--#include file="basket/warenkorbStep2.aspx"-->
<%  Case "warenkorbStep3"%>
<!--#include file="basket/warenkorbStep3.aspx"-->
<%  Case "warenkorbStep4"%>
<!--#include file="basket/warenkorbStep4.aspx"-->
<%  Case "warenkorbStepOffer"%>
<!--#include file="basket/warenkorbStepOffer.aspx"-->
<%  Case "PutInWarenkorb"%>
<%  Call PutInWarenkorb()%>
<%  Case "RestoreWarenkorb"%>
<!--#include file="basket/restoreWarenkorb.aspx"-->
<%  Case "FAQ"%>
<%  Call showFAQ(Request("FAQPage"))%>
<%  'ACCOUNT PAGES%>
<%  Case "Rechnungs"%>
<!--#include file="account/Rechnungs.aspx"-->
<%  Case "RechnungsArtikel"%>
<!--#include file="account/RechnungsArtikel.aspx"-->
<%  Case "ChangePassword"%>
<!--#include file="account/ChangePassword.aspx"-->
<%  Case "ChangeEmail"%>
<!--#include file="account/ChangeEmail.aspx"-->
<%  Case "MyAccount"%>
<!--#include file="account/MyAccount.aspx"-->
<%  Case "MyProfile"%>
<!--#include file="account/MyProfile.aspx"-->
<%  Case "MyProfileSimple"%>
<!--#include file="account/MyProfileSimple.aspx"-->
<%  Case "NewAccount"%>
<!--#include file="account/profileCreate.aspx"-->
<%  Case "NewAccountSimple"%>
<!--#include file="account/profileCreateSimple.aspx"-->
<%  Case "ProfileSave"%>
<!--#include file="account/profileSave.aspx"-->
<%  Case "ProfileSaveSimple"%>
<!--#include file="account/profileSaveSimple.aspx"-->
<%  Case "MyAccountActivate"%>
<!--#include file="account/MyAccountActivate.aspx"-->
<%  Case "createUpdateDeliveryAddresses"%>
<!--#include file="account/createUpdateDeliveryAddresses.aspx"-->
<%  Case "createUpdateAddressSpecial"%>
<!--#include file="account/createUpdateAddressSpecial.aspx"-->
<%  Case "TopTen"%>
<%  Call makeTOPTEN()%>
<%  Case "TopClicks"%>
<%  Response.Write(statisticTopClicks())%>
<%  Case "MerchantList"%>
<%  Call makeMerchantManufacturerList(False)%>
<%  Case "ManufacturerList"%>
<%  Call makeMerchantManufacturerList(True)%>
<%  Case "MerchantProducts"%>
<%  Call DisplaySearchResultsOnMerchantSearch(Request("idnr"), False)%>
<%  Case "ManufacturerProducts"%>
<%  Call DisplaySearchResultsOnMerchantSearch(Request("idnr"), True)%>
<%  Case "ProductMap"%>
<%  If Request("Manufacturer") <> "" Then Response.Write(getTranslation("Produkte von ") & Request("Manufacturer"))%>
<%  If Request("Merchant") <> "" Then Response.Write(getTranslation("Produkte von ") & Request("Merchant"))%>
<%  Response.Write(makeCategoriesTree(BASE_ARTKATNR, 10, Request("Manufacturer"), Request("Merchant")))%>
<%  Case "compareTwoProducts"%>
<%  Response.Write(compareTwoProducts(Request("ArtNr1"), Request("ArtNr2")))%>
<%  Case "compareManyProducts"%>
<%  Response.Write(compareManyProducts())%>
<%  Case "printManyProducts"%>
<%  Call printManyProducts()%>
<%  Case "MyReferedSells"%>
<%  Call showMyReferedSells(getLOGIN(), Request("OrderType"), 0, 0)%>
<%  Case "Newsletter"%>
<%  Call registerForNewsletter(Request("EmailForNewsletter"), Request("Interest"))%>
<%  Case "Bookmarks"%>
<%'<!--#include file="account/userBookmarks.aspx"-->%>
<%'  Case "MyBookmarks"%>
<%'<!--#include file="account/showBookmark.aspx"-->%>
<%'  Case "SaveBookmark"%>
<!--#include file="account/saveBookmark.aspx"-->
<% call SaveBookmark() %>
<%  Case "SaveUserQuery"%>
<!--#include file="account/saveUserQuery.aspx"-->
<% call SaveUserQuery() %>
<%  Case "ShowUserQuery"%>
<!--#include file="account/showUserQuery.aspx"-->
<% call ShowUserQuery() %>
<%  Case "ShowUserSearch"%>
<!--#include file="account/showUserSearches.aspx"-->
<%  Case "DoEmailAFriend"%>
<!--#include file="calls/DoSendToFriend_included.aspx"-->
<%  Case "TestEmailOrder"%>
<!--#include file="account/testEmailOrder.aspx"-->
<%  Case "Ecard"%>
<!--#include file="ecard/index.aspx"-->
<%  Case "EcardView"%>
<!--#include file="ecard/view.aspx"-->
<%  Case "EcardSend"%>
<!--#include file="ecard/send.aspx"-->
<%  Case "FirstPage", "", "WebPage"  ' default page%>
<%  Dim webPage as String : If Request("WebPage") <> "" Then webPage = Request("WebPage") Else webPage = "FirstPage"%>
<% Response.Write (makeRelLinksAbsolute(convertToHTML(parseTemplate(tableValue("webPages", "[Title]", "'" & webPage & "'", "html"),0)))) %>
<%
End Select

Dim ArtNrToRedirekt : ArtNrToRedirekt = Request("ArtNr")

If ArtNrToRedirekt = "" Then 
    ArtNrToRedirekt = Request("ProduktId")
end if
        
If Request("NextPageToShow") <> "" Then
    Response.Redirect("default.aspx?pageToShow=" & Request("NextPageToShow") & "&ArtNR=" & ArtNrToRedirekt & "&message=" & message)
End If
         
%>
<%=body_part2%>
<!--BODY END-->

<script language="VB" runat="server">
    Dim bodyPageTemplate as String, body_part1 as String, body_part2 as String
    Dim filenameForBodyTemplate as String 
</script>


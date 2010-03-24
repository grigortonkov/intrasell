<%@ Page AspCompat="true" %>

<!--#include virtual="/intrasoft/connOpen.aspx"-->
<!--#include virtual="/intrasoft/functions.aspx"-->
<!--#include virtual="/intrasoft/functionsGUI.aspx"-->
<!--#include virtual="/intrasoft/functionsFAQ.aspx"-->
<!--#include virtual="/intrasoft/functionsCache.aspx"-->
<!--#include virtual="/intrasoft/functionsDictionary.aspx"-->
<!--#include virtual="/intrasoft/functionsLogs.aspx"-->
<!--#include file="cgi/functionsSessions.aspx"-->
<!--#include file="cgi/functionsDictionary.aspx"-->
<!--#include file="cgi/functionsCategories.aspx"-->
<!--#include file="cgi/functionsTemplate.aspx"-->
<!--#include file="cgi/functionsProducts.aspx"-->
<!--#include file="cgi/functionsProductsLists.aspx"-->
<!--#include file="cgi/functionsProductsQuery.aspx"-->
<!--#include file="cgi/functionsProductsImages.aspx"-->
<!--#include file="cgi/functionsProductsCompare.aspx"-->
<!--#include file="cgi/functionsSkins.aspx"-->
<!--#include file="cgi/functionsPrices.aspx"-->
<!--#include file="cgi/functionsIntraSell.aspx"-->
<!--#include file="cgi/functionsIntraSellDLL.aspx"-->
<!--#include file="cgi/functionsLieferanten.aspx"-->
<!--#include file="cgi/priceCompare/functionsMerchants.aspx"-->
<!--#include file="cgi/priceCompare/makeProductMerchantList2.aspx"-->
<!--#include file="cgi/functionsUserPoints.aspx"-->
<!--#include file="cgi/functionsUserSearches.aspx"-->
<!--#include file="cgi/mailtexts.aspx"-->
<!--#include file="cgi/functionsProfile.aspx"-->
<!--#include file="cgi/functionsNewsletter.aspx"-->
<!--#include file="cgi/functionsOrderInvoice.aspx"-->
<!--#include file="cgi/functionsGutschein.aspx"-->
<!--#include file="cgi/functionsStatistics.aspx"-->
<!--#include file="cgi/functionsBanners.aspx"-->
<!--#include file="cgi/functionsExtras.aspx"-->
<!--#include file="cgi/functionsToolbar.aspx"-->

<% 
    
    '
    
  Const TAG_BODY = "[BODY]"
  Const DEFAULT_ART_KAT_NR = 9999
  Dim defaultPageTemplate, default_part1, default_part2
 
  
    Response.Write("Grigor Tonkov<br>")
    Response.Write(replaceDomainTerms("RESR<br>"))
    Response.Write(VarValue("Email"))
    
     
  defaultPageTemplate  = findTemplateFromCache(DEFAULT_ART_KAT_NR)
 
 
    
%>

<script language="VB" runat="server">
    Public pageToShow As String
    Public sid As String
    Public artKatNrToShow As String
    Public artNrToShow As String
    Public artOrder As String
    Public message As String
    Public refererId As String
    Public language As String
    Public cleanedInputName As String
    Public land As String
     
    Public PAGETITLE As String, PAGEDESCRIPTION As String, PAGEKEYWORDS As String
    Public SHOP_TITLE As String

    'replaces the terms like Hersteller, Produkt, Lieferant with domain specific Terms 
    Public Function replaceDomainTerms(ByVal htmlCode As String) As String
        replaceDomainTerms = htmlCode
        
    End Function
</script>


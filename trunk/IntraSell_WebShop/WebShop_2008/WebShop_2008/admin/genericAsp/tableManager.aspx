<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--#include virtual="/admin/login.asp"-->
<!--#include virtual="/intrasoft/functions.asp"-->
<html>
<head><TITLE>Table Manager</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=unicode">
<meta http-equiv="Content-Language" content="en-gb">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0" >
<meta name="ProgId" content="FrontPage.Editor.Document">
<%
'Aplication settings for Generic ASP 
'Session("dbGenericPath") = "GenericASPFull/"
'Session("dbGenericPath") = "http://193.171.36.87/wms/ADMIN/GenericASPFull/"
Dim URL : URL =  Request.ServerVariables("URL") 
'Session("dbGenericPath") =  "http://" &  Request.ServerVariables("LOCAL_ADDR")  & left(URL,inStr(URL,"tableManager.asp")-1) & "GenericASPFull/"


Session("MyDSN") = ObjConnection
Session("dbExitPage") = "http://www.griton.eu"
Session("dbTitle") = "IntraSell"
'Session("dbType") = "SQL" '"UDF"
Session("dbConn") = Session("MyDSN") 
%>
<LINK href="../../style.css" rel=stylesheet type=text/css>
<base target="_self">
</head>
<BODY>
<H1 align=center>Table Manager </H1>
<DIV align=center>
<CENTER>
<TABLE border=0 cellPadding=0 cellSpacing=0 width=800>
  
  <TR>
    <TD vAlign=top width="50%">
      <H2>Configuration </H2>
      <UL>
        <LI><A href="tableRedirector_Vars.asp">Vars</A> (Settings) 
        <LI><A href="tableRedirector_Products.asp">Products</A> [<A 
        href="specialSearchl.asp?SearchFormFilename=SearchForm_grArtikel.htm">Search</A>] 

        <LI><A href="tableRedirector_grArtrikel_Staffelpreise.asp">Products - 
        Staffelpreise</A> 
        <LI><A href="tableRedirector_ProductsSpecial.asp">POST/EXPENCES</A> 
        (artikel mit nummer &lt; 1000) 
        <LI><A href="tableRedirector_Categories.asp">Categories</A> 
        <LI><A href="tableRedirector_grMWST.asp">MWST</A> 
        <LI><A href="tableRedirector_webFAQ.asp">FAQ</A> 
        <LI><A href="tableRedirector_webTopTen.asp">PriceHits</A> (Simple List) 
        - <A href="tableRedirector_webCatTopProducts.asp">Top Products</A> (by 
        Category) </LI></UL>
      <P> </P></TD>
    <TD vAlign=top width="50%">
      <H2>Data </H2>
      <UL>
        <LI><A href="tableRedirector_Adressen.asp">Addresses</A> 
        (Kunden)&nbsp;[<A 
        href="specialSearchl.asp?SearchFormFilename=SearchForm_ofAdressen.htm">Search</A>] 

        <LI><A href="tableRedirector_AdressenPLZ.asp">Addresses &amp; PLZ</A> 
        (Kunden und PLZ)&nbsp; 
        <LI><A href="tableRedirector_Lieferanten.asp">Lieferanten</A> 
        <LI><A href="tableRedirector_buchAngebot.asp">Offers</A> - <A 
        href="tableRedirector_buchAngebotArtikel.asp">Products</A> 
        <LI><A href="tableRedirector_buchAuftrag.asp">Orders</A> - <A 
        href="tableRedirector_buchAuftragArtikel.asp">Products</A> 
        <LI><A href="tableRedirector_buchRechnung.asp?OrderType=RE">Invoices</A> 
        - <A href="tableRedirector_buchRechnungArtikel.asp">Products</A> 
        <LI><A href="tableRedirector_buchLieferschein.asp">Sending </A>- <A 
        href="tableRedirector_buchLieferscheinArtikel.asp?OrderType=LI">Products</A> 

        <LI><A href="tableRedirector_buchRetourwaren.asp">Reclamation </A>- <A 
        href="tableRedirector_buchRetourwarenArtikel.asp">Products</A> 
        <LI><A href="tableRedirector_webNewsletter.asp">Newsletter</A> 
    </LI></UL></TD></TR></TABLE></CENTER></DIV>
<HR align=center width=800>

<DIV align=center>
<CENTER>
<TABLE border=0 cellPadding=0 cellSpacing=0 width=800>
  
  <TR>
    <TD width="100%">
      <H2>Server Configuration</H2>
      <P><FONT size=1>DB_SERVER_NAME : <%=Session("DB_SERVER_NAME")%> <br>
    DB_NAME : <%=Session("DB_NAME")%> <br>
    DSN : <%=Session("dbConn")%><br>
    SERVER_ID : <%=Session("SERVER_ID")%><br>
    PATH : <%=Session("dbGenericPath")%><br></FONT></P></TD></TR></TABLE></CENTER></DIV>
</BODY>
</html>

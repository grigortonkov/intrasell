<%
    Call createSession()
 
    'check user input and stop execution if intrusion detected 
    
    'Check query string parameters
    For Each cleanedInputName In Request.QueryString
        If Request(cleanedInputName) <> cleanUserInput(Request(cleanedInputName)) Then
            Response.Write("<font color=red>Is this qs Intrusion!? pName='" & cleanedInputName & "' != '" & Request(cleanedInputName) & "'</font>")
            Response.End()
        End If
    Next
    
    'Check form string parameters
    For Each cleanedInputName In Request.Form
        If Trim(Request(cleanedInputName)) <> Trim(cleanUserInput(Request(cleanedInputName))) Then
            Response.Write("<font color=red>Is this form Intrusion!? pName='" & cleanedInputName & "' != '" & Request(cleanedInputName) & "'</font>")
            Response.End()
        End If
    Next
    'end check for intrusion 
 
 
    pageToShow = cleanUserInput(Request("pageToShow"))
    sid = "123985702397562938659238659238475601940532450239485702"
    artKatNrToShow = cleanUserInput(Request("PreKatNr"))
    artNrToShow = Request("artNr") : If artNrToShow = "" Then artNrToShow = Request("ProduktID")
    artOrder = cleanUserInput(Request("orderBy"))
    message = cleanUserInput(Request("message")) 'if any page sends message to client 
 
    'set in vars 
    If Len(varvalue("DEFAULT_SHOP_LAND")) <> 2 Then 'not set 
        Call setvarvalue("DEFAULT_SHOP_LAND", "AT")
    End If
    'end set 


    'LAND 
    land = cleanUserInput(Request("L"))
    If land & "" = "" Then land = Session("LAND")
    If land & "" = "" Then land = varvalue("DEFAULT_SHOP_LAND")

    'if Session("LAND") <> cleanUserInput(request("L")) and len(cleanUserInput(request("L"))) >1 then Session("LAND") = land
    'if Session("LAND") = "" then  Session("LAND") = land
    'für land wechsel
    If Session("LAND") <> land Then
        If showDebug() Then Response.Write("Land Wechsel! Land ist nun " & land & ".")
        Session("LAND") = land
    End If
    'END LAND 

    'LANGUAGE 
    language = cleanUserInput(Request("language"))
    If language & "" = "" Then language = Session("LANGUAGE")
    If language & "" = "" Then language = varvalue("DEFAULT_SHOP_LANGUAGE")

    'für Language wechsel
    If Session("LANGUAGE") <> language Then
        If showDebug() Then Response.Write("Language Wechsel! Language ist nun " & language & ".")
        Session("LANGUAGE") = language
    End If
    'END LANGUAGE 
 
 
    'set referer Id 
    refererId = Request("r") : If refererId = "" Then refererId = "0" ' get referer id from sent request
    If Session("REFERER_ID") <= 0 Then Session("REFERER_ID") = getInternalIDNRFromForeignRefererId(refererId) 'get internal referer 
    
    
    If artKatNrToShow & "" <> "" Then
        Session("CURRENT_PRODUCT_CATEGORY") = artKatNrToShow
    Else
        Session("CURRENT_PRODUCT_CATEGORY") = 0
    End If
 
    'Response.Write "pagetoShow:" & pagetoShow    
    'if pageToShow = "TopTen" or pageToShow = "TopClicks" or pageToShow = "" Then
    '        SESSION("CURRENT_PRODUCT_CATEGORY") = ""
    'end if  
 
 
    If artNrToShow <> "" And pageToShow = "" Then pageToShow = "ProductView"
    If artKatNrToShow <> "" And pageToShow = "" Then pageToShow = "ProductList" ' Kat template will be parsed and the list will be created 

    If pageToShow = "" Then pageToShow = "FirstPage"
    If pageToShow = "FirstPage" Then
        pageToShow = "ProductList"
        If artKatNrToShow & "" = "" Then artKatNrToShow = 0
    End If
    
    'set ARTKATNR from grArtikel of not yet set
    If artNrToShow <> "" Then
        Session("CURRENT_PRODUCT_CATEGORY") = tablevalue("grArtikel", "ArtNR", artNrToShow, "ARTKATNR")
        'PAGETITLE = tablevalue("grArtikel", "ArtNR", artNrToShow, "Bezeichnung")
        PAGETITLE = makeProductPageWithTemplate(artNrToShow, "[Firma] / [Bezeichnung] / [EAN] / kaufen Sie ab [makeBruttoPreis] €")
        PAGEDESCRIPTION = tablevalue("grArtikel", "ArtNR", artNrToShow, "Beschreibung")
    End If

    If  Not Session("CURRENT_PRODUCT_CATEGORY") is nothing And IsNumeric(Session("CURRENT_PRODUCT_CATEGORY")) Then
        If CLng(Session("CURRENT_PRODUCT_CATEGORY")) > 0 Then
            PAGETITLE = PAGETITLE & " > " & tablevalue("[grArtikel-Kategorien]", "ArtKatNR", Session("CURRENT_PRODUCT_CATEGORY"), "Name")
        End If
    End If
 
    If PAGETITLE <> "" Then
        PAGETITLE = PAGETITLE & " @ "
    End If
 
 
    'response.write Request.ServerVariables("URL") 
    'Session ("BASENAME") = "http://" & Request.ServerVariables("SERVER_NAME")  & left(Request.ServerVariables("URL"), len(Request.ServerVariables("URL")) - len("/default.aspx"))

    SHOP_TITLE = PAGETITLE & VARVALUE("DOMAIN") & " WebShop in " & Session("LAND")
    SHOP_TITLE = PAGETITLE & Request.ServerVariables("HTTP_HOST") & " : " & Session("LAND")
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
</script>
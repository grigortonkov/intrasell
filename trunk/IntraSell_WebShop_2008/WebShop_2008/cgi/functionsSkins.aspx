<%
    SKINNUMBER = varvalue("SKINNUMBER") 'configuration  
    SKIN = "/skins/skin" & SKINNUMBER 'configuration
%>

<script language="VB" runat="server">  
    
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 -2010 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================


    Public SKINNUMBER As String
    Public SKIN As String

    'rem use <=imageFullName("noxel-b.gif")>
    ' Skin  - defines the skin that must be used for this shop
    Function imageFullName(ByVal imageName)
        If basename = "" Then basename = Session("BASENAME")

        Select Case imageName
            Case "isell_verysmall.gif" : imageFullName = basename + "/isell_verysmall.gif"
                'LINKS
            Case "agbs.gif" : imageFullName = basename + SKIN + "/images/links/agbs.gif"
            Case "datenschutz.gif" : imageFullName = basename + SKIN + "/images/links/datenschutz.gif"
            Case "emailnewsletter.gif" : imageFullName = basename + SKIN + "/images/links/emailnewsletter.gif"
            Case "home.gif" : imageFullName = basename + SKIN + "/images/links/home.gif"
            Case "kontakt.gif" : imageFullName = basename + SKIN + "/images/links/kontakt.gif"
            Case "lieferung.gif" : imageFullName = basename + SKIN + "/images/links/lieferung.gif"
            Case "pricehits.gif" : imageFullName = basename + SKIN + "/images/links/pricehits.gif"
            Case "resources.gif" : imageFullName = basename + SKIN + "/images/links/resources.gif"
            Case "produkte.gif" : imageFullName = basename + SKIN + "/images/links/produkte.gif"
            Case "toplinks.gif" : imageFullName = basename + SKIN + "/images/links/toplinks.gif"
            Case "basket1.jpg" : imageFullName = basename + SKIN + "/images/links/basket1.jpg"
            Case "basket2.jpg" : imageFullName = basename + SKIN + "/images/links/basket2.jpg"
            Case "basket3.jpg" : imageFullName = basename + SKIN + "/images/links/basket3.jpg"
            Case "basket4.jpg" : imageFullName = basename + SKIN + "/images/links/basket4.jpg"
            Case "returningcustomer.gif" : imageFullName = basename + SKIN + "/images/links/returningcustomer.gif"
            Case "newaccount.gif" : imageFullName = basename + SKIN + "/images/links/newaccount.gif"
            Case "forgotpassword.gif" : imageFullName = basename + SKIN + "/images/links/forgotpassword.gif"
            Case "paypal.gif" : imageFullName = basename + SKIN + "/images/links/paypal.gif"
        

                'BUTTONS
            Case "bestellen.gif" : imageFullName = basename + SKIN + "/images/buttons/bestellen.gif"
            Case "button.gif" : imageFullName = basename + SKIN + "/images/buttons/button.gif"
            Case "buy.gif" : imageFullName = basename + SKIN + "/images/buttons/buy.gif"
            Case "compare.gif" : imageFullName = basename + SKIN + "/images/buttons/compare.gif"
            Case "go.gif" : imageFullName = basename + SKIN + "/images/buttons/go.gif"
            Case "druck.gif" : imageFullName = basename + SKIN + "/images/buttons/druck.gif"
            Case "emailafriend.gif" : imageFullName = basename + SKIN + "/images/buttons/emailafriend.gif"
            Case "search.gif" : imageFullName = basename + SKIN + "/images/buttons/search.gif"
            Case "shopbags.gif" : imageFullName = basename + SKIN + "/images/buttons/shopbags.gif"
            Case "updatewarenkorb.gif" : imageFullName = basename + SKIN + "/images/buttons/updatewarenkorb.gif"
            Case "weiteraussuchen.gif" : imageFullName = basename + SKIN + "/images/buttons/weiteraussuchen.gif"
            Case "zurkasse.gif" : imageFullName = basename + SKIN + "/images/buttons/zurkasse.gif"
            Case "delete.gif" : imageFullName = basename + SKIN + "/images/buttons/delete.gif"
            Case "save.gif" : imageFullName = basename + SKIN + "/images/buttons/save.gif"
            Case "question.gif" : imageFullName = basename + SKIN + "/images/buttons/question.gif"
            Case "login.gif" : imageFullName = basename + SKIN + "/images/buttons/login.gif"
            Case "logout.gif" : imageFullName = basename + SKIN + "/images/buttons/logout.gif"
            Case "change_order.gif" : imageFullName = basename + SKIN + "/images/buttons/change_order.gif"

                'BORDERS
            Case "default.gif" : imageFullName = basename + SKIN + "/images/borders/default.gif"
            Case "edge_cut.gif" : imageFullName = basename + SKIN + "/images/borders/edge_cut.gif"

                'ICONS
            Case "arrow.gif" : imageFullName = basename + SKIN + "/images/icons/arrow.gif"
            Case "callmeback.gif" : imageFullName = basename + SKIN + "/images/icons/callmeback.gif"
            Case "dot.gif" : imageFullName = basename + SKIN + "/images/icons/dot.gif"
            Case "email.gif" : imageFullName = basename + SKIN + "/images/icons/email.gif"
            Case "emailafriend.gif" : imageFullName = basename + SKIN + "/images/icons/emailafriend.gif"
            Case "smile.gif" : imageFullName = basename + SKIN + "/images/icons/smile.gif"
            Case "package.png" : imageFullName = basename + SKIN + "/images/icons/package.png"
            Case "printer.png" : imageFullName = basename + SKIN + "/images/icons/printer.png"
            Case "data_information.png" : imageFullName = basename + SKIN + "/images/icons/data_information.png"


                'COMPANY
            Case "company.gif" : imageFullName = basename + "/company/images/" & VARVALUE("COMPANY_LOGO_IMAGE")
            Case "rechnung.gif" : imageFullName = basename + "/company/images/rechnung.gif"
        End Select

    End Function
</script>


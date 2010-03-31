<!--#include file="../defaultHead.inc.aspx"-->
<%
    'Description: creates an order from product ID's and returns the created order Numer back
    '<Nummer>123456</Nummer>
    'Paramters:
    ' ArtNR (Array) 
    ' IDNR (ClientID) 
    ' Example for call: ./cgi/services/createOrderService.aspx?debug=_true&ArtNrForOrder=2&ArtNrForOrder=1&ArtNrForOrder=3&ArtNrForOrder=4&ArtNrForOrder=5&ArtNrForOrder=5138&IDNR=1&PayMode=CreditCard

    Session("SID") = "" 'to generate new session on request 
    Session("LOG_IN") = ""
    'generate new SID 
    Call createNewSession()
    Call getSID()
    Dim ServiceSID : ServiceSID = getSID()

    Response.Write("Starting Order Creation! SID=" & ServiceSID)
    Dim ArtNrForOrder
    For Each ArtNrForOrder In Request.QueryString("ArtNrForOrder")

        If ArtNrForOrder & "" <> "" And IsNumeric(ArtNrForOrder & "") Then
            Call PutInWarenkorbByArtNr(ArtNrForOrder, "1", False, ServiceSID)
        End If
    
    Next
    Dim IDNR : IDNR = Request("IDNR")

    Dim payMode : payMode = Request("payMode")
    Dim postMode : postMode = ""
    Dim destination : destination = "AT"
    Dim Notiz : Notiz = ""
    Dim gutscheinNummerStep4 : gutscheinNummerStep4 = ""

    Dim ordId : ordId = createOrderFromBasket(IDNR, ServiceSID, payMode, postMode, destination, Notiz, gutscheinNummerStep4)
    Response.Write("<AuftragNummer>" & ordId & "</AuftragNummer>")
%>
<!--#include file="../../intrasoft/connclose.aspx"-->

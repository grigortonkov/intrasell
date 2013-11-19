<!--#include file="../defaulthead.inc"-->
<%
'Description: creates an order from product ID's and returns the created order Numer back
'<Nummer>123456</Nummer>
'Paramters:
' ArtNR (Array) 
' IDNR (ClientID) 
' Example for call: ./cgi/services/createOrderService.asp?debug=_true&ArtNrForOrder=2&ArtNrForOrder=1&ArtNrForOrder=3&ArtNrForOrder=4&ArtNrForOrder=5&ArtNrForOrder=5138&IDNR=1&PayMode=CreditCard

Session("SID") = "" 'to generate new session on request 
Session("LOG_IN") = ""
'generate new SID 
call createNewSession() 
call getSID()
Dim ServiceSID : ServiceSID = getSID()

response.Write "Starting Order Creation! SID=" & ServiceSID
Dim ArtNrForOrder
for each ArtNrForOrder in request.QueryString("ArtNrForOrder") 

	if ArtNrForOrder & "" <> "" and isNumeric(ArtNrForOrder & "") then 
		call PutInWarenkorbByArtNr(ArtNrForOrder, "1", false, ServiceSID)
    end if 
    
next 
Dim IDNR: IDNR = request("IDNR")

Dim payMode: payMode = request("payMode")
Dim postMode: postMode = ""
Dim destination: destination = "AT"
Dim Notiz: Notiz = ""
Dim gutscheinNummerStep4: gutscheinNummerStep4 = ""

Dim ordId: ordID =  createOrderFromBasket(IDNR, ServiceSID, payMode, postMode, destination, Notiz, gutscheinNummerStep4)
response.write "<AuftragNummer>" & ordID & "</AuftragNummer>"
%>
<!--#include file="../../intrasoft/connclose.asp"-->
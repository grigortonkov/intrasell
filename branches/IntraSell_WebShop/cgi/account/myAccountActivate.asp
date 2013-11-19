<%

dim sqlAct

sqlact = "select Email from ofAdressen where Status = '" & _
                      STATE_NOT_CONFIRMED_CLIENT & "' and Email='" & request("Email") &"'"


if firstValue(sqlact)   =    request("Email") then 'can activate                
	sqlAct = "update ofAdressen set status='Kunde' where Status = '" & _
						STATE_NOT_CONFIRMED_CLIENT & "' and Email='" & request("Email") &"'"
	objConnectionExecute(sqlAct)
	response.Write getTranslation("Ihren Account wurde aktiviert!")
else
   	response.Write getTranslation("Ihren Account wurde bereits aktiviert oder Sie haben nicht den vollständigen Link angeclickt!")
end if 
%>

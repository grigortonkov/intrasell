<!--#include file="defaulthead.inc"-->
<body>
<%
'Dim refererID: 
refererID = request("refererID")
Dim idnr 

if request("idnr") <> "" then ' it is possible that the idnr is send instead of the referer id 
    idnr = request("idnr") 
    refererId= getExternalRefererId(idnr)
else 
    refererID = request("refererID")
    idnr = getInternalIDNRFromForeignRefererId(refererID)
end if 


if idnr < 0 then 'not okay!!! 
 call drawErrorBox("Referer not existing!","No referer for this refererId is internaly defined! " &_ 
				   " Please, contact the administrator!","","") 
 response.write "</body>"
 Response.End  
end if 

call showRefererProducts(idnr)
%>
</body>

<!--#include file="defaulthead.inc"-->
<body>
    <%
        'Dim refererID: 
        refererID = Request("refererID")
        Dim idnr

        If Request("idnr") <> "" Then ' it is possible that the idnr is send instead of the referer id 
            idnr = Request("idnr")
            refererId = getExternalRefererId(idnr)
        Else
            refererID = Request("refererID")
            idnr = getInternalIDNRFromForeignRefererId(refererID)
        End If


        If idnr < 0 Then 'not okay!!! 
 call drawErrorBox("Referer not existing!","No referer for this refererId is internaly defined! " &_ 
				   " Please, contact the administrator!","","") 
            Response.Write("</body>")
            Response.End()
        End If

        Call showRefererProducts(idnr)
    %>
</body>

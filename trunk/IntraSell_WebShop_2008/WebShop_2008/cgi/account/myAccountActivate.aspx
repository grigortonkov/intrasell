<%

    Dim sqlAct

    sqlAct = "select Email from ofAdressen where Status = '" & _
                          STATE_NOT_CONFIRMED_CLIENT & "' and Email='" & Request("Email") & "'"


    If firstValue(sqlAct) = Request("Email") Then 'can activate                
        sqlAct = "update ofAdressen set status='Kunde' where Status = '" & _
             STATE_NOT_CONFIRMED_CLIENT & "' and Email='" & Request("Email") & "'"
        objConnectionExecute(sqlAct)
        Response.Write(getTranslation("Ihren Account wurde aktiviert!"))
    Else
        Response.Write(getTranslation("Ihren Account wurde bereits aktiviert oder Sie haben nicht den vollständigen Link angeclickt!"))
    End If
%>

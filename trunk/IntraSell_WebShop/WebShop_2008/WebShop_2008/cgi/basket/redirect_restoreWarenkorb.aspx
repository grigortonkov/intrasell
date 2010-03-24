<%

    Dim oldWarenkorbSID
    oldWarenkorbSID = Request("oldWarenkorbSID")
    Response.Redirect("../../default.aspx?pageToShow=RestoreWarenkorb&oldWarenkorbSID=" & oldWarenkorbSID)

%>
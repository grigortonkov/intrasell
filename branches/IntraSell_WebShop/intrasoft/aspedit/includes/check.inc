<%
If Level<>0 then
	If Session("aspEdit_UserName")="" then response.redirect("users.asp?action=logon")
	If int(Session("aspEdit_Level"))<Level then response.redirect("users.asp?action=level")
end if

%>
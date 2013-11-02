<!--#include file="../cgi/defaulthead.inc.aspx"-->
<%  'This page redirects using short links
    'eg www.ptec.co.at/short?D2S Philips will be redirected to the product page
    If Request.QueryString().Count > 0 Then
        Dim shortName As String = Request.QueryString(0)
        Response.Write("Your query:" & shortName)
        Response.Redirect("../default.aspx?pageToShow=ProductQuery&qu="&shortName)
    Else
        Response.Write("Please specify your search string.<br/>" & vbNewLine)
        Response.Write("Possible Short Links:<br/>")
        Call productShortLinks()
    End If
%>

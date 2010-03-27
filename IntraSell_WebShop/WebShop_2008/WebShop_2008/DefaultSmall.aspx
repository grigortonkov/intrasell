<!--#include file="cgi/defaulthead.inc.aspx"-->
<% 
  Const TAG_BODY = "[BODY]"
  Const DEFAULT_ART_KAT_NR = 9999
  Dim defaultPageTemplate, default_part1, default_part2
%> 
<script language="VB" runat="server">   
'sets absolute links for google.com
    Function makeRelLinksAbsolute(ByVal htmlCode As String) As String
        'dim absLinkToDefault: absLinkToDefault = "http://" & Request.ServerVariables("SERVER_NAME")  & "/default.aspx" 
        Dim absLinkToDefault As String : absLinkToDefault = Session("BASENAME") & "/default.aspx"
        makeRelLinksAbsolute = Replace(htmlCode, "default.aspx", absLinkToDefault)
    End Function

'replaces the terms like Hersteller, Produkt, Lieferant with domain specific Terms 
    Function replaceDomainTerms(ByVal htmlCode As String) As String
        replaceDomainTerms = htmlCode
    End Function
</script>


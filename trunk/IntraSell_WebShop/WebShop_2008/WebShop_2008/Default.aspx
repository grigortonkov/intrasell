
<!--#include file="cgi/defaulthead.inc.aspx"-->
<% 
  Const TAG_BODY = "[BODY]"
  Const DEFAULT_ART_KAT_NR = 9999
  Dim defaultPageTemplate, default_part1, default_part2
  
  defaultPageTemplate  = findTemplateFromCache(DEFAULT_ART_KAT_NR)
 'defaultPageTemplate  = readTextFile(Server.MapPath("template_default.htm"))
  
  defaultPageTemplate = parseTemplate(defaultPageTemplate,SESSION("CURRENT_PRODUCT_CATEGORY"))
  defaultPageTemplate = replace(defaultPageTemplate, "[SHOP_TITLE]", SHOP_TITLE)
  defaultPageTemplate = replace(defaultPageTemplate, "[PAGEDESCRIPTION]", PAGEDESCRIPTION & "")
  
  if InStr(defaultPageTemplate,TAG_BODY) <= 0 then 'missing 
        Response.Write("<br>Error: BODY Tag is missing in the template!")
      response.End
  end if 
  
  default_part1 = left(defaultPageTemplate,InStr(defaultPageTemplate,TAG_BODY)-1) 
  default_part2 = mid(defaultPageTemplate,InStr(defaultPageTemplate,TAG_BODY) + len(TAG_BODY)) 
  'DISPLAY DROP DOWN MENU
  'call DisplayManu ("default.asp")
    Response.Write(makeRelLinksAbsolute(default_part1))
%>
<!--#include file="cgi/defaultbody.inc.aspx"-->
<%  Response.Write(makeRelLinksAbsolute(default_part2))%>
<!--#include file="intrasoft/connClose.aspx"-->

<script language="VB" runat="server">   
'sets absolute links for google.com
    Function makeRelLinksAbsolute(ByVal htmlCode As String) As String
        'dim absLinkToDefault: absLinkToDefault = "http://" & Request.ServerVariables("SERVER_NAME")  & "/default.asp" 
        Dim absLinkToDefault As String : absLinkToDefault = Session("BASENAME") & "/default.asp"
        makeRelLinksAbsolute = Replace(htmlCode, "default.asp", absLinkToDefault)
    End Function

'replaces the terms like Hersteller, Produkt, Lieferant with domain specific Terms 
    Function replaceDomainTerms(ByVal htmlCode As String) As String
        replaceDomainTerms = htmlCode
    End Function
</script>
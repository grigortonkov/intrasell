<!--#include file="cgi/defaulthead.inc"-->
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
      response.Write "<br>Error: BODY Tag is missing in the template!"
      response.End
  end if 
  
  default_part1 = left(defaultPageTemplate,InStr(defaultPageTemplate,TAG_BODY)-1) 
  default_part2 = mid(defaultPageTemplate,InStr(defaultPageTemplate,TAG_BODY) + len(TAG_BODY)) 
  'DISPLAY DROP DOWN MENU
  'call DisplayManu ("default.asp")
  Response.Write makeRelLinksAbsolute(default_part1)
%>
<!--#include file="cgi/defaultbody.inc"-->
<%Response.Write makeRelLinksAbsolute(default_part2)%>
<!--#include file="intrasoft/connClose.asp"-->
<%
'sets absolute links for google.com
function makeRelLinksAbsolute(byval htmlCode)
 'dim absLinkToDefault: absLinkToDefault = "http://" & Request.ServerVariables("SERVER_NAME")  & "/default.asp" 
  if showDebug() then 
     Response.write "HTTPS=" & Request.ServerVariables("HTTPS")
  end if 
  
  dim basename : basename = Session ("BASENAME")
  if lcase(Request.ServerVariables("HTTPS")) = "on" then 
      basename = replace(Session ("BASENAME") , "http://","https://")
  end if 
 
 dim absLinkToDefault: absLinkToDefault = basename & "/default.asp" 
 makeRelLinksAbsolute = replace(htmlCode, "default.asp", absLinkToDefault)

 
end function 

'replaces the terms like Hersteller, Produkt, Lieferant with domain specific Terms 
function replaceDomainTerms(byval htmlCode)
	replaceDomainTerms=htmlCode
end function 
%>

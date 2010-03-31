<!--#include file="cgi/defaulthead.inc.aspx"-->
<% 
  Const TAG_BODY as String = "[BODY]"
  Const DEFAULT_ART_KAT_NR = 9999
  Dim defaultPageTemplate, default_part1, default_part2 as string
  
  defaultPageTemplate  = findTemplate(DEFAULT_ART_KAT_NR)
  'defaultPageTemplate  = readTextFile(Server.MapPath("template_default.htm"))
  defaultPageTemplate = parseTemplate(defaultPageTemplate,SESSION("CURRENT_PRODUCT_CATEGORY"))
  default_part1 = left(defaultPageTemplate,InStr(defaultPageTemplate,TAG_BODY)-1) 
  default_part2 = mid(defaultPageTemplate,InStr(defaultPageTemplate,TAG_BODY) + len(TAG_BODY)) 
%>
<!--BODY-->
<!--#include file="cgi/defaultbody.inc.aspx"-->
<!--BODY-->
<!--#include file="intrasoft/connClose.asp.aspx"-->





























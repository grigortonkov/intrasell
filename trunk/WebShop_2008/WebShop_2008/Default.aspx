<!--#include file="cgi/defaulthead.inc.aspx"-->
<% 
  Const TAG_BODY as String = "[BODY]"
  Const TAG_SHOP_TITLE as String  = "[SHOP_TITLE]"
  Const TAG_PAGEDESCRIPTION as String = "[PAGEDESCRIPTION]"
  Const DEFAULT_ART_KAT_NR = 9999
  Dim defaultPageTemplate, default_part1, default_part2 as string
  
  
  defaultPageTemplate = findTemplateFromCache(DEFAULT_ART_KAT_NR)
  defaultPageTemplate = parseTemplate(defaultPageTemplate, SESSION("CURRENT_PRODUCT_CATEGORY"))
  defaultPageTemplate = replace(defaultPageTemplate, TAG_SHOP_TITLE, SHOP_TITLE)
  defaultPageTemplate = replace(defaultPageTemplate, TAG_PAGEDESCRIPTION, PAGEDESCRIPTION & "")
  
  if InStr(defaultPageTemplate,TAG_BODY) <= 0 then 'missing 
      Response.Write("<br />Error: BODY Tag is missing in the template!")
      response.End
  end if 
  
  default_part1 = left(defaultPageTemplate,InStr(defaultPageTemplate,TAG_BODY)-1) 
  default_part2 = mid(defaultPageTemplate,InStr(defaultPageTemplate,TAG_BODY) + len(TAG_BODY)) 
  'DISPLAY DROP DOWN MENU
  'call DisplayManu ("default.aspx")
    Response.Write(makeRelLinksAbsolute(default_part1))
%>
<!--#include file="cgi/defaultbody.inc.aspx"-->
<%  Response.Write(makeRelLinksAbsolute(default_part2))%>
<% Call IntraSellDLL_DestroyOnPageEnd() %>
<!--#include file="intrasoft/connClose.aspx"-->
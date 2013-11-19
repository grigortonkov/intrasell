<html>
<head><title>ASPExec Dir Test (ping)</title><head>
<body>
<blockquote>
<H3>ASPExec Dir Test</H3>
<%

  function Subst (strValue, strOldValue, strNewValue)
    intLoc = InStr(strValue, strOldValue)
    While intLoc > 0
      if intLoc > 1 then
        if intLoc = Len(strValue) then
          strValue = Left(strValue, intLoc-1) & strNewValue
        else
          strValue = Left(strValue, intLoc -1) & strNewValue & Right(strValue, Len(strValue)-(intLoc-Len(strOldValue)+1))
        end if
      else
        strValue = strNewValue & Right(strValue, Len(strValue)-1)
      end if
      intLoc = InStr(strValue, strOldValue)
    Wend
    Subst = strValue
  end function

  function FixUpItems (strItem)
    if strItem <> "" then
      strItem = Subst(strItem, "<", "&lt;")
      strItem = Subst(strItem, ">", "&gt;")
      FixUpItems = strItem
    else
      FixUpItems = "<br>"
    end if
  end function

  Set Executor = Server.CreateObject("ASPExec.Execute")
  Executor.Application = "cmd"
  Executor.Parameters = "/C dir c:\"
  strResult = FixUpItems(Executor.ExecuteDosApp)
  Response.Write "<pre>" & strResult & "</pre>"
%>
</blockquote>
</body>
</html>

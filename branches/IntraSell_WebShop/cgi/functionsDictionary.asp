<%
 
'for compatibility reasons 
'const dbOpenDynaset = 0 
function OpenRecordset(sql,something)
  'Response.Write sql
  'on error resume next 
  set OpenRecordset = objConnectionExecute(sql)
end function 

sub msgbox(t1, t2) 
  response.Write t1   
end sub 

 
Public Function IntraSellDictionary()
   'get from cache 
  if IsNull( Session("IntraSell.IntraSellDictionary"))  then
    Set IntraSellDictionary = Session("IntraSell.IntraSellDictionary")
    exit function
  end if
  
  Dim isP
  
  Set isP = Server.CreateObject("IntraSell.IntraSellDictionary")
  'Response.Write(Session ("MyDSN"))
  isP.init(Session ("MyDSN"))
  Set Session("IntraSell.IntraSellDictionary") = isP
  Set IntraSellDictionary = isP
end function 


Public Function getTranslationDok( _ 
                         ByVal TableName , _
                         ByVal Key, _
                         ByVal FieldName, _
                         ByVal TextToTranslate, _
                         ByVal Language_Code) 
   if lcase(request("debug")) = "true" then 
      Response.write "<br>" & Chr(13) & " TableName = [" & TableName  & "]"
      Response.write "<br>" & Chr(13) & " Key = [" & Key  & "]"
      Response.write "<br>" & Chr(13) & " FieldName = [" & FieldName  & "]"
      Response.write "<br>" & Chr(13) & " TextToTranslate = [" & TextToTranslate  & "]"  
      Response.write "<br>" & Chr(13) & " Language_Code = [" & Language_Code  & "]"      
   end if 
   if (TextToTranslate & "" = "") then
      getTranslationDok = "" 
   else                                      
	  getTranslationDok = IntraSellDictionary.getTranslationDok(TableName, Key, FieldName, TextToTranslate, Language_Code)
   end if 
End Function


Public Function makeLanguageSelectionBar()
	dim html 
	html = ""
	html = html + "<a href='default.asp?language=DEU'>Deutsch</a>&nbsp"
	html = html + "<a href='default.asp?language=ENG'>English</a>&nbsp"
	makeLanguageSelectionBar = html
end function 
%>

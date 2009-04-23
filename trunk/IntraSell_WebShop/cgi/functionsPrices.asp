<%

Dim USE_AUFSCHLAG_KATEGORIE : USE_AUFSCHLAG_KATEGORIE = false
Dim USE_STAFFELPREISE : USE_STAFFELPREISE = false
Dim USE_VORKALKULIERTE_VKPREISE : USE_VORKALKULIERTE_VKPREISE = true  
 
'for compatibility reasons 
const dbOpenDynaset = 0 
function OpenRecordset(sql,something)
  'Response.Write sql
  'on error resume next 
  set OpenRecordset = objConnectionExecute(sql)
end function 

sub msgbox(t1, t2) 
  response.Write t1   
end sub 

 


 
' Proxy to the DLL Function 
Public Function getPreis(ByVal IdNr, ByVal ArtNr, ByVal Stk)
  if isnull(ArtNr) or  ArtNr & "" = "" then 
     getPreis = 0
     exit function 
  end if 
  
  if Request.QueryString("debug") = "true" then 
    Response.write "<br>" & Chr(13)
    Response.write "get Price for IdNr = [" & IdNr  & "]"
    Response.write "<br>" & Chr(13)
    Response.write "get Price for ArtNr = [" & ArtNr  & "]"
    Response.write "<br>" & Chr(13)
    Response.write "get Price for Stk = [" & Stk  & "]"    
  end if 
  
  if isnull(IdNr) or IdNr & "" = "" then IdNr = 0
  
  'on error resume next
  getPreis = IntraSellPreise().getPreis(IdNr, ArtNr, Stk )
  'exit function 
End Function



Public Function makeNettoPreis(ByVal ArtNr, ByVal Stk, ByVal IdNr)
   makeNettoPreis = IntraSellPreise().makeNettoPreis(ArtNr, Stk, IdNr)
end function 


Public Function makeBruttoPreis(ByVal Preis, ByVal MwstGroup, ByVal Land)

  if Request.QueryString("debug") = "true" then 
    Response.write "<br>" & Chr(13)
    Response.write "get Price for Preis = [" & Preis  & "]"
    Response.write "<br>" & Chr(13)
    Response.write "get Price for MwstGroup = [" & MwstGroup  & "]"
    Response.write "<br>" & Chr(13)
    Response.write "get Price for Land = [" & Land  & "]"    
  end if 
  dim returnPreis: returnPreis = IntraSellPreise().makeBruttoPreis(Preis, MwstGroup, Land)
 if isNumeric(replace(returnPreis,",",".")) then 
    makeBruttoPreis =  returnPreis
 else 
    Response.write "<br><font color=red>Fehler in der Preisberechung: makeBruttoPreis=" & + returnPreis & "</font>"
    makeBruttoPreis = 0
 end if

end function 

Function makeBruttoPreis2(ByVal ArtNr, ByVal Stk, ByVal Land)

  if Request.QueryString("debug") = "true" then 
    Response.write "<br>" & Chr(13)
    Response.write "get Price for ArtNR = [" & ArtNR  & "]"
    Response.write "<br>" & Chr(13)
    Response.write "get Price for Stk = [" & Stk  & "]"
    Response.write "<br>" & Chr(13)
    Response.write "get Price for Land = [" & Land  & "]"    
  end if 
  
  makeBruttoPreis2  =  IntraSellPreise().makeBruttoPreis2(ArtNR, Stk, Land)
end function 

Public Function calculateBruttoPreis(ByVal VKPreis, ByVal ArtNr, ByVal IDNR)
  if Request.QueryString("debug") = "true" then 
    Response.write "<br>" & Chr(13)
    Response.write "get calculateBruttoPreis for VKPreis = [" & VKPreis  & "]"
    Response.write "<br>" & Chr(13) & " ArtNr = [" & ArtNr  & "]"
    Response.write "<br>" & Chr(13) & " IDNR = [" & IDNR  & "]"    
  end if 
  
  calculateBruttoPreis  =  IntraSellPreise().calculateBruttoPreis(cdbl(VKPreis), cstr(ArtNr), cstr(IDNR))
end function 

Function getEKPreis(ByVal ArtNr)
  getEKPreis = IntraSellPreise().getEKPreis(ArtNr)
end function 

Public Function getBestLieferant(ByVal ArtNr)
  getBestLieferant = IntraSellPreise().getBestLieferant(ArtNr)
end function 

Public Function getLieferantLagerInfo(ByVal ArtNR)
  getLieferantLagerInfo = IntraSellPreise().getLieferantLagerInfo(ArtNR)
end function 

Public Function getVorgangTableForType(ByVal Typ)
  getVorgangTableForType = IntraSellPreise().getVorgangTableForType(Typ)
end function 

Public Function getVorgangArtikelTableForType(ByVal Typ)
  getVorgangArtikelTableForType = IntraSellPreise().getVorgangArtikelTableForType(Typ)
end function 

Public Function getDruckForType(ByVal Typ)
  getDruckForType = IntraSellPreise().getDruckForType(Typ)
end function 	

Public Function getClientLand(ByVal IdNr)
  getClientLand = IntraSellPreise().getClientLand(IdNr)
end function 	


%>

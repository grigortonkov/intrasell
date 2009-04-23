<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001-2009 (R)
' See www.griton.eu for last changes. 
'===========================================================================

Public Function IntraSellPreise()
  'get from cache 
  if IsNull( Session("IntraSell.IntraSellPreise"))  then
    Set IntraSellPreise = Session("IntraSell.IntraSellPreise")
    exit function
  end if
  
  Dim isP
  Set isP = Server.CreateObject("IntraSell.IntraSellPreise")
  isP.init(Session ("MyDSN"))
  Set Session("IntraSell.IntraSellPreise") = isP
  Set IntraSellPreise = isP
end function 

Public Function IntraSellVorgaengeAusdruck()
  'get from cache 
  if IsNull( Session("IntraSell.IntraSellVorgaengeAusdruck"))  then
    Set IntraSellVorgaengeAusdruck = Session("IntraSell.IntraSellVorgaengeAusdruck")
    exit function
  end if
  
  Dim isP
  Set isP = Server.CreateObject("IntraSell.IntraSellVorgaengeAusdruck")
  isP.init(Session ("MyDSN"))
  Set Session("IntraSell.IntraSellVorgaengeAusdruck") = isP
  Set IntraSellVorgaengeAusdruck = isP
end function 

%>
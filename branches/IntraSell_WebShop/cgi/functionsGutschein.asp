<%
Const NAME_FOR_GUTSCHEIN_PRODUCT = "CALCULATE_GUTSCHEIN"


function getArtNrForGutschein()
  dim sql, rs 
  sql  = "select artnr from grArtikel where bezeichnung like '" & NAME_FOR_GUTSCHEIN_PRODUCT & "'" 
  set rs = objConnectionExecute(sql)
  if not rs.eof then 
     getArtNrForGutschein = rs("Artnr")
  else 
     getArtNrForGutschein = ""     
  end if 
  rs.close 
  set rs = nothing 
end function 



function getPreisForGutschein(gutscheinNummer)
  dim sql, rs 
  sql  = "select Summe from buchGutschein where Nummer like '" & gutscheinNummer & "'" 
  set rs = objConnectionExecute(sql)
  if not rs.eof then 
     getPreisForGutschein = rs("Summe")
  else 
     getPreisForGutschein = 0     
  end if 
  rs.close 
  set rs = nothing 
end function 



function setGutscheinState(gutscheinNummer, newState)
  dim sql
  sql  = "update buchGutschein set status = '" & newState & "' where Nummer like '" & gutscheinNummer & "'" 
  objConnectionExecute(sql)
end function 


%>
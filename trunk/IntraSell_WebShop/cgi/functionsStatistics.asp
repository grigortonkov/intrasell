<%
public function replaceTagsForStatistics(byVal templateHTML, byVal idnr) 

     if inStr(templateHTML, "[COUNT_PRODUCTS_AKTIV]")>0   then  templateHTML = replace(templateHTML, "[COUNT_PRODUCTS_AKTIV]", getProductsCount(getLOGIN(),TRUE))
	 if inStr(templateHTML, "[COUNT_PRODUCTS_INAKTIV]")>0 then  templateHTML = replace(templateHTML, "[COUNT_PRODUCTS_INAKTIV]", getProductsCount(getLOGIN(),FALSE))

     if instr(templateHTML, "[COUNT_PRODUCTS_DETAIL_VIEW]") > 0 then templateHTML = replace(templateHTML, "[COUNT_PRODUCTS_DETAIL_VIEW]", stat1(idnr))
     if instr(templateHTML, "[COUNT_PRODUCTS_LIST_VIEW]") > 0 then  templateHTML = replace(templateHTML, "[COUNT_PRODUCTS_LIST_VIEW]", stat2(idnr))
     if instr(templateHTML, "[COUNT_PRODUCTS_CONTACT]") > 0 then templateHTML = replace(templateHTML, "[COUNT_PRODUCTS_CONTACT]", stat3(idnr))

     if instr(templateHTML, "[COUNT_PRODUCTS_ADDED_BOOKMARKS]") > 0 then templateHTML = replace(templateHTML, "[COUNT_PRODUCTS_ADDED_BOOKMARKS]", stat4(idnr))
     if instr(templateHTML, "[COUNT_PRODUCTS_SENDTOFRIEND]") > 0 then templateHTML = replace(templateHTML, "[COUNT_PRODUCTS_SENDTOFRIEND]", stat5(idnr))
     if instr(templateHTML, "[COUNT_PRODUCTS_CONTACTME]") > 0 then templateHTML = replace(templateHTML, "[COUNT_PRODUCTS_CONTACTME]", stat6(idnr))

     if instr(templateHTML, "[COUNT_USER_QUERIES]") > 0 then templateHTML = replace(templateHTML, "[COUNT_USER_QUERIES]", stat7(idnr))

    
   replaceTagsForStatistics = templateHTML
end function 


function stat1(idnr)
   stat1 =  getFirstField("select count(countClicks) from grArtikel a, webProductClicks c where a.ArtNr = c.ArtNr and a.herstellerNr=" & idnr)
end function 

function stat2(idnr)
   stat2 =  getFirstField("select count(countClicks) from grArtikel a, webProductLists c where a.ArtNr = c.ArtNr and a.herstellerNr=" & idnr)
end function 

function stat3(idnr)
   stat3 =  getFirstField("select count(*) from ofKorespondenz k where subjekt like 'Schnell%' and k.idnr=" & idnr)
end function 

function stat4(idnr)
 if Session("dbType") <> "MySQL" then 
   stat4 =  getFirstField("select count(*) from UserBookmarks ub, grArtikel a where ub.URL like '*ArtNR=' & a.ArtNr and a.herstellerNr=" & idnr)
 else
   stat4 =  getFirstField("select count(*) from UserBookmarks ub, grArtikel a where ub.URL like concat('*ArtNR=', a.ArtNr) and a.herstellerNr=" & idnr)
 end if
end function 

function stat5(idnr)
   stat5 =  getFirstField("select count(ToEmail) from webProductsSendToFriend sf, grArtikel a where sf.artNr=a.ArtNr and a.herstellerNr=" & idnr)
end function 

function stat6(idnr)
 stat6 =  getFirstField("select count(*) from ofKorespondenz k where subjekt like 'Objekt%' and k.idnr=" & idnr)
end function


function stat7(idnr)
 stat7 =  getFirstField("select count(*) from userQueries k where UserId=" & idnr)
end function

public function getProductsCount(idnr, active)
  getProductsCount = getFirstField("Select count(*) as co From grArtikel where HerstellerNr =" & idnr & " and ProduktAktiv=" & clng(cint(active)))  
end function 	


%>
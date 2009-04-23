<%

'===============================================================================
' creates form for product comparisment 
'===============================================================================
function compareProductsSelectForm(byval ArtNr1)
dim html
Const COUNT_CHARS_TO_COMPARE = 30
html = "<form action=""default.asp?pageToShow=compareTwoProducts"">"
html = html + "<input name=""artNr1"" type=""hidden"" value=""" & ArtNr1 & """>"
html = html + "<input name=""pageToShow"" type=""hidden"" value=""compareTwoProducts"">"
dim sql,rs
sql = "Select artNr, Bezeichnung from grArtikel where ArtNr <> " & ArtNr1 & _ 
      " AND produktAktiv<>0 and ArtKatNR in (Select  ArtKatNR from grArtikel where ArtNr = " & artNr1 & ") " & _ 
      " ORDER BY Bezeichnung"
set rs = objConnectionExecute(sql) 
 
html = html & "vergleichen mit <select name=""ArtNr2"">"
dim compareWithName
while not rs.EOF
   compareWithName  = rs("Bezeichnung")    
   
   if len(compareWithName) > COUNT_CHARS_TO_COMPARE then 
       compareWithName = left(compareWithName,COUNT_CHARS_TO_COMPARE) & " ..."
   end if 
       
   html = html & "<option value=""" & rs("ArtNr") & """>" & compareWithName
   rs.moveNExt 
 wend 
 
 html = html & "</select>"
 html = html & "<input type=""submit"" value=""go"">"
 html = html & "</form>"

compareProductsSelectForm = html
end function 

function compareTwoProducts(byval ArtNr1,byval ArtNr2)
   dim prodArray(1) 
   Response.Write ArtNr1 & "-" & ArtNr2
   prodArray(0) = ArtNr1
   prodArray(1) = ArtNr2
 
   Response.Write compareProducts(prodArray)
end function 

function compareManyProducts()
 'Response.Write request("artNrToCompare") & "<br>"
     dim arraySize : arraySize = ubound(split(request("artNrToCompare"),","))     
     dim prodArray() 
     redim prodArray(cint(arraySize))
     dim artNr  , i : i = 0
     for each ArtNr in split(request("artNrToCompare"),",") 
         prodArray(i) = artNr
         i = i +1 
     next 
     Response.Write compareProducts(prodArray)
end function 


'ArtNrArray -  array with product numbers 
function compareProducts(byval ArtNrArray)
 dim thProps : thProps = " width=""200"" bgcolor=""#C0C0C0"" "
 dim artKatNR , artNr, i
 dim allCompareFeaturesAreEmpty

 
 if ubound(ArtNrArray) < 1 then
    Response.Write "<p class=""error"">" & getTranslation("Sie muessen zwei oder mehrere Produkte auswaehlen um ein Vergleich machen zu koennen!") & "</p>"
    exit function 
 end if  
 artKatNr = tableValue("grArtikel","ArtNR",artNrArray(1),"ArtKatNR")  
 
 dim tableWidth:  tableWidth = 200 + 200*(ubound(ArtNrArray) +1)
 Response.Write "<table width=""" & tableWidth & """ border=0>"
 Response.Write "<tr>"
 Response.Write "<th " & thProps & ">Feature</th>"
 i = 0
  for each artNR in ArtNrArray
      i = i + 1
	  Response.Write "<th " & thProps & ">" & getTranslation("Produkt") & " "  & i & "</th>"
  next 
 Response.Write "</tr>"
 Response.Write "<tr><td " & thProps & ">" & getTranslation("Bezeichnung") & "</td>"
 for each artNR in ArtNrArray
		Response.Write "<td><a href=""default.asp?artNr=" & artNR & """>" & tableValue("grArtikel","ArtNR",artNR,"Bezeichnung")& "</a></td>"
 next 
 response.write "</tr>"


 Response.Write "<tr><td " & thProps & ">" & getTranslation("Hersteller") & "</td>"
 for each artNR in ArtNrArray
	Response.Write "<td>" & tableValue("lieferantenAdressen","idnr",tableValue("grArtikel","ArtNR",artnr,"herstellerNr"),"Firma")& "</td>"
 next 
 Response.Write "</tr>"
  
 
 Response.Write "<tr><td " & thProps & ">" & getTranslation("Lagerinfo") & "</td>"
 for each artNR in ArtNrArray
	'Response.Write "<td>" & tableValue("grArtikel","ArtNR",artnr,"Bezeichnung1")& "</td>"
	Response.Write "<td>" & getLieferantLagerInfo(ArtNr) & "</td>"
 next 
 Response.Write "</tr>"


 Response.Write "<tr><td " & thProps & ">" & getTranslation("Preis") & "</td>"
 dim preis
 dim mwst
  for each artNR in ArtNrArray
        mwst = tableValue("grArtikel","ArtNR",artNR,"MWST")
		preis = makeBruttoPreis(getPreis(getLOGIN(), ArtNr, 1), mwst, session("Land"))
		Response.Write "<td align=left><b>" & formatnumber(preis ,2) & "</b></td>"
 next 
 response.write " </tr>"
 

'compare the keywords 
Dim sql, rs
sql = "SELECT KeywordID, Name " & _ 
" FROM [grArtikel-KeyWords] " & _ 
" WHERE " & makeArtKatNrInPartParentCats("ArtKatNr", ArtKatNr, 5)
'" WHERE ArtKatNr=" & ArtKatNR  '& _ 
'" ORDER BY [grArtikel-KeyWords].[Order]"


'response.write sql
set rs = objConnectionExecute(sql)
 dim keywordId, kwCurrent
 dim kwHTML : kwHTML = ""
 
 while not rs.EOF
    keywordId = rs("keywordId")  
     allCompareFeaturesAreEmpty = true 
     
		kwHTML =  "<tr>"
				kwHTML = kwHTML &  "<td " & thProps & ">" & Server.HTMLEncode(rs("Name")&"") & "</td>"
				for each artNR in ArtNrArray
						kwHTML = kwHTML & "<td>"
						kwCurrent = getKeyWord(keywordId, artNR)
						kwHTML = kwHTML & kwCurrent
						kwHTML = kwHTML &  "</td>"
						
						if len(kwCurrent)>1 then  allCompareFeaturesAreEmpty = false ' somthing to show 
				next 
				
		kwHTML = kwHTML &  "</tr>" 
		
		if not allCompareFeaturesAreEmpty then 
		    response.write kwHTML
		end if 
		    
		rs.moveNExt 
 wend 
 
'IMAGE 
 Response.Write "<tr><td " & thProps & ">" & getTranslation("Bild") & "</td>"
 for each artNR in ArtNrArray
	Response.Write "<td>" & makeimgTag(tableValue("grArtikel","ArtNR",artNR,"picture"),tableValue("grArtikel","ArtNR",artNR,"Bezeichnung"),200) & "</td>"
 next 
  response.write "</tr>"

'BESCHREIBOUNG
 Response.Write "<tr><td " & thProps & ">" & getTranslation("Beschreibung") & "</td>"
 for each artNR in ArtNrArray
	Response.Write "<td>" & tableValue("grArtikel","ArtNR",artNR,"Beschreibung")& "</td>"
 next 
 response.write "</tr>"
 Response.Write "</table>" 
end function   

'help function for compareProducts function 
function getKeyWord(keywordId, ArtNr)
    dim sql, rs 
    sql = "select * from [grArtikel-KeywordsToProducts] where ArtNr=" & ArtNr & "  AND  KeywordId = " & keywordId
    set rs = objConnectionExecute(sql)
    if not rs.EOF then
        getKeyword = rs("Value")
    else 
         getKeyword = ""     
    end if
    rs.close  
end function 
%>
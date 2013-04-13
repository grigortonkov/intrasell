<%

'===============================================================================
' creates form for product print
' NOT IN USE 
'===============================================================================
function printProductsSelectForm(byval ArtNr1)
dim html
Const COUNT_CHARS_TO_COMPARE = 30
html = "<form action=""default.asp?pageToShow=compareTwoProducts"">"
html = html + "<input name=""artNr1"" type=""hidden"" value=""" & ArtNr1 & """>"
html = html + "<input name=""pageToShow"" type=""hidden"" value=""compareTwoProducts"">"
dim sql,rs
sql = "Select artNr, Bezeichnung from grArtikel where ArtNr <> " & ArtNr1 & _ 
      " AND ArtKatNR in (Select  ArtKatNR from grArtikel where ArtNr = " & artNr1 & ") ORDER BY Bezeichnung"
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

printProductsSelectForm = html
end function 

 
'===============================================================================
' print an array of ArtNrToCompare Parameters
'===============================================================================
function printManyProducts()
 'Response.Write request("artNrToCompare") & "<br>"
     dim arraySize : arraySize = ubound(split(request("artNrToCompare"),","))     
     dim prodArray() 
     redim prodArray(cint(arraySize))
     dim artNr  , i : i = 0
     for each ArtNr in split(request("artNrToCompare"),",") 
         prodArray(i) = artNr
         i = i +1 
         Response.Write makeProductPage(ArtNr, "_print")
     next 
     
     if i = 0 then 
         call drawErrorBox("Keine Auswahl!",getTranslation("Bitte Produkte von der Liste waehlen!"),"","")
     end if 
end function 


%>
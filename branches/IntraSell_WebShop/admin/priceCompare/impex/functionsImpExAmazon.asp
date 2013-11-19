<%


'=======================================================================================
' AMAZON IMPORT
'=======================================================================================
function transformAmazon(byval lieferantNr, byref localFile, byref localFileTransformed) 
 Response.Write "<br>Import File for Amazon..." & localFile
  Const SMARTEFOX_AMAZON_REFID="ed_er_dp_1_1/302-3219939-985762"
  

 ' reorder CSV file to internal structure 
   Dim objFile, objStream, objFileOut, objStreamOut
 		set objFile = Server.CreateObject( "Scripting.FileSystemObject")
 		'Response.Write "localFile=" & localFile 
		set objStream = objFile.OpenTextFile( localFile )
		set objFileOut = Server.CreateObject( "Scripting.FileSystemObject")
		deleteFile(localFileTransformed)
		set objStreamOut = objFile.CreateTextFile( localFileTransformed )
		
		objStream.ReadLine ' Only if first line is with field titles !
		dim outputline , strLine
		Dim countlines: countlines=0
		
		'On error resume next 
		while not objStream.AtEndOfStream ' until end of file 		
		call handleErrors()
		   countlines = countlines +1 
		   if (countlines mod 10) = 0 then Response.Write "C":Response.Flush
		   if (countlines mod 100) = 0 then Response.Write countlines & " lines converted! ":Response.Flush
		    
			status = "OK"
			strLine = replace(objStream.ReadLine,"'","") 
			csValues = Split( strLine, ";" )
			
			'The definition of amazon.csv:
			'0 title	
			'1 publisher	
			'2 kind	
			'3 versandfertig	
			'4 authors	
			'5 price	
			'6 category	
			'7 Number of pages	
			'8 Erscheinungsdatum	
			'9 ISBN	Amazon.de 
			'10 Verkaufsrang	
			'11 Durchschnittliche Kundenbewertung	
			'12 Anzahl der Kundenbewertungen

			'this is the structure of the universal CSV format for PriceCompare system 
			 Dim nr, name, description, manufacturer, taxclass, price, weight, minorder
			 Dim manufacturernr , variation, mult, avail, units, difftxt, picture, category
			 
			 if ubound(csValues) < 12+3 then
			   Response.Write  "<br>Not correct Amazon line! Size is " & ubound(csValues) & " must be >15"
			   else 
			 
				 nr = csValues(9+3)
				 category= csValues(0) 'getIntraSellArtKAtNRForForeignCategory(lieferantNr, csValues(1),"")
				 name= left(csValues(0+3),255)
				 'description= "Redaktionen="& "<a href=""http://www.amazon.de/exec/obidos/tg/stores/detail/-/books/"& csValues(9+3) &"/reviews/ref=" & SMARTEFOX_AMAZON_REFID & """>Amazon.de-Redaktion</a>" & _ 
				 description= "<br><a href=""http://images-eu.amazon.com/images/P/" & csValues(9+3) & ".03.LZZZZZZZ.jpg"">Grössere Abbildung</a>"
				 dim manufacturerNAmeFromAmazon:  manufacturerNAmeFromAmazon= csValues(1+3)
				 if manufacturerNAmeFromAmazon = "" then manufacturerNAmeFromAmazon = "unbekannt"
				 manufacturer=manufacturerNAmeFromAmazon ' getIntraSellManufacturerNr(manufacturerNAmeFromAmazon)
				 
				 taxclass= "0" ' MWST is included
				 price= replace(csValues(5+3),",",".")
				 weight= replace("1",",",".")
				 minorder= "1" 'csValues(8+3)
				 manufacturernr= csValues(9+3)
				 variation= "" 'csValues(10+3)
				 mult= csValues(9+3) 'Mac or not 
				 avail= csValues(3+3)
				 units= "" 'csValues(13+3)
				 difftxt="" 'csValues(14+3)
				 
				 picture= "http://images-eu.amazon.com/images/P/"& csValues(9+3)  &".03.LZZZZZZZ.jpg" 
				 	 
				 dim i
				 dim techInfo:techInfo=""
				 techInfo="ISBN="& csValues(9+3) &",Autor="& csValues(4+3) &",Typ="& csValues(2+3) & _ 
				          ",Erscheinungsdatum="& csValues(8+3) &",Setenanzahl="& csValues(7+3) &",Verkaufsrang="& csValues(10+3) & _ 
				          ",Kundenbewertung="& csValues(11+3) &",Kundenbewertungen="& csValues(12+3) '& _ 
				          '",Redaktionen="& "<a href=/exec/obidos/tg/stores/detail/-/books/"& csValues(9+3) &"/reviews/ref=" & SMARTEFOX_AMAZON_REFID & ">Amazon.de-Redaktion</a>"


				outputline = nr & ";" & category & ";" & name & ";" &  description & ";" & _ 
				             manufacturer & ";" &  taxclass & ";" &  price & ";" & 	 weight & ";" &  minorder & ";" &  _
				             manufacturernr & ";" &  variation & ";" & mult  & ";" & avail  & ";" & units  & ";" & difftxt  & ";" & picture & ";" & techInfo
				objStreamOut.writeLine  outputline
			   end if 'no correctg line 
			Response.Flush
		wend 
	Response.Write "<br>Total " & countlines & " lines converted!"			 
 objStream.close 
 objStreamOut.close 
end function 


%>
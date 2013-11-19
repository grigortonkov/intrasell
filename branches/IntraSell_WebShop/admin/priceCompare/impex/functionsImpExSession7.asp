<%


'=======================================================================================
' CCom IMPORT
'=======================================================================================
function transform5(byval lieferantNr, byref localFile, byref localFileTransformed) 
 Response.Write "<br>Import File for C.Com ..." & localFile


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
			'0 cat	
			'1 HerstellerNr	
			'2 Hersteller
			'3 Bezeichnung	
			'4 price	
			
			'this is the structure of the universal CSV format for PriceCompare system 
			 Dim nr, name, description, manufacturer, taxclass, price, weight, minorder
			 Dim manufacturernr , variation, mult, avail, units, difftxt, picture, category, techInfo
			 
			 if ubound(csValues) < 4 then
			   Response.Write  "<br>Not correct line! Size is " & ubound(csValues) & " must be >5"
			   else 
			 
				 category = csValues(0)
				 nr = left(csValues(3),50)
				 name = csValues(3)
				 description = ""
				 manufacturer= csValues(2)
				 taxclass= "0" ' MWST is included
				 price=csValues(4)
				 weight= "1"
				 minorder= "1" 
				 manufacturernr=  csValues(1)
				 variation= "" 
				 mult= "" 
				 avail= "nach Anfrage"
				 units= "" 
				 difftxt= "" 				 
				 picture= ""  				 	 
				 techInfo="" 

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
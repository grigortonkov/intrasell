<%


'=======================================================================================
' DISKONT COMPUTER IMPORT
'=======================================================================================
function transformDiscountComputer(byval lieferantNr, byref localFile, byref localFileTransformed) 
 Const DISKONTCOMUTER_FILENAME = "c:\smart_ef.csv"
 Response.Write "<br>Import File for Diskont Computer..." & localFile
 dim zipped: zipped = replace("m1"&right(localFile,9),".csv",".zip")
 call deleteFile(zipped) 'delete old zipped file 
 call moveFile(localFile, zipped) '
 call unzipFile(zipped)
 call deleteFile(zipped)
 'Response.End
 
 localFile = DISKONTCOMUTER_FILENAME
 
 ' first unzip file 
 ' then reorder CSV file to internal structure 
   Dim objFile, objStream, objFileOut, objStreamOut
 		set objFile = Server.CreateObject( "Scripting.FileSystemObject")
 		Response.Write "<br>localFile=" & localFile 
		set objStream = objFile.OpenTextFile( localFile )
		set objFileOut = Server.CreateObject( "Scripting.FileSystemObject")
		deleteFile(localFileTransformed)
		set objStreamOut = objFile.CreateTextFile( localFileTransformed )
		
		objStream.ReadLine ' Only if first line is with field titles !
		dim outputline 
		Dim countlines: countlines=0
		while not objStream.AtEndOfStream ' until end of file 
		   countlines = countlines +1 
		   if (countlines mod 10) = 0 then Response.Write "C":Response.Flush
		   if (countlines mod 100) = 0 then Response.Write countlines & " lines converted! ":Response.Flush
		    
			status = "OK"
			strLine = replace(objStream.ReadLine,"'","") 
			csValues = Split( strLine, ";" )
			
			'The definition of smart_efox.csv:
			'DiskontComuter CSV Format 
			'column 1: our item id
			'column 2: our category id  (details see later)
			'column 3: our price (at the moment incl. tax and copyright fee’s)
			'column 4: availability  (1 … on stock; 2 … available; 3 … expected; 4 … in the pipe; 9 … not available) – we used for availability 1 and 2 the color ‘green’, for all other values the color ‘red’
			'column 5: short description of the product – line 1
			'column 6: short description of the product – line 2
			'column 7: manufacturer
			'column 8: manufacturer item id
			'column 9: weight in kg
			'column 10: mac – flag (y … adapted for mac; n … not adapted for mac)
			'column 11: if our distributor is c2000, it is the distributor’s item id. If not, the column is empty. You will need to get the pictures.
			'column 12 - ??: product properties. Even column-numbers (12, 14) are the titles, odd numbers (13,15) are the values.


			'this is the structure of the universal CSV format for PriceCompare system 
			 Dim nr, name, description, manufacturer, taxclass, price, weight, minorder
			 Dim manufacturernr , variation, mult, avail, units, difftxt, picture, category
			 
				 nr = csValues(0)
				 category= getIntraSellArtKAtNRForForeignCategory(lieferantNr, csValues(1),"unknown")
				 name= left(csValues(4)+csValues(5),255)
				 description= csValues(4)+csValues(5)
				 manufacturer= getIntraSellManufacturerNr(csValues(6))
				 taxclass= "0" ' MWST is included
				 price= replace(csValues(2),",",".")
				 weight= replace(csValues(8),",",".")
				 minorder= "1" 'csValues(8)
				 manufacturernr= csValues(7)
				 variation= "" 'csValues(10)
				 mult= csValues(9) 'Mac or not 
				 avail= "not available"
				  if csValues(3)=1 then avail="lagernd"
				  if csValues(3)=2 then avail="verfügbar"
				  if csValues(3)=3 then avail="bestellt"
				  if csValues(3)=4 then avail="erwartet"
				 units= "" 'csValues(13)
				 difftxt="" 'csValues(14)
				 
				 if trim(csValues(10)) <> "" then 
					picture= "http://213.183.5.208/datasheet/images/" & csValues(10) & ".jpg"
				 else 
					picture =""
				 end if 
				 
				 dim i
				 dim techInfo:techInfo=""
				 for i = 11 to ubound(csValues) step 2
				    if (i+1)<= ubound(csValues)  then 'value is defined too 
				     techInfo = techInfo & "," & csValues(i)  & "=" & csValues(i+1)   
				    end if  
				 next 
				 
				
				 
			outputline = nr & ";" & category & ";" & name & ";" &  description & ";" & _ 
			             manufacturer & ";" &  taxclass & ";" &  price & ";" & 	 weight & ";" &  minorder & ";" &  _
			             manufacturernr & ";" &  variation & ";" & mult  & ";" & avail  & ";" & units  & ";" & difftxt  & ";" & picture & ";" & techInfo
			objStreamOut.writeLine  outputline
			
			Response.Flush
		wend 
	Response.Write "<br>Total " & countlines & " lines converted!"			 
 objStream.close 
 objStreamOut.close 
 
end function 



%>
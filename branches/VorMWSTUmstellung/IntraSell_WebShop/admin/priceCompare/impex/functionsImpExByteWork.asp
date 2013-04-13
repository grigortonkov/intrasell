<%
function getURLToFile(url, filename)
    dim aspHttp: set aspHttp = Server.CreateObject("Tonkov.ASPHttp")
    dim result: result = aspHttp.getURL(url)
    set aspHttp = nothing 
    
    set objFileOut = Server.CreateObject( "Scripting.FileSystemObject")
    deleteFile(filename)
	set objStreamOut = objFileOut.CreateTextFile( filename )
	objStreamOut.write result 
	objStreamOut.close 
		
		getURLToFile = true 
end function 

'=======================================================================================
' ByteWorks IMPORT
'=======================================================================================
function transformByteWork(byval lieferantNr, byref localFile, byref localFileTransformed) 
 Response.Write "<br>Import File for bytework.at ..." & localFile
 
        call getURLToFile("http://www2.bytework.at/preisliste.txt","d:\wwwroot\prices\bytework\preisliste.txt")

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
		dim countlines: countlines=0
		
		'On error resume next 
		while not objStream.AtEndOfStream ' until end of file 		
		call handleErrors()
		   countlines = countlines +1 
		   if (countlines mod 10) = 0 then Response.Write "C":Response.Flush
		   if (countlines mod 100) = 0 then Response.Write countlines & " lines converted! ":Response.Flush
		    
			status = "OK"
			strLine = replace(objStream.ReadLine,"'","") 
			csValues = Split( strLine, ";" )
			'Response.Write "<br>line=" & strLine
			'The definition of preisliste.csv:
			'0 cat	bis :
			'0 Bezeichnung	
			'1 PreisATS
			'2 Price Euro	
			'3 Lager	
			
			'this is the structure of the universal CSV format for PriceCompare system 
			 Dim nr, name, description, manufacturer, taxclass, price, weight, minorder
			 Dim manufacturernr , variation, mult, avail, units, difftxt, picture, category, techInfo
			     if ubound(csValues) < 3 then
				     Response.Write  "<br>Not correct line! Size is " & ubound(csValues) & " must be >3"
			     else 
			     'Response.Write "<br>csValues(0))=" & csValues(0)
			     if ubound(split(csValues(0),":"))>=1 then 
			     
				 category = split(csValues(0),":")(0)
				 nr = split(csValues(0),":")(1)
				 name = split(csValues(0),":")(1)
				 description = ""
				 manufacturer= "no name"
				 taxclass= "0" ' MWST is included
				 price=csValues(2)
				 weight= "1"
				 minorder= "1" 
				 manufacturernr=  ""
				 variation= "" 
				 mult= "" 
				 avail= csValues(3)
				 units= "" 
				 difftxt= "" 				 
				 picture= ""  				 	 
				 techInfo="" 

				outputline = nr & ";" & category & ";" & name & ";" &  description & ";" & _ 
				             manufacturer & ";" &  taxclass & ";" &  price & ";" & 	 weight & ";" &  minorder & ";" &  _
				             manufacturernr & ";" &  variation & ";" & mult  & ";" & avail  & ";" & units  & ";" & difftxt  & ";" & picture & ";" & techInfo
				objStreamOut.writeLine  outputline
				end if 'ubound
			   end if 'no correctg line 
			Response.Flush
		wend 
	Response.Write "<br>Total " & countlines & " lines converted!"			 
 objStream.close 
 objStreamOut.close 
end function 


%>
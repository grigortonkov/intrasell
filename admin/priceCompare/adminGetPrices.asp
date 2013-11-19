<!--#include file="../client/intrasoft/menu.asp"-->
<!--#include file="impex/functionsImpex.asp"-->
<%

'restart application unload 


 Dim dirObj 
  'Start the second Web server. 
  'Set dirObj = GetObject("IIS://grigor/W3SVC/1/ROOT/priceCompare" )
  'dirObj.AppUnload 
  'Application.Contents.RemoveAll()

dim resumeOnErrors: resumeOnErrors = (ucase(request("resumeOnErrors"))="ON")
dim debug: debug = (ucase(request("debug"))="ON")


Dim butArr(2,2)
Dim startTime,timeElapsed: startTime =now()
butArr(1,1) = "offene_Preise"
butArr(1,2) = "adminImportPrices.asp"
butArr(2,1) = "importierte_Preise"
butArr(2,2) = "adminImportedPrices.asp"

Dim counterErrors
Dim counterUdatedPrices: counterUdatedPrices = 0 
Dim counterNewProducts : counterNewProducts = 0 

Dim status : status ="OK"
Dim sql
Dim rs
Dim merch: merch = Request("merch")
Dim localFile, localFileTransformed
Dim objFile
Dim objStream
Dim csValues
Dim rsArt
Dim rsImp
Dim butArrMenu(2,2)
Const PARSE_ERROR = "parse error"
const FTP_TRANSFER_TYPE_ASCII = 1
const FTP_TRANSFER_TYPE_BINARY = 2
Dim dateTime 	
Dim categoriesUpdated: categoriesUpdated=""' keeps all updated categories in this import' the old prices will be deleted afterwards 
dim internalNumbersImported: internalNumbersImported="" ' keeps all imported products in this import 
if merch <> "" then
	sql = "SELECT  lieferantenAdressen.Firma  FROM lieferantenAdressen WHERE IDNR = " & merch
	set rs = ObjConnectionExecute(sql)
	dim merchname: merchname = rs("Firma")


	sql = " SELECT priceCompareHaendler.* FROM priceCompareHaendler WHERE " & _
		  " priceCompareHaendler.lieferantNr = " & merch
	Set rs = ObjConnectionExecute(sql)
	if rs.EOF and rs.BOF then Response.Write " No such merchant ! "


     Response.Write "<br> Delete old open prices ...<br>": Response.Flush
     ObjConnectionExecute("DELETE FROM priceComparePricesToImport WHERE LieferantNr="& rs("lieferantNr"))
        
        
	'the ftp price getting will be saved in this file 
	dateTime = replace(now(),".","") : dateTime = replace(dateTime,":","") : dateTime = replace(dateTime," ","") 
	localFile = "c:\merchant_" & rs("lieferantNr") & "_" & dateTime & ".csv"
	localFileTransformed = "c:\merchant_" & rs("lieferantNr") & "_transformed_" & dateTime & ".csv"
	'TODO : delete local file before FTP download 
	if fileExists(localFile) then deleteFile(localFile)
	if fileExists(localFileTransformed) then  deleteFile(localFileTransformed)
	
	'localFile = "c:\example_file_for_import.csv"
	Dim ftpConn: Set FtpConn = Server.CreateObject("AspInet.FTP")
	Dim ftpDownloadresult : ftpDownloadresult = false 
	Response.Write "<br> Going to take file " & rs("filename") & " from ftp to " & localFile & "... please wait!<br>"
	Response.Flush
	
	ftpDownloadresult = FtpConn.FTPGetFile(rs("ftpserver"), rs("ftpusername"), rs("ftppassword"), _
	    rs("filename"), localFile , true , FTP_TRANSFER_TYPE_BINARY)
	response.write "ftpDownloadresult=" & ftpDownloadresult   
	'here the merchants file must be transformed to the priceCompare CSV format for import     
	    

	if ftpDownloadresult then 'the file was imported successfully over FTP
		call transformMerchantFileToInternalCSVFile(rs("lieferantNr"), localFile, localFileTransformed)    
	    'Response.End            'delete old open prices 
        'response.end
		set objFile = Server.CreateObject( "Scripting.FileSystemObject")
		set objStream = objFile.OpenTextFile( localFileTransformed )
		objStream.ReadLine ' Only if first line is with field titles !
		Dim countlines: countlines=0
		Response.Write "<br>Start importing of file " & localFileTransformed & "<br>"
	
		Dim strLine
		Dim HAS_RIGHT_TO_CREATE_PRODUCTS
		HAS_RIGHT_TO_CREATE_PRODUCTS = varValueMerchant(merch,"HAS_RIGHT_TO_CREATE_PRODUCTS") = "TRUE" 
		rem ON ERROR RESUME NEXT 	
		while not objStream.AtEndOfStream ' until end of file 
		    countlines = countlines + 1
		    if (countlines mod 10) = 0 then Response.Write "P":Response.Flush
			if (countlines mod 100) = 0 then Response.Write countlines & " lines processed! ":Response.Flush
		
			status = "OK"
			strLine = objStream.ReadLine
			strLine = replace(strLine,"'","") :strLine = replace(strLine,"""","") 'clean
			csValues = Split( strLine, ";" )
			
			'this is the structure of the universal CSV format for PriceCompare system 
			 Dim nr, name, description, manufacturer, taxclass, price, weight, minorder
			 Dim manufacturernr , variation, mult, avail, units, difftxt, picture, category, techinfo, EAN
				 nr = left(csValues(0),50) 'is the merchant own number not internal !!!!!!!!!!
				 category= csValues(1)'our cat id 'can be number (price compare internam number or external name) 
				 name= left(csValues(2),255)
				 description= csValues(3)
				 manufacturer= csValues(4) 'can be number (price compare internam number or external name) 
				 taxclass= replace(csValues(5),",",".") 
				 price= replace(csValues(6),",",".")
				 weight= replace(csValues(7),",",".")
				 minorder= csValues(8)
				 manufacturernr= csValues(9): if len(manufacturernr)<3 then manufacturernr=""
				 variation= csValues(10)
				 mult= csValues(11)
				 avail= left(csValues(12),50)
				 units= csValues(13)
				 difftxt= csValues(14)
				 picture= csValues(15)  
				 if ubound(csValues)>15 then 
				 techinfo= csValues(16) 'optional attribute
				 else
				 techinfo= ""
				 end if
			 
			  Dim rtErrorDescription
			  Session("LAST_ERROR") = ""
			     if  importPriceLine("", nr, name, description, manufacturer, taxclass, price, _
			                          weight, minorder, manufacturernr , variation, mult, _ 
			                          avail, units, difftxt, picture, category, techinfo, merch, HAS_RIGHT_TO_CREATE_PRODUCTS, rtErrorDescription) then 
			             Response.Write " OK"              
			     else 
			             Response.Write " ERROR"    
			             Dim errDesc : errDesc = left(rtErrorDescription & Session("LAST_ERROR"),255)
			             errDesc = replace(errDesc,"'","")
			             errDesc = replace(errDesc,"""","")
			             
			             SQL = " INSERT INTO priceComparePricesToImport (State, Line, LieferantNr,Error ) " & _ 
				               " Values('" & PARSE_ERROR & "' , '" & strLine & "'," & merch & ",'" & errDesc & "')"	
						'Response.Write SQL 
						ObjConnectionExecute(SQL) 
						counterErrors = counterErrors+1		
			     'error add to open prices
			     end if                     
			
				Response.Flush		
				 

				 
		wend
		objStream.close 
		Response.Write "<br>Total " & countlines & " lines processed!"		
		'objFile.DeleteFile (localFile) 
		
				'delete old unused prices 
				Response.Write "<br>CategoriesUpdated=" & categoriesUpdated 
				sql = "DELETE FROM [lieferantenArtikel-preise] " & _ 
				       " where ArtikelNr in (select ArtNr from grArtikel where ArtKatNr in (-100" & categoriesUpdated &  "))" &  _ 
				      " AND lieferantNr= " & merch  & " AND (preisDatum+1)<" & TOSQLDATE(date()) 
				Response.Write sql
				ObjConnectionExecute(SQL)
				'end delete 
               call UpdateMinPrice()
	 
				
		set rsImp = nothing
		'print statistics 
		Response.Write "<h4><b><FONT color='green'>Successfuly downloaded and imported Prices for lieferant: " & merchname & " ! </FONT></b></h3><BR>"
		Response.Write "<table border='1' width='50%'><tr><td colspan='2' align='center'><b>Import result:</b></td></tr>"
		Response.Write "<tr><td><b>New products:</b></td><td>" & counterNewProducts & "</td></tr>"
		Response.Write "<tr><td><b>Updated prices:</b></td><td>" & counterUdatedPrices & "</td></tr>"
		Response.Write "<tr><td><b>Parsing errors products:</b></td><td>" & counterErrors & "</td></tr>"
		Response.Write "<tr><td><b>TOTAL imported products:</b></td><td>" & counterErrors + counterUdatedPrices + counterNewProducts & "</td></tr></table>"
		timeElapsed = (now()-starttime)*24*60*60
		Response.Write "<b>Time elapsed:</b>" & cint(timeElapsed) 

        call setVarValueMerchant(merch,"LAST_SUCCESSFULL_IMPORT", Date())
	else 'ERROR SITUATION
		Response.Write "<BR><h4><b><FONT color='red'>FTP download Failed for <i>" & merchname & " </i>!<BR>"
		Response.Write "ASPInet Component error was: " & FtpConn.Lasterror & "</FONT></b></h4>"
	end if

end if %>

<%
call drawWindowPart1("Get Prices","","state",butArr)
%>
<table width="100%" border="1" cellspacing="0" cellpadding="2" align="center">
<tr><b><td align="center" valign="center" colspan="10"><h3>Haendlers</h3></td></tr>
<tr align="center"  valign="center" bgcolor=#d0d0d><td width="20%">Firma</td><td>FTP Server</td><td>FTP User Name</td><td>FTP Password</td>
<td>FTP filename (+path)</td>
<td>Last uccessfull Import</td>
<td>Open Prices</td>
<td>Imported Prices</td>
<td colspan="2">&nbsp;&nbsp;</td></b></tr><%
sql = " SELECT  lieferantenAdressen.Firma, priceCompareHaendler.*  FROM lieferantenAdressen " & _
      " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
set rs = ObjConnectionExecute(sql)
while not rs.EOF
	Response.Write "<tr align=""center""><td>" & rs("Firma") & "</td><td>" & rs("ftpserver") & "</td><td>" 
	Response.Write rs("ftpusername") & "</td><td>" & rs("ftppassword") & "</td><td>" & rs("filename") & "</td>" & _ 
 	               "<td>" & varValueMerchant(rs("LieferantNr"),"LAST_SUCCESSFULL_IMPORT") & "</td>"
 	Response.Write"<td>" & getFirstField("select count(*) from priceComparePricesToImport where lieferantNr=" & rs("LieferantNr") ) & "</td>"  	               
 	Response.Write"<td>" & getFirstField("select count(*) from [lieferantenArtikel-Preise] where lieferantNr=" & rs("LieferantNr") ) & "</td>" 
               
 	Response.Write "<td>" 
	call DrawButton( "GetButton", "Get Prices", "adminGetPrices.asp?merch=" & rs("LieferantNr"), "white" )
	Response.Write "</td><td>"
	call DrawButton( "ConfigButton", "Config", "adminMerchantsFtp.asp", "white" )
	Response.Write "</td></tr>"
	rs.MoveNext
wend
Response.Write "</table>"
rs.close
set rs = nothing
call drawWindowPart2("Get Prices","","state",butArr)




%>




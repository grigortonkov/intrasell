<!--#include file="functionsImpexDiskontComputer.asp"-->
<!--#include file="functionsImpexAmazon.asp"-->
<!--#include file="functionsImpexSession7.asp"-->
<!--#include file="functionsImpexCCom.asp"-->
<!--#include file="functionsImpexByteWork.asp"-->


<%
const SECONDS_TO_WAIT_ZIPS = 10

'*****************************************************************
' unzips a file 
'*****************************************************************
function unzipFile(zipName)
 Response.Write "<br>unzipping "   & zipName
 Dim aspZip: set aspZip = server.CreateObject("Tonkov.AspZip") 
 Dim result 
 Response.Write "<br>Unzipping " & zipName  
 'UNZIP Like 
  result = aspZip.unzip( zipName  + " C:\")
 
'DONE: make some wait for SECONDS_TO_WAIT_ZIPS seconds until the zip file is ready 
   Response.Write "<br>waiting " & SECONDS_TO_WAIT_ZIPS & " seconds..."   
   call Wait(SECONDS_TO_WAIT_ZIPS) 
   Response.Write "<br>Result was:" & result  
end function 


'*****************************************************************
' adds the technical information to the product if not yet available 
' the information is collected from different merchants 
' TechInfo is like RAM=128,MHZ=145
'*****************************************************************
function addTechInfo(ArtNr, ArtKatNR, TechInfo)
dim sql, rs 
Dim pair
dim keywordid, keywordValue, kwNAme
for each pair in split(TechInfo,",") 
  if inStr(pair,"=") <1 then 
   'not pair 
  else 'OK
	kwName = left(pair,inStr(pair,"=")-1)
	keywordValue  = left(mid(pair,inStr(pair,"=")+1),50)
	keywordValue = left(keywordValue,255)
	
	
	if kwName<>"" and keywordValue<> "" then 'both must be defined 
		sql = "select * from priceCompareKeyWords where ArtKatNR= " & ArtKatNR & " AND [Name] Like '" & kwName & "'" 
		set rs = ObjConnection.execute(sql) 

		
		if rs.EOF then 'create keyword
		     keywordid =nextId("priceCompareKeyWords","keywordid")
		     sql = "insert into priceCompareKeyWords  (keywordid, ArtKatNR, [Name]) Values ("& keywordid &"," & ArtKatNR & ", '" & kwName & "')"
		     'Response.Write sql
		     ObjConnection.execute(sql)    
		else 
			keywordid = rs("keywordid")
		end if 

		sql = " select * from priceCompareKeyWordsToProducts where keywordid= " & keywordid & " AND ArtNr Like " & ArtNr & _
		      " AND [Value] Like '"& keywordValue & "'" 
		set rs = ObjConnection.execute(sql) 
		
		if rs.EOF then 'create keyword
		     sql = "insert into priceCompareKeyWordsToProducts  (id, keywordid, ArtNr, [Value]) " & _ 
		     " Values ("& nextId("priceCompareKeyWordsToProducts","id")  &","& keywordid &"," & ArtNR & ", '" & keywordValue & "')"
		     'Response.Write sql
		     ObjConnection.execute(sql)    
		end if 
	
	end if ' kw Name and  value are defined 	
	end if ' it is pair
next 
end function 

'**********************************************************************
' UpdatePreises
' updates the selling prices with the Aufschlag from the article category
'**********************************************************************
function UpdatePreises(artNR)
dim sql 
Dim catNr: catNR = TABLEVALUE("grArtikel", "ArtNR", artNR, "ArtKatNR")
Dim aufschlag: aufschlag = TABLEVALUE("[grArtikel-Kategorien]","ArtKatNr", catNR, "Aufschlag")
sql  = " UPDATE [grArtikel] SET " & _ 
	   " grArtikel.PreisATS = [EKPreis]*" & replace(Aufschlag,",",".")  & _       
  	   " WHERE ArtNR = " & artNR 
  	
  	'Response.Write "<BR>sql=" & sql
  	ObjConnection.execute(sql)
  	
sql = " UPDATE [grArtikel] SET " & _ 
	   " grArtikel.PreisEuro = grArtikel.PreisATS " & _ 
	   " WHERE ArtNR = " & artNR
  	  
   'Response.Write "<BR>sql=" & sql
   ObjConnection.execute(sql)
   
end function 


'**********************************************************************
' imports data ot the grArtikel table
' uses for format the CSV file from Farbod 
'**********************************************************************
function importPreiseLine(preisLine)
'On Error Resume Next 
 importPreiseLine = "ERROR"
 preisLine = replace(preisLine,"""","")
 'response.write "PreisLine:" & PreisLine
 
 Dim fields, nr, name, description, manufacturer, taxclass, price, weight, minorder
 Dim manufacturernr , variation, mult, avail, units, difftxt, picture, category
  fields = split(preisLine,";")
  nr = fields(0)
  category= fields(1)
  name= left(fields(2),100)
  description= replace(fields(3),"""","")  'remove "
  description= replace(description,"|",";")   'replace | with ;
  manufacturer= fields(4)
  taxclass= fields(5)
  price= replace(fields(6),",",".")
  weight= replace(fields(7),",",".")
  minorder= fields(8)
  manufacturernr= fields(9)
  variation= fields(10)
  mult= fields(11)
  avail= fields(12)
  units= fields(13)
  difftxt= fields(14)
  picture= fields(15)  

  Dim sql: sql =  "select * from grArtikel where artNr=" & nr
  Dim rs: set rs = ObjConnection.execute(sql)
  Dim IsNEW: IsNEW = rs.EOF 
  rs.close 
 
  if IsNEW THEN  ' NEW Article
      sql = "INSERT INTO grArtikel (ArtNr, Bezeichnung, Bezeichnung1, Beschreibung, Gewicht, Einheit,  " & _ 
           " ArtKatNr, LieferantNr, EAN,  PreisATS, PreisEuro, EKPreis, MWST, Picture) " & _ 
      		" Values (" & nr & ",'" & name & "','" & avail & "','" & description & "'," & weight & ", '" & units & "'," & _
          category & ", " & manufacturer & ",'" & manufacturernr & "'," & price & "," & price & "," & price & "," & taxclass & ", '" & Picture & "')"
          importPreiseLine = "INSERT"
         
  else 'UPDATE
      sql = "UPDATE grArtikel Set " & _ 
      		  " Bezeichnung ='" & name & "'" & _ 
      		  ", Bezeichnung1 ='" & avail & "'" & _ 
      		  ", Beschreibung ='" & description & "'" & _
      		  ", Gewicht =" & weight & _
      		  ", Einheit ='" & units & "'" & _
      		  ", ArtKatNr =" & category & _
      		  ", LieferantNr =" & manufacturer & _
			  ", EAN ='" & manufacturerNr & _      		 
		      "', preisATS =" & price  & _
      		  ", preisEuro =" & price  & _
      		  ", ekPreis =" & price & _
      		  ", MWST=" & taxclass & _
      		  ", Picture ='" & Picture & "'" & _ 
      		  " WHERE ArtNR = " & Nr
      		  importPreiseLine = "UPDATE"
      		  
  end if 

  'on error resume next
 'response.write "<br>sql=" & sql
 ObjConnection.execute(sql)
 call UpdatePreises (Nr)
 
 response.flush
 if err.number > 0 then 
   importPreiseLine = "ERROR"
   response.write "<br>Error: " & err.description
 end if 
 
end function 


'**************************************************************************
'returns the manufacturer from IntraSell and creates new if not existing 
'**************************************************************************
function getIntraSellManufacturerNr(byVal foreignManufacturerName)
 if foreignManufacturerName="" then 
    Response.Write "To select or create new company we need at least the name!"
    getIntraSellManufacturerNr = ""
	exit function 
 end if 
 
  dim sql, rs 
  foreignManufacturerName = replace(foreignManufacturerName,"'","")
  foreignManufacturerName = left(replace(foreignManufacturerName,"""",""),50)
  
  
  sql = "SELECT IdNR from [lieferantenAdressen] WHERE [Firma] like '" & foreignManufacturerName & "'"
  'Response.Write sql
  set rs = ObjConnection.Execute(sql)  
  if rs.eof then
    Dim nIDNR : nIDNR = NextId("lieferantenAdressen","IdNR") 
	'getIntraSellArtKAtNRForItallCategory = -1
	sql = "INSERT INTO LieferantenAdressen (IDNR,[Name],Firma, PLZ) Values (" & _ 
	       nIDNR & ",'" & foreignManufacturerName & "','" & foreignManufacturerName & "',1)"
	'Response.Write "<br>" & sql
	ObjConnection.Execute(sql) 
	getIntraSellManufacturerNr = nIDNR 'try again 
  else
    getIntraSellManufacturerNr = rs("IdNr")
  end if   
  
    rs.close
    set rs = nothing

end function 


'**************************************************************************
'returns the id of the category according the mapping 
'**************************************************************************
function getIntraSellArtKAtNRForForeignCategory(LieferantNr, foreignArtKatNr, foreignArtKatName)
  dim sql, rs , resultCat
 ' Response.Write "foreignArtKatNr="&foreignArtKatNr
  foreignArtKatName = replace(foreignArtKatName,"'","") 
  
  if foreignArtKatNr <> "" and _
     isnumeric(foreignArtKatNr) and _
     foreignArtKatNr>0 then 'mapping by number is needed
	  sql = "SELECT ArtKatNr from priceCompareImpExCategoryMapping WHERE LieferantNr=" & LieferantNr & " AND foreignArtKatNr = " & foreignArtKatNr 
  else 'mapping by category name
	  sql = "SELECT ArtKatNr from priceCompareImpExCategoryMapping WHERE LieferantNr=" & LieferantNr & " AND foreignArtKatName Like '" & foreignArtKatName & "'"
  end if 
  
  'Response.Write sql
  set rs = ObjConnection.Execute(sql)  
  if rs.eof then 
  
   'try to find by name in our cats 
    if foreignArtKatName<> "" then 
        sql = "select * from [grArtikel-Kategorien] where Name Like '" & foreignArtKatName & "'"
        set rs = ObjConnection.Execute(sql)  
        if not rs.EOF then 
            getIntraSellArtKAtNRForForeignCategory = rs("ArtKatNr")
            rs.close
            exit function 
        end if 
        
               'no mapping prepare mapping 
		sql = " Insert into priceCompareImpExCategoryMapping (LieferantNr, ArtKatNr, ForeignArtKatNr, ForeignArtKatName) " & _ 
		    " Values (" & LieferantNr & ",-1," & foreignArtKatNr & ",'" & foreignArtKatName & "')" 
		'Response.Write sql  
		ObjConnection.Execute(sql)    
		
    end if 
    
	resultCat = -1
  else ' mapping exists 
    resultCat = rs("ArtKatNr")
    rs.close 
  end if   


  getIntraSellArtKAtNRForForeignCategory = resultCat

end function 

'**************************************************************************
' transforms the merchants file to internal CSV format for import 
'**************************************************************************
function transformMerchantFileToInternalCSVFile(byval lieferantNr, byval localFile, byval localFileTransformed) 

if lieferantNr = 1 then 'Dikont Computer 
	transformMerchantFileToInternalCSVFile = transformDiscountComputer(lieferantNr, localFile, localFileTransformed)
	exit function 
end if 

if lieferantNr = 2 then 'Amazon
	transformMerchantFileToInternalCSVFile = transformAmazon(lieferantNr, localFile, localFileTransformed)
	exit function
end if 

if lieferantNr = 5 then 'Session7
	transformMerchantFileToInternalCSVFile = transform5(lieferantNr, localFile, localFileTransformed)
	exit function
end if 


if lieferantNr = 6 then 'CCom
	transformMerchantFileToInternalCSVFile = transformCCom(lieferantNr, localFile, localFileTransformed)
	exit function
end if 

if lieferantNr = 7234 then 'CCom
	transformMerchantFileToInternalCSVFile = transformByteWork(lieferantNr, localFile, localFileTransformed)
	exit function
end if 

'else all other cases are standard and the merchants use out CSV file  
 'just copy file 
 call copyFile(localFile, localFileTransformed)

end function 



'=========================================================================
'returns true if error found 
'writes the last error description in the Session("LAST_ERROR")
'=========================================================================
function handleErrors()
  handleErrors  = false 
  Dim errs
  If Err.Number <> 0 Then 
     errs =  Err.Description & ", l:" & Err.helpcontext &  ", s:"& Err.source
     Response.Write "<br>" & errs
     Session("LAST_ERROR")= errs
     Err.Clear
     handleErrors= true 
  end if 
end function 



'=========================================================================
' core function about importing one price line 
' returns true if importing is ok
'
' price - exclusive MWST 
' taxclass - 1,2 for 10 or 20 % 
' the function have special behaviour when the internalArtNr is given, then only some of the parameters are checked
'=========================================================================

function importPriceLine(internalArtNr, nr, name, description, manufacturer, taxclass, price, weight, minorder, _
			             manufacturernr , variation, mult, avail, units, difftxt, picture, category, techinfo, lieferantNr, _
			             HAS_RIGHT_TO_CREATE_PRODUCTS,  byRef rtErrorDescription)
 On Error Resume Next 
 importPriceLine  = false 
 Dim status: status = "OK"
 
 
 
  nr = replace(nr,"'","") :  nr = replace(nr,"""","")  
  manufacturernr = replace(manufacturernr,"'","") :  manufacturernr = replace(manufacturernr,"""","") 
  name = replace(name,"'","") :  name = replace(name,"""","")  
  description = replace(description,"'","") :  description = replace(description,"""","")  
  
  
  
		'try to resolve category and merchant if not provided as numbers 
			if not isnumeric(category) then category = getIntraSellArtKAtNRForForeignCategory(lieferantNr,"0",category)'tries mapping 
			if not isnumeric(manufacturer) then manufacturer = getIntraSellManufacturerNr(manufacturer)'creates manufacturer if not ixisting 
			
			'general parcing error
			if not( IsNumeric(price)) or price="" then ' invalid price, manufacturer, minorder or CategoryID
				status = PARSE_ERROR'"Man/Cat error"
				rtErrorDescription = "price is not number " & price
			end if
			
			if not(IsNumeric(manufacturer)) and internalArtNr=""  then ' invalid price, manufacturer, minorder or CategoryID
				status = PARSE_ERROR'"Man/Cat error"
				rtErrorDescription = "manufacturer is not number " & manufacturer
			end if
			
			if not(IsNumeric(minorder)) then ' invalid price, manufacturer, minorder or CategoryID
				status = PARSE_ERROR'"Man/Cat error"
				rtErrorDescription = "minorder is not number " & minorder
			end if
			
			if not(IsNumeric(category)) and internalArtNr="" then ' invalid price, manufacturer, minorder or CategoryID
				status = PARSE_ERROR'"Man/Cat error"
				rtErrorDescription = "category is not number " & category
			end if
			
		
		    price = "CAST('" & replace(price,",",".")  & "' as money)" 
		    
		    'set Price according the VAT 
		    if taxclass="0.1" or taxclass="0.2" then price = "(1+ " & taxclass & ")*" &  price
			if taxclass="1"   or taxclass="2"   then price = "(1+ " & taxclass & "/10)*" & price
			if taxclass="10"  or taxclass="20"  then price = "(1+ " & taxclass & "/100)*" & price
			'end set VAT 
			'Response.Write price
			
            call findArtikelToUpdate(rsArt, internalArtNr, nr, manufacturernr, Bezeichnung, LieferantNr, price)			
			
			'Response.Write "Trace3"
			
			if status <> "OK" then 'insert as open price
			  ' rtErrorDescription = status
			   exit function 
			else ' No parse errors  
		     	
				'Dim InternalArtNr
				Dim currentPreisATS
				Dim currentBezeichnung1
				
				if rsArt.EOF then ' product is Not in the database
				 'Response.Write "Trace4"
							rsArt.close
							if isnumeric(category) and category<0 then status = PARSE_ERROR:rtErrorDescription = "category not mapped":exit function  ' the category is not mapped yet 
							if HAS_RIGHT_TO_CREATE_PRODUCTS then 
								'create new product 	
								dim newArtNR : newArtNR = nextId("grArtikel","ArtNR")				
								      sql = "INSERT INTO grArtikel (ArtNr, Bezeichnung, Bezeichnung1, Beschreibung, Gewicht, Einheit,  " & _ 
										    " ArtKatNr, LieferantNr, EAN,  PreisATS, PreisEuro, EKPreis, MWST, Picture) " & _ 
      										" Values (" & newArtNR & ",'" & name & "','" & avail & "','" & description & "'," & weight & ", '" & units & "'," & _
										     category & ", " & manufacturer & ",'" & manufacturernr & "'," & price & "," & price & "," & price & "," & taxclass & ", '" & Picture & "')"
									'Response.Write sql
									objConnection.Execute(sql)	
									if  handleErrors() then rtErrorDescription = sql:exit function 	
									counterNewProducts = counterNewProducts	+ 1
									InternalArtNr = newArtNR
									currentPreisATS = price
									currentBezeichnung1 = avail
							else 
							    rtErrorDescription = "no right to create products"
							    exit function 
							end if 
				  		
				else 'produkt exists 'UPDATE' try to update with new information 
				 'Response.Write "Trace5"         
								InternalArtNr = rsArt("artNR")			
								currentPreisATS = rsArt("PreisATS")
								currentBezeichnung1 = rsArt("bezeichnung1")
								category = rsArt("ArtKatNr")
								rsArt.close
								'TODO: write update SQL statement 
								'response.write "<br>InternalArtNr=" & InternalArtNr
					
								if inStr(internalNumbersImported,"," & InternalArtNr)>0 then ' the number was used 
								  Response.Write "number " & InternalArtNr & " used "
								  rtErrorDescription = "number " & InternalArtNr & " used "
								  exit function 
								end if 
					
								internalNumbersImported = internalNumbersImported & "," & InternalArtNr
					
								'UPDATE PRODUCT SECTION 
               					if currentBezeichnung1 = "" or currentPreisATS = 0 then  ' first merchant with such produkt
               					    rtErrorDescription = ""
								 	sql = "UPDATE grArtikel set bezeichnung1 = '" & avail & _
								 		  "', preisATS = " & price & ", preisEuro = " & price & _
								 		  " WHERE ArtNr = " & InternalArtNr
								 	ObjConnection.execute(sql)
								 	if  handleErrors() then rtErrorDescription =sql: exit function 	
								 	currentPreisATS = price 'not to execute the next statement 
								 end if
				'Response.Write "Trace6"				 			     
				end if 	'END UPDATE PRODUCT   								
				set rsArt = nothing
				
				
				'Response.Write "Trace7"
				call addTechInfo(InternalArtNr,category,TechInfo) 
				'Response.Write "Trace8"				
				'Produkt is already in the database
				'now insert or update price for the merchant 
				
					sql = " SELECT * FROM [lieferantenArtikel-Preise]" & _ 
					      " WHERE LieferantNr = " & lieferantNr & _ 
					      " and ArtikelNr = " & InternalArtNr
					'Response.Write sql      
					set rsImp = ObjConnection.execute(sql) 
					Dim ExitFlag: ExitFlag = false
					
					'Response.Write "Trace9"
					'update merchant price 
					If not rsImp.EOF then 'the merchant has already price for this artikle 
					'Response.Write "TraceCC"
					Dim preisId:preisId = rsImp("PreisId") 
					'Response.Write PreisId
							'Move to Archive 
							Dim sql_new
							sql_new = "INSERT INTO [priceCompareLieferantenArtikelPreiseArchive] " & _
									"(LieferantNr, ArtikelNr, ArtikelNrLieferant, " & _
									" EKPreis, VKPreis, PreisDatum ) " & _
									" Values(" & merch & "," & rsImp("ArtikelNr") & ",'" & rsImp("ArtikelNrLieferant") & "'," & _
									replace(rsImp("EKPreis"),",",".") & "," & replace(rsImp("VKPreis"),",",".") & "," & TOSQLDATE(rsImp("PreisDatum")) & ")"
									'" SELECT (LieferantNr, ArtikelNr, ArtikelNrLieferant, " & _
									'" EKPreis, VKPreis, PreisDatum ) from [LieferantenArtikel-Preise] where PriesId = " & rsImp("PreisId")
									
							'Response.Write sql_new		
							ObjConnection.execute(sql_new)
					'Response.Write "TracePP"
							if  handleErrors() then rtErrorDescription =sql_new: exit function 
							
							'Update Price of this merchant
							sql = "UPDATE [lieferantenArtikel-Preise] set EKPreis=" & price & _ 
									", VKPreis = " & price & ", ArtikelNrLieferant = '" & nr & _
									"',PreisDatum=" & TOSQLDATE(Date()) & ", bezeichnung = '" & name & _
									"',lagerInfo = '" & avail & "', bestellmenge = " &  replace(minorder,",",".") & _
									" WHERE PreisId = " & rsImp("PreisId")
							
							'Response.Write sql
							ObjConnection.execute(sql) 
							if  handleErrors() then rtErrorDescription =sql: exit function 
							
							counterUdatedPrices = counterUdatedPrices + 1 
							'Response.Write "Trace11"
                           'end update merchant prices 
					else  ' insert new record in LieferantArtikel-Preise					
						sql = " INSERT INTO [lieferantenArtikel-Preise] " & _
							  " (LieferantNr, ArtikelNr, ArtikelNrLieferant, " & _
							  " EKPreis, VKPreis, bezeichnung, lagerInfo, bestellmenge ) " & _
							  " Values(" &  merch & "," & InternalArtNr & ",'" & nr & "'," & _
							  price & "," & price & ",'" & name & "','" &  avail & "'," & minorder & ")"							
						 'Response.Write (sql)
						 ObjConnection.execute(SQL)
						 if  handleErrors() then rtErrorDescription =sql: exit function  
					end if ' not exit flag
				'end if	' product doesnt exist 
				
			end if 'no parse errors 
			
			if InStr(categoriesUpdated, "," & category) <=0 then 
			 categoriesUpdated = categoriesUpdated & "," & category
			end if 
	rtErrorDescription = ""		
	importPriceLine = true 		
end function



'========================================================================================
'finds the same product for update
'rsArt - record set with the product 
'nr - lieferant own number 
'bezeichnung - product name
'manufacturernr - common product ID name
'======================================================================================== 
function findArtikelToUpdate(byRef rsArt, byVal internalArtNr,  byVal nr, byVal manufacturernr, byVal Bezeichnung, byVal LieferantNr, byVal preis)
 on error resume next 
			'FIND ARTIKEL TO UPDATE
			'try to resolve some attributes by finding the product in the database 
			 'Response.Write "Trace1"
			 
			 if isnumeric(internalArtNr) then
			 if internalArtNr>0 then
			    sql = "select * from grArtikel where ArtNR = " & internalArtNr
			    Set rsArt = objConnection.Execute(sql) 
			    if rs.eof then 
			        Response.Write "<font color=""red""> no Artikle with ArtNr=" & internalArtNr & " exists!</font>"
			        Response.End
			    end if 
			    
			    exit function 
			 end if   
			 end if 
			 
			 sql = ""
		     if EAN <> "" or name <> ""  then 'find by EAN or find by Bezeichnung
				sql = "Select * FROM grArtikel WHERE " & _ 
				      " PreisATS>" & preis & "*0.5 and PreisATS<" & preis & "*2 " & _ 
				      " and ((EAN Like '" & trim(manufacturernr) & "' and EAN is not null and RTRIM(LTRIM(EAN)) <> '' and '" & trim(manufacturernr) & "'<>'') " & _ 
				      " or (Bezeichnung LIKE '" & trim(name) & "' AND Bezeichnung is not null AND RTRIM(LTRIM(Bezeichnung)) <> '' ))"
			 else 
			    sql = "Select * FROM grArtikel WHERE 1=2" 'nothing to find 
			 end if 
			'Response.Write "Trace2"

			'Response.Write sql
			 Set rsArt = objConnection.Execute(sql)	
			 if  handleErrors() then rtErrorDescription = sql:exit function 

			 if not rsArt.EOF then 
			      status = "OK" 'the product is defined  in the database
			 else  'last chance to take Art by previously imported price for this product   
			      sql = "Select * FROM grArtikel WHERE PreisATS>" & preis & "*0.5 and PreisATS<" & preis & "*2 and " & _ 
			            " ArtNR in (select ArtikelNR from [lieferantenArtikel-Preise] " & _ 
			            " WHERE (LieferantNr=" & LieferantNr & " and '"& nr &"'<>'' and ArtikelNrLieferant Like '" & nr & "' AND ArtikelNrLieferant is not null AND RTRIM(LTRIM(ArtikelNrLieferant)) <> '' ) " & _ 
			            " OR ('"& name &"'<>'' and Bezeichnung LIKE '" & name & "' AND Bezeichnung is not null AND RTRIM(LTRIM( Bezeichnung))<> ''))"
			      'Response.Write sql
			      'Response.Write "<br>"
			      Set rsArt = objConnection.Execute(sql)	
			      'Response.Write "Trace3"
     
			     if LieferantNr=5 or LieferantNr=6 or LieferantNr=7234 then 'only for these two manufacturer 
					 if rsArt.EOF then ' fulltext search   
					 'Response.Write "Trace4"
			      			 if len(name) > 5  then 'find by EAN or find by Bezeichnung
			      			    dim fullTextNAme
			      			    fullTextNAme = "%" & replace(name," ","%") & "%"
			      			    fullTextNAme =  replace(fullTextNAme,"-","%")
			      			    fullTextNAme =  replace(fullTextNAme,",","%")
			      			    'Response.write "last poss " & fullTextNAme
								sql = "Select * FROM [lieferantenArtikel-Preise] WHERE " &  _ 
								      " EKPreis>" & preis & "*0.5 and EKPreis<" & preis & "*2 and  " & _ 
								      " Bezeichnung LIKE '" & fullTextNAme  & "'"
							    Set rsArt = objConnection.Execute(sql)	
							     'Response.write "last poss " 
							    if not rsArt.EOF then 'artikel found 
							        sql = "Select * FROM grArtikel WHERE ArtNr=" & rsArt("ArtikelNr")
							        Set rsArt = objConnection.Execute(sql)	
							    end if 
							end if
					 end if 
				 end if ' only for the manufacturer			 
			 end if 			 
			'END FIND ARTIKEL TO UPDATE
      findArtikelToUpdate = true 
end function 



'=============================================================================
'SELECT MIN PRICE OF the MERCHANTS AND UPDATE THE PRICES with it 
'=============================================================================
sub updateMinPrice()
Response.Write "<h2>Update min Price and lagerinfo</h2>" 
dim sql, rs 
				'UPDATE min Price for imported Categories 
				sql =  " SELECT MIN([lieferantenArtikel-Preise].EKPreis) as bestPrice, ArtikelNr  " & _ 
					   " FROM [lieferantenArtikel-Preise], [grArtikel]" & _ 
					   " WHERE artikelNr = ArtNR" & _ 
					   " GROUP BY ArtNR, ArtikelNr, PreisATS" & _ 
					   " HAVING MIN([lieferantenArtikel-Preise].EKPreis) <> [grArtikel].PreisATS " & _ 
					   " OR (COUNT([lieferantenArtikel-Preise].EKPreis) = 1 AND MIN([lieferantenArtikel-Preise].EKPreis) <> [grArtikel].PreisATS)"
                      set rs= objConnection.execute(sql)
              while not rs.EOF      
				'UPDATE min PRICE  
				'bezeichnung1 = '" & rs("lagerInfo") & "'," & _
				  dim lagerInfo, price 
				  price = replace(rs("bestPrice"),",",".")
				  lagerInfo= getFirstField("SELECT lagerinfo from [lieferantenArtikel-Preise] WHERE ArtikelNr= " & rs("ArtikelNr") & " AND EKPreis=" & price)
					 sql = "UPDATE grArtikel set " & _ 
					 	  " preisATS = " & price  & ", preisEuro = " & price  & _
					 	  " WHERE ArtNr = " & rs("ArtikelNr") 
					 'Response.Write sql	  
					 ObjConnection.execute(sql)
					 Response.Write "U " : Response.Flush
				rs.moveNext 	 
			 wend 		 
					 
end sub 




%>
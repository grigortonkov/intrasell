<!--#include virtual="/intrasoft/menu.asp"-->
<!--#include virtual="/admin/impex/functionsImpEx.asp"-->
<%


'**************************************************************************
' this import file is runned many times daily 
'**************************************************************************

on error resume next 

'**************************************************************************
'the first time this asp is started must be created the table CategoryMapping
'**************************************************************************
sub prepareForImport()
	dim sql
    dim AlreadyCreated : AlreadyCreated = VARVALUE("itallCategoryMapping") 

	if AlreadyCreated ="JA" then
	else    
			sql ="CREATE TABLE itallCategoryMapping ( IntraSellCatName VARCHAR(255), ItallCatName VARCHAR(255))"
			ObjConnectionExecute(sql)  
			sql = "INSERT INTO ofVARS ([Name],Wert) VALUES ('itallCategoryMapping','JA')"
			ObjConnectionExecute(sql)  
	end if 		
end sub 

'**************************************************************************
'returns the id of the category according the mapping 
'**************************************************************************
function getIntraSellArtKAtNRForItallCategory(itallCategory)
  dim sql, rs 
  sql = "SELECT ArtKatNr from [grArtikel-Kategorien] WHERE [Name]  In (SELECT intraSellCatName from itallCategoryMapping WHERE itallCatName like '" & itallCategory & "')"
  'Response.Write sql
  set rs = ObjConnectionExecute(sql)  
  if rs.eof then 
	getIntraSellArtKAtNRForItallCategory = -1
  else
    getIntraSellArtKAtNRForItallCategory = rs("ArtKatNr")
  end if   
end function 



'calls everytime but doesnt matter 
call prepareForImport()
'open database ITAll
set objConnITAll=server.createobject("adodb.connection")
objConnITAll.open  "driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & Server.MapPath("ITAll.mdb") & ";"
		

Dim sql
sql = "SELECT ProdNr, Products.ManProdNr, TransCtg.CtgDesc, TransCtg_1.CtgDesc  as RealCategory, Manufacturers.ManNr, " & _ 
      " Manufacturers.ManText, Products.ProdText, Products.ProdLongText, Products.HEK, TransAvailability.AvailabilityDescription, " & _ 
      " Products.Weight, Products.MacFlag, Abs([TaxCode]-3) AS MWSTType " & _ 
	  " FROM (((Manufacturers INNER JOIN Products ON Manufacturers.ManNr = Products.ManNr) INNER JOIN TransCtg ON Products.CtgClassID = TransCtg.CtgID) " & _  
	  " INNER JOIN TransCtg AS TransCtg_1 ON Products.CtgSubClassID = TransCtg_1.CtgID) LEFT JOIN TransAvailability ON Products.AvailabilityCode = TransAvailability.AvailabilityCode " & _ 
	  " WHERE (((TransAvailability.LanguageCode)='D'))"

Dim rsITAll: set rsITAll = objConnITAll.execute(sql)

Dim ImportData, countUpdates, countNew, countErrors, CountNoMapping
  countUpdates = 0 : countNew = 0 :countErrors = 0 : CountNoMapping  =0


      Dim L
dim linesProcessed:linesProcessed=0
    while not rsITAll.EOF   
      
      linesProcessed=linesProcessed+1
      if (linesProcessed mod 100) = 0 then 
       Response.Write "<br>" & linesProcessed & " records processed! "
      end if 
      
      sql = " SELECT Products.ProdNr, Products.ProdText, TransCtg.CtgDesc as VarNAme, TransCtg_1.CtgDesc as VarValue " & _ 
            " FROM ((ProdProperties INNER JOIN Products ON ProdProperties.ProdNr = Products.ProdNr) " & _ 
            " INNER JOIN TransCtg ON ProdProperties.CtgTitleID = TransCtg.CtgID) INNER JOIN " & _ 
            " TransCtg AS TransCtg_1 ON ProdProperties.CtgValueID = TransCtg_1.CtgID " & _ 
            " Where Products.ProdNr =" & rsITAll("ProdNr")
      Dim rsAddInfo: set rsAddinfo =  objConnITAll.execute(sql)
      Dim desc
      if not rsAddInfo.EOF then 
      desc =" TechInfo:"
      end if 
      
      Dim nameKW, valueKW
      while not rsAddInfo.EOF      
     	  nameKW = replace(rsAddInfo("VarName"),",",".") 
     	  valueKW = replace(rsAddInfo("VarValue"),",",".")
         desc = desc & nameKW  & "=" & valueKW  & ","
      rsAddInfo.movenext 
      WEND 
      if right(desc,1) ="," then 
        desc = left(desc,len(desc)-1) ' remove last ","
        desc = desc & "|"
      end if  
      rsAddInfo.close : set rsAddInfo= nothing 
      
      dim catNr
      Dim image: image = "no-image"
      if rsItall("MacFlag")="Y" then image  = "mac.gif"
      catNR = getIntraSellArtKAtNRForItallCategory(rsITAll("RealCategory")) 
      if catNR > 0 then 'the mapping is defined going to import product 
					'nr;category;name;description;manufacturer;taxclass;price;weight;minorder;manufacturernr;variation;mult;avail;units;difftxt;picture
					l = rsITAll("ProdNr") & ";" & _ 
					    catNr & ";" & _
					    rsITAll("ProdText")& ";" & _ 
					    rsITAll("ProdLongText") & desc& ";" & _
					    getIntraSellManufacturerNr(rsITAll("ManText"))& ";" & _ 
					    rsITAll("MWSTType")& ";" & _
					    rsITAll("HEK")& ";" & _
					    rsITAll("Weight")& ";" & _
					    "1" & ";" & _
					    rsITAll("ManProdNr")& ";" & _
					    "1" & ";" & _
					    "1" & ";" & _
					    rsITAll("AvailabilityDescription") & ";" & _
					    "Stk." & ";" & _
					    "1" & ";" & _
					    image
      
					  'response.write "<br>Now import:" & l     

					      if len(l) > 10 then ' line is not empty
					      Dim importResult
 					      importResult =  importPreiseLine(l)
     						 
     						 if importResult ="INSERT" then 
     						   countNew = countNew + 1
     						   response.write "N"
     						 end if 
     						
     						 if importResult  = "UPDATE" then 
     						  countUpdates  = countUpdates  + 1
     						  response.write "U"
     						 end if 
     						 
     						 if importResult = "ERROR" then  
     						    countErrors  = countErrors + 1
     						    response.write "R"
     						 end if       	
     					end if 	 
     					
     	else 
     	  response.write "NM"
     	  CountNoMapping = CountNoMapping +1 
     	end if 'mapping for category defined 
     	rsITAll.moveNext 				
     		     		      	     		 
    wend  
    rsITAll.close 
    set rsITAll = nothing 
      
    
     %>
<META content="MSHTML 6.00.2715.400" name=GENERATOR></HEAD>
<BODY>
<font color="#008080">
   <br>
   Der Verkaufspreis wurde mit dem Aufschlag der dazugehörige Kategorie aktualisiert.</font>
   <br>
<font color="#008080">Fertig! Die Produkte / Preise wurden aktualisiert. </font>&nbsp;
<table border="1" width="26%" cellspacing="0">
  <tr>
    <th width="104%" colspan="2"><b>Statistik / Ergebnis</b></th>
  </tr>
  <tr>
    <td width="67%">Neue Produkte</td>
    <td width="37%"><%=countNew%></td>
  </tr>
  <tr>
    <td width="67%">Änderungen Preise</td>
    <td width="37%"><%=CountUpdates%></td>
  </tr>
  <tr>
    <td width="67%"><font color="#ff0000">Fehler</font></td>
    <td width="37%"><%=CountErrors%></td>
  </tr>
    <tr>
    <td width="67%"><font color="#ff0000">No Mapping</font></td>
    <td width="37%"><%=CountNoMapping%></td>
  </tr>
</table>

<p>Help:<br>
1. Upload the ITALL.mdb file!&nbsp;<br>
3. Legend: "N" - Insert (New); "U" - Update; 
"E" - Error, "NM" -No Mapping, the product will not pe inserted</p></BODY></HTML>


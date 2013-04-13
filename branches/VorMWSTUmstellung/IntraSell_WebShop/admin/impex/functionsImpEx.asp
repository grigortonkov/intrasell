
<%
'on error resume next
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
	  ", grArtikel.PreisEuro = [EKPreis]*" & replace(Aufschlag,",",".")  & _    
  	   " WHERE ArtNR = " & artNR 
  	
  	'Response.Write "<BR>sql=" & sql
  	ObjConnectionExecute(sql)
end function 


'**********************************************************************
' imports data ot the grArtikel table
' uses for format the CSV file from Farbod 
'**********************************************************************
function importPreiseLine(preisLine)
'On Error Resume Next 
 importPreiseLine = "ERROR"
 preisLine = replace(preisLine,"""","")
 'response.write "<br>PreisLine:" & PreisLine
 'Response.Flush
 'exit function 
 Dim fields, nr, name, description, manufacturer, taxclass, price, weight, minorder
 Dim manufacturernr , variation, mult, avail, units, difftxt, picture, category,ProduktAktiv
  fields = split(preisLine,";")
  nr = fields(0)
  category= fields(1)
  name= left(fields(2),100)
  description= replace(fields(3),"""","")  'remove "
  description= replace(description,"|",";")   'replace | with ;
  manufacturer= fields(4): if manufacturer="" then manufacturer ="n/a"
  taxclass= fields(5): taxclass=replace(taxclass,",",".")
  price= replace(fields(6),",",".")
  weight= replace(fields(7),",","."):if weight = "" then weight="0"
  minorder= fields(8)
  manufacturernr= fields(9): if manufacturernr ="" then manufacturernr = 0
  variation= fields(10)
  mult= fields(11)
  avail= fields(12)
  units= fields(13)
  difftxt= fields(14)
  picture= fields(15)  : if picture = "" then picture ="no-image"
  ProduktAktiv= fields(16)  '0 or 1 

   if not isnumeric(manufacturer) then manufacturer=getIntraSellManufacturerNr(manufacturer)' get by name 

  Dim sql: sql =  "select * from grArtikel where artNr=" & nr
  Dim rs: set rs = ObjConnectionExecute(sql)
  Dim IsNEW: IsNEW = rs.EOF 
  rs.close 
 
  if IsNEW THEN  ' NEW Article
      sql = "INSERT INTO grArtikel (ArtNr, Bezeichnung, Bezeichnung1, Beschreibung, Gewicht, Einheit,  " & _ 
           " ArtKatNr, LieferantNr, EAN,  PreisATS, PreisEuro, EKPreis, MWST, Picture,ProduktAktiv) " & _ 
      		" Values (" & nr & ",'" & name & "','" & avail & "','" & description & "'," & weight & ", '" & units & "'," & _
          category & ", " & manufacturer & ",'" & manufacturernr & "'," & price & "," & price & "," & price & "," & _ 
          taxclass & ", '" & Picture & "'," & ProduktAktiv & ")"
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
      		  ",ProduktAktiv=" & ProduktAktiv & " "  & _ 
      		  " WHERE ArtNR = " & Nr
      		  importPreiseLine = "UPDATE"
      		  
  end if 

 on error resume next
 'response.write "<br><font color=red>Error occured</font> on sql=" & sql:Response.Flush
 'Response.end
 ObjConnectionExecute(sql)
 if err.number > 0 then 
	response.write "<br><font color=red>Error occured</font> on sql=" & sql:Response.Flush
	err.Clear 
 end if 
' on error goto 0 
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
	exit function 
 end if 
 
  dim sql, rs 
  sql = "SELECT IdNR from [lieferantenAdressen] WHERE [Firma] like '" & foreignManufacturerName & "'"
  set rs = ObjConnectionExecute(sql)  
  if rs.eof then 
	'getIntraSellArtKAtNRForItallCategory = -1
	sql = "INSERT INTO LieferantenAdressen (IDNR,[Name],Firma, PLZ) Values (" & _ 
	       NextId("lieferantenAdressen","IdNR") & ",'" & foreignManufacturerName & "','" & foreignManufacturerName & "',1)"
	'Response.Write sql
	ObjConnectionExecute(sql) 
	getIntraSellManufacturerNr = getIntraSellManufacturerNr(foreignManufacturerName) 'try again 
  else
    getIntraSellManufacturerNr = rs("IdNr")
  end if   
end function 

%>
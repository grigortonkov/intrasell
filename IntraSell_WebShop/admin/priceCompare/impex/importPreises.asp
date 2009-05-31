<!--#include file="../../client/intrasoft/menu.asp"-->
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
  description= fields(3)
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

 '

 'response.write "<br>sql=" & sql
 ObjConnection.execute(sql)
 call UpdatePreises (Nr)
 
 response.flush
 if err.number > 0 then 
   importPreiseLine = "ERROR"
   response.write "<br>Error: " & err.description
 end if 
 
end function 

Dim ImportData, countUpdates, countNew, countErrors

    ImportData=request("ImportData")
  countUpdates = 0 : countNew = 0 :countErrors = 0 
   if ImportData <> "" then 'it is import 
      Dim Lines, L
      Lines = split(ImportData, CHR(13))
      for each l in Lines 
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
     		     		      	     		 
      next 
      
      
    
     %>
<font color="#008080">
   <br>
   Der Verkaufspreis wurde mit dem Aufschlag der dazugehˆrige Kategorie aktualisiert.</font>
     
     <% 
   %>



&nbsp;<br>
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
    <td width="67%">ƒnderungen Preise</td>
    <td width="37%"><%=CountUpdates%></td>
  </tr>
  <tr>
    <td width="67%"><font color="#FF0000">Fehler</font></td>
    <td width="37%"><%=CountErrors%></td>
  </tr>
</table>   
   <%
   response.end 
   end if 

%>

<form method="POST" action="importPreises.asp">
  <h1>IMPORT&nbsp;</h1>
  <p><textarea rows="7" name="ImportData" cols="10000">
nr;category;name;description;manufacturer;taxclass;price;weight;minorder;manufacturernr;variation;mult;avail;units;difftxt;picture
29175;159;"DVD-A05 DVD-ROM 16-fach, CD-ROM 40-fach, ""SLOT-IN"" inkl.";;46;2;1320;1;1;4;0;1;lagernd;stk;1;no-image
29176;159;"DVD-106S DVD-ROM 16-fach, CD-ROM 40-fach, ""SLOT-IN"" ohne";;46;2;925;1;1;4;0;1;lagernd;stk;1;no-image
29177;159;"DVD-116 DVD-ROM 16-fach, CD-ROM 40-fach, ""LADE""";;46;2;870;1;1;4;0;1;lagernd;stk;1;no-image
29178;160;DVR-A03 DVD-Recorder, 3. Generation fÅr 4,7GB Daten, Single Side;;46;2;10800;1;1;4;0;1;In kÅrze wieder lagernd;stk;1;no-image

</textarea></p>
  <p><input type="submit" value="Abschicken" name="B1"><input type="reset" value="Zur¸cksetzen" name="B2"></p>

<p>Help:<br>
1. Remove the first line in text box. It is only for information how the format should
be!&nbsp;<br>
2. Enter in CSV Form the my EStore price list in the text box. Press ENTER!<br>
3. Legend: &quot;N&quot; - Insert (New); &quot;U&quot; - Update; &quot;E&quot; - Error</p>

<p><a href="example_file_for_import.xls">Excel Vorlage herunterladen</a> <br>
1. Geben Sie in der Excel Date Ihre Produkte und Preise ein <br>
2. in CSV format exportieren und ¸ber diesem Tool importieren.</p>
</form>
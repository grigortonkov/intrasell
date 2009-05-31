<!--#include file="../../intrasoft/menu.asp"-->
<!--#include file="functionsImpEx.asp"-->
<%

Dim ImportData, countUpdates, countNew, countErrors

  ImportData=request("ImportData")
  countUpdates = 0 : countNew = 0 :countErrors = 0 
   if ImportData <> "" then 'it is import 
      Dim Lines, L
      Lines = split(ImportData, CHR(13))
      for each l in Lines 
       ' response.write "<br>Now import:" & l    :Response.Flush 
       

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
  <p><textarea rows="7" name="ImportData" cols="100000">
Lˆschen Sie diese und die n‰chste Zeile  
nr;category;name;description;manufacturer;taxclass;price;weight;minorder;manufacturernr;variation;mult;avail;units;difftxt;picture
1004;21;"Beispiel Artikel 1";Das ist nur ein Beispielartikel| Techinfo:RAM=200,MZ=100| SpecialChoice:Color=Green,Red,Black|Size=100,120,170;1;2;1320;1;1;4;0;1;lagernd;stk;1;1000.gif
1005;21;"Beispiel Artikel 2";Das ist nur ein Beispielartikel| Techinfo:RAM=200,MZ=100;1;2;925;1;1;4;0;1;lagernd;stk;1;http://193.171.36.87/WebShop/company/images/company.gif
1006;21;"Beispiel Artikel 3";;1;2;870;1;1;4;0;1;lagernd;stk;1;no-image
1007;22;"Beispiel Artikel 4";;1;2;10800;1;1;4;0;1;In kÅrze wieder lagernd;stk;1;1000.gif

</textarea></p>
  <p>
  <input type="submit" value="Abschicken" name="B1"><input type="reset" value="Zur¸cksetzen" name="B2"></p>

<p>Help:<br>
1. Remove the first line in text box. It is only for information how the format should
be!&nbsp;<br>
2. Enter in CSV Form the my EStore price list in the text box. Press ENTER!<br>
3. Legend: &quot;N&quot; - Insert (New); &quot;U&quot; - Update; &quot;E&quot; - Error</p>

<p><a href="example_file_for_import.xls">Excel Vorlage herunterladen</a> <br>
1. Geben Sie in der Excel Date Ihre Produkte und Preise ein <br>
2. in CSV format exportieren und ¸ber diesem Tool importieren.</p>
</form>
<!--#include virtual="/intrasoft/menu.asp"-->
<p align="center">
<%
	dim nummer : nummer = request("nummer")
	dim OrderType : OrderType = request("OrderType")
	'sql = "Select Bezahlt from buchRechnung"
	'set rsWK = ObjConnectionExecute(sql)
	'Response.Write rsWk ("Bezahlt")
	'Response.End
	  
	if OrderType = "" then 
	%>
	<font color="#ff0000">
    Order type is not specified! </font>
	<%
	response.end  
	end if  

if request("exec") = "Update" then 
	'we have form submition
	'Update contents and show again...
	Dim TableVorgang, TableVorgangArtikel, SQL, rsWK
	
	TableVorgang = getNameForTable(OrderType)
	TableVorgangArtikel = getNameForTableProducts(OrderType)

	sql = "Update [" & TableVorgang & "] set Datum=" & TOSQLDATE(request("Datum")) & " WHERE (Nummer=" & Nummer & ")"
	set rsWK = ObjConnectionExecute(sql)

	sql = "Update [" & TableVorgang & "] set Bezahlt=" & CheckToSQL(request("C1")) & " WHERE Nummer=" & Nummer
	set rsWK = ObjConnectionExecute(sql)
	
	sql = "Update [" & TableVorgang & "] set Ausgedrukt=" & CheckToSQL(request("C2")) & " WHERE Nummer=" & Nummer
	set rsWK = ObjConnectionExecute(sql)

	sql = "Update [" & TableVorgang & "] set anElba=" & CheckToSQL(request("C3")) & " WHERE Nummer=" & Nummer
	set rsWK = ObjConnectionExecute(sql)
	
	if isNumeric (request("IDNR"))=False then 
		%>
		<P><font color=red>Client#<%=request("IDNR")%> Doesn't Exist!</font></P>
		<%
	else
		sql  = "SELECT * FROM ofAdressen WHERE IDNR=" & request("IDNR") 
		set rsWK = ObjConnectionExecute(sql)
		if Not rsWK.EOF then 
			sql = "Update [" & TableVorgang & "] set KundNr=" & request("IDNR")  & " WHERE Nummer=" & Nummer
			set rsWK = ObjConnectionExecute(sql)
		else
			%>
			<P><font color=red>Client#<%=request("IDNR")%> Doesn't Exist!</font></P>
			<%
		end if
	end if


    if request("newIDNR") <> "" then 
       Dim newIDNR : newIDNR  = left(request("newIDNR"), InStr(request("newIDNR"),"-")-1) 
     	    sql = "Update [" & TableVorgang & "] set KundNr=" & newIDNR  & " WHERE Nummer=" & Nummer
			ObjConnectionExecute(sql)
    end if  
	Dim i, an, ats, qn, chn, ats_Brutto
	For i = 1 to CInt(request("Items"))
	 
		an = "art" & i
		ats = "PreisATS" & i
		ats_brutto = "PreisATS_Brutto" & i
		qn = "Stk" & i
		chn = "checkD" & i 
		ats_brutto = "PreisATS_Brutto" & i		
		if not (isNumeric (request(qn)) and   isNumeric (request(ats)) and isNumeric (request(ats_brutto))) then		 
	   %>
			<P><font color=red>Illegal value for product (#<%=i%> in list) quantity or price</font></P>
	   <%
		else 'it is okay
			 'Response.write " qn = " & request(qn) & " checked is : " & request(chn)
			if ucase(request(chn)) = "ON" then ' delete item
				sql = "DELETE FROM [" & TableVorgangArtikel  
				sql = sql & "] WHERE ArtNR = " &  request(an)
				sql = sql & " AND RechNr=" & Nummer
				call ObjConnectionExecute(sql)
			Else ' update quantity
			   'not working Dim preisATS_BRUTTO_UPDATE : preisATS_BRUTTO_UPDATE =  makeBruttoPreis2(request(an), request(qn),Session("Land"))*request(qn) 	 
				sql = "UPDATE [" & TableVorgangArtikel & "] SET " & _ 
				" Stk=" & request(qn) & " , PreisATS =" & replace(request(ats),",",".") & " , " & _ 
				" PreisATS_Brutto=" & replace(request(ATS_BRUTTO),",",".") & _
				" WHERE ArtNR = " & request(an) & _
				" AND RechNr=" & Nummer
				'response.Write sql: response.flish
				call ObjConnectionExecute(sql)
			End if	
		end if			
	Next	
	
	Dim addNewArtNr : addNewArtNr = request("AddNew")	
	if Trim (addNewArtNr) <> "" then 
	     addNewArtNR= left(request("AddNew"), inStr(request("AddNew"),"-")-1)
	      
		if IsNumeric (addNewArtNR) then 
			sql = "SELECT ArtNr from grArtikel"
			set rsWK = ObjConnectionExecute(sql)
			if rsWK.EOF=True and rsWK.BOF=TRUE then
				%>
				<P><font color=red>Product#<%=addNewArtNR%> Doesn't Exist!</font></P>
				<%
			else
		        Dim Bezeichnung : Bezeichnung = TABLEVALUE("grArtikel", "ARTNR", addNewArtNr  ,"Bezeichnung")
				Dim preisATS : preisATS = TABLEVALUE("grArtikel","ARTNR", addNewArtNr, "PreisATS")
				Dim preisEuro : preisEuro = TABLEVALUE("grArtikel","ARTNR", addNewArtNr, "PreisEuro")
				Dim preisATS_BRUTTO : preisATS_BRUTTO = makeBruttoPreis2(addNewArtNr, 1, Session("Land"))	
				
				sql = " INSERT INTO [" & TableVorgangArtikel & "] (RechNr, ArtNR, Stk, Bezeichnung) " &_ 
				" Values ( " & Nummer & ", " & addNewArtNR & ", 1, '" & Bezeichnung &"' )" 
				ObjConnectionExecute(sql)

			
				
				SQL ="UPDATE [" & TableVorgangArtikel & "] " & _ 
					" SET [" & TableVorgangArtikel & "].PreisATS = " & replace(PreisATS,",",".") & "," & _ 
					" [" & TableVorgangArtikel & "].PreisATS_Brutto = " & replace(preisATS_BRUTTO,",",".")  & _ 
					", Bezeichnung = '" & Bezeichnung & "' " & _ 
					" WHERE [" & TableVorgangArtikel & "].RechNr=" & Nummer & _ 
					" AND [" & TableVorgangArtikel & "].ArtNr=" & addNewArtNr 
			   
			   'response.write sql
	    	   Response.Flush

				call ObjConnectionExecute(sql)
			end if
		else
				%>
				<P><font color=red>ProductID MUST BE NUMERIC!</font></P>
				<%
		end if
	end if
end if
%>

<%
Dim butArr(4,2)
butArr(1,1) = getTranslation("Konvertieren")
butArr(2,1) = getTranslation("Druck")
butArr(3,1) = getTranslation("Neu")
butArr(4,1) = getTranslation("Löschen")
butArr(1,2) = "convertFromTo.asp?fromNummer=" & Nummer & "&From=" & OrderType
butArr(2,2) = "printPreviewOrder.asp?nummer=" & nummer & "&OrderType=" & OrderType & """ target=""_new"
butArr(3,2) = "newOrder.asp?OrderType=" & OrderType
butArr(4,2) = "deleteOrder.asp?OrderNummer=" & nummer  & "&OrderType=" & OrderType
%>
<%call drawButtonLine(butArr)%>
<%call showOrder(OrderType, nummer)%>


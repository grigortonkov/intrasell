<!--#include file="../client/intrasoft/menu.asp"-->
<%Dim butArr(4,2)
Dim sql
Dim rs
Dim merchname
Dim count
Dim merch
merch = request("merch")
butArr(1,1) = "Profile"
butArr(1,2) = "adminMerchantsProfile.asp?merch=" & merch
butArr(2,1) = "FTP settings"
butArr(2,2) = "adminMerchantsFtp.asp?merch=" & merch
butArr(3,1) = "Stars"
butArr(3,2) = "adminMerchantsStars.asp"
butArr(4,1) = "Merchant's List"
butArr(4,2) = "adminMerchantsPayment.asp"
call drawWindowPart1("Admin Merchants Payment Settings","","state",butArr)	

if merch = "" then		
	sql = " SELECT  lieferantenAdressen.* FROM lieferantenAdressen " & _
	      " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
	set rs = ObjConnectionExecute(sql)
	Response.Write "<b> Select a merchant from the list : <b><br> "
	While not rs.EOF
		Response.Write "&nbsp;&nbsp;&nbsp;<A href=""adminMerchantsPayment.asp?merch=" & rs("IDNR") & """><b>" & rs("Firma") & "</b></a><br>"
		rs.MoveNext
	wend
else ' merch <> ""
	sql = " SELECT  Firma FROM lieferantenAdressen WHERE IDNR = " & merch 
	set rs = ObjConnectionExecute(sql)
	merchname = rs("Firma")
	
	if request("UpdateButton") <> "" then 
		sql = " SELECT delivery,PaymentMode, deliveryPrice FROM priceCompareHaendler WHERE LieferantNr=" & merch
		set rs = ObjConnectionExecute(sql)
		if rs("delivery") = true and request("delivery") = "No" then
			sql = "UPDATE priceCompareHaendler set delivery=0 WHERE LieferantNr=" & merch
			ObjConnectionExecute(sql)
		end if	
		if rs("delivery") = false and request("delivery") = "Yes" then
			sql = "UPDATE priceCompareHaendler set delivery=1 WHERE LieferantNr=" & merch
			ObjConnectionExecute(sql)
		end if	
		if rs("PaymentMode") <> request("PaymentMode") then
			sql = "UPDATE priceCompareHaendler set PaymentMode='" & request("PaymentMode") & "' WHERE LieferantNr=" & merch
			ObjConnectionExecute(sql)
		end if	
		
		if request("deliveryPrice")<>"" then
			sql = "UPDATE priceCompareHaendler set deliveryPrice='" & request("deliveryPrice") & "' WHERE LieferantNr=" & merch
			Response.Write sql
			ObjConnectionExecute(sql)
		end if	
		
		'START Zahlungsbedingungen		
		sql = " SELECT * FROM grZahlungsbedingung "
		set rs = ObjConnectionExecute(sql)

		while not rs.EOF 
			sql = " SELECT * FROM [priceCompareHaendler_Zahlungsbedingungen] WHERE Bedingung= " & rs("Nr") & " and IDNR= " & merch
			set rsZ = ObjConnectionExecute(sql)
			if Request("ZB" & rs("Methode") ) = "Yes"  then
				if rsZ.BOF and rsZ.EOF then ' insert record
					sql = "INSERT INTO [priceCompareHaendler_Zahlungsbedingungen] ( IDNR,Bedingung ) " & _
						  " Values( " & merch & "," & rs("Nr") & ")"
					'NextId("[priceCompareHaendler_Zahlungsbedingungen]","ID") & _
					ObjConnectionExecute(sql)
				end if 'else Doesn't need update
			else
				if rsZ.BOF and rsZ.EOF then ' delete record
					'Doesn't need update
				else
					sql = "DELETE FROM [priceCompareHaendler_Zahlungsbedingungen] WHERE Bedingung= " & rs("Nr") & " and IDNR= " & merch
					ObjConnectionExecute(sql)
				end if		
			end if
			rs.MoveNext
		wend 
		'END Zahlungsbedingungen	
		
				
		'START Services	
		sql = " SELECT  * FROM grServices"
		set rs = ObjConnectionExecute(sql)

		while not rs.EOF 
			sql = " SELECT * FROM [priceCompareHaendler_Services] WHERE ServiceNr= " & rs("Nr") & " and IDNR= " & merch
			set rsZ = ObjConnectionExecute(sql)
			if Request("S" & rs("Service") ) = "Yes"  then
				if rsZ.BOF and rsZ.EOF then ' insert record
					sql = "INSERT INTO [priceCompareHaendler_Services] ( IDNR, ServiceNr ) " & _
						  " Values( " & merch & "," & rs("Nr") & ")"
					ObjConnectionExecute(sql)
				end if 'else Doesn't need update
			else
				if rsZ.BOF and rsZ.EOF then ' delete record
					'Doesn't need update
				else
					sql = "DELETE FROM [priceCompareHaendler_Services] WHERE ServiceNr= " & rs("Nr") & " and IDNR= " & merch
					ObjConnectionExecute(sql)
				end if		
			end if
			rs.MoveNext
		wend 
		'END Services	
		
		
		'START LieferungBedingungen
		sql = " SELECT  * FROM grLieferungBedingungen"
		set rs = ObjConnectionExecute(sql)

		while not rs.EOF 
			sql = " SELECT * FROM [priceCompareHaendler_Lieferungbedingungen] WHERE BedingungNr= " & rs("Nr") & " and IDNR= " & merch
			set rsZ = ObjConnectionExecute(sql)
			if Request("L"&rs("Bedingung") ) = "Yes"  then
				if rsZ.BOF and rsZ.EOF then ' insert record
					sql = "INSERT INTO [priceCompareHaendler_Lieferungbedingungen] ( IDNR,BedingungNr ) " & _
						  " Values( " & merch & "," & rs("Nr") & ")"
					'NextId("[priceCompareHaendler_Zahlungsbedingungen]","ID") & _
					ObjConnectionExecute(sql)
				end if 'else Doesn't need update
			else
				if rsZ.BOF and rsZ.EOF then ' delete record
					'Doesn't need update
				else
					sql = "DELETE FROM [priceCompareHaendler_Lieferungbedingungen] WHERE BedingungNr= " & rs("Nr") & " and IDNR= " & merch
					ObjConnectionExecute(sql)
				end if		
			end if
			rs.MoveNext
		wend 
		'END Zahlungsbedingungen							
				
				
		sql = " SELECT * FROM grZahlungsmethode "
		set rs = ObjConnectionExecute(sql)
		while not rs.EOF 
			sql = " SELECT * FROM [priceCompareHaendler_Zahlungsmethoden] WHERE methode='" & rs("methode") & "' and IDNR= " & merch
			set rsZ = ObjConnectionExecute(sql)
			if Request("ZM"&rs("Methode") ) = "Yes"  then
				if rsZ.BOF and rsZ.EOF then ' insert record
					sql = "INSERT INTO [priceCompareHaendler_Zahlungsmethoden] ( IDNR,Methode ) " & _
						  " Values( " & merch & ",'" & rs("Methode") & "')"
					ObjConnectionExecute(sql)
					'& NextId("[priceCompareHaendler_Zahlungsmethoden]","ID") & _
					end if 'else Doesn't need update
			else
				if rsZ.BOF and rsZ.EOF then ' delete record
					'Doesn't need update
				else
					sql = "DELETE FROM [priceCompareHaendler_Zahlungsmethoden] WHERE Methode Like '" & rs("Methode") & "' and IDNR= " & merch
					ObjConnectionExecute(sql)
				end if		
			end if
			rs.MoveNext
		wend 
	end if	%>
	<form action="adminMerchantsPayment.asp?merch=<%=merch%>" method=post id=form2 name=form2>      
	<h3><b><center>Payment & Delivery settings for <%=merchname%></b></h3></center>
	<table align=center border=1 cellspacing=0 cellpadding=0 width="50%">
	<tr><td colspan=2 align=middle bgcolor=#d0d0d0> Current settings</td></tr>
	<tr><td colspan=2 align=middle bgcolor=#a0a0a0><IMG src="../images/dot.gif" width="1" height="1"></td></tr>
	<%sql = " SELECT delivery, deliveryPrice FROM priceCompareHaendler WHERE LieferantNr=" & merch
	set rs = ObjConnectionExecute(sql)	%>
	<tr><td align='right' width='60%'><b>Delivery [Active Store]</b></td>
	<td align='center' width='40%'>
		<INPUT TYPE="Radio" NAME="delivery" <%If rs("delivery") = true Then %>CHECKED<%End If%> VALUE="Yes">Yes
		<INPUT TYPE="Radio" NAME="delivery" <%If rs("delivery") = false Then %>CHECKED<%End If%> VALUE="No">No
	</td></tr>	
	<tr><td align='right'><b>Price of Delivery (&euro;)</b></td>
	<td align='center'><input name='deliveryPrice' style='width:100' value="<%=rs("deliveryPrice")%>"></td></tr>
	<%

	sql = " SELECT PaymentMode FROM priceCompareHaendler WHERE LieferantNr=" & merch
	set rs = ObjConnectionExecute(sql)
	Response.Write "<tr><td align=right><b>Payment Mode</b></td>"
	Response.Write "<td align=center><select name='PaymentMode' style='width:100'><option"
	if rs("PaymentMode") = "base" then 
		Response.Write " SELECTED"
	end if
	Response.Write ">base</option><option"
	if rs("PaymentMode") = "middle" then 
		Response.Write " SELECTED"
	end if
	Response.Write ">middle</option><option"
	if rs("PaymentMode") = "top" then 
		Response.Write " SELECTED"
	end if
	Response.Write ">top</option></select></td></tr></table><br>"
	Response.Write "<table align='center' border='0' cellspacing='0' cellpadding='0' width='90%'>"
	Response.Write "<tr><td valign='top' width='50%'>"
	%>
	<%
	'START Zahlungsbedingungen	
	%>
	<table align=center border=1 cellspacing=0 cellpadding=0 width='90%'>
	<tr>
	<td colspan=2 align=middle bgcolor=#d0d0d0><b> Zahlungsbedingungen </b></td></tr>
	<%
	sql = " SELECT  * FROM grZahlungsbedingung "
	set rs = ObjConnectionExecute(sql)
	while not rs.EOF 
		sql = " SELECT * FROM [priceCompareHaendler_Zahlungsbedingungen] WHERE Bedingung= " & rs("Nr") & " and IDNR= " & merch
		set rsZ = ObjConnectionExecute(sql)
		if rsZ.BOF and rsZ.EOF then
			check = false
		else
			check = true
		end if		
		%>
		<tr><td align=right><b><%=rs("Methode")%>:</b></td>
		<td align=center width="100">
			<INPUT TYPE="Radio" NAME="ZB<%=rs("Methode")%>" <%If check = true Then %>CHECKED<%End If%> VALUE="Yes">Yes
			<INPUT TYPE="Radio" NAME="ZB<%=rs("Methode")%>" <%If check = false Then %>CHECKED<%End If%> VALUE="No">No
		</td></tr><%
		rs.MoveNext
	wend
	%>
	</table>
	<%
	'END Zahlungsbedingungen	
	%>
	
		<%
	'START Services	
	%>
	<table align=center border=1 cellspacing=0 cellpadding=0 width='90%'>
	<tr>
	<td colspan=2 align=middle bgcolor=#d0d0d0><b> Services </b></td></tr>
	<%
	sql = " SELECT * FROM grServices"
	set rs = ObjConnectionExecute(sql)
	while not rs.EOF 
		sql = " SELECT * FROM [priceCompareHaendler_Services] WHERE ServiceNr= " & rs("Nr") & " and IDNR= " & merch
		set rsZ = ObjConnectionExecute(sql)
		if rsZ.BOF and rsZ.EOF then
			check = false
		else
			check = true
		end if		
		%>
		<tr><td align=right><b><%=rs("Service")%>:</b></td>
		<td align=center width="100">
			<INPUT TYPE="Radio" NAME="S<%=rs("Service")%>" <%If check = true Then %>CHECKED<%End If%> VALUE="Yes">Yes
			<INPUT TYPE="Radio" NAME="S<%=rs("Service")%>" <%If check = false Then %>CHECKED<%End If%> VALUE="No">No
		</td></tr><%
		rs.MoveNext
	wend
	%>
	</table>
	<%
	'END Services	
	%>
	
	
		<%
	'START LieferungBedingungen	
	%>
	<table align=center border=1 cellspacing=0 cellpadding=0 width='90%'>
	<tr>
	<td colspan=2 align=middle bgcolor=#d0d0d0><b> LieferungBedingungen </b></td></tr>
	<%
	sql = " SELECT  * FROM grLieferungBedingungen"
	set rs = ObjConnectionExecute(sql)
	while not rs.EOF 
		sql = " SELECT * FROM [priceCompareHaendler_Lieferungbedingungen] WHERE BedingungNr= " & rs("Nr") & " and IDNR= " & merch
		set rsZ = ObjConnectionExecute(sql)
		if rsZ.BOF and rsZ.EOF then
			check = false
		else
			check = true
		end if		
		%>
		<tr><td align=right><b><%=rs("Bedingung")%>:</b></td>
		<td align=center width="100">
			<INPUT TYPE="Radio" NAME="L<%=rs("Bedingung")%>" <%If check = true Then %>CHECKED<%End If%> VALUE="Yes">Yes
			<INPUT TYPE="Radio" NAME="L<%=rs("Bedingung")%>" <%If check = false Then %>CHECKED<%End If%> VALUE="No">No
		</td></tr><%
		rs.MoveNext
	wend
	%>
	</table>
	<%
	'END LieferungBedingungen	
	%>
	
	</td><td valign='top' width='50%'>
	<table align='center' border='1' cellspacing='0' cellpadding='0' width='90%'>
	<tr>
	<td colspan=2 align=middle bgcolor=#d0d0d0><b> Zahlungsmethoden </b></td></tr>
	<%

	sql = " SELECT * FROM grZahlungsmethode "
	set rs = ObjConnectionExecute(sql)
	while not rs.EOF 
		sql = " SELECT * FROM [priceCompareHaendler_Zahlungsmethoden] WHERE methode='" & rs("methode") & "' and IDNR= " & merch
		set rsZ = ObjConnectionExecute(sql)
		if rsZ.BOF and rsZ.EOF then
			check = false
		else
			check = true
		end if%>
		<tr><td align='right'><b><%=rs("Methode")%>:</b></td>
		<td align='center' width="100">
			<INPUT TYPE="Radio" NAME="ZM<%=rs("Methode")%>" <%If check = true Then %>CHECKED<%End If%> VALUE="Yes">Yes
			<INPUT TYPE="Radio" NAME="ZM<%=rs("Methode")%>" <%If check = false Then %>CHECKED<%End If%> VALUE="No">No
		</td></tr><%
		rs.MoveNext
	wend
	rsZ.close
	set rsZ = nothing
	%></table></td></tr></table><BR><%
	Response.Write "<p align='center'>"
	Response.Write "<input type='submit' value='Update' id='Submit1' name='UpdateButton'></p>"
	sql = "SELECT Web FROM lieferantenAdressen WHERE IDNR = " & merch
	set rs = ObjConnectionExecute(sql)
	Response.Write "<p align='center'>Store URL: <a href=""" & rs("Web") & """>" & rs("Web") & "</a></p></form>"
end if	
rs.close
set rs = nothing
call drawWindowPart2("Admin Merchants Payment Settings","","state",butArr) %>

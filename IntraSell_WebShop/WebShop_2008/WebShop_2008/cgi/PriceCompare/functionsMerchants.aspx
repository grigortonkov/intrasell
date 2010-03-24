<script language="VB" runat="server">  

    '******************************************************************
    ' Function [Name]
    ' Description []
    ' Autor: 
    ' Changes: 
    '******************************************************************
    Function makeMerchantView(ByVal merchantId)
        If merchantId = "" Then
            makeMerchantView = ""
            Exit Function
        End If
  
        Dim sql, rs
        sql = " SELECT LieferantNr, Firma, Name, Stars, PaymentMode, Web  " & _
        " FROM lieferantenAdressen INNER JOIN priceCompareHaendler ON " & _
        " (priceCompareHaendler.LieferantNr = lieferantenAdressen.IDNR) " & _
        " AND (lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNr) " & _
        " WHERE LieferantNr = " & merchantId
        'Response.Write sql	 	 
        rs = objConnectionExecute(sql)
        If rs.EOF Then
            makeMerchantView = "N/A"
            Exit Function
        End If
        Dim stars : stars = rs("stars")
        Dim i, starshtml
        For i = 1 To CInt(stars)
            starshtml = "*" & starshtml
        Next
        Dim html '<td width=50>" & starshtml & "</td>" & _ 
        html = "<table border=0><tr><td>"
        html = html & "<a href=""default.aspx?pageToShow=LieferantenInformationen&MERCHANT_HOME=" & rs("web") & "&merchantId=" & merchantId & """ target=""_new"">"
	
        'LOGO VIEW 
        'click on logo goes directly to the merchant homepage
        If LCase(rs("PaymentMode")) = "top" Then
            html = html & "<img border=""0"" _width=100 _height=25 alt=""" & rs("Firma") & """ src=""../merchantLogos/" & rs("LieferantNr") & ".jpg"">"
        End If
        'BOLD VIEW 
        If LCase(rs("PaymentMode")) = "middle" Then html = html & "<b>" & rs("Firma") & "</b>"
	
        'ONLY COMPANY NAME
        If LCase(rs("PaymentMode")) = "base" Then html = html & rs("Firma")

	
        html = html & "</a>"
        'html = html & " <a href=""cgi/priceCompare/merchantPage.asp?merchantId=" & merchantID & """>info</a>" 
        html = html & " <a href=""default.aspx?pageToShow=LieferantenInformationen&merchantId=" & merchantId & """>info</a>"
    
        'TODO: not needed now
        'if rs("web") <> "" then html = html & " <a href=""merchantPage.asp?MERCHANT_HOME="& rs("web") &"&merchantId=" & merchantID & """>home</a>" 
        html = html & "</td></tr></table>"
    
        makeMerchantView = html
        rs.close()
        'write log for statistics 
        '   sql = "INSERT INTO login(PATH_TRANSLATED,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER)  VALUES " & _
        '		 "('showMerchantAsFeaturedMerchant?merchantId=" & merchantID & "','" & _ 
        '          Request.ServerVariables("REMOTE_ADDR ") & " ','" & _
        '		  Request.ServerVariables("REMOTE_HOST") & "','" & _
        '		  Request.ServerVariables("REMOTE_USER") & "')"
        '	objConnectionExecute(sql)	   
    End Function


    Function makeMerchantViewBewertung(ByVal merchantId)
        If merchantId = "" Then
            makeMerchantViewBewertung = ""
            Exit Function
        End If
  
        Dim sql, rs
        sql = " SELECT LieferantNr, Firma, Name, Stars, PaymentMode, Web  " & _
        " FROM lieferantenAdressen INNER JOIN priceCompareHaendler ON " & _
        " (priceCompareHaendler.LieferantNr = lieferantenAdressen.IDNR) " & _
        " AND (lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNr) " & _
        " WHERE LieferantNr = " & merchantId
        'Response.Write sql	 	 
        rs = objConnectionExecute(sql)
        If rs.EOF Then
            makeMerchantViewBewertung = "N/A"
            Exit Function
        End If
   
        Dim stars : stars = rs("stars")
   
        Dim i, starshtml
        'for i = 1 to cint(stars)  
        '   starshtml = "*" & starshtml
        'next   
   
        starshtml = makeBewertungStarsMerchant(CDbl(stars))
    
        makeMerchantViewBewertung = starshtml & "<br><font color='gray'>Bewertungen</font>"
    End Function


    '==========================================================================================
    ' creates image html for the product "bewertung" 
    '==========================================================================================
    Function makeBewertungStarsMerchant(ByVal points)

        If points - Math.Round(points, 0) <= 0.25 Or Math.Round(points, 0) - points > 0.75 Then
            points = Math.Round(points, 0)
        Else
            points = Int(points) + 0.5
        End If
            
        Dim imageName : imageName = "" & Replace(Math.Round(points, 1), ".", ",")
        makeBewertungStarsMerchant = "<img alt=""" & points & " Points"" src=""skins/skin" & SkinNumber & "/images/imagesStars/" & imageName & ".gif"">"
    
    End Function


    '******************************************************************
    ' Function [makeMerchantSimpleView]
    ' Description Merchant view for the Featured merchant Table + Log entry
    ' Autor: 
    ' Changes: 
    '******************************************************************
    Function makeMerchantSimpleView(ByVal merchantId)
        'Response.Write "Merchant ..."
        If merchantId = "" Then
            makeMerchantSimpleView = "N/A"
            Exit Function
        End If
  
        Dim sql, rs
        sql = " SELECT LieferantNr, Firma, Name, Stars, PaymentMode, Web  " & _
        " FROM lieferantenAdressen INNER JOIN priceCompareHaendler ON " & _
        " (priceCompareHaendler.LieferantNr = lieferantenAdressen.IDNR) " & _
        " AND (lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNr) " & _
        " WHERE LieferantNr = " & merchantId
        ' Response.Write sql	 	 
  
        rs = objConnectionExecute(sql)
        If rs.EOF Then
            makeMerchantSimpleView = "N/A"
            Exit Function
        End If
        Dim stars : stars = rs("stars")
        Dim i, starshtml
        For i = 1 To stars
            starshtml = "*" & starshtml
        Next
        Dim html
        html = "<table border=0><tr><td>" & _
               " <a href=""cgi/priceCompare/merchantPage.asp?MERCHANT_HOME=" & rs("web") & "&merchantId=" & merchantId & """ target=""_new"">" & rs("Firma") & "</a>" & _
               " <a href=""cgi/priceCompare/merchantPage.asp?merchantId=" & merchantId & """>info</a>"
        html = html & "</td></tr></table>"
    
        makeMerchantSimpleView = html
        rs.close()
        'write log for statistics 
        sql = "INSERT INTO login(PATH_TRANSLATED,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER)  VALUES " & _
        "('showMerchantAsFeaturedMerchant?merchantId=" & merchantId & "','" & _
               Request.ServerVariables("REMOTE_ADDR ") & " ','" & _
         Request.ServerVariables("REMOTE_HOST") & "','" & _
         Request.ServerVariables("REMOTE_USER") & "')"
        objConnectionExecute(sql)
    End Function



    '******************************************************************
    ' Function [Name]
    ' Description []
    ' Autor: 
    ' Changes: 
    '******************************************************************
    Function makeManufacturerView(ByVal merchantId)
        'makeManufacturerView = makeMerchantView(merchantId)
        makeManufacturerView = tablevalue("lieferantenAdressen", "IdNR", merchantId, "Firma")
    End Function


    '******************************************************************
    ' Function [Name]
    ' Description []
    ' Autor: 
    ' Changes: 
    '******************************************************************
    Function makeMerchantViewWithBanner(ByVal merchantId)
    End Function



    '******************************************************************
    ' Function [Name]
    ' Description []
    ' Autor: 
    ' Changes: 
    '******************************************************************
    Function makeMerchantViewWithBannerAndSlogan(ByVal merchantId)
    End Function

    '******************************************************************
    ' Function [Name]
    ' Description []
    ' Autor: 
    ' Changes: 
    ' parameters 
    ' filename - physical filename on server
    ' merchantId - merchantid 
    ' importfunction - name of function wich must be used to import the file, if no 
    '     importfunction set, then take default function 
    '******************************************************************
    Function importPriceList(ByVal filename, ByVal merchantId, ByVal importfunction)
    End Function

    '******************************************************************
    ' Function [Name]
    ' Description [deletes the merchant and all depending information, files and so on ]
    ' Autor: 
    ' Changes: 
    '******************************************************************
    Function deleteMerchant(ByVal merchantId)

    End Function

    '******************************************************************
    ' Function [Name]
    ' Description [activates or deactivates the merchant for uncertain time,
    '             the merchant cannot make anything on the site ]
    ' Autor: 
    ' Changes: 
    '******************************************************************
    Function deactivateMerchant(ByVal merchantId)
    End Function
    Function activateMerchant(ByVal merchantId)
    End Function

 
    Function getSQLForFeaturedMerchants(ByVal catList)
        getSQLForFeaturedMerchants = " SELECT priceCompareHaendler.LieferantNr, lieferantenAdressen.Firma, lieferantenAdressen.Name " & _
        " FROM priceCompareCatTopHandlers INNER JOIN (lieferantenAdressen " & _
        " INNER JOIN priceCompareHaendler ON (priceCompareHaendler.LieferantNr = lieferantenAdressen.IDNR) AND " & _
        " (lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNr)) ON priceCompareCatTopHandlers.LieferantNr = priceCompareHaendler.LieferantNr " & _
        " WHERE priceCompareCatTopHandlers.CatID in (" & catList & ")" & _
        " GROUP BY priceCompareHaendler.LieferantNr, lieferantenAdressen.Firma, lieferantenAdressen.Name " & _
        " ORDER BY lieferantenAdressen.Firma"
    End Function
    '****************************************************************************
    ' statistics for the most clicked merchants by category 
    '****************************************************************************
    Function showFeaturedMerchants(ByVal ArtKatNr)
        Dim MAX_PRODUCTS : MAX_PRODUCTS = 5
        Dim sql
        Dim html ': html = "Featured Merchants"
        sql = getSQLForFeaturedMerchants(ArtKatNr)
        'Response.Write sql
        Dim rs : rs = objConnectionExecute(sql)
        Dim i : i = 0
        Dim alreadyUsed : alreadyUsed = True
        Dim listedMerchants : listedMerchants = ""
        If rs.eOF Then
            sql = getSQLForFeaturedMerchants(ArtKatNr) 'makeSuperCategoriesList(ArtKatNr))
            rs = objConnectionExecute(sql)
            'Response.Write sql
        End If
        While Not rs.EOF And i < MAX_PRODUCTS
            If InStr(listedMerchants, "," & rs("LieferantNr")) <= 0 Then
                html = html & makeMerchantSimpleView(rs("LieferantNr"))
                listedMerchants = listedMerchants & "," & rs("LieferantNr")
                i = i + 1
            End If
            rs.movenext()
            If rs.eOF And i < MAX_PRODUCTS And Not alreadyUsed Then 'search again in super cats 
                sql = getSQLForFeaturedMerchants(ArtKatNr) 'makeSuperCategoriesList(ArtKatNr))
                'Response.Write sql
                rs = objConnectionExecute(sql)
                alreadyUsed = True
		
            End If
		
		
		
        End While
        rs.close()
        showFeaturedMerchants = html
    End Function

    '****************************************************************************
    'listDeliveryMethods - listes the delivery methods for some merchant
    '****************************************************************************
    Function listDeliveryMethods(ByVal MerchantId)
        Dim rs, sql, strAll
        sql = "SELECT [priceCompareHaendler_Zahlungsbedingungen].IDNR, grZahlungsbedingung.Methode " & _
              " FROM grZahlungsbedingung INNER JOIN [priceCompareHaendler_Zahlungsbedingungen] " & _
              " ON grZahlungsbedingung.Nr = [priceCompareHaendler_Zahlungsbedingungen].Bedingung " & _
              " WHERE IDNR = " & MerchantId
        rs = objConnectionExecute(sql)
         
        While Not rs.EOF
            strAll = strAll & ", " & rs("Methode")
            rs.moveNext()
        End While
        If strAll = "" Then strAll = "xx "
        listDeliveryMethods = Mid(strAll, 3)
    End Function

    Function listPaymentMethods(ByVal MerchantId)
        Dim rs, sql, strAll
        sql = "SELECT * FROM [priceCompareHaendler_Zahlungsmethoden] " & _
              " WHERE IDNR = " & MerchantId
        rs = objConnectionExecute(sql)
         
        While Not rs.EOF
            strAll = strAll & ", " & rs("Methode")
            rs.moveNext()
        End While
        If strAll = "" Then strAll = "xx "
        listPaymentMethods = Mid(strAll, 3)

    End Function


    '*************************************************************************
    'printAddress
    '*************************************************************************
    Function printAddressLieferanten(ByVal kdnr)

        printAddressLieferanten = ""
        Exit Function
        Dim rsKUND
        Dim sql
        sql = "Select * from lieferantenAdressen where IDNR=" & kdnr
        rsKUND = objConnectionExecute(sql)
        Dim PLZ, Ort, Landname
        PLZ = TableValue("grPLZ", "IDNR", rsKUND("PLZ"), "PLZ")
        Ort = TableValue("grPLZ", "IDNR", rsKUND("PLZ"), "Ort")
        Landname = TableValue("grLand", "IdNr", rsKUND("Land"), "Name")
 
        If Trim(rsKUND("Firma")) <> "" Then
            Response.Write("Fa. " & rsKUND("Firma") & " <br>")
        End If
        '=rsKUND ("Anrede")%> <%'=rsKUND ("Name")<br>%> 
        Response.Write(rsKUND("Adresse") & "<br>")
        Response.Write(PLZ & "-" & Ort & "<br>")
        Response.Write(Landname & "<br>")
        Response.Write("Tel:" & rsKUND("Tel") & "<br>")

    End Function

    '
    ' searches for merchants of a productin a zip region 
    '
    Function findMerchants(ByVal bundesland, ByVal ort, ByVal plz, ByVal artnr, ByVal searchWideArea)
        If bundesland = "" And ort = "" And plz = "" Then
            Call drawErrorBox("Fehler", "Sie haben keine Kriterien eingegeben!", "", "")
            Response.End()
        End If
        Dim sql
        sql = " SELECT lieferantenAdressen.*, grPLZ.Ort, grPLZ.Land, grPLZ.PLZ, grPLZ_1.PLZ " & _
           " FROM ((grPLZ INNER JOIN lieferantenAdressen ON grPLZ.IdNr = lieferantenAdressen.PLZ) " & _
              " LEFT JOIN priceCompareNextPLZ ON grPLZ.IdNr = priceCompareNextPLZ.PLZID) " & _
              " LEFT JOIN grPLZ AS grPLZ_1 ON priceCompareNextPLZ.NextPLZID = grPLZ_1.IdNr " & _
              " WHERE 1=1 "
		      
        If plz <> "" Then
            sql = sql & " AND (grPLZ.PLZ=" & plz & " OR grPLZ_1.PLZ=" & plz & ")"
        End If
		
        If bundesland <> "" Then
            sql = sql & " AND grPLZ.PLZ In (Select PLZ from grPLZ where BLand Like '" & bundesland & "')"
        End If
		
        If ort <> "" Then
            sql = sql & "AND grPLZ.PLZ In (Select PLZ from grPLZ where Ort Like '" & ort & "')"
        End If
		    
        'Response.Write "sql=" & sql		 
        Dim rs : rs = objConnectionExecute(sql)
        If rs.eof Then
            Call drawErrorBox("Fehler", "Es sind uns leider keine Zulieferer in diesem Gebiet bekannt.", "", "")
            Exit Function
        End If
		 
        Dim butArr(0, 0)
        Call drawWindowPart1("Liste Zulieferer in PLZ [" & plz & "] und Umgebung:", " ", "", butArr)
        '%>				
        '<table border="0" cellspacing="0">
        '<tr>
        '<th width="177" align="center">Name</th>
        '<th width="166" align="center">Adresse</th>
        '<!--<th width="269" align="center">Weg Beschreibung (route.web.de)</th>-->
        '</tr>
        '<%
        '      Dim i : i = 0
        '      While Not rs.EOF
        '		%><tr><td width="177"> <%=makeMerchantView(rs("IDNR")) %> 
        '		</td><td width="166"><% 
        '          Call printAddressLieferanten(rs("IDNR"))
        '		%>
        '		</td><td>

        '		<!-- WEB.DE Routenplanung Beginn -->
        '		<!--
        '		<FORM TARGET="_blank" ACTION="http://route.web.de/Europa/" METHOD="GET">
        '		<INPUT TYPE=HIDDEN NAME="tocity" VALUE="Linz (A)">
        '		<INPUT TYPE=HIDDEN NAME="tostreet" VALUE="Urfahr">
        '		<INPUT TYPE=HIDDEN NAME="tolat" VALUE="483132">
        '		<INPUT TYPE=HIDDEN NAME="tolon" VALUE="142806">
        '		<TABLE BORDER="1" CELLPADDING="4" CELLSPACING="0">
        '		<TR BGCOLOR="#CC510A">
        '		<TD><FONT FACE="Arial, Helvetica" SIZE="-1" COLOR="#FFFFFF"><B> <B>Routenplanung:</B><BR>
        '		 Ihr Weg nach <B>Linz (A), Urfahr</B></FONT></TD>
        '		</TR>
        '		<TR>
        '		<TD ALIGN="CENTER">
        '		<TABLE BORDER="0" CELLPADDING="2" CELLSPACING="1" WIDTH="100%">
        '		<TR>
        '		<TD BGCOLOR="#FFD8BF"><FONT FACE="Arial, Helvetica" SIZE="-2"> <B>Ort:</B> </FONT></TD>
        '		<TD BGCOLOR="#EFEFEF"><FONT FACE="Arial, Helvetica" SIZE="-1"> <INPUT TYPE="text" NAME="fromcity" VALUE=""></FONT></TD>
        '		<TD ALIGN="CENTER" ROWSPAN="2" VALIGN="MIDDLE" BGCOLOR="#EFEFEF">
        '		<INPUT TYPE="IMAGE" SRC="http://img.web.de/web/img/v4/route/napping.gif" WIDTH="144" HEIGHT="40" BORDER="0" ALT="Routenplanung starten">
        '		</TD>
        '		</TR><TR>
        '		<TD ALIGN="LEFT" BGCOLOR="#FFD8BF"><FONT FACE="Arial, Helvetica" SIZE="-2"> <B>Stadtteil:</B> </FONT></TD>
        '		<TD BGCOLOR="#EFEFEF"><FONT FACE="Arial, Helvetica" SIZE="-1"> <INPUT TYPE="text" NAME="fromstreet" VALUE=""></FONT></TD>
        '		</TR>
        '		</TABLE>
        '		</TD>
        '		</TR>
        '		</TABLE>
        '		</FORM>
        '		-->
        '		<!-- WEB.DE Routenplanung Ende -->
        '		</td></tr>
        '		<%
        '          rs.movenext()
        '          i = i + 1
        '      End While
        '	%></table><%
        '      rs.close()
        Call drawWindowPart2("Liste Zulieferer in PLZ [" & plz & "] und Umgebung:", " ", "", butArr)
    End Function




    '********************************************************************************************
    ' Getter and Setter for the Haendler Vars 
    '********************************************************************************************
    Function varValueMerchant(ByVal lieferantNr, ByVal VarNAme)
        Dim sql : sql = "select * from priceCompareHaendlerOfVars where LieferantNr= " & _
                       lieferantNr & " And [Name] Like '" & VarNAme & "'"
        Dim rs : rs = objConnectionExecute(sql)
        Dim UrlShop
        If rs.EOF Then
            Response.Write("Die Variable [" & VarNAme & "] ist nicht definiert für Haendler # " & lieferantNr & "!")
            varValueMerchant = ""
        Else
            varValueMerchant = rs("Wert")
        End If
    End Function

    '********************************************************************************************
    ' Getter and Setter for the Haendler Vars 
    '********************************************************************************************

    Function setVarValueMerchant(ByVal lieferantNr, ByVal VarNAme, ByVal VarValue)
        Dim sql : sql = "select * from priceCompareHaendlerOfVars where LieferantNr= " & _
                       lieferantNr & " And [Name] Like '" & VarNAme & "'"
        Dim rs : rs = objConnectionExecute(sql)
        Dim UrlShop
        If rs.EOF Then
            sql = "INSERT INTO priceCompareHaendlerOfVars(LieferantNr, [NAme], [Wert]) Values (" & lieferantNr & ",'" & VarNAme & "','" & VarValue & "')"
        Else
            sql = "UPDATE priceCompareHaendlerOfVars Set [Wert] = '" & VarValue & "' Where [Name] like '" & VarNAme & "' AND LieferantNr=" & lieferantNr
        End If
        'Response.write sql
        objConnectionExecute(sql)
    End Function

</script>


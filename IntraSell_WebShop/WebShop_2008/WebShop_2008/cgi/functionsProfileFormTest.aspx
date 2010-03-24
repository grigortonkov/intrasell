 
<br>
<br>
<center>
    <table id="ProfileTable" width="450" border="1" cellspacing="3" cellpadding="3" bordercolor="#CCCCCC"
        style="border-collapse: collapse" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"
        bgcolor="#F3F3F3">
        <input type="hidden" name="Branche<%=typeOfAddress%>" value="0"><!-- simple account  -->
        <%If typeOfAddress = ACCOUNT Then%>
        <tr>
            <th colspan="3" align="center" width="100%" bgcolor="#FFCF00" height="18">
                &nbsp;<%=getTranslation("Anmeldeinformation")%>
            </th>
        </tr>
        <tr>
            <td align="right" class="style1">
                <span style="font-weight: 400"><font size="1">*
                    <%=getTranslation("Email")%>&nbsp;&nbsp; </font></span>
            </td>
            <td>
                <font><font size="1"><b>&nbsp;<input type="text" name="Email<%=typeOfAddress%>" size="20"
                    value="<%=Email%>">
                    <%If withCheck And Len(Email) < 5 Then%></b></font><b><font size="1" id="ErrorMessage"
                        color="red">(!)</a><%End If%>
                    </font></b></font>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                <span style="font-weight: 400"><font size="1">*
                    <%=getTranslation("Emailwiederholung")%>&nbsp;&nbsp; </font></span>
            </td>
            <td>
                &nbsp;<input type="text" name="Emailwiederholung<%=typeOfAddress%>" size="20" value="<%=Emailwiederholung%>">
                <%If withCheck And Len(Emailwiederholung) < 5 Then%></b></font><b><font size="1"
                    id="ErrorMessage" color="red">(!)</a><%End If%>
            </td>
        </tr>
        <tr>
            <%If Not fill Then%>
            <tr>
                <td align="right" class="style1">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    <span style="font-weight: 400"><font size="1">*
                        <%=getTranslation("Passwort")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    &nbsp;<input type="password" name="Passwort<%=typeOfAddress%>" size="20">
                    <%If withCheck And Len(Passwort) < PASSWORD_LENGTH Then%></b></font><b><font size="1"
                        id="ErrorMessage" color="red">(!)</a><%End If%>
                        <%=getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")%>
                </td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    <span style="font-weight: 400"><font size="1">*<%=getTranslation("Passwortbest&auml;tigung")%>&nbsp;&nbsp;
                    </font></span>
                </td>
                <td>
                    &nbsp;<input type="password" name="PasswortII<%=typeOfAddress%>" size="20">
                    <%If withCheck And Len(PasswortII) < PASSWORD_LENGTH Then%></b></font><b><font size="1"
                        id="ErrorMessage" color="red">(!)</a><%End If%>
                        <%=getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")%>
                        <br />
                        <%=getTranslation("Tipp: ''%'' und ''*'' sind als Sonderzeichen nicht erlaubt!")%>
                </td>
            </tr>
            <% Else%>
            <tr>
                <td colspan="2" align="center" width="350">
                    <span style="font-weight: 400"><font size="1">
                        <%=getTranslation("To Change Password Click")%>
                        <a href="default.aspx?PageToShow=ChangePassword">HERE</a>!</font></span>
                </td>
                <input type="hidden" name="Passwort<%=typeOfAddress%>" size="20" value="<%=Passwort%>">
                <input type="hidden" name="PasswortII<%=typeOfAddress%>" size="20" value="<%=PasswortII%>">
            </tr>
            <%End If%>
            <%End If%>
    </table>
    &nbsp;
    <br />
    <table id="ProfileTable" border="1" cellspacing="1" style="border-collapse: collapse"
        cellpadding="3" width="450" bgcolor="#F3F3F3" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF">
        <input type="hidden" name="Redirection" value="<%=Request("Redirection")%>">
        <tr>
            <th colspan="3">
                <%If typeOfAddress = 1 Then%><%=getTranslation("Ihr Account")%><br />
                <%End If%>
                <%If typeOfAddress = 2 Then%><%=getTranslation("Lieferadresse")%><br />
                <%=getTranslation("(nur wenn Lieferadresse vom Account abweicht)")%><%End If%>
                <%If typeOfAddress = 3 Then%><%=getTranslation("Rechnungsadresse")%><br />
                <%=getTranslation("(nur wenn Rechnungsadresse vom Account abweicht)")%><%End If%>
            </th>
        </tr>
        <tr>
            <td align="right" width="138">
                <span style="font-weight: 400"><font size="1">
                    <%=getTranslation("Firma")%>&nbsp;&nbsp; </font></span>
            </td>
            <td>
                <input type="text" name="Firma<%=typeOfAddress%>" size="20" value="<%=Firma%>">
            </td>
        </tr>
        <tr>
            <td align="right" width="138">
                <span style="font-weight: 400"><font size="1">
                    <%=getTranslation("UID")%>&nbsp;&nbsp; </font></span>
            </td>
            <td>
                <input type="text" name="UID<%=typeOfAddress%>" size="20" value="<%=UID%>">
            </td>
        </tr>
        <tr>
            <td align="right" width="138">
                <span style="font-weight: 400"><font size="1">*
                    <%=getTranslation("Anrede")%>&nbsp;&nbsp; </font></span>
            </td>
            <td width="281">
                <font size="1">
                    <select name="Anrede<%=typeOfAddress%>" size="1">
                        <option>
                            <%=anrede%></option>
                        <option>
                            <%=getTranslation("Frau")%></option>
                        <option>
                            <%=getTranslation("Herr")%></option>
                    </select>
                    <%If withCheck And Len(Anrede) < 3 Then%><font color="red">(!)</font><%End If%>
                </font>
            </td>
        </tr>
        <tr>
            <td align="right" width="138">
                <span style="font-weight: 400"><font size="1">
                    <%=getTranslation("Titel")%>&nbsp;&nbsp; </font></span>
            </td>
            <td>
                <input type="text" name="Titel<%=typeOfAddress%>" size="20" value="<%=Titel%>">
            </td>
        </tr>
        <tr>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">*
                        <%=getTranslation("Name")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    <input type="text" name="Name<%=typeOfAddress%>" size="20" value="<%=name%>">
                    <%If withCheck And Len(Name) < 3 Then%><font color="red">(!)</font><%End If%>
                </td>
            </tr>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">*
                        <%=getTranslation("Vorname")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    <font size="1">
                        <input type="text" name="Vorname<%=typeOfAddress%>" size="20" value="<%=vorname%>">
                        <%If withCheck And Len(vorName) < 3 Then%><font color="red">(!)</font><%End If%>
                    </font>
                </td>
            </tr>
            <% If typeOfAddress = ACCOUNT Then%>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">
                        <%=getTranslation("Geburtstag")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    <input type="text" name="Geburtstag<%=typeOfAddress%>" size="20" value="<%=Geburtstag%>">DD.MM.YYYY
                    <%If withCheck And Len(Geburtstag) < 3 Then%><%End If%>
                </td>
            </tr>
            <%End If%>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">*
                        <%=getTranslation("Strasse / Nr.")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    <input type="text" name="Strasse<%=typeOfAddress%>" size="20" value="<%=Strasse%>">
                    <%If withCheck And Len(Strasse) < 3 Then%><font color="red">(!)</font><%End If%>
                </td>
            </tr>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">*
                        <%=getTranslation("PLZ / Ort")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    <input type="text" name="PLZ<%=typeOfAddress%>" size="6" value="<%=PLZ%>">
                    <%If withCheck And Len(PLZ) < 4 Then%><font color="red">(!)</font><%End If%>
                    <input type="text" name="Ort<%=typeOfAddress%>" size="20" value="<%=ORT%>">
                    <%If withCheck And Len(Ort) < 2 Then%><font color="red">(!)</font><%End If%>
                </td>
            </tr>
            <!--
    <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" >* <%=getTranslation("Bundesland")%>&nbsp;&nbsp; </font></span></td>
	<td>
		<select name="BundesLand<%=typeOfAddress%>">
         <%call selectBundesLand(fill, bundesland)%> 
         </select> 
         <%if withCheck and len(bundesland)<1 then %><font color=red>(!)</font><%end if%>       
	</td>
  </tr>
  -->
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">*
                        <%=getTranslation("Land")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    <select name="Land<%=typeOfAddress%>">
                        <%Call selectLand(fill, land)%>
                    </select>
                    <%If withCheck And Len(land) < 1 Then%><font color="red">(!)</font><%End If%>
                    <% 'Response.Write "DEFAULT_LAND_NR=" & varValue("DEFAULT_LAND_NR")%>
                </td>
            </tr>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">*
                        <%=getTranslation("Tel")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    <input type="text" name="Tel<%=typeOfAddress%>" size="20" value="<%=Tel%>">
                    <%If withCheck And Len(Tel) < 5 Then%><font color="red">(!)</font><%End If%>
                </td>
            </tr>
            <%If Not typeOfAddress = ACCOUNT Then%>
            <tr>
                <td align="right" width="150">
                    <span style="font-weight: 400"><font size="1">*
                        <%=getTranslation("Email")%>&nbsp;&nbsp; </font></span>
                </td>
                <td>
                    <font><font size="1"><b>&nbsp;<input type="text" name="Email<%=typeOfAddress%>" size="20"
                        value="<%=Email%>">
                        <%If withCheck And Len(Email) < 5 Then%></b></font><b><font size="1" id="ErrorMessage"
                            color="red">(!)</a><%End If%>
                        </font></b></font>
                </td>
            </tr>
            <%End If%>
            <%If typeOfAddress = ACCOUNT Then%>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">
                        <%=getTranslation("Tel(abend)")%>&nbsp;&nbsp; </font></span>
                </td>
                <td width="281">
                    <input type="text" name="TelII<%=typeOfAddress%>" size="20" value="<%=TelII%>">
                </td>
            </tr>
            <%End If%>
            <%If typeOfAddress = ACCOUNT Then%>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">
                        <%=getTranslation("Fax")%>&nbsp;&nbsp; </font></span>
                </td>
                <td width="281">
                    <input type="text" name="Fax<%=typeOfAddress%>" size="20" value="<%=Fax%>">
                </td>
            </tr>
            <%End If%>
            <%If typeOfAddress = ACCOUNT Then%>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">
                        <%=getTranslation("Mobil")%>&nbsp;&nbsp; </font></span>
                </td>
                <td width="281">
                    <input type="text" name="Mobil<%=typeOfAddress%>" size="20" value="<%=Mobil%>">
                </td>
            </tr>
            <%End If%>
            <%If typeOfAddress = ACCOUNT Then%>
            <tr>
                <td align="right" width="138">
                    <span style="font-weight: 400"><font size="1">
                        <%=getTranslation("Web")%>&nbsp;&nbsp; </font></span>
                </td>
                <td width="281">
                    <input type="text" name="Web<%=typeOfAddress%>" size="20" value="<%=Web%>">
                </td>
            </tr>
            <%End If%>
            <%If Not fill Then%>
            <tr>
                <td align="right" width="350" colspan="2" bgcolor="#FFFFFF">
                    &nbsp;
                </td>
            </tr>
            <%If typeOfAddress = ACCOUNT Then%>
            <tr>
                <td align="right" width="350" colspan="2" bgcolor="#FFFFFF">
                    <p align="left">
                        &nbsp;
                        <input class="submit" type="CheckBox" checked name="IchWillNewsletter<%=typeOfAddress%>"
                            value="ON">
                        <%=getTranslation("Ich möchte Newsletter erhalten")%>
                </td>
            </tr>
            <%End If%>
            <tr>
                <td align="right" width="350" colspan="2" bgcolor="#FFFFFF">
                    <p align="left">
                    &nbsp;
                </td>
            </tr>
            <%End If%>
    </table>
</center>

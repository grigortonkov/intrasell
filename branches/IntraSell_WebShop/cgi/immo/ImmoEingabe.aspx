<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ImmoEingabe.aspx.vb" Inherits="WebShop.immoEingabe"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>immoEingabe</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body ms_positioning="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<TD style="WIDTH: 501px"><B><FONT face="Verdana" color="#980000" size="1">Objekt 
								inserieren&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Schritt 
								1/4)</FONT></B></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table3" cellSpacing="0" width="96%" border="1">
				<TR>
					<TH style="HEIGHT: 20px" bgColor="gainsboro">
						<P>Objektart und Nutzung</P>
					</TH>
				</TR>
				<TR>
					<TD style="WIDTH: 481px"><asp:radiobuttonlist id="rbTyp" runat="server" RepeatDirection="Horizontal" Height="8px" AutoPostBack="True" BorderStyle="None">
							<asp:ListItem Value="Wohnung">Wohnung</asp:ListItem>
							<asp:ListItem Value="Haus">Haus</asp:ListItem>
							<asp:ListItem Value="Grundst&#252;ck">Grundst&#252;ck</asp:ListItem>
							<asp:ListItem Value="Gewerbeobjekt">Gewerbeobjekt</asp:ListItem>
							<asp:ListItem Value="Parkplatz">Parkplatz</asp:ListItem>
						</asp:radiobuttonlist>&nbsp;
						<asp:requiredfieldvalidator id="validKategorie" runat="server" ControlToValidate="rbTyp" ErrorMessage="Bitte wählen!"></asp:requiredfieldvalidator><BR>
						<asp:radiobuttonlist id="rbNutzung" runat="server" RepeatDirection="Horizontal" Height="2px" AutoPostBack="True" BorderStyle="None" Enabled="False">
							<asp:ListItem Value="Miete">Miete</asp:ListItem>
							<asp:ListItem Value="Kauf">Kauf</asp:ListItem>
							<asp:ListItem Value="Pacht">Pacht</asp:ListItem>
						</asp:radiobuttonlist>&nbsp;
						<asp:requiredfieldvalidator id="validNutzung" runat="server" ControlToValidate="rbNutzung" ErrorMessage="Bitte wählen!"></asp:requiredfieldvalidator></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table7" cellSpacing="0" width="96%" border="1">
				<TR>
					<TH bgColor="gainsboro">
						Objektbezeichnung</TD>
					</TH>
				<TR>
					<TD>&nbsp;<asp:textbox id=txtBezeichnung runat="server" Text='<%# DataBinder.Eval(immoObjekt, "Tables[grArtikel].DefaultView.[0].Bezeichnung") %>' Width="320px">
						</asp:textbox><asp:requiredfieldvalidator id="validName" runat="server" ControlToValidate="txtBezeichnung" ErrorMessage="Objektbezeichnung fehlt!"></asp:requiredfieldvalidator></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table5" cellSpacing="0" width="96%" border="1">
				<TR>
					<TH bgColor="gainsboro">
						Objektadresse</TH></TR>
				<TR>
					<TD><asp:panel id="Panel1" runat="server" Width="100%" BorderStyle="None">
							<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR>
									<TD style="WIDTH: 162px; HEIGHT: 21px">
										<asp:label id="Label3" runat="server" Height="11px" Width="64px">Land:</asp:label></TD>
									<TD style="HEIGHT: 21px">
										<asp:DropDownList id="cbImmoLand" runat="server" AutoPostBack="True" Width="192px"></asp:DropDownList>
										<asp:RequiredFieldValidator id="validLand" runat="server" ErrorMessage="!" ControlToValidate="cbImmoLand"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 162px">
										<asp:label id="Label6" runat="server" Height="3px" Width="72px">Bundesland:</asp:label></TD>
									<TD>
										<asp:DropDownList id="cbImmoBundesland" runat="server" AutoPostBack="True" Width="192px"></asp:DropDownList>
										<asp:RequiredFieldValidator id="validBundesland" runat="server" ErrorMessage="!" ControlToValidate="cbImmoBundesland"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 162px">
										<asp:label id="Label7" runat="server" Height="3px" Width="56px">Bezirk:</asp:label></TD>
									<TD>
										<asp:DropDownList id="cbImmoBezirk" runat="server" Width="192px"></asp:DropDownList>
										<asp:RequiredFieldValidator id="validBezirk" runat="server" ErrorMessage="!" ControlToValidate="cbImmoBezirk"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 162px; HEIGHT: 18px" align="left">
										<asp:label id="lblObjektPLZ" runat="server" Height="6px" Width="24px">PLZ:</asp:label>
										<asp:textbox id="txtObjektPLZ" runat="server" Width="48px"></asp:textbox>&nbsp;
										<asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="!" ControlToValidate="txtObjektPLZ" ValidationExpression="\d{5}|\d{4}"></asp:RegularExpressionValidator>&nbsp;
										<asp:label id="lblObjektOrt" runat="server" Height="2px" Width="24px">Ort:</asp:label></TD>
									<TD style="HEIGHT: 18px">
										<asp:textbox id="txtObjektOrt" runat="server" Width="256px"></asp:textbox>&nbsp;
										<asp:RequiredFieldValidator id="validObjektOrt" runat="server" ErrorMessage="!" ControlToValidate="txtObjektOrt"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 162px">
										<asp:label id="lblObjektStrasse" runat="server" Height="7px" Width="56px">Strasse:</asp:label></TD>
									<TD>
										<asp:textbox id="txtObjektStrasse" runat="server" Width="256px"></asp:textbox></TD>
								</TR>
							</TABLE>
						</asp:panel></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table6" cellSpacing="0" width="96%" border="1">
				<TR>
					<TH style="HEIGHT: 20px" bgColor="gainsboro">
						Objekteigenschaften
					</TH>
				</TR>
				<TR>
					<TD><asp:panel id="paneWohnung" runat="server" Height="168px" Width="100%" Visible="False" Enabled="False" BorderStyle="None">
							<TABLE id="Table1" style="WIDTH: 384px; HEIGHT: 48px" cellSpacing="0" cellPadding="0" width="384" border="0">
								<TR>
									<TD style="WIDTH: 119px">
										<asp:Label id="lblImmoTyp" runat="server" Height="11px" Width="128px">Immobilien Typ:</asp:Label></TD>
									<TD>
										<asp:DropDownList id="cbImmoTyp" runat="server" Width="169px"></asp:DropDownList>
										<asp:RequiredFieldValidator id="validImmoTyp" runat="server" ErrorMessage="!" ControlToValidate="cbImmoTyp"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 119px">
										<asp:Label id="lblWohnflaeche" runat="server" Height="8px" Width="152px">Wohnfläche (m²):</asp:Label></TD>
									<TD>
										<asp:TextBox id="txtWohnflaeche" runat="server" Width="96px"></asp:TextBox>
										<asp:RequiredFieldValidator id="validWohnflaeche" runat="server" ErrorMessage="!" ControlToValidate="txtWohnflaeche"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 119px; HEIGHT: 19px">
										<asp:Label id="lblAnzahlzimmer" runat="server" Height="8px" Width="120px">Anzahl Zimmer:</asp:Label></TD>
									<TD style="HEIGHT: 19px">
										<asp:TextBox id="txtAnzahlzimmer" runat="server" Width="96px" ToolTip="1,2,3 usw."></asp:TextBox>
										<asp:RequiredFieldValidator id="validAnzahlzimmer" runat="server" ErrorMessage="!" ControlToValidate="txtAnzahlzimmer"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 119px">
										<asp:Label id="lblKaufpreis" runat="server" Height="3px" Width="128px">Kaufpreis (Euro):</asp:Label></TD>
									<TD>
										<asp:TextBox id="txtKaufpreis" runat="server" Width="96px"></asp:TextBox>
										<asp:RequiredFieldValidator id="validKaufpreis" runat="server" ErrorMessage="!" ControlToValidate="txtKaufpreis"></asp:RequiredFieldValidator>&nbsp;
										<asp:RangeValidator id="RangeValidatorKaufpreis" runat="server" ErrorMessage="RangeValidator" ControlToValidate="txtKaufpreis" MinimumValue="0" MaximumValue="9999999">!</asp:RangeValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 119px">
										<asp:Label id="lblMietpreis" runat="server" Height="11px" Width="128px">Mietpreis (Euro):</asp:Label></TD>
									<TD>
										<asp:TextBox id="txtMietpreis" runat="server" Width="96px"></asp:TextBox>
										<asp:RequiredFieldValidator id="validMietpreis" runat="server" ErrorMessage="!" ControlToValidate="txtMietpreis"></asp:RequiredFieldValidator>&nbsp;
										<asp:RangeValidator id="RangeValidatorMietpreis" runat="server" ErrorMessage="RangeValidator" ControlToValidate="txtMietpreis" MinimumValue="0" MaximumValue="9999">!</asp:RangeValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 119px">
										<asp:Label id="lblBetriebskosten" runat="server" Height="11px" Width="160px">Betriebskosten  (Euro):</asp:Label></TD>
									<TD>
										<asp:TextBox id="txtBetriebskosten" runat="server" Width="96px"></asp:TextBox>
										<asp:RequiredFieldValidator id="validBetriebskosten" runat="server" ErrorMessage="!" ControlToValidate="txtBetriebskosten"></asp:RequiredFieldValidator>&nbsp;
										<asp:RangeValidator id="RangeValidatorBetriebskosten" runat="server" ErrorMessage="RangeValidator" ControlToValidate="txtBetriebskosten" MinimumValue="0" MaximumValue="9999">!</asp:RangeValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 119px">
										<asp:Label id="lblGrundflaeche" runat="server" Height="3px" Width="136px">Grundfläche  (m²):</asp:Label></TD>
									<TD>
										<asp:TextBox id="txtGrundflaeche" runat="server" Width="96px"></asp:TextBox>
										<asp:RequiredFieldValidator id="validGrundflaeche" runat="server" ErrorMessage="!" ControlToValidate="txtGrundflaeche"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 119px">
										<asp:Label id="lblAnzahlstoeck" runat="server" Height="3px" Width="144px">Anzahl Stockwerke:</asp:Label></TD>
									<TD>
										<asp:TextBox id="txtAnzahlstoeck" runat="server" Width="96px" ToolTip="1,2,3 usw."></asp:TextBox>
										<asp:RequiredFieldValidator id="validAnzahlstoeck" runat="server" ErrorMessage="!" ControlToValidate="txtAnzahlstoeck"></asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 119px">
										<asp:Label id="lblVerwendungszweck" runat="server" Height="11px" Width="97px">Verwendungszweck:</asp:Label></TD>
									<TD>
										<asp:DropDownList id="cbVerwendungszweck" runat="server" Width="169px">
											<asp:ListItem Value="Zweck1">Zweck1</asp:ListItem>
											<asp:ListItem Value="Zweck2">Zweck2</asp:ListItem>
										</asp:DropDownList>
										<asp:RequiredFieldValidator id="validVerwendungszweck" runat="server" ErrorMessage="!" ControlToValidate="cbVerwendungszweck"></asp:RequiredFieldValidator></TD>
								</TR>
							</TABLE>
						</asp:panel></TD>
				</TR>
			</TABLE>
			<br>
			<table cellSpacing="0" cellPadding="0" width="96%" border="0">
				<tr>
					<td align="right"><asp:label id="Label1" runat="server" Width="77px" Visible="False">Anbieter Nr.:</asp:label><asp:textbox id="txtAnbieter" runat="server" Width="32px" Visible="False" Enabled="False"></asp:textbox>
						<asp:textbox id="txtArtNr" runat="server" Enabled="False" Width="32px" Visible="False"></asp:textbox><asp:radiobuttonlist id="rbHauptKategorie" runat="server" AutoPostBack="True" Width="124px" Visible="False" Enabled="False">
							<asp:ListItem Value="Bieten" Selected="True">Bieten</asp:ListItem>
						</asp:radiobuttonlist><asp:button id="btnSpeichern" runat="server" Text="speichern &amp; weiter" Width="180px"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

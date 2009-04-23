<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ImmoSuche.aspx.vb" Inherits="WebShop.ImmoSuche"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ImmoSuche</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD style="WIDTH: 501px"><B><FONT face="Verdana" color="#980000" size="2">Objekt&nbsp;suchen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</FONT></B>
					</TD>
				</TR>
			</TABLE>
			<br>
			<asp:Panel id="PanelKategorie" runat="server" Width="100%">
				<TABLE id="tableObjektart" cellSpacing="0" width="96%" border="1">
					<TR>
						<TH style="HEIGHT: 20px" bgColor="gainsboro">
							<P>Objektart und Nutzung</P>
						</TH>
					</TR>
					<TR>
						<TD style="WIDTH: 481px">
							<asp:radiobuttonlist id="rbTyp" runat="server" AutoPostBack="True" Height="8px" RepeatDirection="Horizontal">
								<asp:ListItem Value="Wohnung">Wohnung</asp:ListItem>
								<asp:ListItem Value="Haus">Haus</asp:ListItem>
								<asp:ListItem Value="Grundst&#252;ck">Grundst&#252;ck</asp:ListItem>
								<asp:ListItem Value="Gewerbeobjekt">Gewerbeobjekt</asp:ListItem>
							</asp:radiobuttonlist>&nbsp;
							<asp:requiredfieldvalidator id="validKategorie" runat="server" ErrorMessage="Bitte wählen!" ControlToValidate="rbTyp"></asp:requiredfieldvalidator><BR>
							<asp:radiobuttonlist id="rbNutzung" runat="server" AutoPostBack="True" Height="2px" RepeatDirection="Horizontal">
								<asp:ListItem Value="Miete">Miete</asp:ListItem>
								<asp:ListItem Value="Kauf">Kauf</asp:ListItem>
								<asp:ListItem Value="Pacht">Pacht</asp:ListItem>
							</asp:radiobuttonlist>&nbsp;
							<asp:requiredfieldvalidator id="validNutzung" runat="server" ErrorMessage="Bitte wählen!" ControlToValidate="rbNutzung"></asp:requiredfieldvalidator>
							<asp:radiobuttonlist id="rbHauptKategorie" runat="server" Width="124px" AutoPostBack="True" Height="8px" Visible="False" Enabled="False">
								<asp:ListItem Value="Bieten" Selected="True">Bieten</asp:ListItem>
							</asp:radiobuttonlist></TD>
					</TR>
				</TABLE>
			</asp:Panel>
			<br>
			<TABLE id="Table1" cellSpacing="0" width="96%" border="1">
				<TR>
					<TH style="HEIGHT: 20px" bgColor="gainsboro">
						<P>Option 1</P>
					</TH>
				</TR>
				<TR>
					<TD>&nbsp;&nbsp;
						<TABLE id="Table6" style="HEIGHT: 88px" cellSpacing="1" cellPadding="1" width="100%" border="0" class="extra">
							<TR>
								<TD style="WIDTH: 130px">
									<asp:Label id="Land" runat="server">Land:</asp:Label></TD>
								<TD>
									<asp:DropDownList id="cbImmoLand" runat="server" Width="184px" AutoPostBack="True"></asp:DropDownList></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 130px">
									<asp:Label id="Label1" runat="server">Bundesland:</asp:Label></TD>
								<TD>
									<asp:DropDownList id="cbImmoBundesland" runat="server" Width="184px" AutoPostBack="True"></asp:DropDownList></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 130px">
									<asp:Label id="Label2" runat="server">Bezirk:</asp:Label></TD>
								<TD>
									<asp:DropDownList id="cbImmoBezirk" runat="server" Width="184px"></asp:DropDownList></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table2" cellSpacing="0" width="96%" border="1">
				<TR>
					<TH style="HEIGHT: 20px" bgColor="gainsboro">
						<P>Option 2</P>
					</TH>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table8" cellSpacing="1" cellPadding="1" width="100%" border="0" class="extra">
							<TR>
								<TD style="WIDTH: 130px">
									<asp:Label id="lblPLZ" runat="server">PLZ:</asp:Label></TD>
								<TD>
									<asp:TextBox id="txtObjektPLZ" runat="server" AutoPostBack="True" Width="64px"></asp:TextBox></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table5" cellSpacing="0" width="96%" border="1">
				<TR>
					<TH style="HEIGHT: 20px" bgColor="gainsboro">
						<P>Option 3</P>
					</TH>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table9" cellSpacing="1" cellPadding="1" width="100%" border="0" class="extra">
							<TR>
								<TD style="WIDTH: 130px">
									<asp:Label id="lblObjektnummer" runat="server">Objektnummer:</asp:Label></TD>
								<TD>
									<asp:TextBox id="txtArtNr" runat="server" AutoPostBack="True" Width="142px"></asp:TextBox></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<BR>
			<asp:Panel id="PanelErweiterteSuche" runat="server" Width="100%" Visible="False">
				<TABLE cellSpacing="0" width="96%" border="1">
					<TR>
						<TH style="HEIGHT: 20px" bgColor="gainsboro">
							<P>Erweiterte Suche</P>
						</TH>
					</TR>
					<TR>
						<TD>
							<TABLE class="extra" cellSpacing="1" cellPadding="1" width="100%" border="0">
								<TR>
									<TD>
										<TABLE class="extra" id="Table3" style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px">
													<asp:Label id="lblImmoTyp" runat="server" Width="128px" Height="11px">Immobilien Typ:</asp:Label></TD>
												<TD style="WIDTH: 177px">&nbsp;
													<asp:DropDownList id="cbImmoTyp" runat="server" Width="169px"></asp:DropDownList></TD>
												<TD>&nbsp;&nbsp;&nbsp;&nbsp;
												</TD>
											</TR>
										</TABLE>
										<TABLE style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px">
													<asp:Label id="lblWohnflaeche" runat="server" Width="112px" Height="8px">Wohnfläche (m²):</asp:Label></TD>
												<TD style="WIDTH: 171px">&nbsp;von&nbsp;
													<asp:TextBox id="txtWohnflaecheVon" runat="server" Width="96px"></asp:TextBox></TD>
												<TD>&nbsp;bis
													<asp:TextBox id="txtWohnflaecheBis" runat="server" Width="96px"></asp:TextBox></TD>
											</TR>
										</TABLE>
										<TABLE style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px; HEIGHT: 19px">
													<asp:Label id="lblAnzahlzimmer" runat="server" Width="112px" Height="8px">Anzahl Zimmer:</asp:Label></TD>
												<TD style="WIDTH: 171px; HEIGHT: 19px">&nbsp;von&nbsp;
													<asp:TextBox id="txtAnzahlzimmerVon" runat="server" Width="96px" ToolTip="1,2,3 usw."></asp:TextBox></TD>
												<TD style="HEIGHT: 19px">&nbsp;bis
													<asp:TextBox id="txtAnzahlzimmerBis" runat="server" Width="96px" ToolTip="1,2,3 usw."></asp:TextBox></TD>
											</TR>
										</TABLE>
										<TABLE style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px">
													<asp:Label id="lblKaufpreis" runat="server" Width="104px" Height="3px">Kaufpreis (Euro):</asp:Label></TD>
												<TD style="WIDTH: 171px">&nbsp;von&nbsp;
													<asp:TextBox id="txtKaufpreisVon" runat="server" Width="96px"></asp:TextBox></TD>
												<TD>&nbsp;bis
													<asp:TextBox id="txtKaufpreisBis" runat="server" Width="96px"></asp:TextBox></TD>
											</TR>
										</TABLE>
										<TABLE style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px">
													<asp:Label id="lblMietpreis" runat="server" Width="104px" Height="11px">Mietpreis (Euro):</asp:Label></TD>
												<TD style="WIDTH: 171px">&nbsp;von&nbsp;
													<asp:TextBox id="txtMietpreisVon" runat="server" Width="96px"></asp:TextBox></TD>
												<TD>&nbsp;bis
													<asp:TextBox id="txtMietpreisBis" runat="server" Width="96px"></asp:TextBox></TD>
											</TR>
										</TABLE>
										<TABLE style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px">
													<asp:Label id="lblBetriebskosten" runat="server" Width="120px" Height="11px">Betriebskosten  (Euro):</asp:Label></TD>
												<TD style="WIDTH: 171px">&nbsp;von&nbsp;
													<asp:TextBox id="txtBetriebskostenVon" runat="server" Width="96px"></asp:TextBox></TD>
												<TD>&nbsp;bis
													<asp:TextBox id="txtBetriebskostenBis" runat="server" Width="96px"></asp:TextBox></TD>
											</TR>
										</TABLE>
										<TABLE style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px">
													<asp:Label id="lblGrundflaeche" runat="server" Width="104px" Height="3px">Grundfläche  (m²):</asp:Label></TD>
												<TD style="WIDTH: 171px">&nbsp;von&nbsp;
													<asp:TextBox id="txtGrundflaecheVon" runat="server" Width="96px"></asp:TextBox></TD>
												<TD>&nbsp;bis
													<asp:TextBox id="txtGrundflaecheBis" runat="server" Width="96px"></asp:TextBox></TD>
											</TR>
										</TABLE>
										<TABLE style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px">
													<asp:Label id="lblAnzahlstoeck" runat="server" Width="112px" Height="3px">Anzahl Stockwerke:</asp:Label></TD>
												<TD style="WIDTH: 171px">&nbsp;von&nbsp;
													<asp:TextBox id="txtAnzahlstoeckVon" runat="server" Width="96px" ToolTip="1,2,3 usw."></asp:TextBox></TD>
												<TD>&nbsp;bis
													<asp:TextBox id="txtAnzahlstoeckBis" runat="server" Width="96px" ToolTip="1,2,3 usw."></asp:TextBox></TD>
											</TR>
										</TABLE>
										<TABLE style="WIDTH: 528px" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD style="WIDTH: 136px">
													<asp:Label id="lblVerwendungszweck" runat="server" Width="97px" Height="11px">Verwendungszweck:</asp:Label></TD>
												<TD>&nbsp;
													<asp:DropDownList id="cbVerwendungszweck" runat="server" Width="169px">
														<asp:ListItem Value="Zweck1">Zweck1</asp:ListItem>
														<asp:ListItem Value="Zweck2">Zweck2</asp:ListItem>
													</asp:DropDownList></TD>
												<TD></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</asp:Panel>
			<br>
			<TABLE id="Table7" style="HEIGHT: 32px" cellSpacing="1" cellPadding="1" width="96%" border="0">
				<TR>
					<TD align="right">
						<asp:CustomValidator id="validSuche" runat="server" ErrorMessage="Bitte Suchkriterien festlegen!"></asp:CustomValidator>&nbsp;
						<asp:TextBox id="txtArtKatNr" runat="server" Width="79px" Enabled="False" BorderStyle="Dashed" BorderWidth="1px"></asp:TextBox>
						<asp:Button id="btnShowErweiterteSuche" runat="server" Text="Erweiterte Suche" CausesValidation="False"></asp:Button>
						<asp:Button id="btnSuchen" runat="server" Width="96px" Visible="False" Text="Suche starten"></asp:Button>
						<asp:HyperLink id="HyperLinkShowResult" runat="server" Width="187px" Height="16px" Enabled="False" Font-Size="14pt" Target="_top">Ergebnis Anzeigen</asp:HyperLink></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ImmoSuchinserat.aspx.vb" Inherits="WebShop.ImmoSuchinserat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ImmoSuche</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" borderColor="#c0c0c0" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD style="HEIGHT: 22px"><B><FONT face="Verdana" color="#980000" size="1"><B><FONT face="Verdana" color="#980000" size="1">Suchinserat 
										aufgeben&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Schritt 
										1/3)</FONT></B></FONT></B></TD>
				</TR>
			</TABLE>
			&nbsp;<asp:panel id="PanelKategorie" runat="server" Width="100%">
				<TABLE id="tableObjektart" cellSpacing="0" width="100%" border="1">
					<TR>
						<TH style="HEIGHT: 20px" bgColor="gainsboro">
							<P align="left">Ihr Objektart</P>
						</TH>
					</TR>
					<TR>
						<TD>
							<asp:radiobuttonlist id="rbTyp" runat="server" RepeatDirection="Horizontal" Height="8px" AutoPostBack="True">
								<asp:ListItem Value="Wohnung">Wohnung</asp:ListItem>
								<asp:ListItem Value="Haus">Haus</asp:ListItem>
								<asp:ListItem Value="Grundst&#252;ck">Grundst&#252;ck</asp:ListItem>
								<asp:ListItem Value="Gewerbeobjekt">Gewerbeobjekt</asp:ListItem>
								<asp:ListItem Value="Parkplatz">Parkplatz</asp:ListItem>
							</asp:radiobuttonlist>
							<asp:requiredfieldvalidator id="validKategorie" runat="server" ControlToValidate="rbTyp" ErrorMessage="Bitte wählen!"></asp:requiredfieldvalidator><BR>
							<asp:radiobuttonlist id="rbNutzung" runat="server" RepeatDirection="Horizontal" Height="2px" AutoPostBack="True">
								<asp:ListItem Value="Miete">Miete</asp:ListItem>
								<asp:ListItem Value="Kauf">Kauf</asp:ListItem>
								<asp:ListItem Value="Pacht">Pacht</asp:ListItem>
							</asp:radiobuttonlist>&nbsp;
							<asp:requiredfieldvalidator id="validNutzung" runat="server" ControlToValidate="rbNutzung" ErrorMessage="Bitte wählen!"></asp:requiredfieldvalidator>
							<asp:radiobuttonlist id="rbHauptKategorie" runat="server" Width="16px" Height="8px" AutoPostBack="True"
								Visible="False" Enabled="False">
								<asp:ListItem Value="Suchen" Selected="True">Suchen</asp:ListItem>
							</asp:radiobuttonlist></TD>
					</TR>
				</TABLE>
			</asp:panel>
			<br>
			<TABLE id="Table4" cellSpacing="0" width="100%" border="1">
				<TR>
					<TH width="100%" bgColor="gainsboro">
						<P align="left">Wunschname Ihrer Anzeige</P>
					</TH>
					<TH width="20">
						<A><IMG onmouseover="return escape('In diesem Feld können Sie Ihrer Anzeige eine eigene Bezeichnung geben. Wie zum Beispiel: Großen Einfamilienhaus in ruhiger Lage.')"
								hspace="2" src="../../skins/skin_immo/images/buttons/help.gif"></A>
					</TH>
				<TR>
					<TD colSpan="2"><FONT size="4">&nbsp;</FONT>
						<asp:textbox id=txtBezeichnung runat="server" Width="320px"  MaxLength="100">
						</asp:textbox>
						<asp:requiredfieldvalidator id="validName" runat="server" ControlToValidate="txtBezeichnung" ErrorMessage="Ihr Wunschname Ihrer Anzeige fehlt"></asp:requiredfieldvalidator>&nbsp;z.Bsp.
						<STRONG>Suche 3 Zi. Wohnung in Linz</STRONG></TD>
				</TR>
			</TABLE>
			<BR>
			<asp:panel id="PanelOption1" runat="server" ForeColor="#B22820">
				<TABLE id="Table1" cellSpacing="0" width="100%" border="1">
					<TR>
						<TH style="HEIGHT: 20px" width="100%" bgColor="gainsboro">
							<P align="left">Ihre Wunschumgebung</P>
						</TH>
						<TH>
							<A><IMG onmouseover="return escape('<b>Land:</b> In diesem Feld können Sie das Land auswählen in welchem Sie nach geeigneten Anzeigen such wollen. Zur Zeit befinden Sich nur Anzeigen der Länder Deutschland und Österreich in der Datenbank. Das Suchen in beiden Ländern ist nicht möglich. <BR><BR><B>Bundesland:</B> Nachdem Sie ein Land ausgewählt haben werden Ihnen von diesem die Bundesländer angezeigt. Wählen Sie eines davon. Wenn Sie in allen Bundesländern suchen wollen, nehmen Sie die Auswahl [alle]. <BR><BR><B>Bezirk/Landkreise und Städte:</B> Wenn Sie ein Bundesland ausgewählt haben werden Ihnen von diesem die Bezirke bzw. die Landkreise/Städte angezeigt. Sollten Sie die Suche nun verfeinern wollen, wählen Sie den gewünschten Bezirk bzw. Landkreis/Städte aus.')"
									src="../../skins/skin_immo/images/buttons/help.gif"></A>
						</TH>
					</TR>
					<TR>
						<TD colSpan="2">
							<P align="right">
								<TABLE class="extra" id="Table6" style="HEIGHT: 88px" cellSpacing="1" cellPadding="1" width="100%"
									border="0">
									<TR>
										<TD style="WIDTH: 130px; HEIGHT: 5px">
											<asp:Label id="Land" runat="server">Land*:</asp:Label></TD>
										<TD style="HEIGHT: 5px">
											<asp:DropDownList id="cbImmoLand" runat="server" Width="184px" AutoPostBack="True"></asp:DropDownList>&nbsp;
											<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="cbImmoLand" ErrorMessage="Bitte Land eingeben!"></asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 130px; HEIGHT: 10px">
											<asp:Label id="Label1" runat="server">Bundesland*:</asp:Label></TD>
										<TD style="HEIGHT: 10px">
											<asp:DropDownList id="cbImmoBundesland" runat="server" Width="184px" AutoPostBack="True"></asp:DropDownList>&nbsp;
											<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="cbImmoBundesland"
												ErrorMessage="Bitte Bundesland eingeben!"></asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 130px; HEIGHT: 16px">
											<asp:Label id="Label2" runat="server">Bezirk*:</asp:Label></TD>
										<TD style="HEIGHT: 16px">
											<asp:DropDownList id="cbImmoBezirk" runat="server" Width="184px"></asp:DropDownList>&nbsp;
											<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="cbImmoBezirk" ErrorMessage="Bitte Bezirk eingeben!"></asp:RequiredFieldValidator></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 130px">
											<asp:Label id="lblPLZ" runat="server">PLZ:</asp:Label></TD>
										<TD>
											<asp:TextBox id="txtObjektPLZ" runat="server" Width="64px" AutoPostBack="True"></asp:TextBox></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 130px">Ort:</TD>
										<TD>
											<asp:TextBox id="txtObjektOrt" runat="server" Width="176px" AutoPostBack="True"></asp:TextBox></TD>
									</TR>
								</TABLE>
							</P>
						</TD>
					</TR>
				</TABLE>
			</asp:panel><br>
			<asp:panel id="PanelErweiterteSuche" runat="server" Width="100%" Visible="False">
				<TABLE cellSpacing="0" width="100%" border="1">
					<TR>
						<TH style="HEIGHT: 18px" width="100%" bgColor="gainsboro">
							<P align="left"><FONT color="#b22820">Weitere Angaben</FONT></P>
						</TH>
						<TH>
							<A><IMG onmouseover="return escape('Je nach Objektart haben Sie die Möglichkeit die Suchkriterien so zu verfeinern, dass Sie ein gezieltes Suchergebnis erhalten. Sie haben die Auswahl einer bestimmten Objektart und können je nach Objekt bestimmten Einträgen einen von bis Wert angeben. Sollten Sie mit Ihrer Auswahl kein Suchergebnis erhalten wird Ihnen das im oberen Teil des Fensters angezeigt. In einem solchen Fall würden wir Ihnen raten die Werte nicht zu eng anzugeben oder die Felder frei zu lassen. Denn dann werden Ihnen alle verfügbaren Anzeigen in der angegeben Region angezeigt.')"
									src="../../skins/skin_immo/images/buttons/help.gif"></A>
						</TH>
					</TR>
					<TR>
						<TD colSpan="2">
							<TABLE class="extra" cellSpacing="1" cellPadding="1" width="100%" border="0">
								<TR>
									<TD>
										<TABLE class="extra" id="Table3" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TR>
												<TD width="40%">
													<asp:Label id="lblImmoTyp" runat="server" Width="100%">Objektart:</asp:Label></TD>
												<TD colSpan="2">&nbsp;
													<asp:DropDownList id="cbImmoTyp" runat="server" Width="169px"></asp:DropDownList></TD>
											</TR>
										</TABLE>
										<BR>
										<asp:Panel id="PanelWohnflaeche" runat="server">
											<TABLE class="extra" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TR>
													<TD width="40%">
														<asp:Label id="lblWohnflaeche" runat="server" Width="100%" Height="8px">Wohnfläche (m²):</asp:Label></TD>
													<TD width="30%">&nbsp;von&nbsp;
														<asp:TextBox id="txtWohnflaecheVon" runat="server" Width="64px"></asp:TextBox></TD>
													<TD>&nbsp;bis
														<asp:TextBox id="txtWohnflaecheBis" runat="server" Width="64px"></asp:TextBox></TD>
												</TR>
											</TABLE>
										</asp:Panel>
										<asp:Panel id="PanelZimmeranzahl" runat="server">
											<TABLE class="extra" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TR>
													<TD width="40%">
														<asp:Label id="lblAnzahlzimmer" runat="server" Width="100%" Height="8px">Anzahl der Zimmer:</asp:Label></TD>
													<TD width="30%">&nbsp;von&nbsp;
														<asp:TextBox id="txtAnzahlzimmerVon" runat="server" Width="64px" ToolTip="1,2,3 usw."></asp:TextBox></TD>
													<TD>&nbsp;bis
														<asp:TextBox id="txtAnzahlzimmerBis" runat="server" Width="64px" ToolTip="1,2,3 usw."></asp:TextBox></TD>
												</TR>
											</TABLE>
										</asp:Panel>
										<asp:Panel id="PanelKaufpreis" runat="server">
											<TABLE class="extra" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TR>
													<TD style="WIDTH: 40%">
														<asp:Label id="lblKaufpreis" runat="server" Width="100%" Height="3px">Kaufpreis (Euro):</asp:Label></TD>
													<TD style="WIDTH: 30%">&nbsp;von&nbsp;
														<asp:TextBox id="txtKaufpreisVon" runat="server" Width="64px"></asp:TextBox></TD>
													<TD>&nbsp;bis
														<asp:TextBox id="txtKaufpreisBis" runat="server" Width="64px"></asp:TextBox></TD>
												</TR>
											</TABLE>
										</asp:Panel>
										<asp:Panel id="PanelMietpreis" runat="server">
											<TABLE class="extra" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TR>
													<TD style="WIDTH: 40%">
														<asp:Label id="lblMietpreis" runat="server" Width="100%" Height="11px">Miete (Euro):</asp:Label></TD>
													<TD style="WIDTH: 30%">&nbsp;von&nbsp;
														<asp:TextBox id="txtMietpreisVon" runat="server" Width="64px"></asp:TextBox></TD>
													<TD>&nbsp;bis
														<asp:TextBox id="txtMietpreisBis" runat="server" Width="64px"></asp:TextBox></TD>
												</TR>
											</TABLE>
										</asp:Panel>
										<asp:Panel id="PanelBetriebskosten" runat="server">
											<TABLE class="extra" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TR>
													<TD style="WIDTH: 40%">
														<asp:Label id="lblBetriebskosten" runat="server" Width="100%" Height="11px">Betriebskosten  (Euro):</asp:Label></TD>
													<TD style="WIDTH: 30%">&nbsp;von&nbsp;
														<asp:TextBox id="txtBetriebskostenVon" runat="server" Width="64px"></asp:TextBox></TD>
													<TD>&nbsp;bis
														<asp:TextBox id="txtBetriebskostenBis" runat="server" Width="64px"></asp:TextBox></TD>
												</TR>
											</TABLE>
										</asp:Panel>
										<asp:Panel id="PanelGrundflaeche" runat="server">
											<TABLE class="extra" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TR>
													<TD style="WIDTH: 40%">
														<asp:Label id="lblGrundflaeche" runat="server" Width="100%" Height="3px">Grundfläche  (m²):</asp:Label></TD>
													<TD style="WIDTH: 30%">&nbsp;von&nbsp;
														<asp:TextBox id="txtGrundflaecheVon" runat="server" Width="64px"></asp:TextBox></TD>
													<TD>&nbsp;bis
														<asp:TextBox id="txtGrundflaecheBis" runat="server" Width="64px"></asp:TextBox></TD>
												</TR>
											</TABLE>
										</asp:Panel>
										<asp:Panel id="PanelStoeckanzahl" runat="server">
											<TABLE class="extra" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TR>
													<TD style="WIDTH: 40%">
														<asp:Label id="lblAnzahlstoeck" runat="server" Width="100%" Height="3px">Anzahl der Stockwerke:</asp:Label></TD>
													<TD style="WIDTH: 30%">&nbsp;von&nbsp;
														<asp:TextBox id="txtAnzahlstoeckVon" runat="server" Width="64px" ToolTip="1,2,3 usw."></asp:TextBox></TD>
													<TD>&nbsp;bis
														<asp:TextBox id="txtAnzahlstoeckBis" runat="server" Width="64px" ToolTip="1,2,3 usw."></asp:TextBox></TD>
												</TR>
											</TABLE>
										</asp:Panel>
										<asp:Panel id="PanelVerwendungsZweck" runat="server">
											<TABLE class="extra" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<TR>
													<TD style="WIDTH: 40%">
														<asp:Label id="lblVerwendungszweck" runat="server" Width="100%">Verwendungszweck:</asp:Label></TD>
													<TD colSpan="2">&nbsp;
														<asp:DropDownList id="cbVerwendungszweck" runat="server" Width="169px">
															<asp:ListItem Value="Zweck1">Zweck1</asp:ListItem>
															<asp:ListItem Value="Zweck2">Zweck2</asp:ListItem>
														</asp:DropDownList></TD>
												</TR>
											</TABLE>
										</asp:Panel></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
				<SCRIPT language="javascript">
				    try {
					//top.document.getElementById('SearchFrame').height=700; 
					} catch (e) {}
				</SCRIPT>
				<TABLE id="Table7" style="HEIGHT: 32px" cellSpacing="0" cellPadding="0" width="100%" border="1">
					<TR>
						<TD class="extra" align="right">
							<asp:HyperLink id="HyperLinkShowResult" runat="server" Width="137px" Height="16px" Visible="False"
								Enabled="False" Font-Size="10pt" Target="_top">Ergebnis Anzeigen</asp:HyperLink>&nbsp;
							<asp:TextBox id="txtAnbieter" runat="server" Width="60px" Visible="False" Enabled="False" BorderStyle="None"
								BorderWidth="1px"></asp:TextBox>&nbsp;
							<asp:TextBox id="txtArtNr" runat="server" Width="60px" Visible="False" Enabled="False" BorderStyle="None"
								BorderWidth="1px"></asp:TextBox>&nbsp;
							<asp:TextBox id="txtArtKatNr" runat="server" Width="60px" Visible="False" Enabled="False" BorderStyle="None"
								BorderWidth="1px"></asp:TextBox>&nbsp;
							<asp:Button id="btnSuchen" runat="server" Width="200px" CssClass="extra" Text="speichern und weiter"></asp:Button></TD>
					</TR>
				</TABLE>
			</asp:panel>
		</form>
		<script language="JavaScript" type="text/javascript" src="wz_tooltip.js"></script>
	</BODY>
</HTML>

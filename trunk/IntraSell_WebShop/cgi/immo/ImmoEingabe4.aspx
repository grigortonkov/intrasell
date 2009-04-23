<%@ Register TagPrefix="uc1" TagName="WebUserControl_Login" Src="WebUserControl_Login.ascx" %>
<%@ Reference Control="WebUserControl_Login.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ImmoEingabe4.aspx.vb" Inherits="WebShop.ImmoEingabe4"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ImmoEingabe4</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<TD><B><FONT face="Verdana" color="#980000" size="1">Objekt 
								inserieren&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Schritt 
								4/4)</FONT></B></TD>
				</TR>
			</TABLE>
			<BR>
			<asp:panel id="pLOGIN" style="Z-INDEX: 102; LEFT: 8px" runat="server" Enabled="False" Width="96%" Visible="False">
				<P>
					<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
						<TR>
							<TD>
								<P>Login erforderlich!<BR>
									<A href="../../default.asp?pageToShow=MyAccount&amp;backToPageAfterLoginOrAnmelden=ImmoInseratAufgebenAfterLogin" target="_top">
										Benutzerkonto erstellen oder Anmelden erforderlich.
										<BR>
										Bitte hier klicken! </A>
								</P>
								<P>&nbsp;</P>
							</TD>
						</TR>
					</TABLE>
				</P>
			</asp:panel>
			<BR>
			<BR>
			<asp:Panel id="PanelKontaktperson" style="Z-INDEX: 105; LEFT: 8px" runat="server" Enabled="False" Width="96%" Height="184px" HorizontalAlign="Right">
				<P>
					<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" border="0">
						<TR>
							<TD align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<asp:textbox id="txtArtNr" runat="server" Visible="False" Width="48px" Enabled="False"></asp:textbox>
								<asp:textbox id="txtAnbieter" runat="server" Visible="False" Width="48px" Enabled="False"></asp:textbox>
								<asp:button id="btnLoadData" runat="server" Visible="False" Width="180px" CausesValidation="False" Text="Daten vom Konto übernehmen"></asp:button></TD>
						</TR>
						<TR>
							<TD>
								<TABLE id="TableKontaktperson" style="HEIGHT: 60px" borderColor="darkgray" cellSpacing="0" cellPadding="0" width="100%" border="1">
									<TR>
										<TD style="HEIGHT: 24px" bgColor="gainsboro"><STRONG>Kontaktperson für diese Immobilie</STRONG></TD>
									</TR>
									<TR>
										<TD>
											<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" border="0">
												<TR>
													<TD style="WIDTH: 117px">
														<asp:label id="Label9" runat="server" Width="96px">Kontaktperson:</asp:label></TD>
													<TD>
														<asp:textbox id="txtKontaktperson" runat="server" Width="216px"></asp:textbox></TD>
													<TD>
														<asp:requiredfieldvalidator id="validKontaktperson" runat="server" ControlToValidate="txtKontaktperson" ErrorMessage="Kontaktperson fehlt!"></asp:requiredfieldvalidator></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 117px">
														<asp:label id="Label12" runat="server" Width="64px">Telefon:</asp:label></TD>
													<TD>
														<asp:textbox id="txtKontaktpersonTel" runat="server" Width="216px"></asp:textbox></TD>
													<TD>
														<asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" Width="272px" ControlToValidate="txtKontaktpersonTel" ErrorMessage="Telefon für Kontaktperson fehlt!"></asp:requiredfieldvalidator></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 117px">
														<asp:label id="Label1" runat="server" Width="64px">Fax:</asp:label></TD>
													<TD>
														<asp:textbox id="txtKontaktpersonFax" runat="server" Width="216px"></asp:textbox></TD>
													<TD>
														<asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" Width="272px" ControlToValidate="txtKontaktpersonFax" ErrorMessage="Fax für Kontaktperson fehlt!"></asp:requiredfieldvalidator></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 117px">
														<asp:label id="Label13" runat="server" Width="64px">Email:</asp:label></TD>
													<TD>
														<asp:textbox id="txtKontaktpersonEmail" runat="server" Width="216px"></asp:textbox></TD>
													<TD>
														<asp:requiredfieldvalidator id="validKPEmail" runat="server" Width="264px" ControlToValidate="txtKontaktpersonEmail" ErrorMessage="Email für Kontaktperson fehlt!"></asp:requiredfieldvalidator></TD>
												</TR>
											</TABLE>
										</TD>
									</TR>
								</TABLE>
							</TD>
						</TR>
						<TR>
							<TD align="right">
								<asp:CheckBox id="CheckBoxAktiv" runat="server" Text="Inserat aktivieren" Checked="True"></asp:CheckBox>&nbsp;
								<asp:Button id="btnZurueck" runat="server" Width="180px" Text="zurück"></asp:Button>
								<asp:button id="btnSpeichern" runat="server" Width="180px" Text="abschließen" DESIGNTIMEDRAGDROP="72"></asp:button></TD>
						</TR>
					</TABLE>
				</P>
			</asp:Panel>
			<BR>
			<BR>
			<asp:Panel id="PanelDanke" style="Z-INDEX: 107; LEFT: 8px" runat="server" Visible="False" Width="96%" Height="48px">
				<P>
					<TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" border="0">
						<TR>
							<TD>Vielen Dank!
								<BR>
								<BR>
								Ihre Eingaben wurden erfolgreich gespeichert!
								<BR>
								<BR>
								<asp:HyperLink id="linkArtikel" runat="server" NavigateUrl="../../default.asp?ArtNr=" Target="_top" Font-Size="X-Small">Immobilie ansehen</asp:HyperLink></TD>
						</TR>
					</TABLE>
				</P>
			</asp:Panel></form>
	</body>
</HTML>

<%@ Page Language="vb" AutoEventWireup="false" Codebehind="accountCreate.aspx.vb" Inherits="WebShop.immoAnbieterRegistrieren"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>immoAnbieterRegistrieren</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="FormLogin" method="post">
			<script language="javascript">
		 function sendLogin(){
		 if (FormLogin.LoginEmail.value == ""){
		   alert("Bitte Email eingeben!");
		   return;
		   }
		   
		 if (FormLogin.LoginPasswort.value == ""){
		   alert("Bitte Passwort eingeben!");
		   return;
		   }
		 
		 top.location="../../../default.asp?pageToShow=MyAccount&action=login&backToPageAfterLoginOrAnmelden=ImmoInseratAufgebenAfterLogin&Email=" + FormLogin.LoginEmail.value + "&Password="+FormLogin.LoginPasswort.value ;
		 }
		 
			</script>
			<table width="100%">
				<tr>
					<td>
						<P align="center">Ameldung</P>
						<P>
							<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="300" border="1" align="center">
								<TR>
									<TD><FONT face="Verdana" size="1">E-Mail*:</FONT></TD>
									<TD>
										<INPUT id="LoginEmail" maxLength="40" size="30" name="LoginEmail"></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD><FONT face="Verdana" size="1">Passwort*:</FONT></TD>
									<TD>
										<INPUT id="LoginPasswort" type="password" maxLength="40" size="6" name="LoginPasswort"></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD>
										<INPUT id="SubmitLogin" type="button" onclick="sendLogin();" value="Anmelden und Weiter"></TD>
									<TD></TD>
								</TR>
							</TABLE>
						</P>
						<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</P>
					</td>
				</tr>
			</table>
		</form>
		<form id="Form1" method="post" runat="server">
			<asp:Panel id="PanelForm" runat="server" DESIGNTIMEDRAGDROP="3455" Width="100%">
				<TABLE id="table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TR>
						<TD vAlign="top" width="100%">
							<H2><FONT face="Verdana" size="1">Bitte registrieren Sie sich hier als Anbieter.</FONT></H2>
							<FONT face="Verdana" size="1"><B>Wählen Sie hier Ihre Zugangsdaten:</B><BR>
								Bitte wählen Sie max. 40 Zeichen ohne Leer- und Sonderzeichen und achten Sie 
								auf Groß- und Kleinschreibung!<BR>
								&nbsp;</FONT>
							<TABLE id="table3" style="HEIGHT: 572px" cellSpacing="1" cellPadding="2" width="100%" border="0">
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">E-Mail*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Email" maxLength="40" size="30" name="Email" runat="server">
											<asp:requiredfieldvalidator id="validEmail" runat="server" ControlToValidate="Email" ErrorMessage="!"></asp:requiredfieldvalidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">(5-40 Zeichen)&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">E-Mailwiederholung*:</FONT></TD>
									<TD bgColor="#efefef">
										<INPUT id="Email2" maxLength="150" size="30" name="Email2" runat="server">&nbsp;
										<asp:requiredfieldvalidator id="validEmail2" runat="server" ControlToValidate="Email2" ErrorMessage="!"></asp:requiredfieldvalidator></TD>
									<TD bgColor="#efefef"></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Passwort*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Passwort" type="password" maxLength="40" size="6" name="Passwort" runat="server">&nbsp;
											<asp:requiredfieldvalidator id="validPasswort" runat="server" ControlToValidate="Passwort" ErrorMessage="Mindestens 6 Zeichen" ToolTip=" Zeichen"></asp:requiredfieldvalidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">(5-40 Zeichen)&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Passwortwiederholung*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Passwort2" type="password" maxLength="40" size="6" name="Passwort2" runat="server">&nbsp;
											<asp:RequiredFieldValidator id="validPasswort2" runat="server" ControlToValidate="Passwort2" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD colSpan="3"><FONT face="Verdana" size="1"><B><BR>
												Geben Sie hier Ihre Adressdaten ein:</B> </FONT>
									</TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">
											<asp:Panel id="PanelFirma1" runat="server" Width="100%" Height="32px" Visible="False">Firmenname*/Logo:</asp:Panel></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;<BR>
											<asp:Panel id="PanelFirma" runat="server" Width="100%" Height="48px" Visible="False">
												<P><FONT face="Verdana" size="1"> <INPUT id="Firma" maxLength="100" size="30" name="Firma" runat="server">&nbsp;
														<asp:RequiredFieldValidator id="validFirma" runat="server" ControlToValidate="Firma" ErrorMessage="!"></asp:RequiredFieldValidator><BR>
													</FONT><INPUT id="FileFirmaLogo" type="file" name="FileFirmaLogo" runat="server"></P>
											</asp:Panel></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Anrede*:</FONT></TD>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1"><SELECT id="Anrede" size="1" name="Anrede" runat="server">
												<OPTION value="Herr" selected>Herr</OPTION>
												<OPTION value="Frau">Frau</OPTION>
											</SELECT>
											<asp:RequiredFieldValidator id="validAnrede" runat="server" ControlToValidate="Anrede" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Titel:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Titel" maxLength="10" size="10" name="titel" runat="server"></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Vorname*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Vorname" maxLength="30" size="30" name="Vorname" runat="server">
											<asp:RequiredFieldValidator id="validvorname" runat="server" ControlToValidate="Vorname" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Nachname*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Name" maxLength="50" size="30" name="Name" runat="server">
											<asp:RequiredFieldValidator id="validName" runat="server" ControlToValidate="Name" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Website:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Web" maxLength="150" size="30" name="Web" runat="server"></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD colSpan="3">&nbsp;</TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Telefon*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Tel" maxLength="40" size="30" name="Tel" runat="server">
											<asp:RequiredFieldValidator id="validTel" runat="server" ControlToValidate="Tel" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Telefax:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Fax" maxLength="40" size="30" name="fax" runat="server"></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Mobil:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Mobil" maxLength="40" size="30" name="cell" runat="server"></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Straße*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Strasse" maxLength="100" size="30" name="Strasse" runat="server">
											<asp:RequiredFieldValidator id="validStrasse" runat="server" ControlToValidate="Strasse" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Hausnr.*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="StrasseNr" maxLength="30" size="30" name="StrasseNr" runat="server">
											<asp:RequiredFieldValidator id="validStrasseNr" runat="server" ControlToValidate="StrasseNr" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">PLZ*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="PLZ" maxLength="10" size="10" name="PLZ" runat="server">
											<asp:RegularExpressionValidator id="validPLZ" runat="server" ControlToValidate="PLZ" ErrorMessage="!" ValidationExpression="\d{5}|\d{4}"></asp:RegularExpressionValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Ort*:</FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1"> <INPUT id="Ort" maxLength="50" size="30" name="ort" runat="server">
											<asp:RequiredFieldValidator id="validOrt" runat="server" ControlToValidate="Ort" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
								<TR>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1">Land*:</FONT></TD>
									<TD noWrap bgColor="#efefef"><FONT face="Verdana" size="1"><SELECT id="Land" size="1" name="Land" runat="server">
												<OPTION value="49" selected>Deutschland</OPTION>
												<OPTION value="43">Österreich</OPTION>
											</SELECT>&nbsp;
											<asp:RequiredFieldValidator id="validLand" runat="server" ControlToValidate="Land" ErrorMessage="!"></asp:RequiredFieldValidator></FONT></TD>
									<TD bgColor="#efefef"><FONT face="Verdana" size="1">&nbsp;</FONT></TD>
								</TR>
							</TABLE>
							<FONT face="Verdana" size="1"><INPUT id="SubmitForm" type="submit" value="Speichern und Weiter" name="event:doSave" runat="server">
								<INPUT type="submit" value="Abbrechen" name="event:doCancel">
								<asp:TextBox id="backToPageAfterLoginOrAnmelden" runat="server" Width="264px" Enabled="False" BorderWidth="1px" BorderStyle="Dotted"></asp:TextBox><BR>
								<BR>
								<SPAN class="size1">*: Müssen ausgefüllt werden</SPAN></FONT>
						</TD>
					</TR>
				</TABLE>
			</asp:Panel><BR>
			<BR>
			<asp:Panel id="panelConfirmation" runat="server" Width="100%" Visible="False">
				<P>Ihr Account wurde erstellt !</P>
				<P>
					<asp:HyperLink id="linkAfterLogin" runat="server" Target="_top">WEITER</asp:HyperLink></P>
			</asp:Panel></form>
	</body>
</HTML>

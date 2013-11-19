<%@ Page Language="vb" AutoEventWireup="false" Codebehind="merchantRegister.aspx.vb" Inherits="WebShop.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>RegisterForm</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link REL="stylesheet" HREF="../../../skins/skin_priceCompare_at/pages/style.css" TYPE="text/css">
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgColor="#ccccff">
		<form id="FormRegister" method="post" runat="server">
			<TABLE id="TableRegistrationForm" style="Z-INDEX: 102; LEFT: 27px; WIDTH: 503px; POSITION: absolute; TOP: 38px; HEIGHT: 510px" cellSpacing="1" cellPadding="1" width="503" border="0" title="Registration Form" bgColor="#ffd700">
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label13" runat="server" Width="100px" Height="20px">Firmeninformation</asp:Label></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label1" runat="server" Width="100px" Height="20px">Benutzername</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtUsername" runat="server" Height="22px" Width="122px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="validUsername" runat="server" Width="159px" ControlToValidate="txtUsername" ErrorMessage="Benutzername eingeben!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label4" runat="server" Width="100px" Height="20px">Passwort</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtPasword" runat="server" Width="122px" Height="22px" TextMode="Password"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="validPass" runat="server" ControlToValidate="txtPasword" ErrorMessage="Passwort eingeben!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label5" runat="server" Width="100px" Height="20px">Passwortwiederholung</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtPassword2" runat="server" Width="122px" Height="22px" TextMode="Password"></asp:TextBox></TD>
					<TD>
						<asp:CompareValidator id="comaprePass" runat="server" ControlToValidate="txtPassword2" ErrorMessage="Bestätigung stimmt nicht!" ControlToCompare="txtPasword"></asp:CompareValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label6" runat="server" Width="100px" Height="20px">Firmenname</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtFirma" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="validFirma" runat="server" ControlToValidate="txtFirma" ErrorMessage="Firma eingeben!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label8" runat="server" Width="100px" Height="20px">URL Shop</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtURL" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator8" runat="server" ControlToValidate="txtURL" ErrorMessage="URL Ihrer Firma!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label9" runat="server" Width="100px" Height="20px">Strasse</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtStreet" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator9" runat="server" ControlToValidate="txtStreet" ErrorMessage="Strasse!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label10" runat="server" Width="100px" Height="20px">Land-PLZ</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtPLZ" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RangeValidator id="RangeValidator1" runat="server" Width="154px" ControlToValidate="txtPLZ" ErrorMessage="PLZ ist 1000 bis 9999" MaximumValue="9999" MinimumValue="1000"></asp:RangeValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label11" runat="server" Width="100px" Height="20px">Ort</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtOrt" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" Height="16px" ControlToValidate="txtOrt" ErrorMessage="Ort!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label12" runat="server" Height="20px" Width="100px">Branche</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtBranch" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator10" runat="server" Height="16px" ControlToValidate="txtBranch" ErrorMessage="Branche!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label14" runat="server" Width="100px" Height="20px">Ansprechpartner</asp:Label></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label15" runat="server" Width="100px" Height="20px">Anrede</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtAnrede" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="txtAnrede" ErrorMessage="Anrede!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label16" runat="server" Width="100px" Height="20px">Vorname</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtVorname" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="txtVorname" ErrorMessage="Vorname!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label17" runat="server" Width="100px" Height="20px">Nachname</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtNachname" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="txtNachname" ErrorMessage="Nachname!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label18" runat="server" Width="100px" Height="20px">Email</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtEmail" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email ist flasch!" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label19" runat="server" Width="100px" Height="20px">Telefon</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtTel" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="validTel" runat="server" ErrorMessage="Tel!" ControlToValidate="txtTel"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px">
						<asp:Label id="Label20" runat="server" Width="100px" Height="20px">Fax</asp:Label></TD>
					<TD>
						<asp:TextBox id="txtFax" runat="server" Width="122px" Height="22px"></asp:TextBox></TD>
					<TD>
						<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ControlToValidate="txtFax" ErrorMessage="Fax!"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px"></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 168px"></TD>
					<TD>
						<asp:Button id="btnRegister" runat="server" Width="171px" Height="29px" Text="weiter"></asp:Button></TD>
					<TD></TD>
				</TR>
			</TABLE>
			<DIV style="Z-INDEX: 101; LEFT: 28px; WIDTH: 574px; POSITION: absolute; TOP: 9px; HEIGHT: 25px" ms_positioning="FlowLayout"><FONT size="4">Registrierung 
					als neuer Partner von smartefox Shopping - Tel 1</FONT></DIV>
			<asp:Label id="lblDanke" style="Z-INDEX: 103; LEFT: 32px; POSITION: absolute; TOP: 559px" runat="server" Width="504px" Height="30px" Visible="False">Danke für Ihre Registrierung!</asp:Label>
		</form>
	</body>
</HTML>

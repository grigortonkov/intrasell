<%@ Page Language="vb" AutoEventWireup="false" Codebehind="merchantLogin.aspx.vb" Inherits="WebShop.WebForm2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebForm2</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link REL="stylesheet" HREF="../../../skins/skin_priceCompare_at/pages/style.css" TYPE="text/css">
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgColor="#ccccff">
		<form id="Form1" method="post" runat="server">
			<asp:Panel id="panelRegisteredArea" style="Z-INDEX: 102; LEFT: 17px; POSITION: absolute; TOP: 207px" runat="server" Height="80px" Width="531px" Visible="False" HorizontalAlign="Center" BackColor="Gold">
				<P>&nbsp;</P>
				<P>Willkommen bei&nbsp;Smartefox.com&nbsp;in Ihrem Händlerbereich!</P>
				<P>
					<TABLE id="Table1" style="WIDTH: 421px; HEIGHT: 2px" cellSpacing="1" cellPadding="1" width="421" border="1">
						<TR>
							<TD style="WIDTH: 159px">&nbsp; <A href="merchantStatistics.aspx">Klicks Statistik</A>
							</TD>
							<TD>Statistik Klicks....</TD>
						</TR>
						<TR>
							<TD style="WIDTH: 159px">&nbsp; <A href="MerchantPriceListUpload.aspx">Upload 
									Preisliste</A></TD>
							<TD>Preisliste uploaden</TD>
						</TR>
					</TABLE>
				</P>
				<P>&nbsp;</P>
				<P>&nbsp;</P>
			</asp:Panel>
			<asp:Panel id="PanelLoginDialog" style="Z-INDEX: 103; LEFT: 16px; POSITION: absolute; TOP: 8px" runat="server" Height="181px" Width="531px" HorizontalAlign="Center" BackColor="White">Login 
<DIV title="Login" style="WIDTH: 495px; POSITION: relative; HEIGHT: 153px; BACKGROUND-COLOR: gold" ms_positioning="GridLayout">
					<asp:Label id="Benutzername" style="Z-INDEX: 100; LEFT: 24px; POSITION: absolute; TOP: 16px" runat="server" Width="61px" Height="24px">Benutzername</asp:Label>
					<asp:TextBox id="txtUserName" style="Z-INDEX: 104; LEFT: 155px; POSITION: absolute; TOP: 19px" tabIndex="1" runat="server" Width="118px"></asp:TextBox>
					<asp:TextBox id="txtPassword" style="Z-INDEX: 102; LEFT: 154px; POSITION: absolute; TOP: 50px" tabIndex="2" runat="server" Width="118px" TextMode="Password"></asp:TextBox>
					<asp:Label id="Label2" style="Z-INDEX: 103; LEFT: 24px; POSITION: absolute; TOP: 50px" runat="server" Width="38px" Height="24px">Passwort</asp:Label>
					<asp:Button id="btnLogin" style="Z-INDEX: 105; LEFT: 155px; POSITION: absolute; TOP: 85px" tabIndex="3" runat="server" Width="128px" Height="26px" Text="Anmelden"></asp:Button>
					<asp:RequiredFieldValidator id="RequiredFieldValidator1" style="Z-INDEX: 106; LEFT: 296px; POSITION: absolute; TOP: 24px" runat="server" ErrorMessage="Benutzeranamen eingeben!" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
					<asp:RequiredFieldValidator id="RequiredFieldValidator2" style="Z-INDEX: 107; LEFT: 298px; POSITION: absolute; TOP: 52px" runat="server" ErrorMessage="Passwort fehlt!" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
					<asp:Label id="lblErrorMessage" style="Z-INDEX: 108; LEFT: 67px; POSITION: absolute; TOP: 115px" runat="server" Visible="False" Width="307px" Height="1px" ForeColor="Red">Benutzername/Passwort simmen nicht!</asp:Label></DIV></asp:Panel>
		</form>
	</body>
</HTML>

<%@ Page Language="vb" AutoEventWireup="false" Codebehind="merchantRegisterPart2.aspx.vb" Inherits="WebShop.WebForm5"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>WebForm5</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link REL="stylesheet" HREF="../../../skins/skin_priceCompare_at/pages/style.css" TYPE="text/css">
	</HEAD>
	<body MS_POSITIONING="GridLayout" bgColor="#ccccff">
		<form id="Form1" method="post" runat="server">
			<DIV style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" ms_positioning="FlowLayout"><FONT size="4">Registrierung 
					als neuer Partner von smartefox Shopping - Tel 2</FONT></DIV>
			<asp:Label id="lblDanke" style="Z-INDEX: 103; LEFT: 90px; POSITION: absolute; TOP: 551px" runat="server" Height="30px" Width="504px" Visible="False">Danke für Ihre Registrierung!</asp:Label>
			<TABLE border="0" id="Table1" style="Z-INDEX: 102; LEFT: 44px; WIDTH: 685px; POSITION: absolute; TOP: 36px; HEIGHT: 486px" cellSpacing="1" cellPadding="1" width="685" bgColor="#ffd700">
				<TR>
					<TD style="WIDTH: 110px">
						<asp:Label id="lblURL" runat="server">URL der Preisdatei:</asp:Label></TD>
					<TD style="WIDTH: 216px">
						<asp:TextBox id="txtURLFile" runat="server" Width="201px"></asp:TextBox></TD>
					<TD>z.B. <A href="http://www.shop.com/preisliste.csv">http://www.shop.com/preisliste.csv</A></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px">
						<asp:Label id="lblFTPServername" runat="server">FTP Servername:</asp:Label></TD>
					<TD style="WIDTH: 216px">
						<asp:TextBox id="txtFTPServername" runat="server" Width="200px"></asp:TextBox></TD>
					<TD>z.B. ftp<A href="ftp://ftp.shop.com">.shop.com</A></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px">
						<asp:Label id="lblFTPUsername" runat="server">FTP Username:</asp:Label></TD>
					<TD style="WIDTH: 216px">
						<asp:TextBox id="txtFTPUsername" runat="server" Width="200px"></asp:TextBox></TD>
					<TD>smartefox</TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px">
						<asp:Label id="lblFTPPasswort" runat="server">FTP Passwort:</asp:Label></TD>
					<TD style="WIDTH: 216px">
						<asp:TextBox id="txtFTPPasswort" runat="server" Width="200px"></asp:TextBox></TD>
					<TD>smartpasswort</TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"></TD>
					<TD style="WIDTH: 216px"></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px">
						<asp:Label id="Label1" runat="server">SHOP URL:</asp:Label></TD>
					<TD style="WIDTH: 216px">
						<asp:TextBox id="txtShopURL" runat="server" Width="200px"></asp:TextBox>&nbsp;</TD>
					<TD>z.B. <A href="http://www.shop.com">http://www.shop.com</A></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px">AGB URL:</TD>
					<TD style="WIDTH: 216px">
						<asp:TextBox id="txtAGBURL" runat="server" Width="200px"></asp:TextBox></TD>
					<TD>z.B. <A href="http://www.shop.com/agb.htm">http://www.shop.com/agb.htm</A></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px">Produkt URL</TD>
					<TD style="WIDTH: 216px">
						<asp:TextBox id="txtProduktURL" runat="server" Width="200px"></asp:TextBox></TD>
					<TD>z.B. <A href="http://www.shop.com/default.asp?productid=1001">http://www.shop.com/default.asp?productid=1001</A></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"></TD>
					<TD style="WIDTH: 216px"></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"></TD>
					<TD style="WIDTH: 216px"></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px">
						<asp:Label id="lblNotiz" runat="server">Notiz</asp:Label></TD>
					<TD style="WIDTH: 216px">
						<asp:TextBox id="TextBox5" runat="server" Height="182px" Width="277px"></asp:TextBox></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"></TD>
					<TD style="WIDTH: 216px"></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"></TD>
					<TD style="WIDTH: 216px">
						<asp:Button id="btnSend" runat="server" Width="207px" Text="registrieren"></asp:Button></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"></TD>
					<TD style="WIDTH: 216px"></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 110px"></TD>
					<TD style="WIDTH: 216px"></TD>
					<TD></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

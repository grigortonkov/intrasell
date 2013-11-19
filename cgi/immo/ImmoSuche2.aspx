<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ImmoSuche2.aspx.vb" Inherits="WebShop.ImmoSuche2"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ImmoSuche2</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" borderColor="#c0c0c0" cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<TD style="HEIGHT: 22px"><B><FONT face="Verdana" color="#980000" size="1"><B><FONT face="Verdana" color="#980000" size="1">Suchinserat 
										aufgeben&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Schritt 
										2/3)</FONT></B></FONT></B></TD>
				</TR>
			</TABLE>
			<BR>
			<TABLE id="Table3" borderColor="darkgray" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TR>
					<TH bgColor="gainsboro">
						<P align="left">Kurze Beschreibung Ihres gewünschten Objektes:</P>
					</TH>
				</TR>
				<TR>
					<TD>
						<asp:textbox id="txtBeschreibung" runat="server" Width="100%" Height="32px"></asp:textbox><BR>
					</TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table4" borderColor="#a9a9a9" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TR>
					<TH bgColor="#dcdcdc">
						<P align="left">Detailierte Beschreibung Ihres gewünschten Objektes:</P>
					</TH>
				</TR>
				<TR>
					<TD>
						<asp:textbox id="txtLage" runat="server" Width="100%" Height="32px"></asp:textbox></TD>
				</TR>
			</TABLE>
			<BR>
			<TABLE id="Table5" borderColor="#c0c0c0" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TBODY>
					<TR>
						<TH style="BORDER-RIGHT: medium none" bgColor="#f3f3f3">
							<P align="left">
								<FONT size="1"><B><B><FONT face="" size="1">Weitere zutreffende Angaben zum Objekt auswählen:</FONT></B></B></FONT></P>
						</TH>
					</TR>
					<TR>
						<TD style="BORDER-RIGHT: medium none" width="36%">
							<asp:datalist id="DataList1" runat="server" Width="100%" Height="100%" GridLines="Both" RepeatColumns="2">
								<HEADERTEMPLATE>
									<table>
								</HEADERTEMPLATE>
								<FOOTERTEMPLATE>
			</TABLE>
			</FooterTemplate>
			<ITEMTEMPLATE>
				<asp:checkbox id="CheckBoxOption" runat="server" Text='<%# Container.DataItem("KWName") %>'>
				</asp:checkbox>
			</ITEMTEMPLATE>
			</asp:datalist></TD></TR></TBODY></TABLE><BR>
			<BR>
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<TD align="right">
						<asp:TextBox id="txtArtNr" runat="server" Width="48px" DESIGNTIMEDRAGDROP="749" Enabled="False" BorderStyle="Dotted" BorderWidth="1px"></asp:TextBox>
						<asp:textbox id="txtAnbieter" runat="server" Width="48px" DESIGNTIMEDRAGDROP="750" Enabled="False" BorderStyle="Dotted" BorderWidth="1px"></asp:textbox>
						<asp:Button id="btnZurueck" runat="server" Width="180px" Text="zurück"></asp:Button>&nbsp;
						<asp:Button id="btnSpeichern" style="Z-INDEX: 106; LEFT: 400px" runat="server" Width="180px" Text="speichern &amp; weiter"></asp:Button></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

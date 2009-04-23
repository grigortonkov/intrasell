<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ImmoSuchinserat2.aspx.vb" Inherits="WebShop.ImmoSuchinserat2" %>
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
							<P>
								<asp:Label id="LabelGruppe1" runat="server" Width="200px">Label</asp:Label></P>
							<P>
								<asp:datalist id="Datalist2" runat="server" Height="100%" Width="424px" RepeatColumns="4" GridLines="Both"
									CssClass="extra">
									<HeaderTemplate>
										<table>
									</HeaderTemplate>
									<FooterTemplate>
			</TABLE>
			</FooterTemplate>
			<ItemTemplate>
				<asp:CheckBox id="CheckBoxOption" runat="server" Text='<%# Container.DataItem("KWName") %>'>
				</asp:CheckBox>
			</ItemTemplate>
			</asp:datalist>
			<asp:Label id="LabelGruppe2" runat="server" Width="200px">Label</asp:Label></P>
			<P>
				<asp:datalist id="Datalist3" runat="server" Height="100%" Width="424px" RepeatColumns="4" GridLines="Both"
					CssClass="extra">
					<HeaderTemplate>
						<table>
					</HeaderTemplate>
					<FooterTemplate>
						</TABLE>
					</FooterTemplate>
					<ItemTemplate>
						<asp:CheckBox id="CheckBoxOption" runat="server" Text='<%# Container.DataItem("KWName") %>'>
						</asp:CheckBox>
					</ItemTemplate>
				</asp:datalist>
				<asp:Label id="LabelGruppe3" runat="server" Width="200px">Label</asp:Label><BR>
			</P>
			<asp:datalist id="DataList1" runat="server" Height="100%" Width="424px" RepeatColumns="4" GridLines="Both"
				CssClass="extra">
				<HeaderTemplate>
					<table>
				</HeaderTemplate>
				<FooterTemplate>
					</TABLE>
				</FooterTemplate>
				<ItemTemplate>
					<asp:checkbox id="CheckBoxOption" runat="server" Text='<%# Container.DataItem("KWName") %>'>
					</asp:checkbox>
				</ItemTemplate>
			</asp:datalist></TD></TR></TBODY></TABLE><BR>
			<BR>
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<TD align="right">
						<asp:TextBox id="txtArtNr" runat="server" Width="48px" DESIGNTIMEDRAGDROP="749" Enabled="False"
							BorderWidth="1px" Visible="False"></asp:TextBox>
						<asp:textbox id="txtAnbieter" runat="server" Width="48px" DESIGNTIMEDRAGDROP="750" Enabled="False"
							BorderWidth="1px" Visible="False"></asp:textbox>
						<asp:Button id="btnZurueck" runat="server" Width="180px" Text="zurück"></asp:Button>&nbsp;
						<asp:Button id="btnSpeichern" style="Z-INDEX: 106; LEFT: 400px" runat="server" Width="180px"
							Text="speichern und weiter"></asp:Button></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

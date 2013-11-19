<%@ Page Language="vb" AutoEventWireup="false" Codebehind="merchantStatistics.aspx.vb" Inherits="WebShop.merchantStatistics" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>merchantStatistics</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../skins/skin_priceCompare_at/pages/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body bgColor="#ccccff" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table3" style="Z-INDEX: 102; LEFT: 11px; WIDTH: 573px; POSITION: absolute; TOP: 27px; HEIGHT: 155px" cellSpacing="1" cellPadding="1" width="573" border="0">
				<TR>
					<TD style="WIDTH: 100%; HEIGHT: 23px">Die folgende Tabelle stellt die&nbsp;Anzahl 
						der&nbsp;Klicks auf Ihren Angebote (*):
						<asp:textbox id="txtLieferantNr" runat="server" Visible="False"></asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 590px; HEIGHT: 10px"><asp:datagrid id="Datagrid_Angebote" runat="server" AutoGenerateColumns="False" PageSize="100" AllowSorting="True" Width="419px" Height="10px">
							<AlternatingItemStyle BackColor="#FFFFC0"></AlternatingItemStyle>
							<HeaderStyle BackColor="ControlLight"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="Ihre Nummer" HeaderText="Ihre Nummer"></asp:BoundColumn>
								<asp:BoundColumn DataField="Firma" HeaderText="Firma"></asp:BoundColumn>
								<asp:BoundColumn DataField="Monat" HeaderText="Monat"></asp:BoundColumn>
								<asp:BoundColumn DataField="AnzahlClicks" HeaderText="AnzahlClicks">
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 590px; HEIGHT: 18px">
						<DIV ms_positioning="text2D">(*) Kostenpflichtig sind ausschlieﬂlich Klicks zu 
							Ihren Angebots-Seiten.</DIV>
					</TD>
				</TR>
				<TR>
					<TD style="WIDTH: 590px">Die bestgeklickten Angebote aller Rubriken:</TD>
				</TR>
				<TR>
					<TD style="WIDTH: 590px"><asp:datagrid id="Datagrid_Clicks" runat="server" AutoGenerateColumns="False" PageSize="100" AllowSorting="True" Width="674px" Height="5px">
							<AlternatingItemStyle BackColor="#FFFFC0"></AlternatingItemStyle>
							<HeaderStyle BackColor="ControlLight"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="Ihre Nummer" HeaderText="Ihre Nummer"></asp:BoundColumn>
								<asp:BoundColumn DataField="Firma" HeaderText="Firma"></asp:BoundColumn>
								<asp:BoundColumn DataField="Monat" HeaderText="Monat"></asp:BoundColumn>
								<asp:BoundColumn DataField="Artikel#" HeaderText="Artikel #"></asp:BoundColumn>
								<asp:BoundColumn DataField="Produktbezeichnung" HeaderText="Produktbezeichnung"></asp:BoundColumn>
								<asp:BoundColumn DataField="AnzahlClicks" HeaderText="AnzahlClicks">
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Durchschnittspreis" HeaderText="Durchschnittspreis">
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid>(*) Angezeigt werden maximal die 100 bestgeklickten Angebote.
					</TD>
				</TR>
			</TABLE>
			<asp:button id="btnLoad" style="Z-INDEX: 103; LEFT: 479px; POSITION: absolute; TOP: 2px" runat="server" Width="213px" Height="25px" Text="diese Seite neu laden ..."></asp:button></form>
	</body>
</HTML>

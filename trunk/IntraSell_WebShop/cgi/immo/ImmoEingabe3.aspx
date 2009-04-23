<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ImmoEingabe3.aspx.vb" Inherits="WebShop.ImmoEingabe3"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ImmoEingabe3</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="VBScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<Td>
						<B><FONT face="Verdana" color="#980000" size="1">Objekt 
								inserieren&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Schritt 
								3/4)</FONT></B></Td>
				</TR>
			</TABLE>
			<br>
			<TABLE id="table4" borderColor="#c0c0c0" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TR>
					<TD style="BORDER-RIGHT: medium none" width="36%" bgColor="#f3f3f3"><FONT face="Verdana" size="1"><B>Anbieter-Objekt-Nr. 
								(falls erwünscht)</B></FONT><B><FONT face="Verdana" size="1">:&nbsp;&nbsp;
								<asp:textbox id="txtEAN" runat="server"></asp:textbox></FONT></B></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table1" borderColor="#c0c0c0" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TBODY>
					<TR>
						<Th style="BORDER-RIGHT: medium none; HEIGHT: 23px" width="36%" bgColor="#f3f3f3">
							<FONT face="Verdana" size="1"><B><B><FONT face="Verdana" size="1">Weitere zutreffende Angaben 
											zum Objekt auswählen:</FONT></B></B></FONT></Th>
					</TR>
					<TR>
						<TD style="BORDER-RIGHT: medium none" width="36%">
							<asp:datalist id="DataList1" runat="server" Height="100%" Width="100%" GridLines="Both" RepeatColumns="2">
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
			</asp:datalist></TD></TR></TBODY></TABLE>
			<br>
			<TABLE id="Table3" cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<TD align="right">
						<asp:TextBox id="txtArtNr" runat="server" Width="48px" Visible="False"></asp:TextBox>
						<asp:textbox id="txtAnbieter" runat="server" Width="48px" Enabled="False" Visible="False"></asp:textbox>&nbsp;
						<asp:Button id="btnZurueck" runat="server" Width="180px" Text="zurück"></asp:Button>
						<asp:button id="btnSpeichern" runat="server" Text="speichern &amp; weiter" Width="180px"></asp:button></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

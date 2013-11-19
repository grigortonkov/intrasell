<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Statistics.aspx.vb" Inherits="IRADA.Statistics"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Statistics</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
			<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
			<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
			<meta name="vs_defaultClientScript" content="JavaScript">
			<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<H2>Memberships</H2>
			<P>
				<asp:DataGrid id=DataGrid1 runat="server" DataSource="<%# Stats1 %>" DataMember="list_MembershipTypes" AutoGenerateColumns="False" BorderColor="Tan" BorderWidth="1px" BackColor="LightGoldenrodYellow" CellPadding="2" GridLines="None" ForeColor="Black">
					<FooterStyle BackColor="Tan"></FooterStyle>
					<SelectedItemStyle ForeColor="GhostWhite" BackColor="DarkSlateBlue"></SelectedItemStyle>
					<AlternatingItemStyle BackColor="PaleGoldenrod"></AlternatingItemStyle>
					<HeaderStyle Font-Bold="True" BackColor="Tan"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="TypeOfAccount" SortExpression="TypeOfAccount" HeaderText="TypeOfAccount"></asp:BoundColumn>
						<asp:BoundColumn DataField="Members" SortExpression="Members" HeaderText="Members"></asp:BoundColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Center" ForeColor="DarkSlateBlue" BackColor="PaleGoldenrod"></PagerStyle>
				</asp:DataGrid></P>
			<H2>Payment types</H2>
			<P>
				<asp:DataGrid id=DataGrid2 runat="server" DataSource="<%# Stats1 %>" DataMember="list_MembersPaymentOption" BorderColor="Tan" BorderWidth="1px" BackColor="LightGoldenrodYellow" CellPadding="2" GridLines="None" ForeColor="Black">
					<FooterStyle BackColor="Tan"></FooterStyle>
					<SelectedItemStyle ForeColor="GhostWhite" BackColor="DarkSlateBlue"></SelectedItemStyle>
					<AlternatingItemStyle BackColor="PaleGoldenrod"></AlternatingItemStyle>
					<HeaderStyle Font-Bold="True" BackColor="Tan"></HeaderStyle>
					<PagerStyle HorizontalAlign="Center" ForeColor="DarkSlateBlue" BackColor="PaleGoldenrod"></PagerStyle>
				</asp:DataGrid></P>
		</form>
	</body>
</HTML>

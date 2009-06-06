<%@ Page Language="vb" AutoEventWireup="false" Inherits="mabetex_news.news_sitemap" CodeFile="news_sitemap.aspx.vb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>news_sitemap</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<h1 align="center">Sitemap
			</h1>
			<p align="center">
				<asp:DataGrid id=DataGrid2 runat="server" DataSource="<%# DataSet_RandomNews1 %>" AutoGenerateColumns="False" DataKeyField="NewsNr" DataMember="News" Width="800px" HorizontalAlign="Center" GridLines="Horizontal" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" AllowPaging="True" ShowFooter="True">
					<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
					<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
					<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
					<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
					<HeaderStyle Font-Size="Larger" Font-Bold="True" ForeColor="#F7F7F7" BackColor="#99CCFF"></HeaderStyle>
					<Columns>
						<asp:HyperLinkColumn DataNavigateUrlField="Url" DataTextField="Titel" HeaderText="Titel">
							<HeaderStyle Width="400px"></HeaderStyle>
							<ItemStyle Font-Bold="True"></ItemStyle>
						</asp:HyperLinkColumn>
						<asp:BoundColumn DataField="ErstelltVon" SortExpression="ErstelltVon" HeaderText="ErstelltVon">
							<HeaderStyle Width="100px"></HeaderStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="Datum" SortExpression="Datum" HeaderText="Datum">
							<HeaderStyle Width="50px"></HeaderStyle>
							<ItemStyle Font-Italic="True"></ItemStyle>
						</asp:BoundColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
				</asp:DataGrid>
			</p>
		</form>
	</body>
</HTML>

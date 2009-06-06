<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Members.aspx.vb" Inherits="IRADA.Members"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Members</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<H1>IRADA Member List</H1>
			<P>
				<asp:DataGrid id=DataGrid1 runat="server" DataSource="<%# oblAllMembers %>" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" GridLines="Vertical">
					<FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
					<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
					<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
					<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
					<Columns>
						<asp:ButtonColumn Text="edit" CommandName="Select"></asp:ButtonColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
				</asp:DataGrid></P>
			<H2>Email List: (copy to your email programm)
			</H2>
			<P>
				<asp:DataGrid id=DataList_Emails runat="server" GridLines="None" CellPadding="3" BackColor="White" BorderWidth="2px" BorderStyle="Ridge" BorderColor="White" DataSource="<%# oblAllMembers %>" DataMember="Members" AutoGenerateColumns="False" CellSpacing="1" Width="352px">
					<FooterStyle ForeColor="Black" BackColor="#C6C3C6"></FooterStyle>
					<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#9471DE"></SelectedItemStyle>
					<ItemStyle ForeColor="Black" BackColor="#DEDFDE"></ItemStyle>
					<HeaderStyle Font-Bold="True" ForeColor="#E7E7FF" BackColor="#4A3C8C"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="E-mail Address" SortExpression="E-mail Address" HeaderText="E-mail Address"></asp:BoundColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#C6C3C6"></PagerStyle>
				</asp:DataGrid></P>
		</form>
	</body>
</HTML>

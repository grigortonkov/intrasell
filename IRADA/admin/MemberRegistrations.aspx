<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MemberRegistrations.aspx.vb" Inherits="IRADA.MemberRegistrations"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>MemberRegistrations</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr>
					<td width="440">
						<H4>Meetings (see registered Users)</H4>
					</td>
					<td>
						<H4>Events (see registered Users)</H4>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id=DataGrid_Meetings runat="server" Width="414px" GridLines="Vertical" DataSource="<%# objMeetingsEvents %>" DataMember="Meetings" BorderColor="#DEDFDE" BorderWidth="1px" BackColor="White" CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" DataKeyField="Id" BorderStyle="None" Height="112px">
							<FooterStyle BackColor="#CCCC99"></FooterStyle>
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
							<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
							<ItemStyle BackColor="#F7F7DE"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
							<Columns>
								<asp:BoundColumn Visible="False" DataField="Id" SortExpression="Id" HeaderText="Id"></asp:BoundColumn>
								<asp:ButtonColumn Text="select" ButtonType="PushButton" CommandName="Select"></asp:ButtonColumn>
								<asp:BoundColumn DataField="Description" SortExpression="Description" HeaderText="Description"></asp:BoundColumn>
								<asp:BoundColumn DataField="Price" SortExpression="Price" HeaderText="Price"></asp:BoundColumn>
								<asp:BoundColumn DataField="Registrations" SortExpression="Registrations" HeaderText="Registrations"></asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#F7F7DE" Mode="NumericPages"></PagerStyle>
						</asp:datagrid></td>
					<td>
						<asp:datagrid id=DataGrid_Events runat="server" Width="347px" GridLines="Vertical" DataSource="<%# objMeetingsEvents %>" DataMember="Events" BorderColor="#DEDFDE" BorderWidth="1px" BackColor="White" CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" BorderStyle="None">
							<FooterStyle BackColor="#CCCC99"></FooterStyle>
							<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#CE5D5A"></SelectedItemStyle>
							<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
							<ItemStyle BackColor="#F7F7DE"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#6B696B"></HeaderStyle>
							<Columns>
								<asp:BoundColumn Visible="False" DataField="Id" SortExpression="Id" HeaderText="Id"></asp:BoundColumn>
								<asp:ButtonColumn Text="select" ButtonType="PushButton" CommandName="Select"></asp:ButtonColumn>
								<asp:BoundColumn DataField="Presenter" SortExpression="Presenter" HeaderText="Presenter"></asp:BoundColumn>
								<asp:BoundColumn DataField="Schedule" SortExpression="Schedule" HeaderText="Schedule"></asp:BoundColumn>
								<asp:BoundColumn DataField="Topic" SortExpression="Topic" HeaderText="Topic"></asp:BoundColumn>
								<asp:BoundColumn DataField="Registrations" SortExpression="Registrations" HeaderText="Registrations"></asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#F7F7DE" Mode="NumericPages"></PagerStyle>
						</asp:datagrid></td>
				</tr>
				<tr>
					<td colspan="2">
						<P>&nbsp;</P>
						<H4 align="center">Registered Users</H4>
						<asp:DataGrid id="DataGrid_Members" runat="server" DataSource="<%# objMembers %>" BorderStyle="None" AutoGenerateColumns="False" CellPadding="3" BackColor="White" BorderWidth="1px" BorderColor="#E7E7FF" DataMember="Members" GridLines="Horizontal">
							<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
							<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
							<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
							<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
							<HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="ID1" SortExpression="ID1" HeaderText="ID1"></asp:BoundColumn>
								<asp:BoundColumn DataField="ID1" SortExpression="ID" HeaderText="ID"></asp:BoundColumn>
								<asp:BoundColumn DataField="TypeOfAccount" SortExpression="TypeOfAccount" HeaderText="TypeOfAccount"></asp:BoundColumn>
								<asp:BoundColumn DataField="First_name" SortExpression="First_name" HeaderText="First_name"></asp:BoundColumn>
								<asp:BoundColumn DataField="Last_Name" SortExpression="Last_Name" HeaderText="Last_Name"></asp:BoundColumn>
								<asp:BoundColumn DataField="Student" SortExpression="Student" HeaderText="Student"></asp:BoundColumn>
								<asp:BoundColumn DataField="Address" SortExpression="Address" HeaderText="Address">
									<HeaderStyle Width="200px"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="City" SortExpression="City" HeaderText="City">
									<HeaderStyle Width="50px"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="State" SortExpression="State" HeaderText="State"></asp:BoundColumn>
								<asp:BoundColumn DataField="ZipCode" SortExpression="ZipCode" HeaderText="ZipCode"></asp:BoundColumn>
								<asp:BoundColumn DataField="Work_Phone" SortExpression="Work_Phone" HeaderText="Work_Phone"></asp:BoundColumn>
								<asp:BoundColumn DataField="E-mail Address" SortExpression="E-mail Address" HeaderText="E-mail Address"></asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
						</asp:DataGrid></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

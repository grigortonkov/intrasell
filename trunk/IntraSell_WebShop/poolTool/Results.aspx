<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Results.aspx.vb" Inherits="poolTool.Results"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Results</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" name="vs_targetSchema">
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<P>
				<asp:Label id=Label_Number_Users runat="server" Text='<%# DataBinder.Eval(objTests, "Tables[statisticsCountUsers].DefaultView.[0].countusers") %>' ForeColor="White">
				</asp:Label>&nbsp;<FONT color="#ffffff">Users went through our survey.....<BR>
				</FONT>
				<asp:datagrid id=DataGrid runat="server" DataSource="<%# Dataset_statisticsAnswers %>" DataMember="statistictsAnswers" AutoGenerateColumns="False" Width="210px" Height="48px" GridLines="Horizontal" BorderStyle="None" BorderColor="#2b2b2b" ForeColor="#FF8E0E">
					<Columns>
						<asp:BoundColumn DataField="Answer" SortExpression="Answer" HeaderText="Answer" HeaderStyle-ForeColor="#ff8e0e"></asp:BoundColumn>
						<asp:BoundColumn DataField="CountAnswers" SortExpression="CountAnswers" HeaderText="Count" ItemStyle-ForeColor="#ff8e0e"
							HeaderStyle-ForeColor="#ff8e0e"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="In Percent" ItemStyle-ForeColor="#ff8e0e" HeaderStyle-ForeColor="#ff8e0e">
							<HeaderStyle Width="200px"></HeaderStyle>
							<ItemStyle ForeColor="White"></ItemStyle>
							<ItemTemplate>
								<img src="1.jpg" height=16 width='<%# DataBinder.Eval(Container, "DataItem.InPercent") %>'>
								<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InPercent") %>' ForeColor="#ff8e0e">
								</asp:Label><FONT color="#ff8e0e">%</FONT>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InPercent") %>'>
								</asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:datagrid></P>
			<P><FONT color="#ffffff">The Poll results are not scientific and it’s reflect the 
					opinion of only the ITN.tv viewers, who choose to participate.</FONT>
				<BR>
				<asp:LinkButton id="back" runat="server">back</asp:LinkButton></P>
		</form>
	</body>
</HTML>

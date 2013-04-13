<%@ Page Language="vb" AutoEventWireup="false" Codebehind="EditEvents.aspx.vb" Inherits="IRADA.EditEvents"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>EditEvents</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<DIV id="queryDiv">
				<TABLE id="queryTable" width="100%">
					<TR>
						<TD></TD>
						<TD><asp:button id="buttonLoad" accessKey="L" runat="server" Text="Load"></asp:button>&nbsp;
							<asp:button id="ButtonSave" accessKey="L" runat="server" Text="Save"></asp:button>&nbsp;
							<asp:button id="ButtonNew" accessKey="L" runat="server" Text="New Event"></asp:button>&nbsp;
							<asp:button id="Button1" accessKey="L" runat="server" Text="New Meeting"></asp:button></TD>
					</TR>
				</TABLE>
			</DIV>
			<H1>Edit Events
				<BR>
				<asp:datagrid id=myDataGrid runat="server" AutoGenerateColumns="False" ShowFooter="True" AllowSorting="True" CellSpacing="1" GridLines="None" BackColor="White" BorderWidth="2px" BorderStyle="Ridge" BorderColor="White" DataSource="<%# objDataset_MeetingsEvents %>" CellPadding="3" DataMember="Events" Width="792px" Height="176px" PageSize="5" DataKeyField="Id">
					<FooterStyle ForeColor="Black" BackColor="#C6C3C6"></FooterStyle>
					<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#9471DE"></SelectedItemStyle>
					<ItemStyle ForeColor="Black" BackColor="#DEDFDE"></ItemStyle>
					<HeaderStyle Font-Names="Verdana" Font-Bold="True" Height="10px" ForeColor="#E7E7FF" BackColor="#4A3C8C"></HeaderStyle>
					<Columns>
						<asp:ButtonColumn Text="del" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
						<asp:BoundColumn DataField="Id" SortExpression="Id" HeaderText="Id"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="Presenter">
							<ItemTemplate>
								<asp:TextBox id=Presenter runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Presenter") %>' Width="100px" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Topic">
							<ItemTemplate>
								<asp:TextBox id="Topic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Topic") %>' Width="100px" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Schedule">
							<ItemTemplate>
								<asp:TextBox id="Schedule" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Schedule") %>' Width="100px" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Place">
							<ItemTemplate>
								<asp:TextBox id="Place" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Place") %>' Width="100px" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Price">
							<ItemTemplate>
								<asp:TextBox id="Price" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Price") %>' Width="100px" />
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#C6C3C6"></PagerStyle>
				</asp:datagrid></H1>
			<H1>Edit Meetings</H1>
			<P><asp:datagrid id=DataGrid_Meeting runat="server" AutoGenerateColumns="False" ShowFooter="True" AllowSorting="True" CellSpacing="1" GridLines="None" BackColor="White" BorderWidth="2px" BorderStyle="Ridge" BorderColor="White" DataSource="<%# objDataset_MeetingsEvents %>" CellPadding="3" DataMember="Meetings" Width="792px" Height="176px" PageSize="5" DataKeyField="Id">
					<FooterStyle ForeColor="Black" BackColor="#C6C3C6"></FooterStyle>
					<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#9471DE"></SelectedItemStyle>
					<ItemStyle ForeColor="Black" BackColor="#DEDFDE"></ItemStyle>
					<HeaderStyle Font-Names="Verdana" Font-Bold="True" Height="10px" ForeColor="#E7E7FF" BackColor="#4A3C8C"></HeaderStyle>
					<Columns>
						<asp:ButtonColumn Text="del" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
						<asp:BoundColumn DataField="Id" SortExpression="Id" HeaderText="Id"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="Description">
							<ItemTemplate>
								<asp:TextBox id=Description runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Width="100px" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Price">
							<ItemTemplate>
								<asp:TextBox id="mPrice" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Price") %>' Width="100px" />
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#C6C3C6"></PagerStyle>
				</asp:datagrid></P>
		</form>
	</body>
</HTML>

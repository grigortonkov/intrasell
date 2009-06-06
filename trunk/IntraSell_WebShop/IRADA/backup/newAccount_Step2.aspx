<%@ Page Language="vb" AutoEventWireup="false" Codebehind="newAccount_Step2.aspx.vb" Inherits="IRADA.newAccount_Step2"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>newAccount_Step2</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<DIV align="center">
				<TABLE id="table4" cellSpacing="0" cellPadding="0" width="500" border="0">
					<TR>
						<TD width="497" colSpan="3"><B>Events and Meetings
								<asp:TextBox id="Member" runat="server" Width="65px" BorderStyle="None">1</asp:TextBox></B><BR>
							&nbsp;</TD>
					</TR>
					<TR>
						<TD vAlign="top" width="497" colSpan="3" height="141">Pricing for each meeting:<BR>
							&nbsp;
							<asp:datagrid id=DataGrid_Meetings runat="server" DataSource="<%# objMeetingsEvents %>" DataMember="Meetings" Width="485px" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="4" GridLines="Vertical" ForeColor="Black" AutoGenerateColumns="False" DataKeyField="Id">
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
								</Columns>
								<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#F7F7DE" Mode="NumericPages"></PagerStyle>
							</asp:datagrid>
							<P>Please choose an event:<BR>
								&nbsp;
								<asp:datagrid id=DataGrid_Events runat="server" DataSource="<%# objMeetingsEvents %>" DataMember="Events" Width="485px" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="4" GridLines="Vertical" ForeColor="Black" AutoGenerateColumns="False">
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
									</Columns>
									<PagerStyle HorizontalAlign="Right" ForeColor="Black" BackColor="#F7F7DE" Mode="NumericPages"></PagerStyle>
								</asp:datagrid><BR>
								&nbsp;</P>
						</TD>
					</TR>
					<TR>
						<TD width="165">&nbsp;</TD>
						<TD width="162">&nbsp;</TD>
						<TD width="170">&nbsp;</TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV align="center">
				<TABLE id="table15" cellSpacing="0" cellPadding="0" width="500" border="0">
					<TR>
						<TD width="165"><B>Privacy:</B></TD>
						<TD width="162">&nbsp;</TD>
						<TD width="170">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="497" colSpan="3">
							<DIV align="center">
								<TABLE id="table16" cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TR>
										<TD width="34">
											<P align="center"><asp:checkbox id="cb_DND" runat="server"></asp:checkbox></P>
										</TD>
										<TD>I do not wish to have my name and information published on IRADA's web site or 
											other publications</TD>
									</TR>
								</TABLE>
							</DIV>
						</TD>
					</TR>
					<TR>
						<TD width="497" colSpan="3">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="165">&nbsp;</TD>
						<TD width="162">&nbsp;</TD>
						<TD width="170">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="165"><B>Payment Method:</B></TD>
						<TD width="162">&nbsp;</TD>
						<TD width="170">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="165">&nbsp;</TD>
						<TD width="162">&nbsp;</TD>
						<TD width="170">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="497" colSpan="3"><asp:radiobuttonlist id="rb_PayMethod" runat="server" Width="325px" RepeatColumns="3">
								<asp:ListItem Value="CreditCard">CreditCard</asp:ListItem>
								<asp:ListItem Value="Check">Check</asp:ListItem>
								<asp:ListItem Value="Cach">Cach</asp:ListItem>
							</asp:radiobuttonlist></TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV align="center">
				<TABLE id="table18" cellSpacing="0" cellPadding="0" width="500" border="0">
					<TR>
						<TD width="167">&nbsp;</TD>
						<TD width="162">&nbsp;</TD>
						<TD>&nbsp;</TD>
					</TR>
					<TR>
						<TD width="167">&nbsp;
							<asp:TextBox id="txt_Meeting" runat="server" Width="101px" Height="19px"></asp:TextBox></TD>
						<TD width="162">&nbsp;
							<asp:TextBox id="txt_Event" runat="server" Width="82px" Height="19px"></asp:TextBox></TD>
						<TD><INPUT id="Submit_Form" style="FLOAT: right" type="submit" value="Continue >>" name="B2"
								runat="server"></TD>
					</TR>
					<TR>
						<TD width="167">&nbsp;</TD>
						<TD width="162">&nbsp;</TD>
						<TD>&nbsp;</TD>
					</TR>
				</TABLE>
			</DIV>
		</form>
	</body>
</HTML>

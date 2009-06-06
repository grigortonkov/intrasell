<%@ Page Language="vb" AutoEventWireup="false" Codebehind="registerForEvent.aspx.vb" Inherits="IRADA.registerForEvent"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>registerForEvent</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="table4" cellSpacing="0" cellPadding="0" width="500" border="0">
				<TR>
					<TD width="497" colSpan="3"><B>Register for Event&nbsp;</B><BR>
						&nbsp;</TD>
				</TR>
				<TR>
					<TD vAlign="top" width="497" colSpan="3" height="141">
						<BR>
						&nbsp;
						<P>Please choose an event:<BR>
							&nbsp;
							<asp:datagrid id=DataGrid_Events runat="server" Width="485px" BorderStyle="None" DataSource="<%# objMeetingsEvents %>" DataMember="Events" BorderColor="#DEDFDE" BorderWidth="1px" BackColor="White" CellPadding="4" GridLines="Vertical" ForeColor="Black" AutoGenerateColumns="False">
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
			<TABLE id="table18" cellSpacing="0" cellPadding="0" width="500" border="0">
				<TR>
					<TD width="167">&nbsp;</TD>
					<TD width="162">&nbsp;</TD>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD width="167">&nbsp;
						<asp:TextBox id="Member" runat="server" BorderStyle="None" Width="65px" Visible="False">1</asp:TextBox></TD>
					<TD width="162">&nbsp;
						<asp:TextBox id="txt_Event" runat="server" Width="82px" Height="19px" BorderStyle="None" Visible="False"></asp:TextBox></TD>
					<TD><INPUT id="Submit_Form" style="FLOAT: right" type="submit" value="Register" name="B2" runat="server"></TD>
				</TR>
				<TR>
					<TD width="167">&nbsp;</TD>
					<TD width="162">&nbsp;</TD>
					<TD>&nbsp;</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MemberEdit.aspx.vb" Inherits="IRADA.MemberEdit"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>MemberEdit</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
			<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
			<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
			<meta name="vs_defaultClientScript" content="JavaScript">
			<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<H1 id="queryDiv">Edit Member</H1>
			<P>
				Edit Membership Information
				<asp:TextBox id="ID1" runat="server" BorderStyle="None"></asp:TextBox><BR>
			</P>
			<P>
				<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="1">
					<TR>
						<TD>Account Type</TD>
						<TD>
							<asp:TextBox id=AccountType runat="server" Text='<%# DataBinder.Eval(objDataSet_Members, "Tables[Members].DefaultView.[0].TypeOfAccount") %>'>
							</asp:TextBox></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD>First Name</TD>
						<TD>
							<asp:TextBox id=first_name runat="server" Text='<%# DataBinder.Eval(objDataSet_Members, "Tables[Members].DefaultView.[0].first_name") %>'>
							</asp:TextBox></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD>Last Name</TD>
						<TD>
							<asp:TextBox id=last_name runat="server" Text='<%# DataBinder.Eval(objDataSet_Members, "Tables[Members].DefaultView.[0].last_name") %>'>
							</asp:TextBox></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD>Date Paid</TD>
						<TD>
							<asp:TextBox id=DatePaid runat="server" Text='<%# DataBinder.Eval(objDataSet_Members, "Tables[Members].DefaultView.[0].DatePaid") %>'>
							</asp:TextBox></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD>Amount Paid</TD>
						<TD>
							<asp:TextBox id=AmountPaid runat="server" Text='<%# DataBinder.Eval(objDataSet_Members, "Tables[Members].DefaultView.[0].Payment") %>'>
							</asp:TextBox></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD>
							<asp:Button id="Button_Save" runat="server" Text="save" Width="152px"></asp:Button></TD>
						<TD></TD>
					</TR>
				</TABLE>
			</P>
			<H2>Members Payments</H2>
			<P>
				<asp:DataGrid id=DataGrid1 runat="server" DataSource="<%# objDataSet_Members %>" DataMember="Member_Payment">
				</asp:DataGrid></P>
			<P>&nbsp;</P>
		</form>
	</body>
</HTML>

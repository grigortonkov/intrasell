<%@ Page Language="vb" AutoEventWireup="false" Codebehind="myAccount.aspx.vb" Inherits="IRADA.myAccount"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>myAccount</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
			<meta name="vs_snapToGrid" content="False">
			<meta name="vs_showGrid" content="False">
			<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
			<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
			<meta name="vs_defaultClientScript" content="JavaScript">
			<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<B>
				<asp:Panel id="PanelLogin" runat="server" BackColor="white">
					<P align="center">Login</P>
					<P>
						<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" align="center" border="0">
							<TR>
								<TD>
									<asp:Label id="Label2" runat="server">Email</asp:Label></TD>
								<TD>
									<asp:TextBox id="txtUsername" runat="server"></asp:TextBox></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD>
									<asp:Label id="Label3" runat="server">Password</asp:Label></TD>
								<TD>
									<asp:TextBox id="txtPassword" runat="server" TextMode="Password"></asp:TextBox></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD></TD>
								<TD>
									<asp:Button id="ButtonLogin" runat="server" Width="154px" Text="LogIn"></asp:Button></TD>
								<TD></TD>
							</TR>
						</TABLE>
					</P>
				</asp:Panel>
				<asp:Panel id="PanelMembersArea" runat="server" Height="80px" Visible="False" BackColor="WhiteSmoke">
					<P>My Account Information:
						<asp:Label id=TypeOfAccount runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].TypeOfAccount") %>' Visible="False">
						</asp:Label>
						<BR>
						Account of:
						<asp:Label id=Name runat="server" Visible="False" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].First_Name") &amp; " " &amp; DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Last_Name") %>' Width="191px">
						</asp:Label>
						<asp:Label id=ID1 runat="server" Visible="False" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].ID1") %>' Width="45px">
						</asp:Label></P>
					<P>
						<BR>
			</B>You are registered since:&nbsp; <B>
				<asp:Label id="registeredSince" runat="server" Visible="False" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].CreationTime") %>'>
				</asp:Label>
				<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="300" align="center" border="1">
					<TR>
						<TD>
							<P>
								<asp:Panel id="PanelMember" runat="server" Width="662px" Visible="False" BackColor="White">
									<P>You are a member
									</P>
									<P>since
										<asp:Label id=DatePaid runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].DatePaid") %>' Visible="False" Font-Bold="True">
										</asp:Label>'til&nbsp;
										<asp:Label id="DatePaidTo" runat="server" Visible="False" Font-Bold="True"></asp:Label></P>
									<P><FONT color="#ff0000">&nbsp; </FONT>
										<asp:LinkButton id="btn_renew" runat="server">renew my membership </asp:LinkButton><BR>
										<BR>
										&nbsp;
										<asp:LinkButton id="register_for_event_member" runat="server">register for an event</asp:LinkButton></P>
									<P>&nbsp;</P>
								</asp:Panel>
						</TD>
					</TR>
					<TR>
						<TD>
							<asp:Panel id="PanelNotMember" runat="server" Width="663px" BackColor="Gainsboro">
								<P></P>
								<P>You are not a member yet</P>
								<P>
									<asp:Label id="lblNotYetPaid" runat="server" ForeColor="Red">You requested membership, but your account is not yet free!</asp:Label></P>
								<P><BR>
									&nbsp;
									<asp:LinkButton id="LinkButton_BekomeMember" runat="server">become a member</asp:LinkButton><BR>
									<BR>
									&nbsp;
									<asp:LinkButton id="register_for_event" runat="server">register for an event</asp:LinkButton></P>
								<P>
							</asp:Panel></P></TD>
					</TR>
				</TABLE>
				</P></B>
			<P>&nbsp;</P>
			<P></TD></TR><TR>
					<TD width="236">&nbsp;</TD>
					&nbsp;
					<TD width="92">&nbsp;</TD>
					&nbsp;
					<TD width="170">&nbsp;</TD>
				</TR>
				<TR>
					<TD width="236"><B>
							<asp:LinkButton id="LinkButton_EDIT" runat="server">Edit my account information</asp:LinkButton></B></TD>
					&nbsp;&nbsp;
					<TD width="92">&nbsp;</TD>
					&nbsp;&nbsp;&nbsp;
					<TD width="170"></TD>
					&nbsp;&nbsp;
				</TR>
				&nbsp;<TR>
					&nbsp;<TD width="236">&nbsp;</TD>
					&nbsp;&nbsp;&nbsp;<TD width="92">&nbsp;</TD>
					&nbsp;&nbsp;&nbsp;<TD width="170">
				&nbsp;&nbsp;&nbsp;
			</P>
			</asp:Panel></B>
		</form>
	</body>
</HTML>

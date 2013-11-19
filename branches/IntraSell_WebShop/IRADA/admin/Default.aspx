<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Default.aspx.vb" Inherits="IRADA._Default"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Default</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<DIV align="center">
				<TABLE id="table1" cellSpacing="0" cellPadding="0" width="800" border="0">
					<TR>
						<TD width="113">&nbsp;</TD>
						<TD width="275">&nbsp;</TD>
						<TD width="343">&nbsp;</TD>
						<TD>&nbsp;</TD>
					</TR>
					<TR>
						<TD vAlign="top" width="113"><STRONG>List Of Users:</STRONG></TD>
						<TD width="275"><SELECT id="search_typeOfRegistration1" size="1" name="search_typeOfRegistration1" runat="server">
								<OPTION selected>Normal</OPTION>
								<OPTION>Single_Meetings</OPTION>
								<OPTION>Membership</OPTION>
							</SELECT><BR>
							All that paid the membership part</TD>
						<TD vAlign="top" width="343">&nbsp;
							<asp:TextBox id="creationTime" runat="server" Width="95px">01/01/2005</asp:TextBox>&nbsp;till
							<asp:TextBox id="creationTime1" runat="server" Width="89px">01/01/2015</asp:TextBox></TD>
						<TD>&nbsp;
							<asp:Button id="ButtonSearchUsers" runat="server" Text="Search" Width="80px" Height="80px"></asp:Button></TD>
					</TR>
					<TR>
						<TD width="113" bgColor="#ffcc66">&nbsp;</TD>
						<TD width="275" bgColor="#ffcc66">&nbsp;</TD>
						<TD width="343" bgColor="#ffcc66">&nbsp;</TD>
						<TD bgColor="#ffcc66">&nbsp;</TD>
					</TR>
					<TR>
						<TD vAlign="top" width="113"><STRONG>Send email:</STRONG></TD>
						<TD width="275">send email to:
							<BR>
							<BR>
							<SELECT size="1" name="search_typeOfRegistration1_Email" id="search_typeOfRegistration1_Email"
								runat="server">
								<OPTION selected>Normal</OPTION>
								<OPTION>Single_Meetings</OPTION>
								<OPTION>Membership</OPTION>
							</SELECT><BR>
							All that paid the membership part<BR>
							<BR>
							List of users for events:<BR>
							<BR>
							<asp:DropDownList id=Event_Email runat="server" DataSource="<%# objMeetingsEvents %>" DataMember="Events" DataTextField="Topic" DataValueField="Topic" AutoPostBack="True">
							</asp:DropDownList><BR>
							<BR>
							List of users (all registered, paid or not paid)</TD>
						<TD vAlign="top" width="343">&nbsp;
							<asp:TextBox id="creationTime_email" runat="server" Width="95px">01/01/2005</asp:TextBox>till
							<asp:TextBox id="creationTime_email1" runat="server" Width="89px">01/01/2015</asp:TextBox></TD>
						<TD>&nbsp;
							<asp:Button id="Button_SendMail" runat="server" Text="Send Email" Width="80px" Height="80px"></asp:Button></TD>
					</TR>
					<TR>
						<TD width="113" bgColor="#ffff66">&nbsp;</TD>
						<TD width="275" bgColor="#ffff66">&nbsp;</TD>
						<TD width="343" bgColor="#ffff66">&nbsp;</TD>
						<TD bgColor="#ffff66">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="113"><STRONG>Search User:</STRONG></TD>
						<TD width="618" colSpan="2">
							<P>Type of registration
								<SELECT id="search_typeOfRegistration" size="1" name="D3" runat="server">
									<OPTION selected></OPTION>
									<OPTION>Normal</OPTION>
									<OPTION>Single_Meetings</OPTION>
									<OPTION>Membership</OPTION>
								</SELECT></P>
							<P>Name:<INPUT id="searchName" size="12" value="type here" name="T10" runat="server">
								or Address: <INPUT id="searchAddress" size="12" value="type here" name="T11" runat="server">
								or Member Id: <INPUT id="searchID" size="12" value="0" name="T12" runat="server">&nbsp;&nbsp;
								<BR>
								and after it an option to edit user information or membership and payment 
								method</P>
							<P>Registration from
								<asp:TextBox id="creationTime_" runat="server" Width="95px" Enabled="False">01/01/2005</asp:TextBox>
								&nbsp;till
								<asp:TextBox id="creationTime1_" runat="server" Width="89px" Enabled="False">01/01/2015</asp:TextBox></P>
						</TD>
						<TD>&nbsp;
							<asp:Button id="btnSearch" runat="server" Text="Search" Width="80px" Height="80px"></asp:Button></TD>
					</TR>
					<TR>
						<TD width="113">&nbsp;</TD>
						<TD width="275">&nbsp;</TD>
						<TD width="343">&nbsp;</TD>
						<TD>&nbsp;</TD>
					</TR>
					<TR>
						<TD width="113" bgColor="#ffff00">&nbsp;</TD>
						<TD width="275" bgColor="#ffff00">&nbsp;</TD>
						<TD width="343" bgColor="#ffff00">&nbsp;</TD>
						<TD bgColor="#ffff00">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="113">Edit events</TD>
						<TD width="275">go to a list for add , remove or edit event</TD>
						<TD width="343">&nbsp;</TD>
						<TD>&nbsp;
							<asp:Button id="ButtonEditEvents" runat="server" Text="Edit Events" Width="80px" Height="80px"></asp:Button></TD>
					</TR>
					<TR>
						<TD width="113">&nbsp;</TD>
						<TD width="275">&nbsp;</TD>
						<TD width="343">&nbsp;</TD>
						<TD>&nbsp;</TD>
					</TR>
					<TR>
						<TD width="113">&nbsp;</TD>
						<TD width="275">&nbsp;</TD>
						<TD width="343">&nbsp;</TD>
						<TD>&nbsp;</TD>
					</TR>
					<TR>
						<TD width="113">&nbsp;</TD>
						<TD width="275">&nbsp;</TD>
						<TD width="343">&nbsp;</TD>
						<TD>&nbsp;</TD>
					</TR>
				</TABLE>
			</DIV>
		</form>
	</body>
</HTML>

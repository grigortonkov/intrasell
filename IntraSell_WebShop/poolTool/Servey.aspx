<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Servey.aspx.vb" Inherits="poolTool.Servey"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Servey</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<table border="0" width="210" id="table1" cellspacing="0" cellpadding="0">
				<tr>
					<td height="181" valign="top">
						<img border="0" src="spacer.gif" width="1" height="3">
						<span lang="en-us">
							<font face="Verdana" size="1" color="#ffffff">We will select one e-mail adders out 
								of all participants to be the lucky one who will win $1000:00 Cash.
								<BR>
								(The winner can not be the ITN.tv staff, neither family member of the 
								employees)&nbsp;
								<br>
								<br>
								&nbsp;</font></span><div align="center">
							<table border="0" width="92%" id="table2" cellspacing="0" cellpadding="0">
								<tr>
									<td width="90"><span lang="en-us">
											<font face="Verdana" size="1" color="#ffffff">Name:</font></span></td>
									<td width="165">
										<p align="center">
											<asp:TextBox id="Name" runat="server" BackColor="White" BorderColor="Black"></asp:TextBox>
											<asp:Label id="error_Name" runat="server" Visible="False" ForeColor="Red">Name is required!</asp:Label></p>
									</td>
								</tr>
								<tr>
									<td width="90"><span lang="en-us">
											<font face="Verdana" size="1" color="#ffffff">Last name:</font></span></td>
									<td width="165">
										<p align="center">
											<asp:TextBox id="Lastname" runat="server" BackColor="White" BorderColor="Black"></asp:TextBox>
											<asp:Label id="error_LastName" runat="server" Visible="False" ForeColor="Red">Last name is required!</asp:Label></p>
									</td>
								</tr>
								<tr>
									<td width="90"><span lang="en-us">
											<font face="Verdana" size="1" color="#ffffff">Phone:</font></span></td>
									<td width="165">
										<p align="center">
											<asp:TextBox id="Phone" runat="server" BackColor="White" BorderColor="Black"></asp:TextBox></p>
									</td>
								</tr>
								<tr>
									<td width="90"><span lang="en-us">
											<font face="Verdana" size="1" color="#ffffff">Email*:</font></span></td>
									<td width="165">
										<p align="center">
											<asp:TextBox id="Email" runat="server" BackColor="White" BorderColor="Black"></asp:TextBox>
											<asp:Label id="error_EmailIsMissing" runat="server" ForeColor="Red" Visible="False">Email is required!</asp:Label></p>
									</td>
								</tr>
								<tr>
									<td width="90"><span lang="en-us">
											<font face="Verdana" size="1" color="#ffffff"></font>
										</span></td>
									<td width="165">
										<asp:ImageButton id="ImageButton1" runat="server" ImageUrl="show.gif" BorderWidth="0px"></asp:ImageButton>
									</td>
								</tr>
							</table>
							&nbsp;
						</div>
					</td>
				</tr>
				<tr>
					<td>
						This information will not be use by anyone outside of the ITN.tv organizations. 
						You will be notified privately and if you wish we will announce it on our 
						web-site.</td>
				</tr>
			</table>
			<asp:TextBox id="MailSubject" runat="server" Visible="False"></asp:TextBox>
			<asp:TextBox id="MailText" runat="server" Visible="False"></asp:TextBox>
			<asp:TextBox id="MailFrom" runat="server" Visible="False"></asp:TextBox>
			<asp:TextBox id="SMTP" runat="server" Visible="False"></asp:TextBox>
		</form>
	</body>
</HTML>

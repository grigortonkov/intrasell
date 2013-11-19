<%@ Page Language="vb" AutoEventWireup="false" Codebehind="renewMembership.aspx.vb" Inherits="IRADA.RenewMembership"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>RenewMembership</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="table18" cellSpacing="0" cellPadding="0" width="500" border="0">
				<TR>
					<TD width="167">&nbsp;</TD>
					<TD width="162">&nbsp;</TD>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD width="167" height="11">&nbsp;
						<asp:TextBox id="Member" runat="server" Width="65px" BorderStyle="None" Visible="False">1</asp:TextBox></TD>
					<TD width="162" height="11">&nbsp;
						<asp:TextBox id="txt_Event" runat="server" Width="82px" BorderStyle="None" Height="19px" Visible="False"></asp:TextBox></TD>
					<TD height="11"></TD>
				</TR>
				<TR>
					<TD width="167">&nbsp;</TD>
					<TD width="162">&nbsp;<INPUT id="Submit_Form" style="FLOAT: right" type="submit" value="renew my mebership" name="B2"
							runat="server"></TD>
					<TD>&nbsp;</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

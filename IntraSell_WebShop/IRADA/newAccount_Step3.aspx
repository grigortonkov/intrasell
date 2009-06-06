<%@ Page Language="vb" AutoEventWireup="false" Codebehind="newAccount_Step3.aspx.vb" Inherits="IRADA.newAccount_Step3"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>newAccount_Step3</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
			<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
			<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
			<meta name="vs_defaultClientScript" content="JavaScript">
			<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<H1>Thank You!
			</H1>
			<P>
				<asp:TextBox id=Email runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].E-mail Address") %>' BorderStyle="None">
				</asp:TextBox>
				<asp:TextBox id=Password runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Password") %>' BorderStyle="None">
				</asp:TextBox>
				<asp:TextBox id=Payment runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Payment") %>' BorderStyle="None">
				</asp:TextBox></P>
		</form>
	</body>
</HTML>

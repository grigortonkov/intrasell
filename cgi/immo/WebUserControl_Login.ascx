<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WebUserControl_Login.ascx.vb" Inherits="WebShop.WebUserControl_Login" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" debug="True"%>
<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="1">
	<TR>
		<TD>Email:</TD>
		<TD>
			<asp:TextBox id="txtEmail" runat="server"></asp:TextBox></TD>
		<TD>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></TD>
	</TR>
	<TR>
		<TD style="HEIGHT: 28px">Passwort:</TD>
		<TD style="HEIGHT: 28px">
			<asp:TextBox id="txtPassword" runat="server" TextMode="Password"></asp:TextBox></TD>
		<TD style="HEIGHT: 28px">
			<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></TD>
	</TR>
	<TR>
		<TD></TD>
		<TD></TD>
		<TD></TD>
	</TR>
</TABLE>

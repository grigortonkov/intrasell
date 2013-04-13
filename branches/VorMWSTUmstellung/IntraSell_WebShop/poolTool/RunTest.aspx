<%@ Page Language="vb" AutoEventWireup="false" Codebehind="RunTest.aspx.vb" Inherits="poolTool.RunTest"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>RunTest</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<table border="0" width="210" id="table1" cellspacing="0" cellpadding="0" height="166">
				<tr>
					<td colspan="4">
						<asp:Label id=Label_Question runat="server" Width="210px" Height="16px" Text='<%# DataBinder.Eval(Dataset_tests, "Tables[test_Questions].DefaultView.[0].Question") %>' ForeColor="White">
						</asp:Label><BR>
					</td>
				</tr>
				<tr>
					<td bgcolor="#676767" colspan="4">
						<img border="0" src="spacer.gif" width="1" height="3"></td>
				</tr>
				<tr>
					<td colspan="4">
						<asp:RadioButtonList id=RadioButtonList_answer runat="server" DataMember="test_Answers" DataSource="<%# Dataset_tests %>" BackColor="Transparent" DataTextField="Answer" DataValueField="Answer_Id" AutoPostBack="True" BorderColor="Transparent" BorderStyle="None" Width="100%" BorderWidth="1px">
						</asp:RadioButtonList>
						<asp:TextBox id="txtOther" runat="server" Visible="False" BorderColor="#E0E0E0" BackColor="White"></asp:TextBox>
						<asp:Button id="Button_Other_Enter" runat="server" Text="next" Visible="False" BorderColor="#E0E0E0"
							BackColor="White"></asp:Button>
						<asp:Panel id="Panel_END" runat="server" Height="56px" Width="210px" Visible="False">
							<P>Thank You!</P>
							<P>Please look at the results <A href="Results.aspx">here</A> !</P>
						</asp:Panel>
						<asp:Label id=LABEL_Question_id runat="server" Text='<%# DataBinder.Eval(Dataset_tests, "Tables[test_Questions].DefaultView.[0].Question_Id") %>' Visible="False">
						</asp:Label></td>
				</tr>
				<!--
			<tr>
				<td colspan="4" background="bg.gif"><a href="Results.aspx"> <img alt="view results" border="0" src="show.gif" width="91" height="21"></a></td>
			</tr>
			-->
			</table>
		</form>
	</body>
</HTML>

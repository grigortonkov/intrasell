<%@ Page Language="vb" AutoEventWireup="false" Codebehind="newAccount_Step1.aspx.vb" Inherits="IRADA.newAccount_Step1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>newAccount_Step1</title>
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
			<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
			<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
			<meta content="JavaScript" name="vs_defaultClientScript">
			<meta content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<DIV align="center">
				<TABLE id="table1" cellSpacing="0" cellPadding="0" width="500" border="0">
					<TR>
						<TD width="165">&nbsp;</TD>
						<TD width="230">&nbsp;</TD>
						<TD width="460" colSpan="2">
							<asp:TextBox id="MODE" runat="server" Width="52px" BorderStyle="None" Visible="False"></asp:TextBox>
							<asp:TextBox id="ID1" runat="server" Width="13px" BorderStyle="None" Visible="False"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD width="436" colSpan="4" height="9"><B>Membership Information:</B></TD>
					</TR>
					<TR>
						<TD width="441" colspan="4">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
					<TR>
						<TD width="165">E-Mail:</TD>
						<TD width="230">Password:</TD>
						<TD width="460" colSpan="2">Confirm Password:</TD>
					</TR>
					<TR>
						<TD width="165">
							<asp:TextBox id=Email runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].E-mail Address") %>'>
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="!" ControlToValidate="Email"></asp:RequiredFieldValidator></TD>
						<TD width="230">
							<asp:TextBox id=Password runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].password") %>' Width="85px" TextMode="Password">
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator_Password" runat="server" ControlToValidate="Password"
								ErrorMessage="!"></asp:RequiredFieldValidator></TD>
						<TD width="460" colSpan="2">
							<asp:TextBox id=PasswordConfirmation runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].passwordConfirmation") %>' Width="70px" TextMode="Password">
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator_ConfirmPassword" runat="server" ControlToValidate="PasswordConfirmation"
								ErrorMessage="!"></asp:RequiredFieldValidator></TD>
					</TR>
					<TR>
						<TD width="165">First Name:</TD>
						<TD width="230">Middle Initial:</TD>
						<TD width="460" colSpan="2">Last Name:</TD>
					</TR>
					<TR>
						<TD width="165">
							<asp:TextBox id=first_name runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].First_name") %>'>
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="first_name" ErrorMessage="!"></asp:RequiredFieldValidator></TD>
						<TD width="230">
							<asp:TextBox id=initials runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Middle_Name") %>'>
							</asp:TextBox></TD>
						<TD width="460" colSpan="2">
							<asp:TextBox id=last_name runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Last_Name") %>' Width="91px">
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="last_name" ErrorMessage="!"></asp:RequiredFieldValidator></TD>
					</TR>
					<TR>
						<TD width="441" colspan="4">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
					<TR>
						<TD width="436" colSpan="4"><B>Mailing Address:</B></TD>
					</TR>
					<TR>
						<TD width="441" colspan="4">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
					<TR>
						<TD width="165">Street:</TD>
						<TD width="230">City:</TD>
						<TD width="230">State</TD>
						<TD width="52">Zip</TD>
					</TR>
					<TR>
						<TD width="165">
							<asp:TextBox id=street runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Address") %>'>
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="street" ErrorMessage="!"></asp:RequiredFieldValidator></TD>
						<TD width="230">
							<asp:TextBox id=city runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].City") %>'>
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ControlToValidate="Email" ErrorMessage="!"></asp:RequiredFieldValidator></TD>
						<TD width="230">
							<asp:TextBox id=state runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].State") %>' Width="46px">
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ControlToValidate="state" ErrorMessage="!"></asp:RequiredFieldValidator></TD>
						<TD width="52">
							<asp:TextBox id=zip runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].ZipCode") %>' Width="44px">
							</asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server" ControlToValidate="zip" ErrorMessage="!"></asp:RequiredFieldValidator></TD>
					</TR>
					<TR>
						<TD width="441" colspan="4">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
					<TR>
						<TD width="165"><B>Education:</B></TD>
						<TD width="230">&nbsp;</TD>
						<TD width="460" colSpan="2">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="441" colspan="4">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
					<TR>
						<TD width="165">First Degree:</TD>
						<TD width="230">Year Graduated:</TD>
						<TD width="460" colSpan="2">School:</TD>
					</TR>
					<TR>
						<TD width="165">
							<asp:TextBox id=first_degree runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Address") %>'>
							</asp:TextBox></TD>
						<TD width="230">
							<asp:TextBox id=first_year runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Edu_First_Year") %>'>
							</asp:TextBox></TD>
						<TD width="460" colSpan="2">
							<asp:TextBox id=first_shcool runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Edu_First_School") %>'>
							</asp:TextBox></TD>
					</TR>
					<TR>
						<TD width="165">Second Degree:</TD>
						<TD width="230">Year Graduated:</TD>
						<TD width="460" colSpan="2">School:</TD>
					</TR>
					<TR>
						<TD width="165">
							<asp:TextBox id=second_degree runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Edu_Second_Degree") %>'>
							</asp:TextBox></TD>
						<TD width="230">
							<asp:TextBox id=second_year runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Edu_Second_Year") %>'>
							</asp:TextBox></TD>
						<TD width="460" colSpan="2">
							<asp:TextBox id=second_school runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Edu_Second_School") %>' >
							</asp:TextBox></TD>
					</TR>
					<TR>
						<TD width="165">Specialty:</TD>
						<TD width="230">Year Graduated:</TD>
						<TD width="460" colSpan="2">School:</TD>
					</TR>
					<TR>
						<TD width="165">
							<asp:TextBox id=special_degree runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Edu_Spec_Degree") %>'>
							</asp:TextBox></TD>
						<TD width="230">
							<asp:TextBox id=special_year runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Edu_Spec_Year") %>'>
							</asp:TextBox></TD>
						<TD width="460" colSpan="2">
							<asp:TextBox id=special_school runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Edu_Spec_School") %>' >
							</asp:TextBox></TD>
					</TR>
					<TR>
						<TD width="441" colspan="4">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
					<TR>
						<TD width="165"><B>Office Information:</B></TD>
						<TD width="230">&nbsp;</TD>
						<TD width="460" colSpan="2">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="441" colspan="4">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
					<TR>
						<TD width="165">Address:</TD>
						<TD width="230">&nbsp;</TD>
						<TD width="460" colSpan="2">Type of practice:</TD>
					</TR>
					<TR>
						<TD width="460" colSpan="2">
							<asp:TextBox id=office_address runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].OfficeAddress") %>' Width="313px">
							</asp:TextBox></TD>
						<TD width="460" colSpan="2">
							<asp:TextBox id=office_practice runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].TypeOfPraxis") %>'>
							</asp:TextBox></TD>
					</TR>
					<TR>
						<TD width="165">Phone:</TD>
						<TD width="230">Website:</TD>
						<TD width="460" colSpan="2">&nbsp;</TD>
					</TR>
					<TR>
						<TD width="165">
							<asp:TextBox id=phone runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Work_Phone") %>'>
							</asp:TextBox></TD>
						<TD width="230">
							<asp:TextBox id=website runat="server" Text='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].Website") %>'>
							</asp:TextBox></TD>
						<TD width="460" colSpan="2">&nbsp;</TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV align="center">
				<TABLE id="table6" cellSpacing="0" cellPadding="0" width="500" border="0">
					<TR>
						<TD width="497">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
					<TR>
						<TD width="497" bgColor="#f3f3f3">
							<asp:RadioButtonList id="Radio_register_type" runat="server" Width="446px" SelectedValue='<%# DataBinder.Eval(objMembers, "Tables[Members].DefaultView.[0].TypeOfAccount") %>'>
								<asp:ListItem Value="Normal">Normal Registration (No meetings or events included)</asp:ListItem>
								<asp:ListItem Value="single_meetings">Register for single meetings</asp:ListItem>
								<asp:ListItem Value="Membership">Dentist Membership Dues   (includes 8 CE meetings per year with dinner)   420 $</asp:ListItem>
							</asp:RadioButtonList>
							<asp:RequiredFieldValidator id="RequiredFieldValidator10" runat="server" ControlToValidate="Radio_register_type"
								ErrorMessage="Please select!"></asp:RequiredFieldValidator>
						</TD>
					</TR>
					<TR>
						<TD width="497">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
				</TABLE>
			</DIV>
			<DIV align="center">
				<TABLE id="table8" cellSpacing="0" cellPadding="0" width="500" border="0">
					<TR>
						<TD width="165">&nbsp;</TD>
						<TD width="162">&nbsp;
							<asp:Button id="btnBack" runat="server" Visible="False" Width="89px" Text="<< Back" CausesValidation="False"></asp:Button></TD>
						<TD width="170" align="right">
							<asp:Button id="btn_Next" runat="server" Text="Continue >>"></asp:Button></TD>
					</TR>
					<TR>
						<TD width="497" colspan="3">
							<img src="spacer.gif" width="1" height="5"></TD>
					</TR>
				</TABLE>
			</DIV>
		</form>
	</body>
</HTML>

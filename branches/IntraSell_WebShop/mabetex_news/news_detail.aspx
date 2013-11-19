 <%@ Page Language="vb" AutoEventWireup="false" Inherits="mabetex_news.news_detail" CodeFile="news_detail.aspx.vb" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
	<HEAD>
		<title runat="server" id="pageTitle">test</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
	</HEAD>
	<BODY>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="800" border="0" align="center">
				<tr>
					<td width="182">
						<img src="http://www.mabetexnews.com/logo.gif"></td>
					<td>
						<H2 align="center">MABETEX - NEWS - <A href="news_sitemap.aspx">SITEMAP</A></H2>
					</td>
				</tr>
				<TR>
					<TD width="169" vAlign="top">
						<TABLE id="Table2" width="100%" border="0">
							<TR>
								<TD vAlign="top" width="200">
									<TABLE id="Table3" height="49" cellSpacing="1" cellPadding="1" width="192" border="0">
										<TR>
											<TD>
												<P><FONT color="#ffffff">News Categories</FONT>
													<asp:DataGrid id=DataGrid_Cats runat="server" DataSource="<%# DataSet_Kategorien1 %>" AutoGenerateColumns="False" ShowHeader="False" DataKeyField="KatNr" DataMember="Kategorien" Width="184px" GridLines="None">
														<SelectedItemStyle Font-Underline="True"></SelectedItemStyle>
														<ItemStyle Font-Bold="True"></ItemStyle>
														<Columns>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<img src="http://www.mabetexnews.com/dot_arrow.gif">
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:HyperLinkColumn Target="_self" DataNavigateUrlField="Url" DataTextField="Bezeichnung" SortExpression="Bezeichnung"
																HeaderText="Cats" NavigateUrl="news_list.aspx?KatNR="></asp:HyperLinkColumn>
														</Columns>
													</asp:DataGrid></P>
												<P>&nbsp;</P>
											</TD>
										</TR>
										<TR>
											<TD></TD>
										</TR>
										<TR>
											<TD>Random News
												<asp:DataGrid id=DataGrid2 runat="server" DataSource="<%# DataSet_RandomNews1 %>" AutoGenerateColumns="False" ShowHeader="False" DataKeyField="NewsNr" DataMember="News" Width="184px" GridLines="None">
													<SelectedItemStyle Font-Underline="True"></SelectedItemStyle>
													<ItemStyle Font-Bold="True"></ItemStyle>
													<Columns>
														<asp:TemplateColumn>
															<ItemTemplate>
																<img src="http://www.mabetexnews.com/dot_arrow.gif">
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:HyperLinkColumn Target="_self" DataNavigateUrlField="Url" DataTextField="Titel"></asp:HyperLinkColumn>
													</Columns>
												</asp:DataGrid></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD valign="top">
						<asp:HyperLink id=HyperLink_Prev runat="server" Text='<%# DataBinder.Eval(objNews, "Tables[newsPrevNext].DefaultView.[0].prevNewsURLText") %>' NavigateUrl='<%# DataBinder.Eval(objNews, "Tables[newsPrevNext].DefaultView.[0].prevNewsURL") %>' Font-Bold="True">
						</asp:HyperLink>&nbsp;<asp:Label ID="lblSeparator" runat="server" Text="::"></asp:Label>
						<asp:HyperLink id=HyperLink_Next runat="server" Text='<%# DataBinder.Eval(objNews, "Tables[newsPrevNext].DefaultView.[0].nextNewsURLText") %>' NavigateUrl='<%# DataBinder.Eval(objNews, "Tables[newsPrevNext].DefaultView.[0].nextNewsURL") %>' Font-Bold="True">
						</asp:HyperLink>
						<P></P>
						<P>
							<asp:Image id=Image1 runat="server" ImageUrl='<%# DataBinder.Eval(objNews, "Tables[newsPrevNext].DefaultView.[0].Picture") %>'>
							</asp:Image></P>
						<P>
							<asp:Label id=lblTitel runat="server" Text='<%# DataBinder.Eval(objNews, "Tables[newsPrevNext].DefaultView.[0].Titel") %>' Font-Bold="True">
							</asp:Label></P>
						<P>
							<asp:Label id=lblKurzText runat="server" Text='<%# DataBinder.Eval(objNews, "Tables[newsPrevNext].DefaultView.[0].KurzText") %>' Font-Bold="True">
							</asp:Label></P>
						<P>
							<asp:Label id=lblText runat="server" Text='<%# DataBinder.Eval(objNews, "Tables[newsPrevNext].DefaultView.[0].Text") %>'>
							</asp:Label>
						</P>
					</TD>
				</TR>
				<TR>
					<TD background="http://www.mabetexnews.com/bg_line.bmp" height="1" colspan="2">
						<img border="0" src="spacer.gif" width="1" height="1"></TD>
				</TR>
				<TR>
					<TD height="1" colspan="2">
						<P align="right">
							<img border="0" src="spacer.gif" width="1" height="1"><FONT face="Verdana" color="#808080" size="1">MABETEX 
								GROUP © 2005 - All rights reserved</FONT></P>
					</TD>
				</TR>
			</TABLE>
		</form>
	</BODY>
</HTML>

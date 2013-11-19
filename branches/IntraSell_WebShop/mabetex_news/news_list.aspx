<%@ Page Language="vb" AutoEventWireup="false" Inherits="mabetex_news.news_list" CodeFile="news_list.aspx.vb" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title id="pageTitle" runaT=server>test</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie3-2nav3-0">
		<link REL="stylesheet" HREF="style.css" TYPE="text/css">
			<meta name="keywords" content="tiefbau, hochbau, bau, construction, mabetex, mabco, pacolli, behjet, kremlin, Kasachstan, Astana, interior, architecture, mabetex group, industrial, medical, civil, buildings, refurbishing, architect, engineering, general constructing, hotel managment, residential, medical, engineering, construction, industrial, residential, buildings">
			<meta name="DC.title" content="mabetex">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table width="800" border="0" align="center" cellpadding="0">
				<TBODY>
					<tr>
						<td width="182">
							<img src="http://www.mabetexnews.com/logo.gif"></td>
						<td>
							<H2 align="center" style="text-align: center">MABETEX - NEWS - <A href="news_sitemap.aspx">SITEMAP</A></H2>
                            <h2 align="center" style="text-align: right">
                                <asp:Label ID="lblTime" runat="server" Height="15px" Width="174px" Font-Size="8pt"></asp:Label>&nbsp;</h2>
						</td>
					</tr>
					<TR>
						<TD background="http://www.mabetexnews.com/bg_line.bmp" colspan="2" style="height: 1px">
							<img border="0" width="1" height="1"></TD>
					</TR>
					<tr>
						<td width="182">
							News Categories
							<asp:DataGrid id=DataGrid_Cats runat="server" DataSource="<%# DataSet_Kategorien1 %>" AutoGenerateColumns="False" ShowHeader="False" DataKeyField="KatNr" DataMember="Kategorien" Width="184px" GridLines="None" BorderWidth="0px">
								<SelectedItemStyle Font-Underline="True"></SelectedItemStyle>
								<ItemStyle Font-Size="Large" Font-Bold="True"></ItemStyle>
								<Columns>
									<asp:TemplateColumn HeaderImageUrl="http://www.mabetexnews.com/dot_arrow.gif">
										<HeaderStyle Width="5px"></HeaderStyle>
										<ItemTemplate>
											<img src="http://www.mabetexnews.com/dot_arrow.gif">
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:HyperLinkColumn Target="_self" DataNavigateUrlField="Url" DataTextField="Bezeichnung" SortExpression="Bezeichnung"
										HeaderText="Cats" NavigateUrl="news_list.aspx?KatNR="></asp:HyperLinkColumn>
								</Columns>
							</asp:DataGrid></td>
						<td>


<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="567" height="193">
                <param name="movie" value="image_loader.swf">
                <param name="quality" value="high">
                <embed src="image_loader.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="567" height="193"></embed>
</object>

</td>
		
					
					</tr>
					<TR>
						<TD background="http://www.mabetexnews.com/bg_line.bmp" height="1" colspan="2">
							<img border="0"width="1" height="1"></TD>
					</TR>
					<tr>
						<td width="182" vAlign="top" background="news.jpg">
							Random News
							<asp:DataGrid id="DataGrid2" runat="server" Width="184px" DataSource="<%# DataSet_RandomNews1 %>" AutoGenerateColumns="False" ShowHeader="False" DataKeyField="NewsNr" DataMember="News" GridLines="None" BorderWidth="0px">
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
							</asp:DataGrid>
						</td>
						<td valign="top">
							<P>
								<asp:DataList id="DataList1" runat="server" DataSource="<%# DataSet_AllNews1 %>" Width="100%" Height="164px">
									<ItemTemplate>
										<B><A href='news_detail.aspx?newsNr=<%# DataBinder.Eval(container.dataitem, "NewsNr") %>'>
												<%# DataBinder.Eval(container.dataitem, "Titel") %>
											</A></B>
										<BR>
										<asp:Label id=Label_KurzText runat="server" Width="100%" Text='<%# DataBinder.Eval(container.dataitem, "KurzText") %>'>
										</asp:Label><BR>
										<b>
											<asp:Label id=Label_ErstelltVon runat="server" Width="100%" Text='<%# DataBinder.Eval(container.dataitem, "ErstelltVon") %>'>
											</asp:Label>
										</b>
										<HR>
									</ItemTemplate>
								</asp:DataList></P>
						</td>
					</tr>
					<TR>
						<TD background="http://www.mabetexnews.com/bg_line.bmp" height="1" colspan="2">
							<img border="0" src="spacer.gif" width="1" height="1"></TD>
					</TR>
					<TR>
						<TD colspan="2" style="height: 1px">
						
						<table width="100%">
								<tr>
			<td colspan="2">
			<p align="right"><font face="Verdana" size="1" color="#808080">
			&nbsp; <span style="text-decoration: none">
			<a href="http://www.mabetexnews.com/links.html">
			<font color="#666666"><span style="text-decoration: none">LINKS</span></font></a></span>| <font color="#666666"><span style="text-decoration: none">
			<a target="_blank" href="http://www.mabetexgroup.com/">
			<span style="text-decoration: none"><font color="#666666">MABETEX 
			GROUP DIRECTORIES</font></span></a></span> | </font></font>
			<font face="Verdana" size="1" color="#666666">
			<span style="text-decoration: none">
			<a target="_blank" href="http://www.mabetexit.com">
			<span style="text-decoration: none"><font color="#666666">MABETEX</font></span></a></span></font><font face="Verdana" size="1" color="#808080"><font color="#666666"><a target="_blank" href="http://www.mabetexit.com"><span style="text-decoration: none"><font color="#666666">IT</font></span></a></font> 
			|
			MABETEX GROUP © 2005 - All rights reserved</font></td>
		</tr>
						</table>
						</TD>
					</TR>
				</TBODY></table>
            &nbsp;
            <asp:SqlDataSource ID="SqlDataSource_News" runat="server" ConnectionString="<%$ ConnectionStrings:OleDbConnection.ConnectionString_NET2 %>"
                ProviderName="<%$ ConnectionStrings:OleDbConnection.ConnectionString_NET2.ProviderName %>"
                SelectCommand="SELECT Bezeichnung, Titel, KurzText, Datum, PrevSeite, Seiten, NewsNr, color, ErstelltVon, ErstelltAm, KatNr FROM AllNews">
            </asp:SqlDataSource>
		</form>
	</body>
</HTML>

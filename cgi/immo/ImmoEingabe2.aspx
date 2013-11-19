<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ImmoEingabe2.aspx.vb" Inherits="WebShop.ImmoEingabe2"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>ImmoEingabe2</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" borderColor="#c0c0c0" cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<TD style="HEIGHT: 22px"><B><FONT face="Verdana" color="#980000" size="1">Objekt 
								inserieren&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Schritt 
								2/4)</FONT></B></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table3" borderColor="darkgray" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TR>
					<TH bgColor="gainsboro">
						Beschreibung:</TH></TR>
				<TR>
					<TD><asp:textbox id="txtBeschreibung" runat="server" Width="100%" Height="32px"></asp:textbox></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table4" style="Z-INDEX: 103; LEFT: 8px" borderColor="#a9a9a9" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TR>
					<TH bgColor="#dcdcdc">
						Lage:</TH></TR>
				<TR>
					<TD><asp:textbox id="txtLage" runat="server" Width="100%" Height="32px"></asp:textbox></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table5" style="Z-INDEX: 104; LEFT: 8px" borderColor="#a9a9a9" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TR>
					<TH bgColor="#dcdcdc">
						Ausstattung:</TH></TR>
				<TR>
					<TD><asp:textbox id="txtAusstattung" runat="server" Width="100%" Height="32px"></asp:textbox></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table6" borderColor="#a9a9a9" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TR>
					<TH bgColor="#dcdcdc">
						Sonstiges:</TH></TR>
				<TR>
					<TD><asp:textbox id="txtSonstiges" runat="server" Width="100%" Height="32px"></asp:textbox></TD>
				</TR>
			</TABLE>
			<br>
			<TABLE id="Table7" borderColor="#a9a9a9" cellSpacing="0" cellPadding="0" width="96%" border="1">
				<TR>
					<TH bgColor="#dcdcdc">
						Abbildungen:</TH></TR>
				<TR>
					<TD>
						<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
							<TR>
								<TD style="WIDTH: 114px">
									<asp:Panel id="Panel_1" runat="server" Width="100%">
										<STRONG>Hauptbild:</STRONG></asp:Panel></TD>
								<TD style="WIDTH: 79px" width="79"></TD>
								<TD style="HEIGHT: 1px">&nbsp;
									<asp:Panel id="Panel_13" runat="server" Width="100%">
<INPUT class="INPUT" id="File_Hauptbild" style="WIDTH: 50%" type="file" size="23" name="Filename" runat="server">&nbsp; 
<asp:Button id="btnIMGUpload_Hauptbild" runat="server" Width="120px" CausesValidation="False" Text="Bild uploaden"></asp:Button></asp:Panel></TD>
							</TR>
							<TR>
								<TD>
									<asp:Panel id="Panel_2" runat="server" Width="100%">weiteres Bild 
            1:</asp:Panel></TD>
								<TD style="WIDTH: 79px" width="79">
									<P>&nbsp;</P>
								</TD>
								<TD>&nbsp;
									<asp:Panel id="Panel_23" runat="server" Width="100%">
<INPUT class="INPUT" id="File_WeitereBilder" style="WIDTH: 50%" type="file" size="30" name="Filename" runat="server">&nbsp; 
<asp:Button id="btnIMGUpload_Weiteresbild" runat="server" Width="120px" CausesValidation="False" Text="Bild uploaden"></asp:Button></asp:Panel></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 114px; HEIGHT: 4px">
									<asp:Panel id="Panel_3" runat="server" Width="100%">weiteres Bild 2:</asp:Panel></TD>
								<TD style="WIDTH: 79px" width="79">
									<P>&nbsp;</P>
								</TD>
								<TD>&nbsp;
									<asp:Panel id="Panel_33" runat="server" Width="100%">
<INPUT class="INPUT" id="File_WeitereBilder2" style="WIDTH: 50%" type="file" size="30" name="Filename" runat="server">&nbsp; 
<asp:Button id="btnIMGUpload_Weiteresbild2" runat="server" Width="120px" CausesValidation="False" Text="Bild uploaden"></asp:Button></asp:Panel></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 114px; HEIGHT: 4px">
									<asp:Panel id="Panel_4" runat="server" Width="100%">weiteres Bild 3:</asp:Panel></TD>
								<TD style="WIDTH: 79px" width="79">
									<P>&nbsp;</P>
								</TD>
								<TD>&nbsp;
									<asp:Panel id="Panel_43" runat="server" Width="100%">
<INPUT class="INPUT" id="File_WeitereBilder3" style="WIDTH: 50%" type="file" size="30" name="Filename" runat="server">&nbsp; 
<asp:Button id="btnIMGUpload_Weiteresbild3" runat="server" Width="120px" CausesValidation="False" Text="Bild uploaden"></asp:Button></asp:Panel></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 114px; HEIGHT: 4px">
									<asp:Panel id="Panel_5" runat="server" Width="100%">weiteres Bild 4:</asp:Panel></TD>
								<TD style="WIDTH: 79px" width="79">
									<P>&nbsp;</P>
								</TD>
								<TD>&nbsp;
									<asp:Panel id="Panel_53" runat="server" Width="100%">
<INPUT class="INPUT" id="File_WeitereBilder4" style="WIDTH: 50%" type="file" size="30" name="Filename" runat="server">&nbsp; 
<asp:Button id="btnIMGUpload_Weiteresbild4" runat="server" Width="120px" CausesValidation="False" Text="Bild uploaden"></asp:Button></asp:Panel></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 114px; HEIGHT: 4px">
									<asp:Panel id="Panel_6" runat="server" Width="100%">weiteres Bild 5:</asp:Panel></TD>
								<TD style="WIDTH: 79px" width="79">
									<P>&nbsp;</P>
								</TD>
								<TD>&nbsp;
									<asp:Panel id="Panel_63" runat="server" Width="100%">
<INPUT class="INPUT" id="File_WeitereBilder5" style="WIDTH: 50%" type="file" size="30" name="Filename" runat="server">&nbsp; 
<asp:Button id="btnIMGUpload_Weiteresbild5" runat="server" Width="120px" CausesValidation="False" Text="Bild uploaden"></asp:Button></asp:Panel></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 114px">
									<asp:Panel id="Panel_7" runat="server" Width="100%">
										<STRONG>Grundriss:</STRONG></asp:Panel></TD>
								<TD style="WIDTH: 79px" width="79"></TD>
								<TD>&nbsp;
									<asp:Panel id="Panel_73" runat="server" Width="100%">
<INPUT class="INPUT" id="File_Grundriss" style="WIDTH: 50%" type="file" size="30" name="Filename" runat="server">&nbsp; 
<asp:Button id="btnIMGUpload_Grundriss" runat="server" Width="120px" CausesValidation="False" Text="Bild uploaden"></asp:Button></asp:Panel></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 114px">
									<asp:Panel id="Panel_8" runat="server" Width="100%">Grundriss2:</asp:Panel></TD>
								<TD style="WIDTH: 79px" width="79"></TD>
								<TD>&nbsp;
									<asp:Panel id="Panel_83" runat="server" Width="100%">
<INPUT class="INPUT" id="File_Grundriss2" style="WIDTH: 50%" type="file" size="30" name="File_Grundriss2" runat="server">&nbsp; 
<asp:Button id="btnIMGUpload_Grundriss2" runat="server" Width="120px" CausesValidation="False" Text="Bild uploaden"></asp:Button></asp:Panel></TD>
							</TR>
						</TABLE>
						<TABLE id="Table8" cellSpacing="1" cellPadding="1" width="100%" border="0">
							<TR>
								<TH style="WIDTH: 127px" colSpan="6">
									Bildervorschau</TH></TR>
							<TR>
								<TD style="WIDTH: 127px">Hauptbild:</TD>
								<TD>
									<asp:image id="Image_Hauptbild" runat="server" Height="60px" Width="56px"></asp:image><BR>
									<asp:checkbox id="cbDeleteHauptbild" runat="server" Text="löschen" AutoPostBack="True" CssClass="extra"></asp:checkbox></TD>
								<TD></TD>
								<TD></TD>
								<TD></TD>
								<TD></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 127px">weitere Bilder:</TD>
								<TD>
									<asp:image id="Image_WeitereBilder1" runat="server" Height="60px" Width="56px"></asp:image><BR>
									<asp:checkbox id="cbDelete_WeitereBilder1" runat="server" Visible="False" Text="löschen" AutoPostBack="True" CssClass="extra"></asp:checkbox></TD>
								<TD>
									<asp:image id="Image_WeitereBilder2" runat="server" Height="60px" Width="56px"></asp:image><BR>
									<asp:checkbox id="cbDelete_WeitereBilder2" runat="server" Text="löschen" AutoPostBack="True" CssClass="extra"></asp:checkbox></TD>
								<TD>
									<asp:image id="Image_WeitereBilder3" runat="server" Height="60px" Width="56px"></asp:image><BR>
									<asp:checkbox id="cbDelete_WeitereBilder3" runat="server" Text="löschen" AutoPostBack="True" CssClass="extra"></asp:checkbox></TD>
								<TD>
									<asp:image id="Image_WeitereBilder4" runat="server" Height="60px" Width="56px"></asp:image><BR>
									<asp:checkbox id="cbDelete_WeitereBilder4" runat="server" Text="löschen" AutoPostBack="True" CssClass="extra"></asp:checkbox></TD>
								<TD>
									<asp:image id="Image_WeitereBilder5" runat="server" Height="60px" Width="56px"></asp:image><BR>
									<asp:checkbox id="cbDelete_WeitereBilder5" runat="server" Text="löschen" AutoPostBack="True" CssClass="extra"></asp:checkbox></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 127px">Grundrisse:</TD>
								<TD>
									<asp:image id="Image_Grundriss" runat="server" Height="60px" Width="56px"></asp:image><BR>
									<asp:checkbox id="cbDeleteGrundriss" runat="server" Text="löschen" AutoPostBack="True" CssClass="extra"></asp:checkbox></TD>
								<TD>
									<asp:image id="Image_Grundriss2" runat="server" Height="60px" Width="56px"></asp:image><BR>
									<asp:CheckBox id="cbDeleteGrundriss2" runat="server" Text="löschen" AutoPostBack="True" CssClass="extra"></asp:CheckBox></TD>
								<TD></TD>
								<TD></TD>
								<TD></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<BR>
			<TABLE cellSpacing="0" cellPadding="0" width="96%" border="0">
				<TR>
					<TD align="right">
						<asp:Button id="btnIMGUpload" runat="server" Width="180px" Visible="False" CausesValidation="False" Text="Bilder uploaden"></asp:Button>
						<asp:TextBox id="txtArtNr" runat="server" Width="48px" Visible="False" DESIGNTIMEDRAGDROP="749"></asp:TextBox>
						<asp:textbox id="txtAnbieter" runat="server" Width="48px" Visible="False" DESIGNTIMEDRAGDROP="750" Enabled="False"></asp:textbox>
						<asp:Button id="btnZurueck" runat="server" Width="180px" Text="zurück"></asp:Button>&nbsp;
						<asp:Button id="btnSpeichern" style="Z-INDEX: 106; LEFT: 400px" runat="server" Width="180px" Text="speichern &amp; weiter"></asp:Button></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>

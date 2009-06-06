Public Class myAccount
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.objMembers = New IRADA.DataSet_Members
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.OleDbDataAdapter2 = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbInsertCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        CType(Me.objMembers, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'objMembers
        '
        Me.objMembers.DataSetName = "DataSet_Members"
        Me.objMembers.Locale = New System.Globalization.CultureInfo("de-AT")
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'OleDbDataAdapter2
        '
        Me.OleDbDataAdapter2.InsertCommand = Me.OleDbInsertCommand2
        Me.OleDbDataAdapter2.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter2.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Members", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Address", "Address"), New System.Data.Common.DataColumnMapping("April02event", "April02event"), New System.Data.Common.DataColumnMapping("Board Member", "Board Member"), New System.Data.Common.DataColumnMapping("Category_5", "Category_5"), New System.Data.Common.DataColumnMapping("Category_6", "Category_6"), New System.Data.Common.DataColumnMapping("ChangeTime", "ChangeTime"), New System.Data.Common.DataColumnMapping("City", "City"), New System.Data.Common.DataColumnMapping("Contact", "Contact"), New System.Data.Common.DataColumnMapping("CreationTime", "CreationTime"), New System.Data.Common.DataColumnMapping("date paid 2004", "date paid 2004"), New System.Data.Common.DataColumnMapping("Date paid 2005", "Date paid 2005"), New System.Data.Common.DataColumnMapping("DatePaid", "DatePaid"), New System.Data.Common.DataColumnMapping("Delivery Point", "Delivery Point"), New System.Data.Common.DataColumnMapping("Edu_First_Degree", "Edu_First_Degree"), New System.Data.Common.DataColumnMapping("Edu_First_School", "Edu_First_School"), New System.Data.Common.DataColumnMapping("Edu_First_Year", "Edu_First_Year"), New System.Data.Common.DataColumnMapping("Edu_Second_Degree", "Edu_Second_Degree"), New System.Data.Common.DataColumnMapping("Edu_Second_School", "Edu_Second_School"), New System.Data.Common.DataColumnMapping("Edu_Second_Year", "Edu_Second_Year"), New System.Data.Common.DataColumnMapping("Edu_Spec_Degree", "Edu_Spec_Degree"), New System.Data.Common.DataColumnMapping("Edu_Spec_School", "Edu_Spec_School"), New System.Data.Common.DataColumnMapping("Edu_Spec_Year", "Edu_Spec_Year"), New System.Data.Common.DataColumnMapping("E-mail Address", "E-mail Address"), New System.Data.Common.DataColumnMapping("Fax_Phone", "Fax_Phone"), New System.Data.Common.DataColumnMapping("First_name", "First_name"), New System.Data.Common.DataColumnMapping("ID", "ID"), New System.Data.Common.DataColumnMapping("ID1", "ID1"), New System.Data.Common.DataColumnMapping("Jan292003Payment", "Jan292003Payment"), New System.Data.Common.DataColumnMapping("Last_Name", "Last_Name"), New System.Data.Common.DataColumnMapping("LicenseNumber", "LicenseNumber"), New System.Data.Common.DataColumnMapping("Middle_Name", "Middle_Name"), New System.Data.Common.DataColumnMapping("Notes", "Notes"), New System.Data.Common.DataColumnMapping("Notes_1", "Notes_1"), New System.Data.Common.DataColumnMapping("OfficeAddress", "OfficeAddress"), New System.Data.Common.DataColumnMapping("Other_Phone", "Other_Phone"), New System.Data.Common.DataColumnMapping("Paid 2004", "Paid 2004"), New System.Data.Common.DataColumnMapping("paid 2005", "paid 2005"), New System.Data.Common.DataColumnMapping("Paid Member 2001", "Paid Member 2001"), New System.Data.Common.DataColumnMapping("Paid Member 2002", "Paid Member 2002"), New System.Data.Common.DataColumnMapping("paid Member 2003", "paid Member 2003"), New System.Data.Common.DataColumnMapping("Password", "Password"), New System.Data.Common.DataColumnMapping("PasswordConfirmation", "PasswordConfirmation"), New System.Data.Common.DataColumnMapping("Payment", "Payment"), New System.Data.Common.DataColumnMapping("Payment 2004", "Payment 2004"), New System.Data.Common.DataColumnMapping("payment 2005", "payment 2005"), New System.Data.Common.DataColumnMapping("Payment2003", "Payment2003"), New System.Data.Common.DataColumnMapping("PaymentMethod", "PaymentMethod"), New System.Data.Common.DataColumnMapping("Privacy Option", "Privacy Option"), New System.Data.Common.DataColumnMapping("State", "State"), New System.Data.Common.DataColumnMapping("Student", "Student"), New System.Data.Common.DataColumnMapping("Title", "Title"), New System.Data.Common.DataColumnMapping("TypeOfAccount", "TypeOfAccount"), New System.Data.Common.DataColumnMapping("TypeOfPraxis", "TypeOfPraxis"), New System.Data.Common.DataColumnMapping("Website", "Website"), New System.Data.Common.DataColumnMapping("Work_Phone", "Work_Phone"), New System.Data.Common.DataColumnMapping("ZipCode", "ZipCode")})})
        '
        'OleDbInsertCommand2
        '
        Me.OleDbInsertCommand2.CommandText = "INSERT INTO Members(Address, April02event, [Board Member], Category_5, Category_6" & _
        ", ChangeTime, City, Contact, CreationTime, [date paid 2004], [Date paid 2005], D" & _
        "atePaid, [Delivery Point], Edu_First_Degree, Edu_First_School, Edu_First_Year, E" & _
        "du_Second_Degree, Edu_Second_School, Edu_Second_Year, Edu_Spec_Degree, Edu_Spec_" & _
        "School, Edu_Spec_Year, [E-mail Address], Fax_Phone, First_name, ID, Jan292003Pay" & _
        "ment, Last_Name, LicenseNumber, Middle_Name, Notes, Notes_1, OfficeAddress, Othe" & _
        "r_Phone, [Paid 2004], [paid 2005], [Paid Member 2001], [Paid Member 2002], [paid" & _
        " Member 2003], [Password], PasswordConfirmation, Payment, [Payment 2004], [payme" & _
        "nt 2005], Payment2003, PaymentMethod, [Privacy Option], State, Student, Title, T" & _
        "ypeOfAccount, TypeOfPraxis, Website, Work_Phone, ZipCode) VALUES (?, ?, ?, ?, ?," & _
        " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?" & _
        ", ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        Me.OleDbInsertCommand2.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Address", System.Data.OleDb.OleDbType.VarWChar, 255, "Address"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("April02event", System.Data.OleDb.OleDbType.Boolean, 2, "April02event"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Board_Member", System.Data.OleDb.OleDbType.VarWChar, 255, "Board Member"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Category_5", System.Data.OleDb.OleDbType.VarWChar, 255, "Category_5"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Category_6", System.Data.OleDb.OleDbType.VarWChar, 255, "Category_6"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ChangeTime", System.Data.OleDb.OleDbType.DBDate, 0, "ChangeTime"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("City", System.Data.OleDb.OleDbType.VarWChar, 255, "City"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Contact", System.Data.OleDb.OleDbType.VarWChar, 255, "Contact"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("CreationTime", System.Data.OleDb.OleDbType.DBDate, 0, "CreationTime"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("date_paid_2004", System.Data.OleDb.OleDbType.DBDate, 0, "date paid 2004"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Date_paid_2005", System.Data.OleDb.OleDbType.DBDate, 0, "Date paid 2005"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, "DatePaid"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Delivery_Point", System.Data.OleDb.OleDbType.VarWChar, 255, "Delivery Point"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_Degree", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_First_Degree"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_School", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_First_School"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_Year", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_First_Year"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_Degree", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Second_Degree"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_School", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Second_School"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_Year", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Second_Year"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_Degree", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Spec_Degree"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_School", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Spec_School"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_Year", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Spec_Year"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("E_mail_Address", System.Data.OleDb.OleDbType.VarWChar, 255, "E-mail Address"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Fax_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Fax_Phone"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("First_name", System.Data.OleDb.OleDbType.VarWChar, 255, "First_name"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ID", System.Data.OleDb.OleDbType.Double, 0, "ID"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Jan292003Payment", System.Data.OleDb.OleDbType.Currency, 0, "Jan292003Payment"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Last_Name", System.Data.OleDb.OleDbType.VarWChar, 255, "Last_Name"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("LicenseNumber", System.Data.OleDb.OleDbType.Double, 0, "LicenseNumber"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Middle_Name", System.Data.OleDb.OleDbType.VarChar, 50, "Middle_Name"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Notes", System.Data.OleDb.OleDbType.VarWChar, 255, "Notes"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Notes_1", System.Data.OleDb.OleDbType.VarWChar, 255, "Notes_1"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("OfficeAddress", System.Data.OleDb.OleDbType.VarChar, 50, "OfficeAddress"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Other_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Other_Phone"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_2004", System.Data.OleDb.OleDbType.Boolean, 2, "Paid 2004"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("paid_2005", System.Data.OleDb.OleDbType.Boolean, 2, "paid 2005"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_Member_2001", System.Data.OleDb.OleDbType.VarWChar, 255, "Paid Member 2001"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_Member_2002", System.Data.OleDb.OleDbType.Boolean, 2, "Paid Member 2002"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("paid_Member_2003", System.Data.OleDb.OleDbType.Boolean, 2, "paid Member 2003"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Password", System.Data.OleDb.OleDbType.VarChar, 50, "Password"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("PasswordConfirmation", System.Data.OleDb.OleDbType.VarChar, 50, "PasswordConfirmation"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment", System.Data.OleDb.OleDbType.Currency, 0, "Payment"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment_2004", System.Data.OleDb.OleDbType.Currency, 0, "Payment 2004"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("payment_2005", System.Data.OleDb.OleDbType.Currency, 0, "payment 2005"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment2003", System.Data.OleDb.OleDbType.Currency, 0, "Payment2003"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, "PaymentMethod"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Privacy_Option", System.Data.OleDb.OleDbType.Boolean, 2, "Privacy Option"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("State", System.Data.OleDb.OleDbType.VarWChar, 255, "State"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Student", System.Data.OleDb.OleDbType.Boolean, 2, "Student"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Title", System.Data.OleDb.OleDbType.VarWChar, 255, "Title"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfAccount", System.Data.OleDb.OleDbType.VarChar, 50, "TypeOfAccount"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfPraxis", System.Data.OleDb.OleDbType.VarChar, 50, "TypeOfPraxis"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Website", System.Data.OleDb.OleDbType.VarChar, 50, "Website"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Work_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Work_Phone"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ZipCode", System.Data.OleDb.OleDbType.VarWChar, 255, "ZipCode"))
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT [Password], Address, April02event, [Board Member], Category_5, Category_6," & _
        " ChangeTime, City, Contact, CreationTime, [date paid 2004], [Date paid 2005], Da" & _
        "tePaid, [Delivery Point], Edu_First_Degree, Edu_First_School, Edu_First_Year, Ed" & _
        "u_Second_Degree, Edu_Second_School, Edu_Second_Year, Edu_Spec_Degree, Edu_Spec_S" & _
        "chool, Edu_Spec_Year, [E-mail Address], Fax_Phone, First_name, ID, ID1, Jan29200" & _
        "3Payment, Last_Name, LicenseNumber, Middle_Name, Notes, Notes_1, OfficeAddress, " & _
        "Other_Phone, [Paid 2004], [paid 2005], [Paid Member 2001], [Paid Member 2002], [" & _
        "paid Member 2003], PasswordConfirmation, Payment, [Payment 2004], [payment 2005]" & _
        ", Payment2003, PaymentMethod, [Privacy Option], State, Student, Title, TypeOfAcc" & _
        "ount, TypeOfPraxis, Website, Work_Phone, ZipCode FROM Members WHERE ([Password] " & _
        "= ?) AND ([E-mail Address] = ?)"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection
        Me.OleDbSelectCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Password", System.Data.OleDb.OleDbType.VarWChar, 50, "Password"))
        Me.OleDbSelectCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("E_mail_Address", System.Data.OleDb.OleDbType.VarWChar, 255, "E-mail Address"))
        CType(Me.objMembers, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents objMembers As IRADA.DataSet_Members
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents OleDbDataAdapter2 As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbInsertCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents btn_renew As System.Web.UI.WebControls.LinkButton
    Protected WithEvents txtUsername As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents registeredSince As System.Web.UI.WebControls.Label
    Protected WithEvents PanelMember As System.Web.UI.WebControls.Panel
    Protected WithEvents ButtonLogin As System.Web.UI.WebControls.Button
    Protected WithEvents PanelLogin As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelMembersArea As System.Web.UI.WebControls.Panel
    Protected WithEvents Name As System.Web.UI.WebControls.Label
    Protected WithEvents DatePaidTo As System.Web.UI.WebControls.Label
    Protected WithEvents ID1 As System.Web.UI.WebControls.Label
    Protected WithEvents register_for_event As System.Web.UI.WebControls.LinkButton
    Protected WithEvents LinkButton_BekomeMember As System.Web.UI.WebControls.LinkButton
    Protected WithEvents PanelNotMember As System.Web.UI.WebControls.Panel
    Protected WithEvents DatePaid As System.Web.UI.WebControls.Label
    Protected WithEvents LinkButton_EDIT As System.Web.UI.WebControls.LinkButton
    Protected WithEvents register_for_event_member As System.Web.UI.WebControls.LinkButton
    Protected WithEvents TypeOfAccount As System.Web.UI.WebControls.Label
    Protected WithEvents lblNotYetPaid As System.Web.UI.WebControls.Label

    'HINWEIS: Die folgende Platzhalterdeklaration ist für den Web Form-Designer erforderlich.
    'Nicht löschen oder verschieben.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: Dieser Methodenaufruf ist für den Web Form-Designer erforderlich
        'Verwenden Sie nicht den Code-Editor zur Bearbeitung.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ' Hier Benutzercode zur Seiteninitialisierung einfügen
    End Sub

  
    Private Sub ButtonLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonLogin.Click

        Me.OleDbConnection.Open()
        Me.OleDbDataAdapter2.SelectCommand.Parameters("E_mail_Address").Value = Me.txtUsername.Text
        Me.OleDbDataAdapter2.SelectCommand.Parameters("Password").Value = Me.txtPassword.Text

        Me.OleDbDataAdapter2.Fill(Me.objMembers, "Members")
        Me.OleDbConnection.Close()

        If Me.objMembers.Tables("Members").Rows.Count = 1 Then 'Loged in 
            Me.panelLogin.visible = False

            Me.PanelMembersArea.Visible = True
            Me.Name.Visible = True
            Me.registeredSince.Visible = True
            Me.TypeOfAccount.Visible = True

            Me.DataBind()

            'decide if paying customer

            If Me.DatePaid.Text <> "" And (Me.TypeOfAccount.Text = "Membership") Then
                Dim dayOfPayment As Date = DatePaid.Text
                Me.DatePaid.Visible = True
                Me.DatePaidTo.Visible = True
                Me.PanelMember.Visible = True
                Me.PanelNotMember.Visible = False

                DatePaid.Text = dayOfPayment
                DatePaidTo.Text = dayOfPayment.AddDays(365)


                If dayOfPayment.AddDays(365) < Date.Today Then ' payment expired 
                    Me.register_for_event_member.Enabled = False
                End If

            Else 'not paid yet 

                Me.lblNotYetPaid.Visible = (Me.TypeOfAccount.Text = "Membership")
                Me.PanelMember.Visible = False
                Me.PanelNotMember.Visible = True
            End If

            Me.DataBind()
        End If
    End Sub

    Private Sub btn_renew_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_renew.Click
        Dim redLink As String = "renewMembership.aspx?Member=" & CType(Me.ID1.Text, String)
        Response.Redirect(redLink)
    End Sub

    Private Sub register_for_event_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles register_for_event.Click
        Dim redLink As String = "registerForEvent.aspx?Member=" & CType(Me.ID1.Text, String)
        Response.Redirect(redLink)
    End Sub
    Private Sub register_for_event_member_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles register_for_event_member.Click
        Dim redLink As String = "registerForEvent.aspx?Member=" & CType(Me.ID1.Text, String)
        Response.Redirect(redLink)
    End Sub

    Private Sub LinkButton_BekomeMember_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LinkButton_BekomeMember.Click
        ''Dim redLink As String = "newAccount_step2.aspx?Member=" & CType(Me.ID1.Text, String)
        Dim redLink As String = "newAccount_step1.aspx?Mode=EDIT&showAccountType=true&ID1=" & CType(Me.ID1.Text, String)
        Response.Redirect(redLink)
    End Sub

    Private Sub LinkButton_EDIT_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LinkButton_EDIT.Click
        Dim redLink As String = "newAccount_step1.aspx?Mode=EDIT&ID1=" & CType(Me.ID1.Text, String)
        Response.Redirect(redLink)
    End Sub


End Class

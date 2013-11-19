Public Class Servey
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDeleteCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter_Users = New System.Data.OleDb.OleDbDataAdapter
        Me.objTests = New poolTool.Dataset_tests
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter_CountUsers = New System.Data.OleDb.OleDbDataAdapter
        CType(Me.objTests, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'OleDbSelectCommand1
        '
        Me.OleDbSelectCommand1.CommandText = "SELECT Email, Name, Lastname, Phone, Person_Id FROM test_User"
        Me.OleDbSelectCommand1.Connection = Me.OleDbConnection
        '
        'OleDbInsertCommand1
        '
        Me.OleDbInsertCommand1.CommandText = "INSERT INTO test_User (Person_Id, Email, Name, Lastname, Phone) VALUES (?, ?, ?, " & _
        "?, ?)"
        Me.OleDbInsertCommand1.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Person_Id", System.Data.OleDb.OleDbType.Integer, 0, "Person_Id"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Email", System.Data.OleDb.OleDbType.VarWChar, 50, "Email"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Name", System.Data.OleDb.OleDbType.VarWChar, 16, "Name"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Lastname", System.Data.OleDb.OleDbType.VarWChar, 50, "Lastname"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Phone", System.Data.OleDb.OleDbType.VarWChar, 50, "Phone"))
        '
        'OleDbUpdateCommand1
        '
        Me.OleDbUpdateCommand1.CommandText = "UPDATE test_User SET Name = ?, Person_Id = ? WHERE (Person_Id = ?) AND (Name = ? " & _
        "OR ? IS NULL AND Name IS NULL)"
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Name", System.Data.OleDb.OleDbType.VarWChar, 16, "Name"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Person_Id", System.Data.OleDb.OleDbType.Integer, 0, "Person_Id"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Person_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Person_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Name", System.Data.OleDb.OleDbType.VarWChar, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Name1", System.Data.OleDb.OleDbType.VarWChar, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Name", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDeleteCommand1
        '
        Me.OleDbDeleteCommand1.CommandText = "DELETE FROM test_User WHERE (Person_Id = ?) AND (Name = ? OR ? IS NULL AND Name I" & _
        "S NULL)"
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Person_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Person_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Name", System.Data.OleDb.OleDbType.VarWChar, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Name1", System.Data.OleDb.OleDbType.VarWChar, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Name", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDataAdapter_Users
        '
        Me.OleDbDataAdapter_Users.DeleteCommand = Me.OleDbDeleteCommand1
        Me.OleDbDataAdapter_Users.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter_Users.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter_Users.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "test_User", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Name", "Name"), New System.Data.Common.DataColumnMapping("Person_Id", "Person_Id")})})
        Me.OleDbDataAdapter_Users.UpdateCommand = Me.OleDbUpdateCommand1
        '
        'objTests
        '
        Me.objTests.DataSetName = "Dataset_tests"
        Me.objTests.Locale = New System.Globalization.CultureInfo("en-US")
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT countusers FROM statisticsCountUsers"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection
        '
        'OleDbInsertCommand2
        '
        Me.OleDbInsertCommand2.CommandText = "INSERT INTO statisticsCountUsers(countusers) VALUES (?)"
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("countusers", System.Data.OleDb.OleDbType.Integer, 0, "countusers"))
        '
        'OleDbDataAdapter_CountUsers
        '
        Me.OleDbDataAdapter_CountUsers.InsertCommand = Me.OleDbInsertCommand2
        Me.OleDbDataAdapter_CountUsers.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter_CountUsers.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "statisticsCountUsers", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("countusers", "countusers")})})
        CType(Me.objTests, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents ImageButton1 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDeleteCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter_Users As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents objTests As poolTool.Dataset_tests
    Protected WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter_CountUsers As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents Name As System.Web.UI.WebControls.TextBox
    Protected WithEvents Lastname As System.Web.UI.WebControls.TextBox
    Protected WithEvents Phone As System.Web.UI.WebControls.TextBox
    Protected WithEvents Email As System.Web.UI.WebControls.TextBox
    Protected WithEvents error_EmailIsMissing As System.Web.UI.WebControls.Label
    Protected WithEvents MailSubject As System.Web.UI.WebControls.TextBox
    Protected WithEvents MailText As System.Web.UI.WebControls.TextBox
    Protected WithEvents MailFrom As System.Web.UI.WebControls.TextBox
    Protected WithEvents SMTP As System.Web.UI.WebControls.TextBox
    Protected WithEvents error_Name As System.Web.UI.WebControls.Label
    Protected WithEvents error_LastName As System.Web.UI.WebControls.Label

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
        ' If Not IsPostBack() Then
        ' Hier Benutzercode zur Seiteninitialisierung einfügen
        Me.OleDbConnection.Open()
        Me.OleDbDataAdapter_Users.Fill(Me.objTests)
        Me.OleDbConnection.Close()
        Me.Email.DataBind()
        'End If
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.MailFrom.Text = CType(configurationAppSettings.GetValue("MailFrom", GetType(System.String)), String)
        Me.MailText.Text = CType(configurationAppSettings.GetValue("MailText", GetType(System.String)), String)
        Me.MailSubject.Text = CType(configurationAppSettings.GetValue("MailSubject", GetType(System.String)), String)
        Me.SMTP.Text = CType(configurationAppSettings.GetValue("SMTP", GetType(System.String)), String)
    End Sub

    Private Sub ImageButton1_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        If Me.Name.Text & "" = "" Then
            Me.error_Name.Visible = True
            Exit Sub
        Else
            Me.error_Name.Visible = False
        End If

        If Me.Lastname.Text & "" = "" Then
            Me.error_LastName.Visible = True
            Exit Sub
        Else
            Me.error_LastName.Visible = False
        End If

        If Me.Email.Text <> "" Then

            Dim newRow As System.Data.DataRow = Me.objTests.Tables("test_User").NewRow()   'go to now row   
            newRow.Item(1) = Me.Email.Text
            newRow.Item(2) = Me.Name.Text
            newRow.Item(3) = Me.Lastname.Text
            newRow.Item(4) = Me.Phone.Text
            Me.objTests.Tables("test_User").Rows.Add(newRow)

            Me.OleDbDataAdapter_Users.Update(Me.objTests)
            Dim sMail As String = sendRegEmail(Me.MailSubject.Text, Me.MailText.Text, Me.MailFrom.Text, Me.Email.Text, Me.SMTP.Text)
            If sMail = "" Then
                Response.Redirect("Results.aspx")
            Else
                Response.Write(sMail)
            End If

        Else
            error_EmailIsMissing.Visible = True
        End If

    End Sub

    Function sendRegEmail(ByVal subject As String, _
    ByVal mailText As String, _
    ByVal mailFrom As String, _
    ByVal mailtTo As String, _
    ByVal smtp As String) As String
        Try
            Dim msgMail As System.Web.Mail.MailMessage
            msgMail = New System.Web.Mail.MailMessage
            msgMail.To = mailtTo
            msgMail.From = mailFrom
            msgMail.Subject = subject
            msgMail.BodyFormat = System.Web.Mail.MailFormat.Html
            msgMail.Body = mailText
            System.Web.Mail.SmtpMail.SmtpServer = smtp
            'System.Web.Mail.SmtpMail.SmtpServer.Insert(0, smtp)
            System.Web.Mail.SmtpMail.Send(msgMail)
            'Response.Write("Email was send!")
            sendRegEmail = ""
        Catch
            sendRegEmail = Err.Number & ":" & Err.LastDllError & "|" & Err.Description
        End Try
    End Function



End Class

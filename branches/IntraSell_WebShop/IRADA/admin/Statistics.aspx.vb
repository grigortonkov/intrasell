Public Class Statistics
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter1 = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter2 = New System.Data.OleDb.OleDbDataAdapter
        Me.Stats1 = New IRADA.Stats
        CType(Me.Stats1, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'OleDbSelectCommand1
        '
        Me.OleDbSelectCommand1.CommandText = "SELECT Members, TypeOfAccount FROM list_MembershipTypes"
        Me.OleDbSelectCommand1.Connection = Me.OleDbConnection
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'OleDbInsertCommand1
        '
        Me.OleDbInsertCommand1.CommandText = "INSERT INTO list_MembershipTypes(Members, TypeOfAccount) VALUES (?, ?)"
        Me.OleDbInsertCommand1.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Members", System.Data.OleDb.OleDbType.Integer, 0, "Members"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, "TypeOfAccount"))
        '
        'OleDbDataAdapter1
        '
        Me.OleDbDataAdapter1.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter1.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter1.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "list_MembershipTypes", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Members", "Members"), New System.Data.Common.DataColumnMapping("TypeOfAccount", "TypeOfAccount")})})
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT Members, PaymentMethod FROM list_MembersPaymentOption"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection
        '
        'OleDbInsertCommand2
        '
        Me.OleDbInsertCommand2.CommandText = "INSERT INTO list_MembersPaymentOption(Members, PaymentMethod) VALUES (?, ?)"
        Me.OleDbInsertCommand2.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Members", System.Data.OleDb.OleDbType.Integer, 0, "Members"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, "PaymentMethod"))
        '
        'OleDbDataAdapter2
        '
        Me.OleDbDataAdapter2.InsertCommand = Me.OleDbInsertCommand2
        Me.OleDbDataAdapter2.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter2.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "list_MembersPaymentOption", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Members", "Members"), New System.Data.Common.DataColumnMapping("PaymentMethod", "PaymentMethod")})})
        '
        'Stats1
        '
        Me.Stats1.DataSetName = "Stats"
        Me.Stats1.Locale = New System.Globalization.CultureInfo("en-US")
        CType(Me.Stats1, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents DataGrid2 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter1 As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter2 As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents Stats1 As IRADA.Stats
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection

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
        Me.OleDbDataAdapter1.Fill(Me.Stats1)
        Me.OleDbDataAdapter2.Fill(Me.Stats1)
        Me.DataBind()
    End Sub

End Class

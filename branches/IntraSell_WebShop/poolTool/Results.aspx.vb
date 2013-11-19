Public Class Results
    Inherits System.Web.UI.Page

    'Verdana 8 pts
    'result 
#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter_statisticsAnswers = New System.Data.OleDb.OleDbDataAdapter
        Me.Dataset_statisticsAnswers = New poolTool.Dataset_tests
        Me.OleDbDataAdapter_CountUsers = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbInsertCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        Me.objTests = New poolTool.Dataset_tests
        CType(Me.Dataset_statisticsAnswers, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.objTests, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'OleDbSelectCommand1
        '
        Me.OleDbSelectCommand1.CommandText = "SELECT Answer, CountAnswers * 4 AS CountAnswers, CountTotalAnswers * 4 AS CountTo" & _
        "talAnswers, InPercent, Question, Question_Id, CountTotalAnswers AS Expr1 FROM st" & _
        "atistictsAnswers ORDER BY Question_Id, Question"
        Me.OleDbSelectCommand1.Connection = Me.OleDbConnection
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'OleDbInsertCommand1
        '
        Me.OleDbInsertCommand1.CommandText = "INSERT INTO statistictsAnswers(Answer, CountAnswers, CountTotalAnswers, InPercent" & _
        ", Question) VALUES (?, ?, ?, ?, ?)"
        Me.OleDbInsertCommand1.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Answer", System.Data.OleDb.OleDbType.VarWChar, 255, "Answer"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("CountAnswers", System.Data.OleDb.OleDbType.Integer, 0, "CountAnswers"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("CountTotalAnswers", System.Data.OleDb.OleDbType.Integer, 0, "CountTotalAnswers"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("InPercent", System.Data.OleDb.OleDbType.Double, 0, "InPercent"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Question", System.Data.OleDb.OleDbType.VarWChar, 255, "Question"))
        '
        'OleDbDataAdapter_statisticsAnswers
        '
        Me.OleDbDataAdapter_statisticsAnswers.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter_statisticsAnswers.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter_statisticsAnswers.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "statistictsAnswers", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Answer", "Answer"), New System.Data.Common.DataColumnMapping("CountAnswers", "CountAnswers"), New System.Data.Common.DataColumnMapping("CountTotalAnswers", "CountTotalAnswers"), New System.Data.Common.DataColumnMapping("InPercent", "InPercent"), New System.Data.Common.DataColumnMapping("Question", "Question"), New System.Data.Common.DataColumnMapping("Question_Id", "Question_Id")})})
        '
        'Dataset_statisticsAnswers
        '
        Me.Dataset_statisticsAnswers.DataSetName = "Dataset_tests"
        Me.Dataset_statisticsAnswers.Locale = New System.Globalization.CultureInfo("en-US")
        '
        'OleDbDataAdapter_CountUsers
        '
        Me.OleDbDataAdapter_CountUsers.InsertCommand = Me.OleDbInsertCommand2
        Me.OleDbDataAdapter_CountUsers.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter_CountUsers.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "statisticsCountUsers", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("countusers", "countusers")})})
        '
        'OleDbInsertCommand2
        '
        Me.OleDbInsertCommand2.CommandText = "INSERT INTO statisticsCountUsers(countusers) VALUES (?)"
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("countusers", System.Data.OleDb.OleDbType.Integer, 0, "countusers"))
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT MAX(CountTotalAnswers * 4) AS CountUsers FROM statistictsAnswers"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection
        '
        'objTests
        '
        Me.objTests.DataSetName = "Dataset_tests"
        Me.objTests.Locale = New System.Globalization.CultureInfo("en-US")
        CType(Me.Dataset_statisticsAnswers, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.objTests, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents OleDbDataAdapter_statisticsAnswers As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents Dataset_statisticsAnswers As poolTool.Dataset_tests
    Protected WithEvents DataGrid As System.Web.UI.WebControls.DataGrid
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents OleDbDataAdapter_CountUsers As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbInsertCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents objTests As poolTool.Dataset_tests
    Protected WithEvents Label_Number_Users As System.Web.UI.WebControls.Label
    Protected WithEvents back As System.Web.UI.WebControls.LinkButton

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
        Me.OleDbConnection.Open()
        Me.OleDbDataAdapter_statisticsAnswers.Fill(Me.Dataset_statisticsAnswers)
        Me.OleDbConnection.Close()

        Me.DataGrid.DataBind()

        'Me.Label_QUESTION.DataBind()


        ' Hier Benutzercode zur Seiteninitialisierung einfügen
        Me.OleDbConnection.Open()
        Me.OleDbDataAdapter_CountUsers.Fill(Me.objTests)
        Me.OleDbConnection.Close()
        Me.Label_Number_Users.DataBind()

    End Sub
 

    Public lastQuestion As String
    Public NewValues(1000) As String
    Public NewValuesBottom(1000) As String

    Private Sub DataGrid_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles DataGrid.ItemDataBound
        'Here we need to detect when a row has a new SalesDate, and add 
        'it to our array
        If e.Item.ItemType = System.Web.UI.WebControls.ListItemType.Item Or _
            e.Item.ItemType = System.Web.UI.WebControls.ListItemType.AlternatingItem Then
            NewValues(e.Item.ItemIndex) = ""
            NewValuesBottom(e.Item.ItemIndex) = ""
            If e.Item.DataItem("Question") <> lastQuestion Then
                lastQuestion = e.Item.DataItem("Question")
                '' NewValues(e.Item.ItemIndex) = String.Format("{0:D}", e.Item.DataItem("Question"))
                ''NewValuesBottom(e.Item.ItemIndex) = "Total # of respondents " & String.Format("{0:D}", e.Item.DataItem("CountTotalAnswers"))


                NewValues(e.Item.ItemIndex) = "Total # of respondents " & String.Format("{0:D}", e.Item.DataItem("CountTotalAnswers"))
                NewValues(e.Item.ItemIndex) += "<br><br>" & String.Format("{0:D}", e.Item.DataItem("Question"))

            End If
        End If
    End Sub

    Private Sub DataGrid_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataGrid.PreRender
        'Just before the Datagrid renders its output, add the extra 
        'separator rows
        Dim DG As System.Web.UI.WebControls.DataGrid = CType(sender, System.Web.UI.WebControls.DataGrid)
        Dim Tbl As System.Web.UI.WebControls.Table = DG.Controls(0)

        Dim DGI As System.Web.UI.WebControls.DataGridItem
        Dim DGI_Bottom As System.Web.UI.WebControls.DataGridItem

        Dim Cell As System.Web.UI.WebControls.TableCell
        Dim Cell_Bottom As System.Web.UI.WebControls.TableCell

        Dim i As Integer, iAdded As Integer = 0
        For i = 0 To NewValues.GetUpperBound(0)
            If NewValues(i) <> "" Then
                'Just so it picks up the formatting class for my Header
                'could have used ListItemType.Item
                DGI = New System.Web.UI.WebControls.DataGridItem(0, 0, System.Web.UI.WebControls.ListItemType.Header)
                Cell = New System.Web.UI.WebControls.TableCell
                Cell.ColumnSpan = 3
                'Cell.BackColor = System.Drawing.Color.Gray
                Cell.ForeColor = System.Drawing.Color.Orange
                Cell.Text = NewValues(i)
                DGI.Cells.Add(Cell)
                'Add one to skip past the Header item
                Tbl.Controls.AddAt(i + iAdded + 1, DGI)

                iAdded = iAdded + 1
            End If
        Next

        'iAdded = 0
        'For i = 0 To NewValuesBottom.GetUpperBound(0)
        '    If NewValuesBottom(i) <> "" Then
        '        DGI_Bottom = New System.Web.UI.WebControls.DataGridItem(0, 0, System.Web.UI.WebControls.ListItemType.Header)
        '        Cell_Bottom = New System.Web.UI.WebControls.TableCell
        '        Cell_Bottom.ColumnSpan = 3
        '        Cell_Bottom.BackColor = System.Drawing.Color.Gold
        '        Cell_Bottom.Text = NewValuesBottom(i)
        '        DGI_Bottom.Cells.Add(Cell_Bottom)
        '        'Add one to skip past the Header item
        '        Tbl.Controls.AddAt(i + iAdded + 1 + 1, DGI_Bottom)

        '        iAdded = iAdded + 1
        '    End If
        'Next

    End Sub

    Private Sub back_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles back.Click
        Response.Redirect("survey.htm")
    End Sub
End Class

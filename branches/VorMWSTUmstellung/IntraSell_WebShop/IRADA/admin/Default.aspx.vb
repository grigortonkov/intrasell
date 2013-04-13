Public Class _Default
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.objMeetingsEvents = New IRADA.Dataset_MeetingsEvents
        Me.OleDbDataAdapter_Events = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbDeleteCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand1 = New System.Data.OleDb.OleDbCommand
        CType(Me.objMeetingsEvents, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'objMeetingsEvents
        '
        Me.objMeetingsEvents.DataSetName = "Dataset_MeetingsEvents"
        Me.objMeetingsEvents.Locale = New System.Globalization.CultureInfo("en-US")
        '
        'OleDbDataAdapter_Events
        '
        Me.OleDbDataAdapter_Events.DeleteCommand = Me.OleDbDeleteCommand1
        Me.OleDbDataAdapter_Events.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter_Events.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter_Events.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Events", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Id", "Id"), New System.Data.Common.DataColumnMapping("Place", "Place"), New System.Data.Common.DataColumnMapping("Presenter", "Presenter"), New System.Data.Common.DataColumnMapping("Price", "Price"), New System.Data.Common.DataColumnMapping("Schedule", "Schedule"), New System.Data.Common.DataColumnMapping("Topic", "Topic")})})
        Me.OleDbDataAdapter_Events.UpdateCommand = Me.OleDbUpdateCommand1
        '
        'OleDbDeleteCommand1
        '
        Me.OleDbDeleteCommand1.CommandText = "DELETE FROM Events WHERE (Id = ?) AND (Place = ? OR ? IS NULL AND Place IS NULL) " & _
        "AND (Presenter = ? OR ? IS NULL AND Presenter IS NULL) AND (Price = ? OR ? IS NU" & _
        "LL AND Price IS NULL) AND (Schedule = ? OR ? IS NULL AND Schedule IS NULL) AND (" & _
        "Topic = ? OR ? IS NULL AND Topic IS NULL)"
        Me.OleDbDeleteCommand1.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Place", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Place", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Place1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Place", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Presenter", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Presenter", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Presenter1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Presenter", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Price", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Price1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Schedule", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Schedule", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Schedule1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Schedule", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Topic", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Topic", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Topic1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Topic", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbInsertCommand1
        '
        Me.OleDbInsertCommand1.CommandText = "INSERT INTO Events(Place, Presenter, Price, Schedule, Topic) VALUES (?, ?, ?, ?, " & _
        "?)"
        Me.OleDbInsertCommand1.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Place", System.Data.OleDb.OleDbType.VarWChar, 50, "Place"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Presenter", System.Data.OleDb.OleDbType.VarWChar, 50, "Presenter"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Price", System.Data.OleDb.OleDbType.Integer, 0, "Price"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Schedule", System.Data.OleDb.OleDbType.DBDate, 0, "Schedule"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Topic", System.Data.OleDb.OleDbType.VarWChar, 50, "Topic"))
        '
        'OleDbSelectCommand1
        '
        Me.OleDbSelectCommand1.CommandText = "SELECT Events.Id, Events.Place, Events.Presenter, Events.Price, Events.Schedule, " & _
        "Events.Topic, COUNT(Member_Events.Id) AS Registrations FROM (Events INNER JOIN M" & _
        "ember_Events ON Events.Id = Member_Events.Event) GROUP BY Events.Id, Events.Plac" & _
        "e, Events.Presenter, Events.Price, Events.Schedule, Events.Topic"
        Me.OleDbSelectCommand1.Connection = Me.OleDbConnection
        '
        'OleDbUpdateCommand1
        '
        Me.OleDbUpdateCommand1.CommandText = "UPDATE Events SET Place = ?, Presenter = ?, Price = ?, Schedule = ?, Topic = ? WH" & _
        "ERE (Id = ?) AND (Place = ? OR ? IS NULL AND Place IS NULL) AND (Presenter = ? O" & _
        "R ? IS NULL AND Presenter IS NULL) AND (Price = ? OR ? IS NULL AND Price IS NULL" & _
        ") AND (Schedule = ? OR ? IS NULL AND Schedule IS NULL) AND (Topic = ? OR ? IS NU" & _
        "LL AND Topic IS NULL)"
        Me.OleDbUpdateCommand1.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Place", System.Data.OleDb.OleDbType.VarWChar, 50, "Place"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Presenter", System.Data.OleDb.OleDbType.VarWChar, 50, "Presenter"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Price", System.Data.OleDb.OleDbType.Integer, 0, "Price"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Schedule", System.Data.OleDb.OleDbType.DBDate, 0, "Schedule"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Topic", System.Data.OleDb.OleDbType.VarWChar, 50, "Topic"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Place", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Place", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Place1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Place", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Presenter", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Presenter", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Presenter1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Presenter", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Price", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Price1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Schedule", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Schedule", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Schedule1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Schedule", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Topic", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Topic", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Topic1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Topic", System.Data.DataRowVersion.Original, Nothing))
        CType(Me.objMeetingsEvents, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents btnSearch As System.Web.UI.WebControls.Button
    Protected WithEvents searchName As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents searchAddress As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents searchID As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents ButtonEditEvents As System.Web.UI.WebControls.Button
    Protected WithEvents search_typeOfRegistration As System.Web.UI.HtmlControls.HtmlSelect
    Protected WithEvents txtDateFrom As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents txtDateTo As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents ButtonSearchUsers As System.Web.UI.WebControls.Button
    Protected WithEvents search_typeOfRegistration1 As System.Web.UI.HtmlControls.HtmlSelect
    Protected WithEvents creationTime As System.Web.UI.WebControls.TextBox
    Protected WithEvents creationTime1 As System.Web.UI.WebControls.TextBox
    Protected WithEvents creationTime1_ As System.Web.UI.WebControls.TextBox
    Protected WithEvents creationTime_ As System.Web.UI.WebControls.TextBox
    Protected WithEvents creationTime_email1 As System.Web.UI.WebControls.TextBox
    Protected WithEvents creationTime_email As System.Web.UI.WebControls.TextBox
    Protected WithEvents search_typeOfRegistration1_Email As System.Web.UI.HtmlControls.HtmlSelect
    Protected WithEvents Event_Email As System.Web.UI.WebControls.DropDownList
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents objMeetingsEvents As IRADA.Dataset_MeetingsEvents
    Protected WithEvents OleDbDataAdapter_Events As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbDeleteCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents Button_SendMail As System.Web.UI.WebControls.Button

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
        If Not Me.IsPostBack Then
            Me.OleDbConnection.Open()
            Me.OleDbDataAdapter_Events.Fill(Me.objMeetingsEvents)
            Me.OleDbConnection.Close()
            Me.DataBind()
        End If
    End Sub

    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Response.Redirect("Members.aspx?typeOfRegistration=" & Me.search_typeOfRegistration.Value & _
        "&ID1=" & Me.searchID.Value & _
        "&Address=" & Me.searchAddress.Value & _
        "&Name=" & Me.searchName.Value & _
        "&creationTime=" & Me.creationTime_.Text & _
        "&creationTime1=" & Me.creationTime1_.Text & _
        "&DataFrom=AllMembers")
    End Sub

    Private Sub ButtonEditEvents_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonEditEvents.Click
        Response.Redirect("EditEvents.aspx")
    End Sub

    Private Sub ButtonSearchUsers_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonSearchUsers.Click
        Response.Redirect("Members.aspx?typeOfRegistration1=" & Me.search_typeOfRegistration1.Value & _
        "&creationTime=" & Me.creationTime.Text & _
        "&creationTime1=" & Me.creationTime1.Text & _
        "&DataFrom=NewMembers")

    End Sub

    Private Sub Button_SendMail_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button_SendMail.Click
        If Me.search_typeOfRegistration1_Email.Visible = True Then
            Response.Redirect("Members.aspx?typeOfRegistration1=" & Me.search_typeOfRegistration1_Email.Value & _
            "&creationTime=" & Me.creationTime_email.Text & _
            "&creationTime1=" & Me.creationTime_email1.Text & _
            "&DataFrom=Emails")
        Else
            Response.Redirect("Members.aspx?Event_Email=" & Me.Event_Email.SelectedValue & _
            "&DataFrom=Emails")
        End If

    End Sub

    Private Sub search_typeOfRegistration1_Email_ServerChange(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles search_typeOfRegistration1_Email.ServerChange

    End Sub

    Private Sub Event_Email_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Event_Email.SelectedIndexChanged
        Me.search_typeOfRegistration1_Email.Visible = False
        Me.creationTime_email.Enabled = False
        Me.creationTime_email1.Enabled = False

    End Sub
End Class


Public Class EditEvents
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.objDataset_MeetingsEvents = New IRADA.Dataset_MeetingsEvents
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.OleDbDataAdapter_Events = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbDeleteCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter_Meetings = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbDeleteCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbCommand = New System.Data.OleDb.OleDbCommand
        CType(Me.objDataset_MeetingsEvents, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'objDataset_MeetingsEvents
        '
        Me.objDataset_MeetingsEvents.DataSetName = "Dataset_MeetingsEvents"
        Me.objDataset_MeetingsEvents.Locale = New System.Globalization.CultureInfo("en-US")
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
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
        "Events.Topic, COUNT(Member_Events.Id) AS Registrations FROM (Events LEFT OUTER J" & _
        "OIN Member_Events ON Events.Id = Member_Events.Event) GROUP BY Events.Id, Events" & _
        ".Place, Events.Presenter, Events.Price, Events.Schedule, Events.Topic"
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
        '
        'OleDbDataAdapter_Meetings
        '
        Me.OleDbDataAdapter_Meetings.DeleteCommand = Me.OleDbDeleteCommand2
        Me.OleDbDataAdapter_Meetings.InsertCommand = Me.OleDbInsertCommand2
        Me.OleDbDataAdapter_Meetings.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter_Meetings.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Meetings", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Description", "Description"), New System.Data.Common.DataColumnMapping("Id", "Id"), New System.Data.Common.DataColumnMapping("Price", "Price")})})
        Me.OleDbDataAdapter_Meetings.UpdateCommand = Me.OleDbUpdateCommand2
        '
        'OleDbDeleteCommand2
        '
        Me.OleDbDeleteCommand2.CommandText = "DELETE FROM Meetings WHERE (Id = ?) AND (Description = ? OR ? IS NULL AND Descrip" & _
        "tion IS NULL) AND (Price = ? OR ? IS NULL AND Price IS NULL)"
        Me.OleDbDeleteCommand2.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Description", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Description", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Description1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Description", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Price", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Price1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Price", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbInsertCommand2
        '
        Me.OleDbInsertCommand2.CommandText = "INSERT INTO Meetings(Description, Price) VALUES (?, ?)"
        Me.OleDbInsertCommand2.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Description", System.Data.OleDb.OleDbType.VarWChar, 255, "Description"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Price", System.Data.OleDb.OleDbType.Integer, 0, "Price"))
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT Meetings.Description, Meetings.Id, Meetings.Price, COUNT(Member_Meetings.I" & _
        "d) AS Registrations FROM (Meetings LEFT OUTER JOIN Member_Meetings ON Meetings.I" & _
        "d = Member_Meetings.Meeting) GROUP BY Meetings.Description, Meetings.Id, Meeting" & _
        "s.Price"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection
        '
        'OleDbUpdateCommand2
        '
        Me.OleDbUpdateCommand2.CommandText = "UPDATE Meetings SET Description = ?, Price = ? WHERE (Id = ?) AND (Description = " & _
        "? OR ? IS NULL AND Description IS NULL) AND (Price = ? OR ? IS NULL AND Price IS" & _
        " NULL)"
        Me.OleDbUpdateCommand2.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Description", System.Data.OleDb.OleDbType.VarWChar, 255, "Description"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Price", System.Data.OleDb.OleDbType.Integer, 0, "Price"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Description", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Description", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Description1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Description", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Price", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Price", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Price1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Price", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbCommand
        '
        Me.OleDbCommand.Connection = Me.OleDbConnection
        CType(Me.objDataset_MeetingsEvents, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents objDataset_MeetingsEvents As IRADA.Dataset_MeetingsEvents
    Protected WithEvents buttonLoad As System.Web.UI.WebControls.Button
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents OleDbDataAdapter_Events As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbDeleteCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter_Meetings As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbDeleteCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents ButtonSave As System.Web.UI.WebControls.Button
    Protected WithEvents ButtonNew As System.Web.UI.WebControls.Button
    Protected WithEvents myDataGrid As System.Web.UI.WebControls.DataGrid
    Protected WithEvents DataGrid_Meeting As System.Web.UI.WebControls.DataGrid
    Protected WithEvents Button1 As System.Web.UI.WebControls.Button
    Protected WithEvents OleDbCommand As System.Data.OleDb.OleDbCommand

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
            reloadData()
        End If
    End Sub

    Private Sub buttonLoad_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles buttonLoad.Click
        Call reloadData()

    End Sub


 


    Sub reloadData()
        Try
            Me.OleDbDataAdapter_Events.Fill(Me.objDataset_MeetingsEvents)
            Me.OleDbDataAdapter_Meetings.Fill(Me.objDataset_MeetingsEvents)

            'Hier Code zum Füllen des DataSets einfügen. Die Tabelle wird nicht auf der Seite angezeigt, wenn das DataSet leer ist.
            Me.myDataGrid.SelectedIndex = -1
            Me.myDataGrid.DataBind()
            Me.DataGrid_Meeting.DataBind()

        Catch eLoad As System.Exception
            Me.Response.Write(eLoad.Message)
        End Try
    End Sub

    Private Sub ButtonSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonSave.Click
        Dim i As Integer
        Dim _item As System.Web.UI.WebControls.DataGridItem
        Dim dr As System.Data.DataRow

        'EVENTS 
        Me.OleDbDataAdapter_Events.Fill(Me.objDataset_MeetingsEvents)
        For i = 0 To myDataGrid.Items.Count - 1
            _item = myDataGrid.Items(i)
            dr = objDataset_MeetingsEvents.Tables("Events").Rows(i)
            dr(1) = CType(_item.FindControl("Presenter"), System.Web.UI.WebControls.TextBox).Text
            dr(2) = CType(_item.FindControl("Topic"), System.Web.UI.WebControls.TextBox).Text
            dr(3) = CType(_item.FindControl("Schedule"), System.Web.UI.WebControls.TextBox).Text
            dr(4) = CType(_item.FindControl("Place"), System.Web.UI.WebControls.TextBox).Text
            dr(5) = CType(_item.FindControl("Price"), System.Web.UI.WebControls.TextBox).Text
            'dr(3) = giftCheckBox.Checked
        Next
        Me.OleDbDataAdapter_Events.Update(Me.objDataset_MeetingsEvents)
        'END EVENTS 



        'MEETINGS 
        Me.OleDbDataAdapter_Meetings.Fill(Me.objDataset_MeetingsEvents)
        For i = 0 To Me.DataGrid_Meeting.Items.Count - 1
            _item = DataGrid_Meeting.Items(i)
            dr = objDataset_MeetingsEvents.Tables("Meetings").Rows(i)
            dr(1) = CType(_item.FindControl("Description"), System.Web.UI.WebControls.TextBox).Text
            dr(2) = CType(_item.FindControl("mPrice"), System.Web.UI.WebControls.TextBox).Text
        Next
        Me.OleDbDataAdapter_Meetings.Update(Me.objDataset_MeetingsEvents)
        'END MEETINGS 

        reloadData()
    End Sub

    Private Sub ButtonNew_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonNew.Click
        Me.OleDbConnection.Open()
        Me.OleDbCommand.CommandText = "Insert into Events(Topic, Price, Presenter, Schedule, Place) " & _
        " values ('new event',0,'prof Uli', now(), 'meeting place')"
        Me.OleDbCommand.ExecuteNonQuery()
        reloadData()
        Me.OleDbConnection.Close()
    End Sub


    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.OleDbConnection.Open()
        Me.OleDbCommand.CommandText = "Insert into Meetings(Description, Price) values ('new meeting',0)"
        Me.OleDbCommand.ExecuteNonQuery()
        reloadData()
        Me.OleDbConnection.Close()
    End Sub
End Class

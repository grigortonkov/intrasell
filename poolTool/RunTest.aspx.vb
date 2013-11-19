Public Class RunTest
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
        Me.OleDbDataAdapter_Answers = New System.Data.OleDb.OleDbDataAdapter
        Me.Dataset_tests = New poolTool.Dataset_tests
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDeleteCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter_Questions = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbSelectCommand3 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand3 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand3 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDeleteCommand3 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter_Test = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbSelectCommand4 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand4 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand4 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDeleteCommand4 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter_Users = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbCommand = New System.Data.OleDb.OleDbCommand
        CType(Me.Dataset_tests, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'OleDbSelectCommand1
        '
        Me.OleDbSelectCommand1.CommandText = "SELECT FK_Question_Id, Answer, Answer_Id, Points FROM test_Answers WHERE (FK_Ques" & _
        "tion_Id = ?) ORDER BY FK_Question_Id, Answer_Id"
        Me.OleDbSelectCommand1.Connection = Me.OleDbConnection
        Me.OleDbSelectCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("FK_Question_Id", System.Data.OleDb.OleDbType.Integer, 0, "FK_Question_Id"))
        '
        'OleDbInsertCommand1
        '
        Me.OleDbInsertCommand1.CommandText = "INSERT INTO test_Answers(Answer, FK_Question_Id, Points) VALUES (?, ?, ?)"
        Me.OleDbInsertCommand1.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Answer", System.Data.OleDb.OleDbType.VarWChar, 255, "Answer"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("FK_Question_Id", System.Data.OleDb.OleDbType.Integer, 0, "FK_Question_Id"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Points", System.Data.OleDb.OleDbType.Integer, 0, "Points"))
        '
        'OleDbUpdateCommand1
        '
        Me.OleDbUpdateCommand1.CommandText = "UPDATE test_Answers SET Answer = ?, FK_Question_Id = ?, Points = ? WHERE (Answer_" & _
        "Id = ?) AND (Answer = ? OR ? IS NULL AND Answer IS NULL) AND (FK_Question_Id = ?" & _
        " OR ? IS NULL AND FK_Question_Id IS NULL) AND (Points = ? OR ? IS NULL AND Point" & _
        "s IS NULL)"
        Me.OleDbUpdateCommand1.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Answer", System.Data.OleDb.OleDbType.VarWChar, 255, "Answer"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("FK_Question_Id", System.Data.OleDb.OleDbType.Integer, 0, "FK_Question_Id"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Points", System.Data.OleDb.OleDbType.Integer, 0, "Points"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Answer_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Answer_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Answer", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Answer", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Answer1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Answer", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_FK_Question_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FK_Question_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_FK_Question_Id1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FK_Question_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Points", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Points", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Points1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Points", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDeleteCommand1
        '
        Me.OleDbDeleteCommand1.CommandText = "DELETE FROM test_Answers WHERE (Answer_Id = ?) AND (Answer = ? OR ? IS NULL AND A" & _
        "nswer IS NULL) AND (FK_Question_Id = ? OR ? IS NULL AND FK_Question_Id IS NULL) " & _
        "AND (Points = ? OR ? IS NULL AND Points IS NULL)"
        Me.OleDbDeleteCommand1.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Answer_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Answer_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Answer", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Answer", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Answer1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Answer", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_FK_Question_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FK_Question_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_FK_Question_Id1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FK_Question_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Points", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Points", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Points1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Points", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDataAdapter_Answers
        '
        Me.OleDbDataAdapter_Answers.DeleteCommand = Me.OleDbDeleteCommand1
        Me.OleDbDataAdapter_Answers.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter_Answers.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter_Answers.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "test_Answers", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Answer", "Answer"), New System.Data.Common.DataColumnMapping("Answer_Id", "Answer_Id"), New System.Data.Common.DataColumnMapping("FK_Question_Id", "FK_Question_Id"), New System.Data.Common.DataColumnMapping("Points", "Points")})})
        Me.OleDbDataAdapter_Answers.UpdateCommand = Me.OleDbUpdateCommand1
        '
        'Dataset_tests
        '
        Me.Dataset_tests.DataSetName = "Dataset_tests"
        Me.Dataset_tests.Locale = New System.Globalization.CultureInfo("en-US")
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT Question_Id, FK_Test_Id, Picture, Question, TimeToSolve FROM test_Question" & _
        "s WHERE (Question_Id = ?)"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection
        Me.OleDbSelectCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Question_Id", System.Data.OleDb.OleDbType.Integer, 0, "Question_Id"))
        '
        'OleDbInsertCommand2
        '
        Me.OleDbInsertCommand2.CommandText = "INSERT INTO test_Questions(FK_Test_Id, Picture, Question, TimeToSolve) VALUES (?," & _
        " ?, ?, ?)"
        Me.OleDbInsertCommand2.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("FK_Test_Id", System.Data.OleDb.OleDbType.Integer, 0, "FK_Test_Id"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Picture", System.Data.OleDb.OleDbType.VarWChar, 255, "Picture"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Question", System.Data.OleDb.OleDbType.VarWChar, 255, "Question"))
        Me.OleDbInsertCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("TimeToSolve", System.Data.OleDb.OleDbType.Single, 0, "TimeToSolve"))
        '
        'OleDbUpdateCommand2
        '
        Me.OleDbUpdateCommand2.CommandText = "UPDATE test_Questions SET FK_Test_Id = ?, Picture = ?, Question = ?, TimeToSolve " & _
        "= ? WHERE (Question_Id = ?) AND (FK_Test_Id = ? OR ? IS NULL AND FK_Test_Id IS N" & _
        "ULL) AND (Picture = ? OR ? IS NULL AND Picture IS NULL) AND (Question = ? OR ? I" & _
        "S NULL AND Question IS NULL) AND (TimeToSolve = ?)"
        Me.OleDbUpdateCommand2.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("FK_Test_Id", System.Data.OleDb.OleDbType.Integer, 0, "FK_Test_Id"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Picture", System.Data.OleDb.OleDbType.VarWChar, 255, "Picture"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Question", System.Data.OleDb.OleDbType.VarWChar, 255, "Question"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("TimeToSolve", System.Data.OleDb.OleDbType.Single, 0, "TimeToSolve"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Question_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Question_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_FK_Test_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FK_Test_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_FK_Test_Id1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FK_Test_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Picture", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Picture", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Picture1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Picture", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Question", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Question", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Question1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Question", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TimeToSolve", System.Data.OleDb.OleDbType.Single, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TimeToSolve", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDeleteCommand2
        '
        Me.OleDbDeleteCommand2.CommandText = "DELETE FROM test_Questions WHERE (Question_Id = ?) AND (FK_Test_Id = ? OR ? IS NU" & _
        "LL AND FK_Test_Id IS NULL) AND (Picture = ? OR ? IS NULL AND Picture IS NULL) AN" & _
        "D (Question = ? OR ? IS NULL AND Question IS NULL) AND (TimeToSolve = ?)"
        Me.OleDbDeleteCommand2.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Question_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Question_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_FK_Test_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FK_Test_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_FK_Test_Id1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "FK_Test_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Picture", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Picture", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Picture1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Picture", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Question", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Question", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Question1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Question", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TimeToSolve", System.Data.OleDb.OleDbType.Single, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TimeToSolve", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDataAdapter_Questions
        '
        Me.OleDbDataAdapter_Questions.DeleteCommand = Me.OleDbDeleteCommand2
        Me.OleDbDataAdapter_Questions.InsertCommand = Me.OleDbInsertCommand2
        Me.OleDbDataAdapter_Questions.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter_Questions.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "test_Questions", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("FK_Test_Id", "FK_Test_Id"), New System.Data.Common.DataColumnMapping("Picture", "Picture"), New System.Data.Common.DataColumnMapping("Question", "Question"), New System.Data.Common.DataColumnMapping("Question_Id", "Question_Id"), New System.Data.Common.DataColumnMapping("TimeToSolve", "TimeToSolve")})})
        Me.OleDbDataAdapter_Questions.UpdateCommand = Me.OleDbUpdateCommand2
        '
        'OleDbSelectCommand3
        '
        Me.OleDbSelectCommand3.CommandText = "SELECT Description, Test_Id, Testname FROM test_Tests"
        Me.OleDbSelectCommand3.Connection = Me.OleDbConnection
        '
        'OleDbInsertCommand3
        '
        Me.OleDbInsertCommand3.CommandText = "INSERT INTO test_Tests(Description, Testname) VALUES (?, ?)"
        Me.OleDbInsertCommand3.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Description", System.Data.OleDb.OleDbType.VarWChar, 0, "Description"))
        Me.OleDbInsertCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Testname", System.Data.OleDb.OleDbType.VarWChar, 50, "Testname"))
        '
        'OleDbUpdateCommand3
        '
        Me.OleDbUpdateCommand3.CommandText = "UPDATE test_Tests SET Description = ?, Testname = ? WHERE (Test_Id = ?) AND (Test" & _
        "name = ? OR ? IS NULL AND Testname IS NULL)"
        Me.OleDbUpdateCommand3.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Description", System.Data.OleDb.OleDbType.VarWChar, 0, "Description"))
        Me.OleDbUpdateCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Testname", System.Data.OleDb.OleDbType.VarWChar, 50, "Testname"))
        Me.OleDbUpdateCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Test_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Test_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Testname", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Testname", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Testname1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Testname", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDeleteCommand3
        '
        Me.OleDbDeleteCommand3.CommandText = "DELETE FROM test_Tests WHERE (Test_Id = ?) AND (Testname = ? OR ? IS NULL AND Tes" & _
        "tname IS NULL)"
        Me.OleDbDeleteCommand3.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Test_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Test_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Testname", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Testname", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Testname1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Testname", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDataAdapter_Test
        '
        Me.OleDbDataAdapter_Test.DeleteCommand = Me.OleDbDeleteCommand3
        Me.OleDbDataAdapter_Test.InsertCommand = Me.OleDbInsertCommand3
        Me.OleDbDataAdapter_Test.SelectCommand = Me.OleDbSelectCommand3
        Me.OleDbDataAdapter_Test.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "test_Tests", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Description", "Description"), New System.Data.Common.DataColumnMapping("Test_Id", "Test_Id"), New System.Data.Common.DataColumnMapping("Testname", "Testname")})})
        Me.OleDbDataAdapter_Test.UpdateCommand = Me.OleDbUpdateCommand3
        '
        'OleDbSelectCommand4
        '
        Me.OleDbSelectCommand4.CommandText = "SELECT Name, Person_Id FROM test_User"
        Me.OleDbSelectCommand4.Connection = Me.OleDbConnection
        '
        'OleDbInsertCommand4
        '
        Me.OleDbInsertCommand4.CommandText = "INSERT INTO test_User(Name, Person_Id) VALUES (?, ?)"
        Me.OleDbInsertCommand4.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Name", System.Data.OleDb.OleDbType.VarWChar, 16, "Name"))
        Me.OleDbInsertCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Person_Id", System.Data.OleDb.OleDbType.Integer, 0, "Person_Id"))
        '
        'OleDbUpdateCommand4
        '
        Me.OleDbUpdateCommand4.CommandText = "UPDATE test_User SET Name = ?, Person_Id = ? WHERE (Person_Id = ?) AND (Name = ? " & _
        "OR ? IS NULL AND Name IS NULL)"
        Me.OleDbUpdateCommand4.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Name", System.Data.OleDb.OleDbType.VarWChar, 16, "Name"))
        Me.OleDbUpdateCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Person_Id", System.Data.OleDb.OleDbType.Integer, 0, "Person_Id"))
        Me.OleDbUpdateCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Person_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Person_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Name", System.Data.OleDb.OleDbType.VarWChar, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Name1", System.Data.OleDb.OleDbType.VarWChar, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Name", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDeleteCommand4
        '
        Me.OleDbDeleteCommand4.CommandText = "DELETE FROM test_User WHERE (Person_Id = ?) AND (Name = ? OR ? IS NULL AND Name I" & _
        "S NULL)"
        Me.OleDbDeleteCommand4.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Person_Id", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Person_Id", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Name", System.Data.OleDb.OleDbType.VarWChar, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand4.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Name1", System.Data.OleDb.OleDbType.VarWChar, 16, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Name", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDataAdapter_Users
        '
        Me.OleDbDataAdapter_Users.DeleteCommand = Me.OleDbDeleteCommand4
        Me.OleDbDataAdapter_Users.InsertCommand = Me.OleDbInsertCommand4
        Me.OleDbDataAdapter_Users.SelectCommand = Me.OleDbSelectCommand4
        Me.OleDbDataAdapter_Users.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "test_User", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Name", "Name"), New System.Data.Common.DataColumnMapping("Person_Id", "Person_Id")})})
        Me.OleDbDataAdapter_Users.UpdateCommand = Me.OleDbUpdateCommand4
        '
        'OleDbCommand
        '
        Me.OleDbCommand.Connection = Me.OleDbConnection
        CType(Me.Dataset_tests, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDeleteCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents Dataset_tests As poolTool.Dataset_tests
    Protected WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDeleteCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter_Questions As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbSelectCommand3 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand3 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand3 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDeleteCommand3 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter_Test As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbSelectCommand4 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand4 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand4 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDeleteCommand4 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter_Users As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents Label_Question As System.Web.UI.WebControls.Label
    Protected WithEvents OleDbDataAdapter_Answers As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbCommand As System.Data.OleDb.OleDbCommand
    Protected WithEvents LABEL_Question_id As System.Web.UI.WebControls.Label
    Protected WithEvents RadioButtonList_answer As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents Panel_END As System.Web.UI.WebControls.Panel
    Protected WithEvents Form1 As System.Web.UI.HtmlControls.HtmlForm
    Protected WithEvents txtOther As System.Web.UI.WebControls.TextBox
    Protected WithEvents Button_Other_Enter As System.Web.UI.WebControls.Button

    'HINWEIS: Die folgende Platzhalterdeklaration ist für den Web Form-Designer erforderlich.
    'Nicht löschen oder verschieben.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: Dieser Methodenaufruf ist für den Web Form-Designer erforderlich
        'Verwenden Sie nicht den Code-Editor zur Bearbeitung.
        InitializeComponent()
    End Sub

#End Region

    Const FIRST_Question = 460

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Not Me.IsPostBack Then 'FirstLoad 
            Call loadQuestion(FIRST_Question)
        End If
        Me.txtOther.Text = "" 'clean 
    End Sub

    Dim current_question_id As Integer

    Function loadQuestion(ByVal questionId As Integer)
        ' Hier Benutzercode zur Seiteninitialisierung einfügen

        Me.OleDbDataAdapter_Questions.SelectCommand.Parameters(0).Value = questionId
        Me.OleDbDataAdapter_Answers.SelectCommand.Parameters(0).Value = questionId

        Me.OleDbConnection.Open()
        Me.OleDbDataAdapter_Test.Fill(Me.Dataset_tests)
        Me.OleDbDataAdapter_Questions.Fill(Me.Dataset_tests)
        Me.OleDbDataAdapter_Answers.Fill(Me.Dataset_tests)
        Me.OleDbConnection.Close()


        'Me.DataGrid.DataBind()
        Me.Label_Question.DataBind()
        Me.LABEL_Question_id.DataBind()
        Me.RadioButtonList_answer.DataBind()
    End Function

    'Private Sub DataGrid_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DataGrid.SelectedIndexChanged
    '    'save selection 
    '    Call saveAnswerAndShowNext()

    '    'select next question 
    '    Me.OleDbConnection.Open()
    '    Me.OleDbCommand.CommandText = "select question_id from test_questions where question_id>" & LABEL_Question_id.Text & " order by  question_id"
    '    Dim res = Me.OleDbCommand.ExecuteScalar()
    '    Me.OleDbConnection.Close()

    '    If res Is Nothing Then 'keine mehr 
    '        Me.showEnd()
    '    Else
    '        'show next if any 
    '        Call loadQuestion(res)
    '    End If

    'End Sub

    Function saveAnswerAndShowNext()
        'Me.Label_Answer_Id.DataBind()
        Dim answer_id As String
        answer_id = Me.RadioButtonList_answer.SelectedValue
        Me.OleDbConnection.Open()

        If LCase(Me.RadioButtonList_answer.SelectedItem.Text) = "other" Then
            Me.OleDbCommand.CommandText = "Insert Into test_TestRuns (fk_person_id, fk_answer_id, OtherAnswer) " & _
            " Values (1," & answer_id & ",'" & Me.txtOther.Text & "')"
        Else
            Me.OleDbCommand.CommandText = "Insert Into test_TestRuns (fk_person_id, fk_answer_id) Values (1," & answer_id & ")"
        End If


        Dim res = Me.OleDbCommand.ExecuteScalar()
        Me.OleDbConnection.Close()

    End Function

    Private Sub RadioButtonList_answer_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButtonList_answer.SelectedIndexChanged

        If LCase(Me.RadioButtonList_answer.SelectedItem.Text) = "other" Then 'enable answer 
            Me.txtOther.Visible = True
            Me.Button_Other_Enter.Visible = True
            Exit Sub
        End If

        Call saveAnswerAndShowNext()
        Call gotoNextQuestion()

    End Sub
    Sub gotoNextQuestion()
        'select next question 
        Me.OleDbConnection.Open()
        Me.OleDbCommand.CommandText = "select question_id from test_questions where question_id>" & LABEL_Question_id.Text & " order by  question_id"
        Dim res = Me.OleDbCommand.ExecuteScalar()
        Me.OleDbConnection.Close()

        If res Is Nothing Then 'keine mehr 
            Me.showEnd()
        Else
            'show next if any 
            Call loadQuestion(res)
        End If
    End Sub
    Sub showEnd()
        Me.Panel_END.Visible = True
        Me.RadioButtonList_answer.Visible = False
        Me.Label_Question.Visible = False
        Response.Redirect("Servey.aspx?")
    End Sub

    Private Sub Button_Other_Enter_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button_Other_Enter.Click
        Me.txtOther.Visible = False
        Me.Button_Other_Enter.Visible = False
        Call saveAnswerAndShowNext()
        Call gotoNextQuestion()
    End Sub
End Class

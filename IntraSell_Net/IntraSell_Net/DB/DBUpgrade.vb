Option Explicit On
Imports IntraSell_DLL
Imports MySql.Data.MySqlClient

Module DBUpgrade

    Private Sub test()

        Dim result As String = ""
        Call processSQLFile("test.sql", result)

    End Sub

    '====================================================
    ' ProcessAllSQLFiles
    ' REads all SQL Files and runs the statements against the database 
    '====================================================
    Public Function ProcessAllSQLFiles() As Boolean 'True if no errors 
        ProcessAllSQLFiles = False
        writeLog("SQL PROCESSING START")

        Dim sqlMakeTable As String
        sqlMakeTable = "CREATE TABLE `UpgradeLog` (" & _
                         "`ID` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT," & _
                         "`EventName` VARCHAR(255) NOT NULL," & _
                         "`Result` VARCHAR(2000)," & _
                         "`Timestamp` TIMESTAMP NOT NULL," & _
                         "PRIMARY KEY (`ID`)" & _
                         " ) ENGINE = InnoDB;"


        Dim errors As String = ""
        Call AddIn_dbupgrade_doupgrade(sqlMakeTable, errors) 'add the upgrade table

        Dim list = Split(ListFilesInFolder(AddIn_dbupgrade_dbFolder, True), ";")
        Dim filename As String
        Dim rs As MySqlDataReader

        Dim result As String = ""
        Dim i
        For i = 0 To UBound(list) - 1
            filename = list(i)

            'check if already processed
            rs = openRecordset("select * from UpgradeLog where EventName =  '" & filename & "';")
            If Not rs.Read Then
                rs.Close()
                Call processSQLFile(filename, result)

                result = Replace(result, "'", "")
                result = Replace(result, """", "")
                result = Left(result, 2000)
                RunSQL("insert into UpgradeLog (EventName, Result) values ( '" & filename & "', '" & result & "');")
            Else
                rs.Close()
            End If
        Next
        ProcessAllSQLFiles = True
        writeLog("SQL PROCESSING END")
    End Function

    '====================================================
    ' processSQLFile - process the sql commands in the file
    '====================================================
    Public Sub processSQLFile(ByVal filename As String, ByRef result As String)

        'sqlFile = AddIn_dbupgrade_readFile2("dbpatch_20091005_CalcSheet_Positions.sql")
        'sqlFile = AddIn_dbupgrade_readFile2("dbpatch_20090824_AddIn_DokSys.sql")

        Dim sqlFile, sql
        Dim i As Integer
        Dim arrSQL
        Dim errText As String = ""
        Dim sqlsExecuted As Integer = 0
        Dim sqlsWithError As Integer = 0


        sqlFile = AddIn_dbupgrade_readFile2(filename)
        arrSQL = Split(sqlFile, ";")

        For i = 0 To UBound(arrSQL) - 1
            sql = Trim(arrSQL(i))
            sql = Replace(sql, "ï»¿", "")
            If AddIn_dbupgrade_doupgrade(sql, errText) Then
                'mark as done
                result = result & errText & vbCrLf
                sqlsExecuted = sqlsExecuted + 1
            Else
                result = result & errText & vbCrLf
                sqlsWithError = sqlsWithError + 1
                'mark as undone ' write error protokoll
                writeLog("Error: " + errText)
            End If

        Next i

        result = result & "Statements Executed:" & sqlsExecuted
        result = result & "Statements Errors:" & sqlsWithError


    End Sub


    '====================================================
    ' executes the file content defined in the text file
    '====================================================
    Function AddIn_dbupgrade_doupgrade(ByVal sqlDML As String, ByRef outErrorText As String) As Boolean

        Try
            writeLog("Run SQL: " + sqlDML)

            'create NEW DB connection
            'Dim connString As String = VarValue_Default("DB_CONN_STRING_NET", Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)
            Dim connString As String = Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString
            Dim cConn As MySqlConnection = New MySqlConnection(connString)
            cConn.Open()

            Dim cmd As MySqlCommand = cConn.CreateCommand()
            cmd.CommandText = sqlDML
            cmd.ExecuteNonQuery()
            cConn.Close()
            AddIn_dbupgrade_doupgrade = True

            Exit Function
        Catch ex As Exception
            AddIn_dbupgrade_doupgrade = False
            outErrorText = Err.Description
        End Try
    End Function


    '====================================================
    '
    '====================================================
    Private Function AddIn_dbupgrade_readFile2(ByVal filename As String)

        Dim fs, exportFile
        fs = CreateObject("Scripting.FileSystemObject")
        exportFile = fs.OpenTextFile(AddIn_dbupgrade_dbFolder() & filename)
        Dim line As String = exportFile.ReadAll
        exportFile.Close()
        Return line

    End Function



    '====================================================
    ' delivers the current db folder
    '====================================================
    Private Function AddIn_dbupgrade_dbFolder()
        Return GetAppPath()
    End Function


   
End Module

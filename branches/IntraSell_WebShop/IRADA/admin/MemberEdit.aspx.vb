Public Class MemberEdit
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.objDataSet_Members = New IRADA.DataSet_Members
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.OleDbDataAdapter_MemberEdit = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbDeleteCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        Me.insertPayment = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDeleteCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter_InsertPayment = New System.Data.OleDb.OleDbDataAdapter
        CType(Me.objDataSet_Members, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'objDataSet_Members
        '
        Me.objDataSet_Members.DataSetName = "DataSet_Members"
        Me.objDataSet_Members.Locale = New System.Globalization.CultureInfo("de-AT")
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'OleDbDataAdapter_MemberEdit
        '
        Me.OleDbDataAdapter_MemberEdit.DeleteCommand = Me.OleDbDeleteCommand1
        Me.OleDbDataAdapter_MemberEdit.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter_MemberEdit.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter_MemberEdit.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Members", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Address", "Address"), New System.Data.Common.DataColumnMapping("April02event", "April02event"), New System.Data.Common.DataColumnMapping("Board Member", "Board Member"), New System.Data.Common.DataColumnMapping("Category_5", "Category_5"), New System.Data.Common.DataColumnMapping("Category_6", "Category_6"), New System.Data.Common.DataColumnMapping("ChangeTime", "ChangeTime"), New System.Data.Common.DataColumnMapping("City", "City"), New System.Data.Common.DataColumnMapping("Contact", "Contact"), New System.Data.Common.DataColumnMapping("CreationTime", "CreationTime"), New System.Data.Common.DataColumnMapping("date paid 2004", "date paid 2004"), New System.Data.Common.DataColumnMapping("Date paid 2005", "Date paid 2005"), New System.Data.Common.DataColumnMapping("DatePaid", "DatePaid"), New System.Data.Common.DataColumnMapping("Delivery Point", "Delivery Point"), New System.Data.Common.DataColumnMapping("Edu_First_Degree", "Edu_First_Degree"), New System.Data.Common.DataColumnMapping("Edu_First_School", "Edu_First_School"), New System.Data.Common.DataColumnMapping("Edu_First_Year", "Edu_First_Year"), New System.Data.Common.DataColumnMapping("Edu_Second_Degree", "Edu_Second_Degree"), New System.Data.Common.DataColumnMapping("Edu_Second_School", "Edu_Second_School"), New System.Data.Common.DataColumnMapping("Edu_Second_Year", "Edu_Second_Year"), New System.Data.Common.DataColumnMapping("Edu_Spec_Degree", "Edu_Spec_Degree"), New System.Data.Common.DataColumnMapping("Edu_Spec_School", "Edu_Spec_School"), New System.Data.Common.DataColumnMapping("Edu_Spec_Year", "Edu_Spec_Year"), New System.Data.Common.DataColumnMapping("E-mail Address", "E-mail Address"), New System.Data.Common.DataColumnMapping("Fax_Phone", "Fax_Phone"), New System.Data.Common.DataColumnMapping("First_name", "First_name"), New System.Data.Common.DataColumnMapping("ID", "ID"), New System.Data.Common.DataColumnMapping("ID1", "ID1"), New System.Data.Common.DataColumnMapping("Jan292003Payment", "Jan292003Payment"), New System.Data.Common.DataColumnMapping("Last_Name", "Last_Name"), New System.Data.Common.DataColumnMapping("LicenseNumber", "LicenseNumber"), New System.Data.Common.DataColumnMapping("Middle_Name", "Middle_Name"), New System.Data.Common.DataColumnMapping("Notes", "Notes"), New System.Data.Common.DataColumnMapping("Notes_1", "Notes_1"), New System.Data.Common.DataColumnMapping("OfficeAddress", "OfficeAddress"), New System.Data.Common.DataColumnMapping("Other_Phone", "Other_Phone"), New System.Data.Common.DataColumnMapping("Paid 2004", "Paid 2004"), New System.Data.Common.DataColumnMapping("paid 2005", "paid 2005"), New System.Data.Common.DataColumnMapping("Paid Member 2001", "Paid Member 2001"), New System.Data.Common.DataColumnMapping("Paid Member 2002", "Paid Member 2002"), New System.Data.Common.DataColumnMapping("paid Member 2003", "paid Member 2003"), New System.Data.Common.DataColumnMapping("Password", "Password"), New System.Data.Common.DataColumnMapping("PasswordConfirmation", "PasswordConfirmation"), New System.Data.Common.DataColumnMapping("Payment", "Payment"), New System.Data.Common.DataColumnMapping("Payment 2004", "Payment 2004"), New System.Data.Common.DataColumnMapping("payment 2005", "payment 2005"), New System.Data.Common.DataColumnMapping("Payment2003", "Payment2003"), New System.Data.Common.DataColumnMapping("PaymentMethod", "PaymentMethod"), New System.Data.Common.DataColumnMapping("Privacy Option", "Privacy Option"), New System.Data.Common.DataColumnMapping("State", "State"), New System.Data.Common.DataColumnMapping("Student", "Student"), New System.Data.Common.DataColumnMapping("Title", "Title"), New System.Data.Common.DataColumnMapping("TypeOfAccount", "TypeOfAccount"), New System.Data.Common.DataColumnMapping("TypeOfPraxis", "TypeOfPraxis"), New System.Data.Common.DataColumnMapping("Website", "Website"), New System.Data.Common.DataColumnMapping("Work_Phone", "Work_Phone"), New System.Data.Common.DataColumnMapping("ZipCode", "ZipCode")})})
        Me.OleDbDataAdapter_MemberEdit.UpdateCommand = Me.OleDbUpdateCommand1
        '
        'OleDbDeleteCommand1
        '
        Me.OleDbDeleteCommand1.CommandText = "DELETE FROM Members WHERE (ID1 = ?) AND (Address = ? OR ? IS NULL AND Address IS " & _
        "NULL) AND (April02event = ?) AND ([Board Member] = ? OR ? IS NULL AND [Board Mem" & _
        "ber] IS NULL) AND (Category_5 = ? OR ? IS NULL AND Category_5 IS NULL) AND (Cate" & _
        "gory_6 = ? OR ? IS NULL AND Category_6 IS NULL) AND (ChangeTime = ? OR ? IS NULL" & _
        " AND ChangeTime IS NULL) AND (City = ? OR ? IS NULL AND City IS NULL) AND (Conta" & _
        "ct = ? OR ? IS NULL AND Contact IS NULL) AND (CreationTime = ? OR ? IS NULL AND " & _
        "CreationTime IS NULL) AND ([Date paid 2005] = ? OR ? IS NULL AND [Date paid 2005" & _
        "] IS NULL) AND (DatePaid = ? OR ? IS NULL AND DatePaid IS NULL) AND ([Delivery P" & _
        "oint] = ? OR ? IS NULL AND [Delivery Point] IS NULL) AND ([E-mail Address] = ? O" & _
        "R ? IS NULL AND [E-mail Address] IS NULL) AND (Edu_First_Degree = ? OR ? IS NULL" & _
        " AND Edu_First_Degree IS NULL) AND (Edu_First_School = ? OR ? IS NULL AND Edu_Fi" & _
        "rst_School IS NULL) AND (Edu_First_Year = ? OR ? IS NULL AND Edu_First_Year IS N" & _
        "ULL) AND (Edu_Second_Degree = ? OR ? IS NULL AND Edu_Second_Degree IS NULL) AND " & _
        "(Edu_Second_School = ? OR ? IS NULL AND Edu_Second_School IS NULL) AND (Edu_Seco" & _
        "nd_Year = ? OR ? IS NULL AND Edu_Second_Year IS NULL) AND (Edu_Spec_Degree = ? O" & _
        "R ? IS NULL AND Edu_Spec_Degree IS NULL) AND (Edu_Spec_School = ? OR ? IS NULL A" & _
        "ND Edu_Spec_School IS NULL) AND (Edu_Spec_Year = ? OR ? IS NULL AND Edu_Spec_Yea" & _
        "r IS NULL) AND (Fax_Phone = ? OR ? IS NULL AND Fax_Phone IS NULL) AND (First_nam" & _
        "e = ? OR ? IS NULL AND First_name IS NULL) AND (ID = ? OR ? IS NULL AND ID IS NU" & _
        "LL) AND (Jan292003Payment = ? OR ? IS NULL AND Jan292003Payment IS NULL) AND (La" & _
        "st_Name = ? OR ? IS NULL AND Last_Name IS NULL) AND (LicenseNumber = ? OR ? IS N" & _
        "ULL AND LicenseNumber IS NULL) AND (Middle_Name = ? OR ? IS NULL AND Middle_Name" & _
        " IS NULL) AND (Notes = ? OR ? IS NULL AND Notes IS NULL) AND (Notes_1 = ? OR ? I" & _
        "S NULL AND Notes_1 IS NULL) AND (OfficeAddress = ? OR ? IS NULL AND OfficeAddres" & _
        "s IS NULL) AND (Other_Phone = ? OR ? IS NULL AND Other_Phone IS NULL) AND ([Paid" & _
        " 2004] = ?) AND ([Paid Member 2001] = ? OR ? IS NULL AND [Paid Member 2001] IS N" & _
        "ULL) AND ([Paid Member 2002] = ?) AND ([Password] = ? OR ? IS NULL AND [Password" & _
        "] IS NULL) AND (PasswordConfirmation = ? OR ? IS NULL AND PasswordConfirmation I" & _
        "S NULL) AND (Payment = ? OR ? IS NULL AND Payment IS NULL) AND ([Payment 2004] =" & _
        " ? OR ? IS NULL AND [Payment 2004] IS NULL) AND (Payment2003 = ? OR ? IS NULL AN" & _
        "D Payment2003 IS NULL) AND (PaymentMethod = ? OR ? IS NULL AND PaymentMethod IS " & _
        "NULL) AND ([Privacy Option] = ?) AND (State = ? OR ? IS NULL AND State IS NULL) " & _
        "AND (Student = ?) AND (Title = ? OR ? IS NULL AND Title IS NULL) AND (TypeOfAcco" & _
        "unt = ? OR ? IS NULL AND TypeOfAccount IS NULL) AND (TypeOfPraxis = ? OR ? IS NU" & _
        "LL AND TypeOfPraxis IS NULL) AND (Website = ? OR ? IS NULL AND Website IS NULL) " & _
        "AND (Work_Phone = ? OR ? IS NULL AND Work_Phone IS NULL) AND (ZipCode = ? OR ? I" & _
        "S NULL AND ZipCode IS NULL) AND ([date paid 2004] = ? OR ? IS NULL AND [date pai" & _
        "d 2004] IS NULL) AND ([paid 2005] = ?) AND ([paid Member 2003] = ?) AND ([paymen" & _
        "t 2005] = ? OR ? IS NULL AND [payment 2005] IS NULL)"
        Me.OleDbDeleteCommand1.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID1", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Address", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Address", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Address1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Address", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_April02event", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "April02event", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Board_Member", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Board Member", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Board_Member1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Board Member", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Category_5", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Category_5", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Category_51", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Category_5", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Category_6", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Category_6", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Category_61", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Category_6", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ChangeTime", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ChangeTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ChangeTime1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ChangeTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_City", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "City", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_City1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "City", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Contact", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Contact", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Contact1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Contact", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_CreationTime", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CreationTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_CreationTime1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CreationTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Date_paid_2005", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Date paid 2005", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Date_paid_20051", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Date paid 2005", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "DatePaid", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_DatePaid1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "DatePaid", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Delivery_Point", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Delivery Point", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Delivery_Point1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Delivery Point", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_E_mail_Address", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "E-mail Address", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_E_mail_Address1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "E-mail Address", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_First_Degree", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_First_Degree", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_First_Degree1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_First_Degree", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_First_School", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_First_School", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_First_School1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_First_School", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_First_Year", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_First_Year", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_First_Year1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_First_Year", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Second_Degree", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Second_Degree", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Second_Degree1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Second_Degree", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Second_School", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Second_School", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Second_School1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Second_School", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Second_Year", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Second_Year", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Second_Year1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Second_Year", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Spec_Degree", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Spec_Degree", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Spec_Degree1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Spec_Degree", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Spec_School", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Spec_School", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Spec_School1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Spec_School", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Spec_Year", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Spec_Year", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Edu_Spec_Year1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Edu_Spec_Year", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Fax_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Fax_Phone", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Fax_Phone1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Fax_Phone", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_First_name", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "First_name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_First_name1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "First_name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID2", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Jan292003Payment", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Jan292003Payment", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Jan292003Payment1", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Jan292003Payment", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Last_Name", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Last_Name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Last_Name1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Last_Name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_LicenseNumber", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LicenseNumber", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_LicenseNumber1", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LicenseNumber", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Middle_Name", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Middle_Name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Middle_Name1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Middle_Name", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Notes", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Notes1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Notes_1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Notes_1", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Notes_11", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Notes_1", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_OfficeAddress", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "OfficeAddress", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_OfficeAddress1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "OfficeAddress", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Other_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Other_Phone", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Other_Phone1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Other_Phone", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Paid_2004", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Paid 2004", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Paid_Member_2001", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Paid Member 2001", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Paid_Member_20011", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Paid Member 2001", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Paid_Member_2002", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Paid Member 2002", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Password", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Password", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Password1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Password", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PasswordConfirmation", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PasswordConfirmation", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PasswordConfirmation1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PasswordConfirmation", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Payment", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Payment", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Payment1", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Payment", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Payment_2004", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Payment 2004", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Payment_20041", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Payment 2004", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Payment2003", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Payment2003", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Payment20031", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Payment2003", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentMethod", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentMethod1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentMethod", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Privacy_Option", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Privacy Option", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_State", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "State", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_State1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "State", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Student", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Student", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Title", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Title", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Title1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Title", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TypeOfAccount", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TypeOfAccount1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TypeOfAccount", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TypeOfPraxis", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TypeOfPraxis", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TypeOfPraxis1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TypeOfPraxis", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Website", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Website", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Website1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Website", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Work_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Work_Phone", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Work_Phone1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Work_Phone", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ZipCode", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ZipCode", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ZipCode1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ZipCode", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_date_paid_2004", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "date paid 2004", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_date_paid_20041", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "date paid 2004", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_paid_2005", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "paid 2005", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_paid_Member_2003", System.Data.OleDb.OleDbType.Boolean, 2, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "paid Member 2003", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_payment_2005", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "payment 2005", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_payment_20051", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "payment 2005", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbInsertCommand1
        '
        Me.OleDbInsertCommand1.CommandText = "INSERT INTO Members(Address, April02event, [Board Member], Category_5, Category_6" & _
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
        Me.OleDbInsertCommand1.Connection = Me.OleDbConnection
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Address", System.Data.OleDb.OleDbType.VarWChar, 255, "Address"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("April02event", System.Data.OleDb.OleDbType.Boolean, 2, "April02event"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Board_Member", System.Data.OleDb.OleDbType.VarWChar, 255, "Board Member"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Category_5", System.Data.OleDb.OleDbType.VarWChar, 255, "Category_5"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Category_6", System.Data.OleDb.OleDbType.VarWChar, 255, "Category_6"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ChangeTime", System.Data.OleDb.OleDbType.DBDate, 0, "ChangeTime"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("City", System.Data.OleDb.OleDbType.VarWChar, 255, "City"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Contact", System.Data.OleDb.OleDbType.VarWChar, 255, "Contact"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("CreationTime", System.Data.OleDb.OleDbType.DBDate, 0, "CreationTime"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("date_paid_2004", System.Data.OleDb.OleDbType.DBDate, 0, "date paid 2004"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Date_paid_2005", System.Data.OleDb.OleDbType.DBDate, 0, "Date paid 2005"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, "DatePaid"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Delivery_Point", System.Data.OleDb.OleDbType.VarWChar, 255, "Delivery Point"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_Degree", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_First_Degree"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_School", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_First_School"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_Year", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_First_Year"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_Degree", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_Second_Degree"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_School", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_Second_School"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_Year", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_Second_Year"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_Degree", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_Spec_Degree"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_School", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_Spec_School"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_Year", System.Data.OleDb.OleDbType.VarWChar, 50, "Edu_Spec_Year"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("E_mail_Address", System.Data.OleDb.OleDbType.VarWChar, 255, "E-mail Address"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Fax_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Fax_Phone"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("First_name", System.Data.OleDb.OleDbType.VarWChar, 255, "First_name"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ID", System.Data.OleDb.OleDbType.Double, 0, "ID"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Jan292003Payment", System.Data.OleDb.OleDbType.Currency, 0, "Jan292003Payment"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Last_Name", System.Data.OleDb.OleDbType.VarWChar, 255, "Last_Name"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("LicenseNumber", System.Data.OleDb.OleDbType.Double, 0, "LicenseNumber"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Middle_Name", System.Data.OleDb.OleDbType.VarWChar, 50, "Middle_Name"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Notes", System.Data.OleDb.OleDbType.VarWChar, 255, "Notes"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Notes_1", System.Data.OleDb.OleDbType.VarWChar, 255, "Notes_1"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("OfficeAddress", System.Data.OleDb.OleDbType.VarWChar, 50, "OfficeAddress"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Other_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Other_Phone"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_2004", System.Data.OleDb.OleDbType.Boolean, 2, "Paid 2004"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("paid_2005", System.Data.OleDb.OleDbType.Boolean, 2, "paid 2005"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_Member_2001", System.Data.OleDb.OleDbType.VarWChar, 255, "Paid Member 2001"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_Member_2002", System.Data.OleDb.OleDbType.Boolean, 2, "Paid Member 2002"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("paid_Member_2003", System.Data.OleDb.OleDbType.Boolean, 2, "paid Member 2003"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Password", System.Data.OleDb.OleDbType.VarWChar, 50, "Password"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("PasswordConfirmation", System.Data.OleDb.OleDbType.VarWChar, 50, "PasswordConfirmation"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment", System.Data.OleDb.OleDbType.Currency, 0, "Payment"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment_2004", System.Data.OleDb.OleDbType.Currency, 0, "Payment 2004"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("payment_2005", System.Data.OleDb.OleDbType.Currency, 0, "payment 2005"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment2003", System.Data.OleDb.OleDbType.Currency, 0, "Payment2003"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, "PaymentMethod"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Privacy_Option", System.Data.OleDb.OleDbType.Boolean, 2, "Privacy Option"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("State", System.Data.OleDb.OleDbType.VarWChar, 255, "State"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Student", System.Data.OleDb.OleDbType.Boolean, 2, "Student"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Title", System.Data.OleDb.OleDbType.VarWChar, 255, "Title"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, "TypeOfAccount"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfPraxis", System.Data.OleDb.OleDbType.VarWChar, 50, "TypeOfPraxis"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Website", System.Data.OleDb.OleDbType.VarWChar, 50, "Website"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Work_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Work_Phone"))
        Me.OleDbInsertCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ZipCode", System.Data.OleDb.OleDbType.VarWChar, 255, "ZipCode"))
        '
        'OleDbSelectCommand1
        '
        Me.OleDbSelectCommand1.CommandText = "SELECT Address, April02event, [Board Member], Category_5, Category_6, ChangeTime," & _
        " City, Contact, CreationTime, [date paid 2004], [Date paid 2005], DatePaid, [Del" & _
        "ivery Point], Edu_First_Degree, Edu_First_School, Edu_First_Year, Edu_Second_Deg" & _
        "ree, Edu_Second_School, Edu_Second_Year, Edu_Spec_Degree, Edu_Spec_School, Edu_S" & _
        "pec_Year, [E-mail Address], Fax_Phone, First_name, ID, ID1, Jan292003Payment, La" & _
        "st_Name, LicenseNumber, Middle_Name, Notes, Notes_1, OfficeAddress, Other_Phone," & _
        " [Paid 2004], [paid 2005], [Paid Member 2001], [Paid Member 2002], [paid Member " & _
        "2003], [Password], PasswordConfirmation, Payment, [Payment 2004], [payment 2005]" & _
        ", Payment2003, PaymentMethod, [Privacy Option], State, Student, Title, TypeOfAcc" & _
        "ount, TypeOfPraxis, Website, Work_Phone, ZipCode FROM Members WHERE (ID1 = ?)"
        Me.OleDbSelectCommand1.Connection = Me.OleDbConnection
        Me.OleDbSelectCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ID1", System.Data.OleDb.OleDbType.Integer, 0, "ID1"))
        '
        'OleDbUpdateCommand1
        '
        Me.OleDbUpdateCommand1.CommandText = "UPDATE Members SET DatePaid = ?, First_name = ?, Last_Name = ?, TypeOfAccount = ?" & _
        " WHERE (ID1 = ?)"
        Me.OleDbUpdateCommand1.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, "DatePaid"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("First_name", System.Data.OleDb.OleDbType.VarWChar, 255, "First_name"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Last_Name", System.Data.OleDb.OleDbType.VarWChar, 255, "Last_Name"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, "TypeOfAccount"))
        Me.OleDbUpdateCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID1", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT ChangeTime, CreationTime, DatePaid, [Delivery Point], ID1, LicenseNumber, " & _
        "Notes, PaymentAmount, PaymentMethod, PID, TypeOfAccount FROM Member_Payment WHER" & _
        "E (ID1 = ?)"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection
        Me.OleDbSelectCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ID1", System.Data.OleDb.OleDbType.Integer, 0, "ID1"))
        '
        'insertPayment
        '
        Me.insertPayment.CommandText = "INSERT INTO Member_Payment (DatePaid, ID1, PaymentAmount, PaymentMethod, TypeOfAc" & _
        "count) VALUES (?, ?, ?, ?, ?)"
        Me.insertPayment.Connection = Me.OleDbConnection
        Me.insertPayment.Parameters.Add(New System.Data.OleDb.OleDbParameter("DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, "DatePaid"))
        Me.insertPayment.Parameters.Add(New System.Data.OleDb.OleDbParameter("ID1", System.Data.OleDb.OleDbType.Integer, 0, "ID1"))
        Me.insertPayment.Parameters.Add(New System.Data.OleDb.OleDbParameter("PaymentAmount", System.Data.OleDb.OleDbType.Currency, 0, "PaymentAmount"))
        Me.insertPayment.Parameters.Add(New System.Data.OleDb.OleDbParameter("PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, "PaymentMethod"))
        Me.insertPayment.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, "TypeOfAccount"))
        '
        'OleDbUpdateCommand2
        '
        Me.OleDbUpdateCommand2.CommandText = "UPDATE Member_Payment SET ChangeTime = ?, CreationTime = ?, DatePaid = ?, [Delive" & _
        "ry Point] = ?, ID1 = ?, LicenseNumber = ?, Notes = ?, PaymentAmount = ?, Payment" & _
        "Method = ?, TypeOfAccount = ? WHERE (PID = ?) AND (ChangeTime = ? OR ? IS NULL A" & _
        "ND ChangeTime IS NULL) AND (CreationTime = ? OR ? IS NULL AND CreationTime IS NU" & _
        "LL) AND (DatePaid = ? OR ? IS NULL AND DatePaid IS NULL) AND ([Delivery Point] =" & _
        " ? OR ? IS NULL AND [Delivery Point] IS NULL) AND (ID1 = ? OR ? IS NULL AND ID1 " & _
        "IS NULL) AND (LicenseNumber = ? OR ? IS NULL AND LicenseNumber IS NULL) AND (Not" & _
        "es = ? OR ? IS NULL AND Notes IS NULL) AND (PaymentAmount = ? OR ? IS NULL AND P" & _
        "aymentAmount IS NULL) AND (PaymentMethod = ? OR ? IS NULL AND PaymentMethod IS N" & _
        "ULL) AND (TypeOfAccount = ? OR ? IS NULL AND TypeOfAccount IS NULL)"
        Me.OleDbUpdateCommand2.Connection = Me.OleDbConnection
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ChangeTime", System.Data.OleDb.OleDbType.DBDate, 0, "ChangeTime"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("CreationTime", System.Data.OleDb.OleDbType.DBDate, 0, "CreationTime"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, "DatePaid"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Delivery_Point", System.Data.OleDb.OleDbType.VarWChar, 255, "Delivery Point"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ID1", System.Data.OleDb.OleDbType.Integer, 0, "ID1"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("LicenseNumber", System.Data.OleDb.OleDbType.Double, 0, "LicenseNumber"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Notes", System.Data.OleDb.OleDbType.VarWChar, 255, "Notes"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("PaymentAmount", System.Data.OleDb.OleDbType.Currency, 0, "PaymentAmount"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, "PaymentMethod"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, "TypeOfAccount"))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PID", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PID", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ChangeTime", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ChangeTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ChangeTime1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ChangeTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_CreationTime", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CreationTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_CreationTime1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CreationTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "DatePaid", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_DatePaid1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "DatePaid", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Delivery_Point", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Delivery Point", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Delivery_Point1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Delivery Point", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID1", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID11", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID1", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_LicenseNumber", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LicenseNumber", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_LicenseNumber1", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LicenseNumber", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Notes", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Notes1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentAmount", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentAmount", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentAmount1", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentAmount", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentMethod", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentMethod1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentMethod", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TypeOfAccount", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbUpdateCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TypeOfAccount1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TypeOfAccount", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDeleteCommand2
        '
        Me.OleDbDeleteCommand2.CommandText = "DELETE FROM Member_Payment WHERE (PID = ?) AND (ChangeTime = ? OR ? IS NULL AND C" & _
        "hangeTime IS NULL) AND (CreationTime = ? OR ? IS NULL AND CreationTime IS NULL) " & _
        "AND (DatePaid = ? OR ? IS NULL AND DatePaid IS NULL) AND ([Delivery Point] = ? O" & _
        "R ? IS NULL AND [Delivery Point] IS NULL) AND (ID1 = ? OR ? IS NULL AND ID1 IS N" & _
        "ULL) AND (LicenseNumber = ? OR ? IS NULL AND LicenseNumber IS NULL) AND (Notes =" & _
        " ? OR ? IS NULL AND Notes IS NULL) AND (PaymentAmount = ? OR ? IS NULL AND Payme" & _
        "ntAmount IS NULL) AND (PaymentMethod = ? OR ? IS NULL AND PaymentMethod IS NULL)" & _
        " AND (TypeOfAccount = ? OR ? IS NULL AND TypeOfAccount IS NULL)"
        Me.OleDbDeleteCommand2.Connection = Me.OleDbConnection
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PID", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PID", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ChangeTime", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ChangeTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ChangeTime1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ChangeTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_CreationTime", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CreationTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_CreationTime1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "CreationTime", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "DatePaid", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_DatePaid1", System.Data.OleDb.OleDbType.DBDate, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "DatePaid", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Delivery_Point", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Delivery Point", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Delivery_Point1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Delivery Point", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID1", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID11", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID1", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_LicenseNumber", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LicenseNumber", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_LicenseNumber1", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LicenseNumber", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Notes", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_Notes1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "Notes", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentAmount", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentAmount", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentAmount1", System.Data.OleDb.OleDbType.Currency, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentAmount", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentMethod", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_PaymentMethod1", System.Data.OleDb.OleDbType.VarWChar, 255, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PaymentMethod", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TypeOfAccount", System.Data.DataRowVersion.Original, Nothing))
        Me.OleDbDeleteCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_TypeOfAccount1", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TypeOfAccount", System.Data.DataRowVersion.Original, Nothing))
        '
        'OleDbDataAdapter_InsertPayment
        '
        Me.OleDbDataAdapter_InsertPayment.DeleteCommand = Me.OleDbDeleteCommand2
        Me.OleDbDataAdapter_InsertPayment.InsertCommand = Me.insertPayment
        Me.OleDbDataAdapter_InsertPayment.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter_InsertPayment.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Member_Payment", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("ChangeTime", "ChangeTime"), New System.Data.Common.DataColumnMapping("CreationTime", "CreationTime"), New System.Data.Common.DataColumnMapping("DatePaid", "DatePaid"), New System.Data.Common.DataColumnMapping("Delivery Point", "Delivery Point"), New System.Data.Common.DataColumnMapping("ID1", "ID1"), New System.Data.Common.DataColumnMapping("LicenseNumber", "LicenseNumber"), New System.Data.Common.DataColumnMapping("Notes", "Notes"), New System.Data.Common.DataColumnMapping("PaymentAmount", "PaymentAmount"), New System.Data.Common.DataColumnMapping("PaymentMethod", "PaymentMethod"), New System.Data.Common.DataColumnMapping("PID", "PID"), New System.Data.Common.DataColumnMapping("TypeOfAccount", "TypeOfAccount")})})
        Me.OleDbDataAdapter_InsertPayment.UpdateCommand = Me.OleDbUpdateCommand2
        CType(Me.objDataSet_Members, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents objDataSet_Members As IRADA.DataSet_Members
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents OleDbDataAdapter_MemberEdit As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbDeleteCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents last_name As System.Web.UI.WebControls.TextBox
    Protected WithEvents first_name As System.Web.UI.WebControls.TextBox
    Protected WithEvents DatePaid As System.Web.UI.WebControls.TextBox
    Protected WithEvents AccountType As System.Web.UI.WebControls.TextBox
    Protected WithEvents Button_Save As System.Web.UI.WebControls.Button
    Protected WithEvents ID1 As System.Web.UI.WebControls.TextBox
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents AmountPaid As System.Web.UI.WebControls.TextBox
    Protected WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents insertPayment As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbUpdateCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDeleteCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter_InsertPayment As System.Data.OleDb.OleDbDataAdapter

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
            If Request("ID1") = "" Then
                Response.Write("Parameter ID1 is missing!")
                Exit Sub
            End If
            Me.ID1.Text = Request("ID1")
            Me.OleDbConnection.Open()
            Call loadData(Me.ID1.Text)
            Me.OleDbConnection.Close()
            Me.DataBind()
        End If
    End Sub

    Sub loadData(ByVal id1 As String)

        Me.OleDbDataAdapter_MemberEdit.SelectCommand.Parameters("ID1").Value = id1
        Me.OleDbDataAdapter_MemberEdit.Fill(Me.objDataSet_Members)

        Me.OleDbDataAdapter_InsertPayment.SelectCommand.Parameters("ID1").Value = id1
        Me.OleDbDataAdapter_InsertPayment.Fill(Me.objDataSet_Members)

        'Me.DataBind()
    End Sub



    Private Sub Button_Save_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button_Save.Click


        Me.OleDbConnection.Open()
        loadData(Me.ID1.Text)
        Dim memberRow As DataSet_Members.MembersRow
        memberRow = CType(Me.objDataSet_Members.Tables("Members").Rows(0), DataSet_Members.MembersRow)

        memberRow.First_name = Me.first_name.Text
        memberRow.Last_Name = Me.last_name.Text
        memberRow.DatePaid = Me.DatePaid.Text
        memberRow.TypeOfAccount = Me.AccountType.Text
        memberRow.Payment = Me.AmountPaid.Text

        Me.OleDbDataAdapter_MemberEdit.Update(Me.objDataSet_Members)

        'insert intop payment history 
        Me.insertPayment.Parameters("ID1").Value = Me.ID1.Text
        Me.insertPayment.Parameters("TypeOfAccount").Value = Me.AccountType.Text
        Me.insertPayment.Parameters("PaymentAmount").Value = Me.AmountPaid.Text
        Me.insertPayment.Parameters("PaymentMethod").Value = "online"
        Me.insertPayment.Parameters("DatePaid").Value = Me.DatePaid.Text
        Me.insertPayment.ExecuteNonQuery()


        loadData(Me.ID1.Text)
        Me.OleDbConnection.Close()

    End Sub
End Class

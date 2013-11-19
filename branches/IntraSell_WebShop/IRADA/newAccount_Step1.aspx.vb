Public Class newAccount_Step1
    Inherits System.Web.UI.Page

#Region " Vom Web Form Designer generierter Code "

    'Dieser Aufruf ist für den Web Form-Designer erforderlich.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.OleDbConnection = New System.Data.OleDb.OleDbConnection
        Me.objMembers = New IRADA.DataSet_Members
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter2 = New System.Data.OleDb.OleDbDataAdapter
        Me.objMembersAlle = New IRADA.DataSet_Members
        Me.OleDbDataAdapter_EditMembership = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbCommand3 = New System.Data.OleDb.OleDbCommand
        CType(Me.objMembers, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.objMembersAlle, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'OleDbConnection
        '
        Me.OleDbConnection.ConnectionString = CType(configurationAppSettings.GetValue("OleDbConnection.ConnectionString", GetType(System.String)), String)
        '
        'objMembers
        '
        Me.objMembers.DataSetName = "DataSet_Members"
        Me.objMembers.Locale = New System.Globalization.CultureInfo("de-AT")
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT Address, April02event, [Board Member], Category_5, Category_6, ChangeTime," & _
        " City, Contact, CreationTime, [date paid 2004], [Date paid 2005], DatePaid, [Del" & _
        "ivery Point], Edu_First_Degree, Edu_First_School, Edu_First_Year, Edu_Second_Deg" & _
        "ree, Edu_Second_School, Edu_Second_Year, Edu_Spec_Degree, Edu_Spec_School, Edu_S" & _
        "pec_Year, [E-mail Address], Fax_Phone, First_name, ID, ID1, Jan292003Payment, La" & _
        "st_Name, LicenseNumber, Middle_Name, Notes, Notes_1, OfficeAddress, Other_Phone," & _
        " [Paid 2004], [paid 2005], [Paid Member 2001], [Paid Member 2002], [paid Member " & _
        "2003], [Password], PasswordConfirmation, Payment, [Payment 2004], [payment 2005]" & _
        ", Payment2003, PaymentMethod, [Privacy Option], State, Student, Title, TypeOfAcc" & _
        "ount, TypeOfPraxis, Website, Work_Phone, ZipCode FROM Members"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection
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
        'OleDbDataAdapter2
        '
        Me.OleDbDataAdapter2.InsertCommand = Me.OleDbInsertCommand2
        Me.OleDbDataAdapter2.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter2.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Members", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Address", "Address"), New System.Data.Common.DataColumnMapping("April02event", "April02event"), New System.Data.Common.DataColumnMapping("Board Member", "Board Member"), New System.Data.Common.DataColumnMapping("Category_5", "Category_5"), New System.Data.Common.DataColumnMapping("Category_6", "Category_6"), New System.Data.Common.DataColumnMapping("ChangeTime", "ChangeTime"), New System.Data.Common.DataColumnMapping("City", "City"), New System.Data.Common.DataColumnMapping("Contact", "Contact"), New System.Data.Common.DataColumnMapping("CreationTime", "CreationTime"), New System.Data.Common.DataColumnMapping("date paid 2004", "date paid 2004"), New System.Data.Common.DataColumnMapping("Date paid 2005", "Date paid 2005"), New System.Data.Common.DataColumnMapping("DatePaid", "DatePaid"), New System.Data.Common.DataColumnMapping("Delivery Point", "Delivery Point"), New System.Data.Common.DataColumnMapping("Edu_First_Degree", "Edu_First_Degree"), New System.Data.Common.DataColumnMapping("Edu_First_School", "Edu_First_School"), New System.Data.Common.DataColumnMapping("Edu_First_Year", "Edu_First_Year"), New System.Data.Common.DataColumnMapping("Edu_Second_Degree", "Edu_Second_Degree"), New System.Data.Common.DataColumnMapping("Edu_Second_School", "Edu_Second_School"), New System.Data.Common.DataColumnMapping("Edu_Second_Year", "Edu_Second_Year"), New System.Data.Common.DataColumnMapping("Edu_Spec_Degree", "Edu_Spec_Degree"), New System.Data.Common.DataColumnMapping("Edu_Spec_School", "Edu_Spec_School"), New System.Data.Common.DataColumnMapping("Edu_Spec_Year", "Edu_Spec_Year"), New System.Data.Common.DataColumnMapping("E-mail Address", "E-mail Address"), New System.Data.Common.DataColumnMapping("Fax_Phone", "Fax_Phone"), New System.Data.Common.DataColumnMapping("First_name", "First_name"), New System.Data.Common.DataColumnMapping("ID", "ID"), New System.Data.Common.DataColumnMapping("ID1", "ID1"), New System.Data.Common.DataColumnMapping("Jan292003Payment", "Jan292003Payment"), New System.Data.Common.DataColumnMapping("Last_Name", "Last_Name"), New System.Data.Common.DataColumnMapping("LicenseNumber", "LicenseNumber"), New System.Data.Common.DataColumnMapping("Middle_Name", "Middle_Name"), New System.Data.Common.DataColumnMapping("Notes", "Notes"), New System.Data.Common.DataColumnMapping("Notes_1", "Notes_1"), New System.Data.Common.DataColumnMapping("OfficeAddress", "OfficeAddress"), New System.Data.Common.DataColumnMapping("Other_Phone", "Other_Phone"), New System.Data.Common.DataColumnMapping("Paid 2004", "Paid 2004"), New System.Data.Common.DataColumnMapping("paid 2005", "paid 2005"), New System.Data.Common.DataColumnMapping("Paid Member 2001", "Paid Member 2001"), New System.Data.Common.DataColumnMapping("Paid Member 2002", "Paid Member 2002"), New System.Data.Common.DataColumnMapping("paid Member 2003", "paid Member 2003"), New System.Data.Common.DataColumnMapping("Password", "Password"), New System.Data.Common.DataColumnMapping("PasswordConfirmation", "PasswordConfirmation"), New System.Data.Common.DataColumnMapping("Payment", "Payment"), New System.Data.Common.DataColumnMapping("Payment 2004", "Payment 2004"), New System.Data.Common.DataColumnMapping("payment 2005", "payment 2005"), New System.Data.Common.DataColumnMapping("Payment2003", "Payment2003"), New System.Data.Common.DataColumnMapping("PaymentMethod", "PaymentMethod"), New System.Data.Common.DataColumnMapping("Privacy Option", "Privacy Option"), New System.Data.Common.DataColumnMapping("State", "State"), New System.Data.Common.DataColumnMapping("Student", "Student"), New System.Data.Common.DataColumnMapping("Title", "Title"), New System.Data.Common.DataColumnMapping("TypeOfAccount", "TypeOfAccount"), New System.Data.Common.DataColumnMapping("TypeOfPraxis", "TypeOfPraxis"), New System.Data.Common.DataColumnMapping("Website", "Website"), New System.Data.Common.DataColumnMapping("Work_Phone", "Work_Phone"), New System.Data.Common.DataColumnMapping("ZipCode", "ZipCode")})})
        '
        'objMembersAlle
        '
        Me.objMembersAlle.DataSetName = "DataSet_Members"
        Me.objMembersAlle.Locale = New System.Globalization.CultureInfo("de-AT")
        '
        'OleDbDataAdapter_EditMembership
        '
        Me.OleDbDataAdapter_EditMembership.InsertCommand = Me.OleDbCommand1
        Me.OleDbDataAdapter_EditMembership.SelectCommand = Me.OleDbCommand2
        Me.OleDbDataAdapter_EditMembership.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Members", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("Address", "Address"), New System.Data.Common.DataColumnMapping("April02event", "April02event"), New System.Data.Common.DataColumnMapping("Board Member", "Board Member"), New System.Data.Common.DataColumnMapping("Category_5", "Category_5"), New System.Data.Common.DataColumnMapping("Category_6", "Category_6"), New System.Data.Common.DataColumnMapping("ChangeTime", "ChangeTime"), New System.Data.Common.DataColumnMapping("City", "City"), New System.Data.Common.DataColumnMapping("Contact", "Contact"), New System.Data.Common.DataColumnMapping("CreationTime", "CreationTime"), New System.Data.Common.DataColumnMapping("date paid 2004", "date paid 2004"), New System.Data.Common.DataColumnMapping("Date paid 2005", "Date paid 2005"), New System.Data.Common.DataColumnMapping("DatePaid", "DatePaid"), New System.Data.Common.DataColumnMapping("Delivery Point", "Delivery Point"), New System.Data.Common.DataColumnMapping("Edu_First_Degree", "Edu_First_Degree"), New System.Data.Common.DataColumnMapping("Edu_First_School", "Edu_First_School"), New System.Data.Common.DataColumnMapping("Edu_First_Year", "Edu_First_Year"), New System.Data.Common.DataColumnMapping("Edu_Second_Degree", "Edu_Second_Degree"), New System.Data.Common.DataColumnMapping("Edu_Second_School", "Edu_Second_School"), New System.Data.Common.DataColumnMapping("Edu_Second_Year", "Edu_Second_Year"), New System.Data.Common.DataColumnMapping("Edu_Spec_Degree", "Edu_Spec_Degree"), New System.Data.Common.DataColumnMapping("Edu_Spec_School", "Edu_Spec_School"), New System.Data.Common.DataColumnMapping("Edu_Spec_Year", "Edu_Spec_Year"), New System.Data.Common.DataColumnMapping("E-mail Address", "E-mail Address"), New System.Data.Common.DataColumnMapping("Fax_Phone", "Fax_Phone"), New System.Data.Common.DataColumnMapping("First_name", "First_name"), New System.Data.Common.DataColumnMapping("ID", "ID"), New System.Data.Common.DataColumnMapping("ID1", "ID1"), New System.Data.Common.DataColumnMapping("Jan292003Payment", "Jan292003Payment"), New System.Data.Common.DataColumnMapping("Last_Name", "Last_Name"), New System.Data.Common.DataColumnMapping("LicenseNumber", "LicenseNumber"), New System.Data.Common.DataColumnMapping("Middle_Name", "Middle_Name"), New System.Data.Common.DataColumnMapping("Notes", "Notes"), New System.Data.Common.DataColumnMapping("Notes_1", "Notes_1"), New System.Data.Common.DataColumnMapping("OfficeAddress", "OfficeAddress"), New System.Data.Common.DataColumnMapping("Other_Phone", "Other_Phone"), New System.Data.Common.DataColumnMapping("Paid 2004", "Paid 2004"), New System.Data.Common.DataColumnMapping("paid 2005", "paid 2005"), New System.Data.Common.DataColumnMapping("Paid Member 2001", "Paid Member 2001"), New System.Data.Common.DataColumnMapping("Paid Member 2002", "Paid Member 2002"), New System.Data.Common.DataColumnMapping("paid Member 2003", "paid Member 2003"), New System.Data.Common.DataColumnMapping("Password", "Password"), New System.Data.Common.DataColumnMapping("PasswordConfirmation", "PasswordConfirmation"), New System.Data.Common.DataColumnMapping("Payment", "Payment"), New System.Data.Common.DataColumnMapping("Payment 2004", "Payment 2004"), New System.Data.Common.DataColumnMapping("payment 2005", "payment 2005"), New System.Data.Common.DataColumnMapping("Payment2003", "Payment2003"), New System.Data.Common.DataColumnMapping("PaymentMethod", "PaymentMethod"), New System.Data.Common.DataColumnMapping("Privacy Option", "Privacy Option"), New System.Data.Common.DataColumnMapping("State", "State"), New System.Data.Common.DataColumnMapping("Student", "Student"), New System.Data.Common.DataColumnMapping("Title", "Title"), New System.Data.Common.DataColumnMapping("TypeOfAccount", "TypeOfAccount"), New System.Data.Common.DataColumnMapping("TypeOfPraxis", "TypeOfPraxis"), New System.Data.Common.DataColumnMapping("Website", "Website"), New System.Data.Common.DataColumnMapping("Work_Phone", "Work_Phone"), New System.Data.Common.DataColumnMapping("ZipCode", "ZipCode")})})
        Me.OleDbDataAdapter_EditMembership.UpdateCommand = Me.OleDbCommand3
        '
        'OleDbCommand1
        '
        Me.OleDbCommand1.CommandText = "INSERT INTO Members(Address, April02event, [Board Member], Category_5, Category_6" & _
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
        Me.OleDbCommand1.Connection = Me.OleDbConnection
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Address", System.Data.OleDb.OleDbType.VarWChar, 255, "Address"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("April02event", System.Data.OleDb.OleDbType.Boolean, 2, "April02event"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Board_Member", System.Data.OleDb.OleDbType.VarWChar, 255, "Board Member"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Category_5", System.Data.OleDb.OleDbType.VarWChar, 255, "Category_5"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Category_6", System.Data.OleDb.OleDbType.VarWChar, 255, "Category_6"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ChangeTime", System.Data.OleDb.OleDbType.DBDate, 0, "ChangeTime"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("City", System.Data.OleDb.OleDbType.VarWChar, 255, "City"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Contact", System.Data.OleDb.OleDbType.VarWChar, 255, "Contact"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("CreationTime", System.Data.OleDb.OleDbType.DBDate, 0, "CreationTime"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("date_paid_2004", System.Data.OleDb.OleDbType.DBDate, 0, "date paid 2004"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Date_paid_2005", System.Data.OleDb.OleDbType.DBDate, 0, "Date paid 2005"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("DatePaid", System.Data.OleDb.OleDbType.DBDate, 0, "DatePaid"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Delivery_Point", System.Data.OleDb.OleDbType.VarWChar, 255, "Delivery Point"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_Degree", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_First_Degree"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_School", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_First_School"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_First_Year", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_First_Year"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_Degree", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Second_Degree"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_School", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Second_School"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Second_Year", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Second_Year"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_Degree", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Spec_Degree"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_School", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Spec_School"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Edu_Spec_Year", System.Data.OleDb.OleDbType.VarChar, 50, "Edu_Spec_Year"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("E_mail_Address", System.Data.OleDb.OleDbType.VarWChar, 255, "E-mail Address"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Fax_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Fax_Phone"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("First_name", System.Data.OleDb.OleDbType.VarWChar, 255, "First_name"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ID", System.Data.OleDb.OleDbType.Double, 0, "ID"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Jan292003Payment", System.Data.OleDb.OleDbType.Currency, 0, "Jan292003Payment"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Last_Name", System.Data.OleDb.OleDbType.VarWChar, 255, "Last_Name"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("LicenseNumber", System.Data.OleDb.OleDbType.Double, 0, "LicenseNumber"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Middle_Name", System.Data.OleDb.OleDbType.VarChar, 50, "Middle_Name"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Notes", System.Data.OleDb.OleDbType.VarWChar, 255, "Notes"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Notes_1", System.Data.OleDb.OleDbType.VarWChar, 255, "Notes_1"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("OfficeAddress", System.Data.OleDb.OleDbType.VarChar, 50, "OfficeAddress"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Other_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Other_Phone"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_2004", System.Data.OleDb.OleDbType.Boolean, 2, "Paid 2004"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("paid_2005", System.Data.OleDb.OleDbType.Boolean, 2, "paid 2005"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_Member_2001", System.Data.OleDb.OleDbType.VarWChar, 255, "Paid Member 2001"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Paid_Member_2002", System.Data.OleDb.OleDbType.Boolean, 2, "Paid Member 2002"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("paid_Member_2003", System.Data.OleDb.OleDbType.Boolean, 2, "paid Member 2003"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Password", System.Data.OleDb.OleDbType.VarChar, 50, "Password"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("PasswordConfirmation", System.Data.OleDb.OleDbType.VarChar, 50, "PasswordConfirmation"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment", System.Data.OleDb.OleDbType.Currency, 0, "Payment"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment_2004", System.Data.OleDb.OleDbType.Currency, 0, "Payment 2004"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("payment_2005", System.Data.OleDb.OleDbType.Currency, 0, "payment 2005"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Payment2003", System.Data.OleDb.OleDbType.Currency, 0, "Payment2003"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("PaymentMethod", System.Data.OleDb.OleDbType.VarWChar, 255, "PaymentMethod"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Privacy_Option", System.Data.OleDb.OleDbType.Boolean, 2, "Privacy Option"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("State", System.Data.OleDb.OleDbType.VarWChar, 255, "State"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Student", System.Data.OleDb.OleDbType.Boolean, 2, "Student"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Title", System.Data.OleDb.OleDbType.VarWChar, 255, "Title"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfAccount", System.Data.OleDb.OleDbType.VarChar, 50, "TypeOfAccount"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfPraxis", System.Data.OleDb.OleDbType.VarChar, 50, "TypeOfPraxis"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Website", System.Data.OleDb.OleDbType.VarChar, 50, "Website"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("Work_Phone", System.Data.OleDb.OleDbType.VarWChar, 255, "Work_Phone"))
        Me.OleDbCommand1.Parameters.Add(New System.Data.OleDb.OleDbParameter("ZipCode", System.Data.OleDb.OleDbType.VarWChar, 255, "ZipCode"))
        '
        'OleDbCommand2
        '
        Me.OleDbCommand2.CommandText = "SELECT Address, April02event, [Board Member], Category_5, Category_6, ChangeTime," & _
        " City, Contact, CreationTime, [date paid 2004], [Date paid 2005], DatePaid, [Del" & _
        "ivery Point], Edu_First_Degree, Edu_First_School, Edu_First_Year, Edu_Second_Deg" & _
        "ree, Edu_Second_School, Edu_Second_Year, Edu_Spec_Degree, Edu_Spec_School, Edu_S" & _
        "pec_Year, [E-mail Address], Fax_Phone, First_name, ID, ID1, Jan292003Payment, La" & _
        "st_Name, LicenseNumber, Middle_Name, Notes, Notes_1, OfficeAddress, Other_Phone," & _
        " [Paid 2004], [paid 2005], [Paid Member 2001], [Paid Member 2002], [paid Member " & _
        "2003], [Password], PasswordConfirmation, Payment, [Payment 2004], [payment 2005]" & _
        ", Payment2003, PaymentMethod, [Privacy Option], State, Student, Title, TypeOfAcc" & _
        "ount, TypeOfPraxis, Website, Work_Phone, ZipCode FROM Members WHERE (ID1 = ?)"
        Me.OleDbCommand2.Connection = Me.OleDbConnection
        Me.OleDbCommand2.Parameters.Add(New System.Data.OleDb.OleDbParameter("ID1", System.Data.OleDb.OleDbType.Integer, 0, "ID1"))
        '
        'OleDbCommand3
        '
        Me.OleDbCommand3.CommandText = "UPDATE Members SET TypeOfAccount = ?, [Password] = ?, PasswordConfirmation = ?, [" & _
        "E-mail Address] = ? WHERE (ID1 = ?)"
        Me.OleDbCommand3.Connection = Me.OleDbConnection
        Me.OleDbCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("TypeOfAccount", System.Data.OleDb.OleDbType.VarWChar, 50, "TypeOfAccount"))
        Me.OleDbCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Password", System.Data.OleDb.OleDbType.VarWChar, 50, "Password"))
        Me.OleDbCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("PasswordConfirmation", System.Data.OleDb.OleDbType.VarWChar, 50, "PasswordConfirmation"))
        Me.OleDbCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("E_mail_Address", System.Data.OleDb.OleDbType.VarWChar, 255, "E-mail Address"))
        Me.OleDbCommand3.Parameters.Add(New System.Data.OleDb.OleDbParameter("Original_ID1", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "ID1", System.Data.DataRowVersion.Original, Nothing))
        CType(Me.objMembers, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.objMembersAlle, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Protected WithEvents objMembers As IRADA.DataSet_Members
    Protected WithEvents Email As System.Web.UI.WebControls.TextBox
    Protected WithEvents Password As System.Web.UI.WebControls.TextBox
    Protected WithEvents PasswordConfirmation As System.Web.UI.WebControls.TextBox
    Protected WithEvents OleDbConnection As System.Data.OleDb.OleDbConnection
    Protected WithEvents first_name As System.Web.UI.WebControls.TextBox
    Protected WithEvents initials As System.Web.UI.WebControls.TextBox
    Protected WithEvents last_name As System.Web.UI.WebControls.TextBox
    Protected WithEvents street As System.Web.UI.WebControls.TextBox
    Protected WithEvents phone As System.Web.UI.WebControls.TextBox
    Protected WithEvents website As System.Web.UI.WebControls.TextBox
    Protected WithEvents office_address As System.Web.UI.WebControls.TextBox
    Protected WithEvents office_practice As System.Web.UI.WebControls.TextBox
    Protected WithEvents btn_Next As System.Web.UI.WebControls.Button
    Protected WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbInsertCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbDataAdapter2 As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents objMembersAlle As IRADA.DataSet_Members
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents state As System.Web.UI.WebControls.TextBox
    Protected WithEvents zip As System.Web.UI.WebControls.TextBox
    Protected WithEvents first_degree As System.Web.UI.WebControls.TextBox
    Protected WithEvents first_year As System.Web.UI.WebControls.TextBox
    Protected WithEvents first_shcool As System.Web.UI.WebControls.TextBox
    Protected WithEvents second_degree As System.Web.UI.WebControls.TextBox
    Protected WithEvents special_degree As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator4 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator5 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator6 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator7 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents city As System.Web.UI.WebControls.TextBox
    Protected WithEvents Radio_register_type As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents RequiredFieldValidator10 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents second_year As System.Web.UI.WebControls.TextBox
    Protected WithEvents second_school As System.Web.UI.WebControls.TextBox
    Protected WithEvents special_year As System.Web.UI.WebControls.TextBox
    Protected WithEvents special_school As System.Web.UI.WebControls.TextBox
    Protected WithEvents OleDbDataAdapter_EditMembership As System.Data.OleDb.OleDbDataAdapter
    Protected WithEvents OleDbCommand1 As System.Data.OleDb.OleDbCommand
    Protected WithEvents OleDbCommand2 As System.Data.OleDb.OleDbCommand
    Protected WithEvents MODE As System.Web.UI.WebControls.TextBox
    Protected WithEvents ID1 As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator_Password As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator_ConfirmPassword As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents btnBack As System.Web.UI.WebControls.Button
    Protected WithEvents OleDbCommand3 As System.Data.OleDb.OleDbCommand

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
        If Not Me.IsPostBack Then
            ' Hier Benutzercode zur Seiteninitialisierung einfügen
            Me.OleDbConnection.Open()
            Try


                'if mode is Edit 
                If Request("Mode") = "EDIT" Then
                    Me.MODE.Text = Request("Mode")
                    Me.ID1.Text = Request("id1")
                    Me.OleDbDataAdapter_EditMembership.SelectCommand.Parameters("ID1").Value = Request("ID1")
                    Me.OleDbDataAdapter_EditMembership.Fill(Me.objMembers)

                    If Request("showAccountType") = "true" Then
                        Me.Radio_register_type.SelectedValue = "Membership"
                    Else
                        Me.Radio_register_type.Enabled = False
                        ' Me.Radio_register_type.Visible = False
                        Me.RequiredFieldValidator10.Enabled = False
                    End If


                Else
                    'Me.OleDbDataAdapter2.Fill(Me.objMembers)
                    Dim dr As System.Data.DataRow = Me.objMembers.Tables("Members").NewRow()
                    Me.objMembers.Tables("Members").Rows.Add(dr)
                    'BindingContext(DSProducts1, "products").AddNew()
                End If

                Me.DataBind()
            Catch
                Response.Write(Err.Description)
            End Try
            Me.OleDbConnection.Close()
        End If
    End Sub

    Private Sub btn_Next_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_Next.Click



        Try
            Dim redLink As String
            Dim dr As DataSet_Members.MembersRow

            Me.OleDbConnection.Open()

            If Me.MODE.Text = "EDIT" Then 'edit account
                Me.OleDbDataAdapter_EditMembership.SelectCommand.Parameters("ID1").Value = Request("ID1")
                Me.OleDbDataAdapter_EditMembership.Fill(Me.objMembers)
                dr = Me.objMembers.Tables("Members").Rows(0)
                Call fillFromForm(dr)
                Me.OleDbDataAdapter_EditMembership.UpdateCommand.Parameters("Original_ID1").Value = Request("ID1")
                Me.OleDbDataAdapter_EditMembership.Update(Me.objMembers)

                redLink = "myAccount.aspx?Member=" & CType(Me.ID1.Text, String)

                Response.Write("Your Data have been updated!")
                Me.btn_Next.Visible = False
                Me.btnBack.Visible = True
                Exit Sub
            Else

                Me.OleDbDataAdapter2.Fill(Me.objMembersAlle) 'alle laden 
                dr = Me.objMembers.Tables("Members").NewRow()
                Call fillFromForm(dr)

                Me.objMembers.Tables("Members").Rows.Add(dr)
                Me.objMembersAlle.Merge(Me.objMembers)
                Me.OleDbDataAdapter2.Update(Me.objMembersAlle)

                Dim regId1 As Integer = getGerId1(Email.Text, Me.OleDbConnection)

                'goto next page 
                redLink = "newAccount_step2.aspx?Member=" & CType(regId1, String)
            End If

            Response.Redirect(redLink)

        Catch ex As Exception
            Response.Write(Err.Description)
        Finally
            Me.OleDbConnection.Close()
        End Try

    End Sub
    Sub fillFromForm(ByRef dr As DataSet_Members.MembersRow)

        dr._E_mail_Address = Me.Email.Text
        dr.Password = Me.Password.Text
        dr.First_name = Me.first_name.Text
        dr.Middle_Name = Me.initials.Text
        If dr.Middle_Name = "" Then dr.Middle_Name = "_"
        dr.Last_Name = Me.last_name.Text

        dr.Address = Me.street.Text
        dr.State = Me.state.Text
        dr.ZipCode = Me.zip.Text
        dr.City = Me.city.Text

        dr.Edu_First_Degree = Me.first_degree.Text & "_"
        dr.Edu_First_School = Me.first_shcool.Text & "_"
        dr.Edu_First_Year = Me.first_year.Text & "_"

        dr.Edu_Second_Degree = Me.first_degree.Text & "_"
        dr.Edu_Second_School = Me.second_school.Text & "_"
        dr.Edu_Second_Year = Me.second_year.Text & "_"

        dr.Edu_Spec_Degree = Me.special_degree.Text & "_"
        dr.Edu_Spec_School = Me.special_school.Text & "_"
        dr.Edu_Spec_Year = Me.special_year.Text & "_"

        dr.OfficeAddress = Me.office_address.Text
        dr.TypeOfPraxis = Me.office_practice.Text

        dr.TypeOfAccount = Me.Radio_register_type.SelectedValue
        dr.CreationTime = Date.Today

    End Sub
    Function getGerId1(ByVal Email As String, ByRef conn As System.Data.OleDb.OleDbConnection) As Integer
        Dim sql = "select max(id1) as MaxId1 from Members where [E-mail address] like '" & Email & "'"
        Dim rs As System.Data.OleDb.OleDbCommand = New System.Data.OleDb.OleDbCommand(sql)
        rs.Connection = conn
        getGerId1 = rs.ExecuteScalar()
    End Function


    Private Sub OleDbDataAdapter2_RowUpdated(ByVal sender As System.Object, ByVal e As System.Data.OleDb.OleDbRowUpdatedEventArgs) Handles OleDbDataAdapter2.RowUpdated

    End Sub

    Private Sub TextBox2_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles city.TextChanged

    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("myAccount.aspx")
    End Sub
End Class

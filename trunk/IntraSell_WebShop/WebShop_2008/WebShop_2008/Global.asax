<script Language="VB" RunAt="server">
 
    Dim DATABASEPATH As String
    Dim BASEPATH As String
    Dim SMTPSERVER As String
    Dim SMTPSERVERSPAMM As String
    Dim USER As String, PASS As String, myDSN As String, BASENAME As String
    Dim objConnection As Object
    Public Language As String
    
    '==============================================================================
    ' on Applicaiton Start
    '==============================================================================
    Sub Application_OnStart()
        Application("useronline") = 0
    End Sub

    '==============================================================================      
    'Open DB Session
    '==============================================================================
    Sub Session_OnStart() ' user code here 

        'GLOBALS
        Session("DATABASEPATH") = "c:\"
        Session("SMTPSERVER") = "www.arfaian.com" ' Used for mail functionality 
        Session("SMTPSERVERSPAMM") = SMTPSERVER
        Session("BASENAME") = "http://localhost:88"
        'Session ("BASENAME")        = "http://" & Request.ServerVariables("SERVER_NAME")  '& left(Request.ServerVariables("URL"), len(Request.ServerVariables("URL")) - len("\global.asa"))
        'response.write Session ("BASENAME") 

        'read username and password from IIS login
        USER = Request.ServerVariables("REMOTE_USER")
        PASS = Request.ServerVariables("REMOTE_PASSWORD") ' Please check if the VAR name is correct
        'end read 

        'WMS FILES FOLDER 
        Session("WMSFILESFOLDER") = "c:\bene\Files" 'Server.MapPath("../../../FILES/")   
      
        'DB SETTINGS              
        Session("DB_LANGUAGE") = "DE" 'German for Dates in MSSQL Server

        'HARD CODED
        Session("dbType") = "MySQL" 'allowed: 'ACCESS 'SQL 'MySQL    
        Session("SERVER_ID") = 3 'Important, Every WMS Server has its ID / the settings are in the table Servers    
        Session("DB_SERVER_NAME") = "localhost"
        Session("DB_NAME") = "IntraSell_Daten_2"
        Session("DB_USER_ADMIN") = "webshop"
        Session("DB_PASS_ADMIN") = "efox2004"
        Session("DB_USER") = "webshop"
        Session("DB_PASS") = "efox2004"
      
        'NUR MSACCESS
        Session("DATABASEPATH") = Server.MapPath("db/IntraSell_Daten_2.07.mdb")
        Session("DATABASEPATH") = "Z:\temp\IntraSell_WebShop\db\IntraSell_Daten_2.08_xscorpion.mdb"

      
        'SQL SERVER
        'OPEN SQL SERVER CONNECTION 
        Session("MyDSN") = "driver={SQL Server};server=" & Session("DB_SERVER_NAME") & ";uid=" & Session("DB_USER") & ";pwd=" & Session("DB_PASS") & ";database=" & Session("DB_NAME")

        'MS ACCESS    
        Session("MyDSN") = "driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & Session("DATABASEPATH") & ";"

        'My SQL Connection 
        Session("MyDSN") = "driver={MySQL ODBC 5.1 Driver};PORT=3306;DATABASE=" & Session("DB_NAME") & ";SERVER=" & Session("DB_SERVER_NAME") & ";USER=" & Session("DB_USER") & ";PASSWORD=" & Session("DB_PASS") & ";PASS=" & Session("DB_PASS")
 
        'count users
        Application.Lock()
        Application("useronline") = Application("useronline") + 1
        Application.UnLock()

    End Sub

    '==============================================================================
    'Close DB Session
    '==============================================================================
    Sub Session_OnEnd()
        'not needed objConnection.Close:Set objConnection = Nothing
        'count users
        Application.Lock()
        Application("useronline") = Application("useronline") - 1
        Application.UnLock()
    End Sub
</script>


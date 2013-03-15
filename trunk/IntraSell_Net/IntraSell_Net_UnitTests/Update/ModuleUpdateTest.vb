Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net
Imports IntraSell_DLL


'''<summary>
'''This is a test class for ModuleUpdateTest and is intended
'''to contain all ModuleUpdateTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleUpdateTest


    Private testContextInstance As TestContext

    '''<summary>
    '''Gets or sets the test context which provides
    '''information about and functionality for the current test run.
    '''</summary>
    Public Property TestContext() As TestContext
        Get
            Return testContextInstance
        End Get
        Set(value As TestContext)
            testContextInstance = Value
        End Set
    End Property

#Region "Additional test attributes"
    '
    'You can use the following additional attributes as you write your tests:
    '
    'Use ClassInitialize to run code before running the first test in the class
    <ClassInitialize()> _
    Public Shared Sub MyClassInitialize(ByVal testContext As TestContext)
        DBTest.MyClassInitialize(testContext)
    End Sub
    '
    'Use ClassCleanup to run code after all tests in a class have run
    '<ClassCleanup()>  _
    'Public Shared Sub MyClassCleanup()
    'End Sub
    '
    'Use TestInitialize to run code before running each test
    '<TestInitialize()>  _
    'Public Sub MyTestInitialize()
    'End Sub
    '
    'Use TestCleanup to run code after each test has run
    '<TestCleanup()>  _
    'Public Sub MyTestCleanup()
    'End Sub
    '
#End Region


    '''<summary>
    '''A test for UpdateIntraSell
    '''</summary>
    <TestMethod()> _
    Public Sub UpdateIntraSellTest1()
        Dim silentMode As Boolean = True
        Dim actual As Boolean = ModuleUpdate.UpdateIntraSell(silentMode)
        Assert.AreEqual(True, actual)

        'Process all SQL Files 
        actual = ProcessAllSQLFiles()
        Assert.AreEqual(True, actual)
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub

    '''<summary>
    '''A test for UpdateIntraSell
    '''</summary>
    <TestMethod()> _
    Public Sub UpdateIntraSellTest2()
        'Process all SQL Files 
        Dim silentMode As Boolean = True
        Dim actual As Boolean = DBUpgrade.ProcessAllSQLFiles()
        Assert.AreEqual(True, actual)
     
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub


    '''<summary>
    '''A test for UpdateIntraSell
    '''</summary>
    <TestMethod()> _
    Public Sub UpdateIntraSellForCustomerTest()
        'Notwendige Var eintragen 
        FunctionsVars.VarValue_Default("INTRASELL_UPDATE_URL_CUSTOMER", "http://intrasell.googlecode.com/svn/trunk/Upgrade/NET/KSG/update.txt")
        Dim silentMode As Boolean = True
        Dim actual As Boolean = ModuleUpdate.UpdateIntraSellForCustomer(silentMode)
        Assert.AreEqual(True, actual)

        'Process all SQL Files 
        actual = ProcessAllSQLFiles()
        Assert.AreEqual(True, actual)
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub


    '''<summary>
    '''A test for UpdateIntraSell
    '''</summary>
    <TestMethod()> _
    Public Sub UpdateIntraSellForCustomerTestManuel()
        'Notwendige Var eintragen 
        FunctionsVars.VarValue_Default("INTRASELL_UPDATE_URL_CUSTOMER", "http://intrasell.googlecode.com/svn/trunk/Upgrade/NET/KSG/update.txt")
        Dim silentMode As Boolean = False
        Dim actual As Boolean = ModuleUpdate.UpdateIntraSellForCustomer(silentMode)
        Assert.AreEqual(True, actual)

        'Process all SQL Files 
        actual = ProcessAllSQLFiles()
        Assert.AreEqual(True, actual)
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub


End Class

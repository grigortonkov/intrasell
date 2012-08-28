Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net



'''<summary>
'''This is a test class for ModuleSetupTest and is intended
'''to contain all ModuleSetupTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleSetupTest


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
    <ClassInitialize()> _
    Public Overloads Shared Sub MyClassInitialize(ByVal testContext As TestContext)
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
    '''A test for SetUpMySqlServer
    '''</summary>
    <TestMethod()> _
    Public Sub SetUpMySqlServerTest()
        Dim actual As Boolean = ModuleSetup.SetUpMySqlServer(True)
        Assert.AreEqual(True, actual)
        'Assert.Inconclusive("A method that does not return a value cannot be verified.")
    End Sub
End Class

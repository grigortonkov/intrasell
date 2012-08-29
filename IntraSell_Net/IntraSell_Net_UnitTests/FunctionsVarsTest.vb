Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_DLL



'''<summary>
'''This is a test class for FunctionsVarsTest and is intended
'''to contain all FunctionsVarsTest Unit Tests
'''</summary>
<TestClass()> _
Public Class FunctionsVarsTest


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
    '''A test for nextId
    '''</summary>
    <TestMethod()> _
    Public Sub nextIdTest()
       
        Dim expected As Long = 1
        Dim actual As Long

        actual = FunctionsVars.nextId("ofVars", "ID", , False)
        Assert.AreEqual(CStr(455), CStr(actual))

        actual = FunctionsVars.nextId("ofVars", "ID", , True)
        Assert.AreEqual(CStr(455), CStr(actual))

        actual = FunctionsVars.nextId("ofAdressen", "IDNR", , True)
        Assert.AreEqual(CStr(3), CStr(actual))

        ' Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class

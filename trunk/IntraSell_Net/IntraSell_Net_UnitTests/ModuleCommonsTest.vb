Imports System.Data

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net



'''<summary>
'''This is a test class for ModuleCommonsTest and is intended
'''to contain all ModuleCommonsTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleCommonsTest


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
    '<ClassInitialize()>  _
    'Public Shared Sub MyClassInitialize(ByVal testContext As TestContext)
    'End Sub
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
    '''A test for openRecordset
    '''</summary>
    <TestMethod()> _
    Public Sub openRecordsetTest()
        Dim sql As String = "select * from ofVars order by Name"
        Dim expected As MySql.Data.MySqlClient.MySqlDataReader = Nothing ' TODO: Initialize to an appropriate value
        Dim actual As MySql.Data.MySqlClient.MySqlDataReader

        actual = ModuleCommons.openRecordset(sql) 
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class

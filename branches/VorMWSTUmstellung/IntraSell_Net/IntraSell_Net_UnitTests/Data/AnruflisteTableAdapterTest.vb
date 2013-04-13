Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsAnrufeTableAdapters



'''<summary>
'''This is a test class for AnruflisteTableAdapterTest and is intended
'''to contain all AnruflisteTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class AnruflisteTableAdapterTest


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
    '''A test for AnrufArchiviertQuery
    '''</summary>
    <TestMethod()> _
    Public Sub AnrufArchiviertQueryTest()
        Dim target As AnruflisteTableAdapter = New AnruflisteTableAdapter() ' TODO: Initialize to an appropriate value
        Dim archiviert As Object = True
        Dim Original_AnrufNr As Integer = 1
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.AnrufArchiviertQuery(archiviert, Original_AnrufNr)
        Assert.AreEqual(expected, actual)
    End Sub
End Class

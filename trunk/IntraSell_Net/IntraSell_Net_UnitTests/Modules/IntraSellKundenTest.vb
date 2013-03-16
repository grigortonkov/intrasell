Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_DLL



'''<summary>
'''This is a test class for IntraSellKundenTest and is intended
'''to contain all IntraSellKundenTest Unit Tests
'''</summary>
<TestClass()> _
Public Class IntraSellKundenTest


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
    '''A test for getPLZCreateIfNeeded
    '''</summary>
    <TestMethod()> _
    Public Sub Kunden_getPLZCreateIfNeededTest()

        Dim Land As String = 43
        Dim Ort As String = "Linz"
        Dim PLZ As String = "4040"
        Dim expected As String = "43_4040"
        Dim actual As String
        actual = IntraSellKunden.getPLZCreateIfNeeded(Land, Ort, PLZ)
        Assert.AreEqual(expected, actual)

    End Sub

    <TestMethod()> _
    Public Sub Kunden_getPLZCreateIfNeeded2Test()

        Dim Land As String = 49
        Dim Ort As String = "Pocking"
        Dim PLZ As String = "89000"
        Dim expected As String = "D 89000"
        Dim actual As String
        actual = IntraSellKunden.getPLZCreateIfNeeded(Land, Ort, PLZ)
        Assert.AreEqual(expected, actual)

    End Sub

End Class

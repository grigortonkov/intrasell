Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_DLL



'''<summary>
'''This is a test class for IntraSellPreiseTest and is intended
'''to contain all IntraSellPreiseTest Unit Tests
'''</summary>
<TestClass()> _
Public Class IntraSellPreiseTest


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
    '''A test for getNewVorgangNummer
    '''</summary>
    <TestMethod()> _
    Public Sub getNewVorgangNummerTest()
        Dim target As IntraSellPreise = New IntraSellPreise() ' TODO: Initialize to an appropriate value
        Dim Typ As String = "AR"
        Dim IdNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim expected As String = "1"
        Dim actual As String
        actual = target.getNewVorgangNummer(Typ, IdNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class

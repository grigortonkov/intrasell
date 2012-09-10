Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net



'''<summary>
'''This is a test class for ModuleBuchVorgangTest and is intended
'''to contain all ModuleBuchVorgangTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleBuchVorgangWorkflowTest



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
            testContextInstance = value
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
    '''A test for VorgangStorno
    '''</summary>
    <TestMethod()> _
    Public Sub VorgangKonvertierenTest_AN_AU()
        If Not IntraSell_DLL.FunctionsDB.CurrentDB.State = Data.ConnectionState.Open Then
            IntraSell_DLL.FunctionsDB.CurrentDB.Open()
        End If

        Dim VorgangTyp As String = buchvorgangTableAdapterTest.VORGANG_TYP_AN_1
        Dim VorgangTypTo As String = buchvorgangTableAdapterTest.VORGANG_TYP_AU_1
        Dim VorgangNummer As Integer = buchvorgangTableAdapterTest.VORGANG_NUMMER_AN_1
        Dim KundNr As Integer = 100

        Dim expected As String = "2012002"
        Dim actual As String
        actual = ModuleBuchVorgang.VorgangKonvertieren(VorgangTyp, VorgangTypTo, VorgangNummer, KundNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for VorgangStorno
    '''</summary>
    <TestMethod()> _
    Public Sub VorgangKonvertierenTest_AU_AR()
        If Not IntraSell_DLL.FunctionsDB.CurrentDB.State = Data.ConnectionState.Open Then
            IntraSell_DLL.FunctionsDB.CurrentDB.Open()
        End If

        Dim VorgangTyp As String = buchvorgangTableAdapterTest.VORGANG_TYP_AU_1
        Dim VorgangTypTo As String = buchvorgangTableAdapterTest.VORGANG_TYP_AR_1
        Dim VorgangNummer As Integer = buchvorgangTableAdapterTest.VORGANG_NUMMER_AN_1
        Dim KundNr As Integer = 100

        Dim expected As String = "2012002"
        Dim actual As String
        actual = ModuleBuchVorgang.VorgangKonvertieren(VorgangTyp, VorgangTypTo, VorgangNummer, KundNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for VorgangStorno
    '''</summary>
    <TestMethod()> _
    Public Sub VorgangKonvertierenTest_AR_LI()
        If Not IntraSell_DLL.FunctionsDB.CurrentDB.State = Data.ConnectionState.Open Then
            IntraSell_DLL.FunctionsDB.CurrentDB.Open()
        End If

        Dim VorgangTyp As String = buchvorgangTableAdapterTest.VORGANG_TYP_AR_2
        Dim VorgangTypTo As String = buchvorgangTableAdapterTest.VORGANG_TYP_LI_1
        Dim VorgangNummer As Integer = buchvorgangTableAdapterTest.VORGANG_NUMMER_AR_2
        Dim KundNr As Integer = 100

        Dim expected As String = "2012002"
        Dim actual As String
        actual = ModuleBuchVorgang.VorgangKonvertieren(VorgangTyp, VorgangTypTo, VorgangNummer, KundNr)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

End Class

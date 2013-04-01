Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net
Imports IntraSell_DLL


'''<summary>
'''This is a test class for ModuleMahnwesenTest and is intended
'''to contain all ModuleMahnwesenTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleMahnwesenTest


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
    '''A test for CalculateMahnStufe
    '''</summary>
    <TestMethod()> _
    Public Sub CalculateMahnStufeTest()
        'zuerst die Rechnung veraltetn 
        RunSQL("update buchVorgang set Datum = '2012-01-01' where typ= 'AR' and  nummer = " & buchvorgangTableAdapterTest.VORGANG_NUMMER_AR_2)
        Dim RechNummer As String = buchvorgangTableAdapterTest.VORGANG_NUMMER_AR_2
        Dim expected As String = "MAHNSTUFE_1"
        Dim actual As String
        actual = ModuleMahnwesen.CalculateMahnStufe(RechNummer)
        Assert.AreEqual(expected, actual)
        ' Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for CalculateMahnStufe
    '''</summary>
    <TestMethod()> _
    Public Sub SetzeMahnStufeTest()
        Dim RechNummer As String = buchvorgangTableAdapterTest.VORGANG_NUMMER_AR_2
        Dim expected As String = "True"
        Dim actual As String
        actual = ModuleMahnwesen.SetzeMahnStufe(RechNummer, "MAHNSTUFE_1")
        Assert.AreEqual(expected, actual)
        ' Assert.Inconclusive("Verify the correctness of this test method.")

    End Sub
End Class

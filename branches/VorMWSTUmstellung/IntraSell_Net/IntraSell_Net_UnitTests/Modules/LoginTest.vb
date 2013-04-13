Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net



'''<summary>
'''This is a test class for LoginTest and is intended
'''to contain all LoginTest Unit Testsc:\privat\tonk\Dropbox\IntraSell\IntraSell_dev\IntraSell_Net\IntraSell_Net\Forms\Infrastructure\About.vb
'''</summary>
<TestClass()> _
Public Class LoginTest


    Private testContextInstance As TestContext

    '''<summary>
    '''Gets or sets the test context which provides
    '''information about and functionality for the current test run.
    '''</summary>
    Public Property TestContext() As TestContext
        Get
            Return testContextInstance
        End Get
        Set(ByVal value As TestContext)
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
    '''A test for LoginUser
    '''</summary>
    <TestMethod(), _
     DeploymentItem("IntraSell_Net.exe")> _
    Public Sub LoginUserTest()
        'Dim target As Login = New Login() ' TODO: Initialize to an appropriate value
        Dim username As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim passwort As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim result As Boolean = LoginUser(username, passwort)

        Assert.IsFalse(result)
    End Sub

    <TestMethod(), _
 DeploymentItem("IntraSell_Net.exe")> _
    Public Sub LoginUserTest_OK() 
        Dim username As String = "MM"
        Dim passwort As String = "MM"
        Dim result As Boolean = LoginUser(username, passwort)

        Assert.IsTrue(result)
    End Sub


    <TestMethod(), _
DeploymentItem("IntraSell_Net.exe")> _
    Public Sub LoginUserTest_NOK()
        Dim username As String = "MM"
        Dim passwort As String = ""
        Dim result As Boolean = LoginUser(username, passwort)

        Assert.IsFalse(result)
    End Sub


    <TestMethod(), _
DeploymentItem("IntraSell_Net.exe")> _
    Public Sub LoginUserTest_NOK2()
        Dim username As String = "MMX"
        Dim passwort As String = "MMX"
        Dim result As Boolean = LoginUser(username, passwort)

        Assert.IsFalse(result)
    End Sub
End Class

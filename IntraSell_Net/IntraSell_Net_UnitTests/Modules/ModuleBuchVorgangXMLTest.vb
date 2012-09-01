Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net

Imports IntraSell_DLL
Imports System.Xml


'''<summary>
'''This is a test class for ModuleBuchVorgangXMLTest and is intended
'''to contain all ModuleBuchVorgangXMLTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ModuleBuchVorgangXMLTest


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

    '<TestInitialize()> _
    'Public Overloads Sub MyTestInitialize()

    'End Sub
    '
    'Use TestCleanup to run code after each test has run
    '<TestCleanup()>  _
    'Public Sub MyTestCleanup()
    'End Sub
    '
#End Region


    '''<summary>
    '''A test for VorgangXML
    '''</summary>
    <TestMethod()> _
    Public Sub VorgangXMLTest()

        Dim VorgangNummer As Long = "1000000"
        Dim VorgangTyp As String = "AR"
        Dim expected As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim actual As String
        actual = ModuleBuchVorgangXML.VorgangXML(VorgangNummer, VorgangTyp)


        'Load in XML Document to check if ok 
        Dim x As XmlDataDocument = New Xml.XmlDataDocument()
        x.LoadXml(actual)

        'x = (New Xml.XmlDataDocument())
        'x.Load("z:\\Business\\IntraSell_System\\IntraSell_Net\\IntraSell_Net\\bin\\Debug\\tmp\\Vorgang_buchVorgang_AR1.xml")

        'Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for OpenAusdruck_inWord_XML
    '''</summary>
    <TestMethod()> _
    Public Sub OpenAusdruck_inWord_XMLTest()
        Dim VorgangNummer As Long = ModuleBuchVorgangTest.VORGANG_NUMMER_1
        Dim VorgangTyp As String = ModuleBuchVorgangTest.VORGANG_TYP_1
        Dim VorlageFilename As String = "Vorlagen/17. RECHNUNG.dot"
        Dim Viewer As String = "NONE" '"WORD"
        Dim SofortSenden As Boolean = False ' TODO: Initialize to an appropriate value
        Dim MailText As String = "Here is my Mail."

        Dim expected As String = "c:\Vorgang_" & VorgangTyp & VorgangNummer & ".doc" ' TODO: Initialize to an appropriate value
        Dim actual As String
        actual = ModuleBuchVorgangXML.OpenAusdruck_inWord_XML(VorgangTyp, VorgangNummer, VorlageFilename, Viewer, SofortSenden, MailText)

        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class

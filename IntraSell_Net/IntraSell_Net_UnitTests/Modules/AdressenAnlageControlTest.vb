Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net



'''<summary>
'''This is a test class for AdressenAnlageControlTest and is intended
'''to contain all AdressenAnlageControlTest Unit Tests
'''</summary>
<TestClass()> _
Public Class AdressenAnlageControlTest


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
    '''A test for AdresseAnlegen
    '''</summary>
    <TestMethod()> _
    Public Sub AdresseAnlegenTest()
        Dim target As AdressenAnlageControl = New AdressenAnlageControl()
        '3 zeilen werden  importiert 
        Dim text As String = "ADEG C & C Großmarkt Inh ADEG Wolfsberg" & vbNewLine & _
        "Unterburg , Eberndorfer Str 38" & vbNewLine & _
        "9122 Sankt Kanzian am Klopeiner See (K)" & vbNewLine & _
        "04239 21 601" & vbNewLine
        Assert.IsTrue(target.AdresseAnlegen(text) >= 0)

        'update 
        Assert.IsTrue(target.AdresseAnlegen(text) >= 0)

        text = "ADEG C & C Großmarkt Inh ADEG Wolfsberg" & vbNewLine & _
          " " & vbNewLine & _
          " " & vbNewLine & _
        "Unterburg , Eberndorfer Str 38" & vbNewLine & _
        "9122 Sankt Kanzian am Klopeiner See (K)" & vbNewLine & _
        "04239 21 601" & vbNewLine
        Assert.IsTrue(target.AdresseAnlegen(text) >= 0)


        '3 zeilen werden nicht importiert 
        text = "ADEG C & C Großmarkt Inh ADEG Wolfsberg" & vbNewLine & _
       "Unterburg , Eberndorfer Str 38" & vbNewLine & _
       "9122 Sankt Kanzian am Klopeiner See (K)"
        Assert.IsTrue(target.AdresseAnlegen(text) = -1)


    End Sub

    '''<summary>
    '''A test for AdresseAnlegen
    '''</summary>
    <TestMethod()> _
    Public Sub AdresseAnlegen2Test()
        Dim target As AdressenAnlageControl = New AdressenAnlageControl()
        '3 zeilen werden  importiert 
        Dim text As String = "Rosso et Bianco(V-card)" & vbNewLine & _
                            "Villacher Str 9" & vbNewLine & _
                            "9220 Velden am Wörther See" & vbNewLine & _
                            "Telefon	+43 4274 52002" & vbNewLine & _
                            "Fax	+43 4274 52002" & vbNewLine & _
                            "E-Mail	service@rossoetbianco.at" & vbNewLine & _
                            "Internet	www.rossoetbianco.at Vorschau" & vbNewLine & _
                            "0.0Keine Bewertungen" & vbNewLine

        Assert.IsTrue(target.AdresseAnlegen(text) >= 0)


    End Sub
End Class

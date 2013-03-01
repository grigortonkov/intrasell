Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsAnrufeTableAdapters



'''<summary>
'''This is a test class for ofanrufeTableAdapterTest and is intended
'''to contain all ofanrufeTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ofanrufeTableAdapterTest


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
    '''A test for Insert
    '''</summary>
    <TestMethod()> _
    Public Sub ofAnrufe_InsertTest()
        Dim target As ofanrufeTableAdapter = New ofanrufeTableAdapter() ' TODO: Initialize to an appropriate value
        Dim AdrNr As Nullable(Of Integer) = 1
        Dim LAenderung As Nullable(Of DateTime) = DateTime.Now
        Dim LKontakt As Nullable(Of DateTime) = DateTime.Now
        Dim NAnruf As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Notizen As String = "TODO: Initialize to an appropriate value"
        Dim MitarbeiterNr As Nullable(Of Integer) = New Nullable(Of Integer)()
        Dim BeginZeit As Nullable(Of DateTime) = DateTime.Now
        Dim EndeZeit As Nullable(Of DateTime) = DateTime.Now
        Dim Verrechnung As Object = False
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Insert(AdrNr, LAenderung, LKontakt, NAnruf, Notizen, MitarbeiterNr, BeginZeit, EndeZeit, Verrechnung)
        Assert.AreEqual(expected, actual)
    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub ofAnrufe_UpdateTest()
        Dim target As ofanrufeTableAdapter = New ofanrufeTableAdapter() ' TODO: Initialize to an appropriate value
        Dim AdrNr As Nullable(Of Integer) = 1
        Dim LAenderung As Nullable(Of DateTime) = DateTime.Now
        Dim LKontakt As Nullable(Of DateTime) = DateTime.Now
        Dim NAnruf As String = DateTime.Now
        Dim Notizen As String = "TODO: Initialize to an appropriate value"
        Dim MitarbeiterNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim BeginZeit As Nullable(Of DateTime) = DateTime.Now
        Dim EndeZeit As Nullable(Of DateTime) = DateTime.Now
        Dim Verrechnung As Object = True
        Dim Original_AnrufNr As Integer = 0
        Dim expected As Integer = 0
        Dim actual As Integer
        actual = target.Update(AdrNr, LAenderung, LKontakt, NAnruf, Notizen, MitarbeiterNr, BeginZeit, EndeZeit, Verrechnung, Original_AnrufNr)
        Assert.AreEqual(expected, actual)
    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub ofAnrufe_DeleteTest()
        Dim target As ofanrufeTableAdapter = New ofanrufeTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_AnrufNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_AnrufNr)
        Assert.AreEqual(expected, actual)

    End Sub
End Class

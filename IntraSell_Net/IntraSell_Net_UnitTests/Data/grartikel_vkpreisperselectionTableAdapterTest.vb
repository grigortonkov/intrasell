Imports System.Data

Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsPreiseTableAdapters



'''<summary>
'''This is a test class for grartikel_vkpreisperselectionTableAdapterTest and is intended
'''to contain all grartikel_vkpreisperselectionTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class grartikel_vkpreisperselectionTableAdapterTest


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
    Public Sub Preisregeln_InsertTest()
        Dim target As grartikel_vkpreisperselectionTableAdapter = New grartikel_vkpreisperselectionTableAdapter() ' TODO: Initialize to an appropriate value

        Dim Datum As Nullable(Of DateTime) = New Nullable(Of DateTime)()
        Dim VKPreis As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])
        Dim AufschlagVKPreis As Nullable(Of Double) = New Nullable(Of Double)()
        Dim AufschlagEKPreis As Nullable(Of Double) = New Nullable(Of Double)()

        Dim PreislisteName As String = "Bonuskunden"
        Dim ArtKatNr As Nullable(Of Integer) = New Nullable(Of Integer)()
        Dim ArtNr As Nullable(Of Integer) = New Nullable(Of Integer)
        Dim IDNR As Nullable(Of Integer) = New Nullable(Of Integer)
        Dim StkAb As Nullable(Of Integer) = New Nullable(Of Integer)()

        Dim expected As Integer = 1
        Dim actual As Integer

        'Regel 1 - Allgemeine Regel - 50 % auf EK Preis
        actual = target.Insert(Datum, VKPreis, AufschlagVKPreis, 50, PreislisteName, ArtKatNr, ArtNr, IDNR, StkAb)
        Assert.AreEqual(expected, actual)


        'Regel 2 - Artikel 100
        actual = target.Insert(Datum, VKPreis, 20, AufschlagEKPreis, PreislisteName, ArtKatNr, 100, IDNR, StkAb)
        Assert.AreEqual(expected, actual)


        'Regel 3 - Artikel 101
        actual = target.Insert(Datum, VKPreis, 10, AufschlagEKPreis, PreislisteName, ArtKatNr, 101, IDNR, StkAb)
        Assert.AreEqual(expected, actual)


        'Regel 4,5,6 - Kunde idnr 100 bekommt rabatte ab 5 od. 10 stk. 
        'Regel 4
        actual = target.Insert(Datum, 100, AufschlagVKPreis, AufschlagEKPreis, PreislisteName, ArtKatNr, ArtNr, 100, StkAb)
        Assert.AreEqual(expected, actual)

        'Regel 5
        actual = target.Insert(Datum, 90, AufschlagVKPreis, AufschlagEKPreis, PreislisteName, ArtKatNr, ArtNr, 100, 5)
        Assert.AreEqual(expected, actual)

        'Regel 6
        actual = target.Insert(Datum, 80, AufschlagVKPreis, AufschlagEKPreis, PreislisteName, ArtKatNr, ArtNr, 100, 10)
        Assert.AreEqual(expected, actual)

    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub Preisregeln_UpdateTest()
        Dim target As grartikel_vkpreisperselectionTableAdapter = New grartikel_vkpreisperselectionTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Datum As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim VKPreis As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim AufschlagVKPreis As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim AufschlagEKPreis As Nullable(Of [Decimal]) = New Nullable(Of [Decimal])() ' TODO: Initialize to an appropriate value
        Dim PreislisteName As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ArtKatNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim ArtNr As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim IDNR As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim StkAb As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Id As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(Datum, VKPreis, AufschlagVKPreis, AufschlagEKPreis, PreislisteName, ArtKatNr, ArtNr, IDNR, StkAb, Original_Id)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub Preisregeln_DeleteTest()
        Dim target As grartikel_vkpreisperselectionTableAdapter = New grartikel_vkpreisperselectionTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_Id As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_Id)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    ' '''<summary>
    ' '''A test for Update
    ' '''</summary>
    '<TestMethod()> _
    'Public Sub UpdateTest1()
    '    Dim target As grartikel_vkpreisperselectionTableAdapter = New grartikel_vkpreisperselectionTableAdapter() ' TODO: Initialize to an appropriate value
    '    Dim dataRow As DataRow = Nothing ' TODO: Initialize to an appropriate value
    '    Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
    '    Dim actual As Integer
    '    actual = target.Update(dataRow)
    '    Assert.AreEqual(expected, actual)
    '    Assert.Inconclusive("Verify the correctness of this test method.")
    'End Sub
End Class

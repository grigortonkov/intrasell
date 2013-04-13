Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsArtikelTableAdapters



'''<summary>
'''This is a test class for grartikel_kategorienTableAdapterTest and is intended
'''to contain all grartikel_kategorienTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class grartikel_kategorienTableAdapterTest


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
    Public Sub grartikel_kategorien_InsertTest()
        Dim target As grartikel_kategorienTableAdapter = New grartikel_kategorienTableAdapter() ' TODO: Initialize to an appropriate value
        Dim ArtKatNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Name As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ArtKatNrParent As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Desc As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Template As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Aufschlag As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim GewinnReferenz As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Stylesheet As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Picture As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim TemplateForProduct As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Order As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Land As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Insert(ArtKatNr, Name, ArtKatNrParent, Desc, Template, Aufschlag, GewinnReferenz, Stylesheet, Picture, TemplateForProduct, Order, Land)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub grartikel_kategorienUpdateTest()
        Dim target As grartikel_kategorienTableAdapter = New grartikel_kategorienTableAdapter() ' TODO: Initialize to an appropriate value
        Dim ArtKatNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Name As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ArtKatNrParent As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Desc As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Template As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Aufschlag As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim GewinnReferenz As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Stylesheet As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Picture As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim TemplateForProduct As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Order As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Land As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_ArtKatNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Name As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_ArtKatNrParent As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Desc As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Template As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Aufschlag As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Original_GewinnReferenz As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Original_Stylesheet As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Picture As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_TemplateForProduct As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Order As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Land As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(ArtKatNr, Name, ArtKatNrParent, Desc, Template, Aufschlag, GewinnReferenz, Stylesheet, Picture, TemplateForProduct, Order, Land, Original_ArtKatNr, Original_Name, Original_ArtKatNrParent, Original_Desc, Original_Template, Original_Aufschlag, Original_GewinnReferenz, Original_Stylesheet, Original_Picture, Original_TemplateForProduct, Original_Order, Original_Land)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Update
    '''</summary>
    <TestMethod()> _
    Public Sub grartikel_kategorien_UpdateTest1()
        Dim target As grartikel_kategorienTableAdapter = New grartikel_kategorienTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Name As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim ArtKatNrParent As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Desc As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Template As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Aufschlag As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim GewinnReferenz As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Stylesheet As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Picture As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim TemplateForProduct As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Order As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Land As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_ArtKatNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Name As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_ArtKatNrParent As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Desc As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Template As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Aufschlag As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Original_GewinnReferenz As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Original_Stylesheet As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Picture As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_TemplateForProduct As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Order As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Land As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Update(Name, ArtKatNrParent, Desc, Template, Aufschlag, GewinnReferenz, Stylesheet, Picture, TemplateForProduct, Order, Land, Original_ArtKatNr, Original_Name, Original_ArtKatNrParent, Original_Desc, Original_Template, Original_Aufschlag, Original_GewinnReferenz, Original_Stylesheet, Original_Picture, Original_TemplateForProduct, Original_Order, Original_Land)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub grartikel_kategorien_DeleteTest()
        Dim target As grartikel_kategorienTableAdapter = New grartikel_kategorienTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_ArtKatNr As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim Original_Name As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_ArtKatNrParent As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Desc As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Template As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Aufschlag As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Original_GewinnReferenz As Nullable(Of Double) = New Nullable(Of Double)() ' TODO: Initialize to an appropriate value
        Dim Original_Stylesheet As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Picture As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_TemplateForProduct As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Original_Order As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Original_Land As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 0 ' TODO: Initialize to an appropriate value
        Dim actual As Integer
        actual = target.Delete(Original_ArtKatNr, Original_Name, Original_ArtKatNrParent, Original_Desc, Original_Template, Original_Aufschlag, Original_GewinnReferenz, Original_Stylesheet, Original_Picture, Original_TemplateForProduct, Original_Order, Original_Land)
        Assert.AreEqual(expected, actual)
        Assert.Inconclusive("Verify the correctness of this test method.")
    End Sub
End Class

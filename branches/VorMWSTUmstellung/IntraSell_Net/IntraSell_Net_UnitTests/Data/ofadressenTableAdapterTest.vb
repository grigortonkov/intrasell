Imports System

Imports Microsoft.VisualStudio.TestTools.UnitTesting

Imports IntraSell_Net.dsAdressenTableAdapters



'''<summary>
'''This is a test class for ofadressenTableAdapterTest and is intended
'''to contain all ofadressenTableAdapterTest Unit Tests
'''</summary>
<TestClass()> _
Public Class ofadressenTableAdapterTest


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

    <TestMethod()> _
    Public Sub ofAdressen_ALL()
        ofAdressen_InsertUpdateTest()
        ofAdressen_DeleteTest()
    End Sub


    '''<summary>
    '''A test for Insert
    '''</summary>
    <TestMethod()> _
    Public Sub ofAdressen_InsertUpdateTest()
        Dim target As ofadressenTableAdapter = New ofadressenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim IDNR As Integer = 100
        Dim Status As String = "Neu"
        Dim Branche As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Briefanrede As String = "Lieber Herr"
        Dim Titel As String = "Prof. Dr."
        Dim Anrede As String = "Herr"
        Dim Name As String = "TONKOV"
        Dim Vorname As String = "Grigor"
        Dim Name1 As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Firma As String = "GRITON"
        Dim Adresse As String = "Firmenstr. 14"
        Dim Land As Nullable(Of Integer) = 43
        Dim PLZ As String = "A-4040"
        Dim Ort As String = "Linz"
        Dim Tel As String = "070-12345678-90"
        Dim Tel2 As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Fax As String = "070-12345678-110"
        Dim Fax2 As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Mobil As String = "0550-12345678-90"
        Dim Email As String = "grigor.tonkov@gmail.com"
        Dim Web As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim Export As Nullable(Of Byte) = 0
        Dim AngelegtAn As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim MAAusen As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim MAInnen As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim Abbuchung As Nullable(Of Byte) = New Nullable(Of Byte)() ' TODO: Initialize to an appropriate value
        Dim hasMenu As Nullable(Of Byte) = New Nullable(Of Byte)() ' TODO: Initialize to an appropriate value
        Dim Passwort As String = "123456$"
        Dim nextIDNR As Nullable(Of Integer) = New Nullable(Of Integer)() ' TODO: Initialize to an appropriate value
        Dim mandant As Nullable(Of Short) = New Nullable(Of Short)() ' TODO: Initialize to an appropriate value
        Dim Geburtstag As Nullable(Of DateTime) = New Nullable(Of DateTime)() ' TODO: Initialize to an appropriate value
        Dim UID As String = "AT-1234567890"
        Dim SkypeAdresse As String = "grigortonkov"
        Dim MessengerAdresse As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim EUNummer As String = "EU 1"
        Dim EUNummer1 As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim EUNummer2 As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim BHReferenz As String = String.Empty ' TODO: Initialize to an appropriate value
        Dim expected As Integer = 1 ' TODO: Initialize to an appropriate value
        Dim actual As Integer

        'INSERT 
        actual = target.Insert(IDNR, Status, Branche, Briefanrede, Titel, Anrede, Name, Vorname, Name1, Firma, Adresse, Land, PLZ, Ort, Tel, Tel2, Fax, Fax2, Mobil, Email, Web, Export, AngelegtAn, MAAusen, MAInnen, Abbuchung, hasMenu, Passwort, nextIDNR, mandant, Geburtstag, UID, SkypeAdresse, MessengerAdresse, EUNummer, EUNummer1, EUNummer2, BHReferenz)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")
        'UPDATE 
        Status = "Kunde"
        actual = target.Update(Status, Branche, Briefanrede, Titel, Anrede, Name, Vorname, Name1, Firma, Adresse, Land, PLZ, Ort, Tel, Tel2, Fax, Fax2, Mobil, Email, Web, Export, AngelegtAn, MAAusen, MAInnen, Abbuchung, hasMenu, Passwort, nextIDNR, mandant, Geburtstag, UID, SkypeAdresse, MessengerAdresse, EUNummer, EUNummer1, EUNummer2, BHReferenz, IDNR)
        Assert.AreEqual(expected, actual)

        'Weitere Adressen 
        IDNR = 101 : Vorname = "Theodor" : Name = "Roth"
        actual = target.Insert(IDNR, Status, Branche, Briefanrede, Titel, Anrede, Name, Vorname, Name1, Firma, Adresse, Land, PLZ, Ort, Tel, Tel2, Fax, Fax2, Mobil, Email, Web, Export, AngelegtAn, MAAusen, MAInnen, Abbuchung, hasMenu, Passwort, nextIDNR, mandant, Geburtstag, UID, SkypeAdresse, MessengerAdresse, EUNummer, EUNummer1, EUNummer2, BHReferenz)
        Assert.AreEqual(expected, actual)


        IDNR = 102 : Vorname = "Christina" : Name = "Roth"
        actual = target.Insert(IDNR, Status, Branche, Briefanrede, Titel, Anrede, Name, Vorname, Name1, Firma, Adresse, Land, PLZ, Ort, Tel, Tel2, Fax, Fax2, Mobil, Email, Web, Export, AngelegtAn, MAAusen, MAInnen, Abbuchung, hasMenu, Passwort, nextIDNR, mandant, Geburtstag, UID, SkypeAdresse, MessengerAdresse, EUNummer, EUNummer1, EUNummer2, BHReferenz)
        Assert.AreEqual(expected, actual)

    End Sub

   

    '''<summary>
    '''A test for Delete
    '''</summary>
    <TestMethod()> _
    Public Sub ofAdressen_DeleteTest()
        Dim target As ofadressenTableAdapter = New ofadressenTableAdapter() ' TODO: Initialize to an appropriate value
        Dim Original_IDNR As Integer = 100
        Dim expected As Integer = 1
        Dim actual As Integer
        actual = target.Delete(Original_IDNR)
        Assert.AreEqual(expected, actual)
        'Assert.Inconclusive("Verify the correctness of this test method.")

        actual = target.Delete(101)
        Assert.AreEqual(expected, actual)

        actual = target.Delete(102)
        Assert.AreEqual(expected, actual)

    End Sub
End Class

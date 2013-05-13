VERSION 5.00
Begin VB.Form FormMain 
   Caption         =   "Form"
   ClientHeight    =   5985
   ClientLeft      =   2505
   ClientTop       =   3885
   ClientWidth     =   11415
   LinkTopic       =   "Form1"
   ScaleHeight     =   5985
   ScaleWidth      =   11415
   Begin VB.CommandButton CommandGetMWST 
      Caption         =   "MWST"
      Height          =   495
      Left            =   7800
      TabIndex        =   9
      Top             =   2880
      Width           =   1215
   End
   Begin VB.Frame Frame3 
      Caption         =   "Oeffne Word Printing"
      Height          =   1215
      Left            =   5400
      TabIndex        =   6
      Top             =   1560
      Width           =   3855
      Begin VB.CommandButton CommandKunden 
         Caption         =   "Kunden"
         Height          =   495
         Left            =   960
         TabIndex        =   8
         Top             =   480
         Width           =   1215
      End
      Begin VB.CommandButton Preis 
         Caption         =   "Preis"
         Height          =   495
         Left            =   2400
         TabIndex        =   7
         Top             =   480
         Width           =   1215
      End
   End
   Begin VB.TextBox txtConnString 
      Height          =   285
      Left            =   600
      MultiLine       =   -1  'True
      TabIndex        =   5
      Text            =   "Main.frx":0000
      Top             =   240
      Width           =   10695
   End
   Begin VB.Frame Frame2 
      Caption         =   "Oeffne Word Printing"
      Height          =   1215
      Left            =   600
      TabIndex        =   2
      Top             =   2760
      Width           =   3855
      Begin VB.TextBox txtNummer 
         Height          =   285
         Left            =   240
         TabIndex        =   4
         Text            =   "200500001"
         Top             =   720
         Width           =   1455
      End
      Begin VB.CommandButton CommandRechnung 
         Caption         =   "Rechnung"
         Height          =   495
         Left            =   2520
         TabIndex        =   3
         Top             =   600
         Width           =   1095
      End
   End
   Begin VB.CommandButton TEST 
      Caption         =   "TEST"
      Height          =   495
      Left            =   3120
      TabIndex        =   0
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Run Tests 1,2,3"
      Height          =   1095
      Left            =   600
      TabIndex        =   1
      Top             =   1560
      Width           =   3855
   End
End
Attribute VB_Name = "FormMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 
Private Sub Command1_Click()
    Dim vars As IntraSellVars
    MsgBox vars.varValue("DOMAIN")
End Sub

 


Private Sub Preis_Click()
    Dim Preis As Double
    Dim preise As IntraSellPreise
    Set preise = New IntraSellPreise
    preise.init (Me.txtConnString.Text)
    'Preis = preise.getPreis(-999, 10258, stk)
     'Preis = preise.getPreis(0, 10310, 1)
    Preis = preise.getPreis(0, 123, 1)
    
    MsgBox "Preis=" & CStr(Preis)
   'Destroy
    preise.destroy
End Sub

Private Sub CommandGetMWST_Click()
Dim Preis As Double
    Dim mwst As Double
    Dim preise As IntraSellPreise
    Set preise = New IntraSellPreise
    preise.init (Me.txtConnString.Text)
    'Preis = preise.getPreis(-999, 10258, stk)
     'Preis = preise.getPreis(0, 10310, 1)
    Preis = preise.getPreis(295352, 1700, 1)
    
    mwst = preise.getMWSTArtikel(1700, 295352)
    MsgBox "Mwst=" & CStr(mwst)
    
    '21
    mwst = preise.getMWSTArtikel(1, 1)
    MsgBox "Mwst=" & CStr(mwst)
    
   'Destroy
    preise.destroy
End Sub


Private Sub TEST_Click()
   'Dim databasePath: databasePath = "D:\Business\IntraSoft\IntraSell\IntraSell_Daten_2.08.mdb"
   'functionsDB.ConnStringODBC = "PROVIDER=MSDASQL;dsn=IntraSell_pccenter;uid=;pwd=;"
   'functionsDB.ConnStringODBC = "driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
 
    'TEST 1
    Dim vars As IntraSellVars
    Set vars = New IntraSellVars
    vars.init (Me.txtConnString.Text)
    MsgBox vars.varValue("DOMAIN")
    Call vars.SETVARVALUE("DOMAIN", "IhreFirma.at")
     vars.destroy

    'TEST 2
    Dim preise As IntraSellPreise
    Set preise = New IntraSellPreise
    preise.init (Me.txtConnString.Text)
    
    MsgBox preise.getNewVorgangNummer("AR", 1)
    
    'TEST 3
    Dim Preis As Double
    Dim ii As Integer: ii = 1
    Dim stk As Integer: stk = 1
    Preis = preise.getPreis(ii, ii, stk)
    
    MsgBox "Preis=" & Preis
     
    'Test 4
    
    Preis = preise.getPreis(0, 10310, 10)
      MsgBox "Preis=" & Preis
     'Destroy
    preise.destroy
     
End Sub

 
Private Sub CommandRechnung_Click()
    Dim functionsDB
    'Dim databasePath
    'databasePath = "D:\Business\IntraSoft\IntraSell\IntraSell_Daten_2.08.mdb"
    'databasePath = "c:\mdi\db\IntraSell_Daten_2.07.mdb"
    functionsDB.ConnStringODBC = Me.txtConnString.Text '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
   
    Dim druck As IntraSellVorgaengeAusdruck
    Set druck = New IntraSellVorgaengeAusdruck
    druck.init (functionsDB.ConnStringODBC)
    
    druck.OpenAusdruck_inWord_RTF "AR", Me.txtNummer.Text, ""
    'druck.OpenAusdruck_inWord "AR", Me.txtNummer.Text, ""

End Sub


Private Sub CommandKunden_Click()
    Dim functionsDB
    'Dim databasePath: databasePath = "D:\Business\IntraSoft\IntraSell\IntraSell_Daten_2.08.mdb"
    Dim databasePath: databasePath = "c:\mdi\db\IntraSell_Daten_2.07.mdb"
   'functionsDB.ConnStringODBC = "PROVIDER=MSDASQL;dsn=IntraSell_pccenter;uid=;pwd=;"
    functionsDB.ConnStringODBC = "driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"

    Dim kunden As IntraSellKunden: Set kunden = New IntraSellKunden
    kunden.init (functionsDB.ConnStringODBC)
    
    'MsgBox kunden.neueAdresse(1, "xxx", "xxx", "xxx", "xxx", "xxx", "4040", "xxx", "xxx", "xxx", "43", "tel", "tel22", , "Herr", "neu", "mobil")
End Sub


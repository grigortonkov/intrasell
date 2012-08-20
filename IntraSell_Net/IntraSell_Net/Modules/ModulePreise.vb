Imports IntraSell_DLL
Module ModulePreise

    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001-2009 (R)
    ' See www.griton.eu for last changes.
    '===========================================================================

    ''for compatibility reasons
    'Const dbOpenDynaset = 0

    'Private Preise As IntraSell.IntraSellPreise

    'Public Function IntraSellPreise() As IntraSell.IntraSellPreise
    '    If Preise Is Nothing Then   ' init
    '        On Error Resume Next
    '        Preise = New IntraSell.IntraSellPreise
    '        If err.Number <> 0 Then
    '            MsgBox("Die IntraSell DLL konnte nicht gefunden werden!" & err.Description, vbCritical)
    '            err.Number = 0
    '            On Error GoTo 0
    '            Exit Function
    '        End If
    '        On Error GoTo 0
    '        'init
    '        Preise.Init(ConnStringIntraSellData)
    '    End If

    '    IntraSellPreise = Preise
    'End Function


    '' Call the DLL to get the price
    'Public Function getPreis(ByVal IDNR, ByVal ArtNr, ByVal Stk) As Double
    '    If ArtNr & "" = "" Then Exit Function
    '    getPreis = IntraSellPreise.getPreis(IDNR, ArtNr, Replace(Stk, ",", "."))
    'End Function


    Public Function getEKPreis(ByVal ArtNr)
        getEKPreis = 0 'TODO IntraSellPreise.getEKPreis(ArtNr)
    End Function

    '' Call the DLL
    'Public Function getBestLieferant(ByVal ArtNr)
    '    getBestLieferant = IntraSellPreise.getBestLieferant(ArtNr)
    'End Function

    ' Call the DLL
    Public Function getDruckForType(ByVal Typ As String) As String

        getDruckForType = getDruckForType(Typ)
        'Boote Marian - unterstützung für Akonto und Schlussrechnung
        If firstRow("select 1 from qryBuchRechAkonto") = 1 Then
            Return "Schuss-" & getDruckForType
            Exit Function
        End If
        Dim Woher As Object : Woher = firstRow("select woher from qryBuchRech")
        If Woher <> "" And Left(Woher, Len(Typ)) = Typ Then
            Return "Akonto-" & getDruckForType
            Exit Function
        End If

    End Function


    Public Function getVorgangTableForType(ByVal Typ)
        getVorgangTableForType = "buchVorgang" ' IntraSellPreise.getVorgangTableForType(Typ)
    End Function

    Public Function getVorgangArtikelTableForType(ByVal Typ)
        getVorgangArtikelTableForType = "buchVorgang-Artikel"  'IntraSellPreise.getVorgangArtikelTableForType(Typ)
    End Function


    'Public Function calculateBruttoPreis(ByVal VKPreis As Double, ByVal ArtNr As String, ByVal IDNR As String)
    '    calculateBruttoPreis = IntraSellPreise.calculateBruttoPreis(VKPreis, ArtNr, IDNR)
    'End Function


    'Public Function getMWSTArtikel(ByVal ArtNr As String)
    '    getMWSTArtikel = IntraSellPreise.getMWSTArtikel(ArtNr)
    'End Function

    'Public Function convertFromTo(ByVal FromOrder As String, ByVal ToOrder As String, ByVal FromNummer As String, ByVal NewKundNr As String) As String
    '    convertFromTo = IntraSellPreise.convertFromTo(FromOrder, ToOrder, FromNummer, NewKundNr)
    'End Function

    'Public Function getNewVorgangNummer(ByVal Typ, ByVal IDNR)
    '    getNewVorgangNummer = IntraSellPreise.getNewVorgangNummer(Typ, IDNR)
    'End Function

End Module

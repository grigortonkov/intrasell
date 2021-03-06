﻿Option Strict On
Option Explicit On

Imports IntraSell_DLL

Module ModulePreise

    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001-2009 (R)
    ' See www.griton.eu for last changes.
    '===========================================================================

    ''for compatibility reasons
    'Const dbOpenDynaset = 0

    Private Preise As IntraSell_DLL.IntraSellPreise

    Public Function IntraSellPreise() As IntraSell_DLL.IntraSellPreise
        If Preise Is Nothing Then   ' init

            Preise = New IntraSell_DLL.IntraSellPreise
            If Err.Number <> 0 Then
                MsgBox("Die IntraSell DLL konnte nicht gefunden werden!" & Err.Description, vbCritical)
            End If

            'init
            Preise.init(ConnStringIntraSellData)
        End If

        IntraSellPreise = Preise
    End Function


    '' Call the DLL to get the price
    Public Function getPreis(ByVal IDNR As Integer, ByVal ArtNr As Integer, ByVal Stk As Double) As Double
        If ArtNr & "" = "" Then Return 0 : Exit Function
        getPreis = IntraSellPreise.getPreis(IDNR, ArtNr, Stk)
    End Function


    Public Function getEKPreis(ByVal ArtNr As Integer) As Double
        Return IntraSellPreise.getEKPreis(ArtNr)
    End Function

    '' Call the DLL 
    Public Function getBestLieferant(ByVal ArtNr As Integer) As String
        getBestLieferant = IntraSellPreise.getBestLieferant(ArtNr)
    End Function


    ' Call the DLL
    Public Function getDruckForType(ByVal Typ As String) As String

        'getDruckForType = IntraSellPreise.getDruckForType(Typ)
        getDruckForType = CStr(firstRow("select Druckbezeichnung from buchVorgangTyp where Typ='" & Typ & "'"))
        'Boote Marian - unterstützung für Akonto und Schlussrechnung
        '        qryBuchRechAkonto()
        '            SELECT 'AR' AS VorgangTyp, qryBuchRech.Nummer, akonto.Nummer AS AkontoNummer, akonto.Datum AS AkontoDatum, akonto.Summe, akonto.SummeMWST, akonto.SummeBrutto, qryBuchRech.Wohin, qryBuchRech.SummeATS-akonto.Summe AS RestSumme, qryBuchRech.SummeATSBrutto-qryBuchRech.SummeATS-akonto.Summemwst AS RestMWST, qryBuchRech.SummeATSBrutto-akonto.SummeBrutto AS RestBrutto
        'FROM qryBuchRech, buchRechnung AS akonto
        'GROUP BY 'AR', qryBuchRech.Nummer, akonto.Nummer, akonto.Datum, akonto.Summe, akonto.SummeMWST, akonto.SummeBrutto, qryBuchRech.Wohin, qryBuchRech.SummeATS-akonto.Summe, qryBuchRech.SummeATSBrutto-qryBuchRech.SummeATS-akonto.Summemwst, qryBuchRech.SummeATSBrutto-akonto.SummeBrutto
        'HAVING (((qryBuchRech.Wohin)="AR" & [akonto].[Nummer]));

        'qryBuchRech
        '            SELECT 'AR' AS VorgangTyp, ofAdressen.Idnr, ofAdressen.Name & " " & ofAdressen.Vorname AS Namen, ofAdressen.Firma, ofAdressen.Adresse, buchRechnung.Nummer, [grPLZ].[plz] & " " & [grPLZ].[ort] AS plzort, Sum([Stk]*[PreisATS]) AS summeATS, Sum([Stk]*[PreisATS_Brutto]) AS summeATSBrutto, buchRechnung.Datum, First(buchRechnung.Notiz) AS Notiz, Sum([Stk]*[PreisEuro]) AS summeEuro, buchRechnung.KundNr, buchRechnung.ZahlungsBedungung, buchRechnung.Zahlungsmethode, buchRechnung.TransportMethode, buchRechnung.Woher, buchRechnung.Wohin, ofAdressen.Anrede, ofAdressen.Anrede+" " & ofAdressen.Titel AS AnredeTitel, getLand(ofAdressen.Idnr) AS land, getUID(ofAdressen.idnr) AS uid, ofAdressen.Tel, ofAdressen.Email, buchRechnung.KundNr2
        'FROM ((ofAdressen RIGHT JOIN buchRechnung ON ofAdressen.IDNR = buchRechnung.KundNr) LEFT JOIN grPLZ ON ofAdressen.PLZ = grPLZ.IdNr) INNER JOIN [buchRech-Artikel] ON buchRechnung.Nummer = [buchRech-Artikel].RechNr
        'WHERE (((buchRechnung.[nummer])=3002))
        'GROUP BY 'AR', ofAdressen.Idnr, ofAdressen.Name & " " & ofAdressen.Vorname, ofAdressen.Firma, ofAdressen.Adresse, buchRechnung.Nummer, [grPLZ].[plz] & " " & [grPLZ].[ort], buchRechnung.Datum, buchRechnung.KundNr, buchRechnung.ZahlungsBedungung, buchRechnung.Zahlungsmethode, buchRechnung.TransportMethode, buchRechnung.Woher, buchRechnung.Wohin, ofAdressen.Anrede, ofAdressen.Anrede+" " & ofAdressen.Titel, getLand(ofAdressen.Idnr), getUID(ofAdressen.idnr), ofAdressen.Tel, ofAdressen.Email, buchRechnung.KundNr2, buchRechnung.Notiz;

        Exit Function
        'TODO: Logik für Akonto und Schlussrechnung ist noch offen 
        'If CStr(firstRow("select 1 from qryBuchRechAkonto")) = "1" Then
        '    Return "Schuss-" & getDruckForType
        '    Exit Function
        'End If
        'Dim Woher As String = CStr(firstRow("select woher from qryBuchRech"))
        'If Woher <> "" And Left(CStr(Woher), Len(Typ)) = Typ Then
        '    Return "Akonto-" & getDruckForType
        '    Exit Function
        'End If

    End Function


    Public Function getVorgangTableForType(ByVal Typ As String) As String
        getVorgangTableForType = "buchVorgang" ' IntraSellPreise.getVorgangTableForType(Typ)
    End Function

    Public Function getVorgangArtikelTableForType(ByVal Typ As String) As String
        getVorgangArtikelTableForType = "buchVorgang-Artikel"  'IntraSellPreise.getVorgangArtikelTableForType(Typ)
    End Function


    Public Function calculateBruttoPreis(ByVal VKPreis As Double, ByVal ArtNr As String, ByVal IDNR As Integer) As Double
        calculateBruttoPreis = IntraSellPreise.calculateBruttoPreis(VKPreis, ArtNr, IDNR)
    End Function


    Public Function getMWSTArtikel(ByVal ArtNr As String) As Double
        getMWSTArtikel = IntraSellPreise.getMWSTArtikel(ArtNr)
    End Function

    Public Function convertFromTo(ByVal FromOrder As String, ByVal ToOrder As String, ByVal FromNummer As Integer, ByVal NewKundNr As Integer) As String
        Return IntraSellPreise.convertFromTo(FromOrder, ToOrder, FromNummer, NewKundNr)
    End Function

    Public Function getNewVorgangNummer(ByVal Typ As String, ByVal IDNR As Integer) As String
        Return IntraSellPreise.getNewVorgangNummer(Typ, IDNR)
    End Function

End Module

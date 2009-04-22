Attribute VB_Name = "moduleBuchRechnung"
Option Compare Database

 Public Sub neueRechnung(ByVal formName As String)
   Dim frm As Form: Set frm = Forms(formName)
    If MsgBox("Wollen Sie " & getDruckForType(frm.txtVorgangType) & " anlegen?", vbYesNo, _
      "Neu" & getDruckForType(frm.txtVorgangType)) = vbYes Then
        
        frm.Rech_Artikel.Locked = False
        frm.Rech_Artikel.Enabled = True
        
        Dim rs As Recordset
        DoCmd.GoToRecord , , acNewRec

        
         'set Lieferant as Kunde
        If frm.txtVorgangType = VORGANG_TYP_LAU Then
            frm![LieferantNR] = Forms![lieferantenAdressen]![IDNR]
            frm![KundNr] = Forms![lieferantenAdressen]![IDNR]
        Else
            If isFormOpen("ofKunden") Then
                frm![KundNr] = Forms![ofKunden]![IDNR]
                Forms![ofKunden]![Status] = "Kunde"
            Else
                frm![KundNr] = 0
            End If
        End If
        
         frm!Nummer = getNewVorgangNummer(frm.txtVorgangType, frm.KundNr)
        'Check if open vorgaenge
        Call openVorgänge(frm!KundNr, frm!Nummer, frm.txtVorgangType)
        
        'SAVE FORM
        Call SaveCurrentRecord
        
        frm.ZahlungsBedungung.Requery
        frm.TransportMethode.Requery
        frm.ZahlungsMethode.Requery
        
        'Setze die standart werte ( erste Zeile in Stammdaten)
        Dim txt
          txt = TABLEVALUE("grZahlungsbedingung", "Nr", TABLEVALUE("[ofAdressen-Zahlungsbedingungen]", "Idnr", frm.KundNr, "Bedingung"), "Methode")
          If InStr(txt, "Variable") < 1 Then frm!ZahlungsBedungung = txt ' setzen nur wenn vorhanden
          txt = TABLEVALUE("[ofAdressen-ZahlungsMethoden]", "Idnr", frm.KundNr, "Methode")
          If InStr(txt, "Variable") < 1 Then frm!ZahlungsMethode = txt
          txt = TABLEVALUE("[ofAdressen-TransportMethoden]", "Idnr", frm.KundNr, "Methode")
          If InStr(txt, "Variable") < 1 Then frm!TransportMethode = txt

 End If
 Call checkForStorno(frm.Form)

 End Sub
 
  

Imports IntraSell_DLL
Imports MySql.Data.MySqlClient

Module ModuleBuchVorgangForm


    Public Const COL_ID_INDEX As Integer = 0
    Public Const COL_STK_INDEX As Integer = 3
    Public Const COL_ARTNR_COMBO_INDEX As Integer = 4
    Public Const COL_ARTNR_INDEX As Integer = 5
    Public Const COL_BEZEICHNUNG_INDEX As Integer = 6
    Public Const COL_PREIS_NETTO_INDEX As Integer = 7
    Public Const COL_PREIS_BRUTTO_INDEX As Integer = 8
    Public Const COL_MWST_INDEX As Integer = 9
    Public Const COL_EKPREIS_INDEX As Integer = 10



    Public Sub Recalculate(ByVal Buchvorgang_artikelDataGridView As DataGridView, _
                           ByVal SummeTextBox As TextBox, _
                           ByVal SummeBruttoTextBox As TextBox, _
                           ByVal SummeMWSTTextBox As TextBox)
        Try


            Dim summeNetto As Double = 0.0, summeBrutto As Double = 0.0, MWST As Double = 0.0
            Dim dg As DataGridView = Buchvorgang_artikelDataGridView
            'sum(RoundUp([Stk]*[PreisATS],2)) as Summe, sum(RoundUp([Stk]*[PreisATS_Brutto],2)) as Summe_Brutto

            Dim precision As Int16 = VarValue_Default("PREIS_GENAUIGKEIT", 2)
            With Buchvorgang_artikelDataGridView
                For counter = 1 To (.Rows.Count)
                    'deposit = 0
                    'withdrawal = 0

                    Try
                        Dim stk As Double = 0, netto As Double = 0, brutto As Double = 0
                        stk = Double.Parse(dg.Rows(counter - 1).Cells(COL_STK_INDEX).Value)
                        netto = Double.Parse(dg.Rows(counter - 1).Cells(COL_PREIS_NETTO_INDEX).Value.ToString())
                        brutto = Double.Parse(dg.Rows(counter - 1).Cells(COL_PREIS_BRUTTO_INDEX).Value.ToString())

                        summeNetto += stk * netto
                        summeBrutto += stk * brutto

                    Catch ex As Exception
                        Exit Sub 'on any error 
                    End Try
                Next

            End With

            MWST = summeBrutto - summeNetto

            SummeTextBox.Text = FormatCurrency(summeNetto, precision)
            SummeBruttoTextBox.Text = FormatCurrency(summeBrutto, precision)
            SummeMWSTTextBox.Text = FormatCurrency(MWST, precision)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub



    ''' <summary>
    ''' update preise after changing the row 
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub ArtNr_CalculatePreis(ByVal Buchvorgang_artikelBindingSource, ByVal KundNrAdressenControl)
        Try

            Dim r As dsVorgaenge._buchvorgang_artikelRow = Buchvorgang_artikelBindingSource.Current.row
            Try
                If IsNull(r.ArtNr) Then
                    Exit Sub
                End If
            Catch ex As Exception
                Exit Sub
            End Try
            Dim KundNr As String = KundNrAdressenControl.IDNR

            Dim rs As MySqlDataReader = openRecordset("select * from grArtikel where ArtNr= " & r.ArtNr)

            Dim VKPreis As Double = 0
            If rs.Read Then
                VKPreis = rs("PreisATS")
                Try
                    If IsNull(r.Bezeichnung) Or r.Bezeichnung = "" Then
                        r.Bezeichnung = rs("Bezeichnung")
                    End If
                Catch ex As Exception
                    r.Bezeichnung = rs("Bezeichnung")
                End Try

            End If

            rs.Close()

            'try to get specialpreis
            Try
                If IsNull(r.Stk) Then
                    Exit Sub
                End If
            Catch ex As Exception
                Exit Sub
            End Try

            Dim specialPreis As Double = getPreis(KundNr, r.ArtNr, r.Stk)
            If specialPreis > 0 Then
                VKPreis = specialPreis
            End If

            Dim notDefined As Boolean = False
            Try
                If IsDBNull(r.Preis_Netto) Then
                    notDefined = True
                ElseIf r.Preis_Netto = 0 Then
                    notDefined = True
                End If
            Catch ex As Exception
                notDefined = True
            End Try


            If notDefined Then
                r.Preis_Netto = VKPreis
                r.Preis_Brutto = calculateBruttoPreis(VKPreis, r.ArtNr, KundNr)
                r.MWST = r.Preis_Brutto - r.Preis_Netto
            Else
                r.Preis_Brutto = calculateBruttoPreis(r.Preis_Netto, r.ArtNr, KundNr)
                r.MWST = r.Preis_Brutto - r.Preis_Netto
            End If



            notDefined = False
            Try

                If IsDBNull(r.EKPreis) Then
                    notDefined = True
                ElseIf r.EKPreis = 0 Then
                    notDefined = True
                End If
            Catch ex As Exception
                notDefined = True
            End Try
            If notDefined Then
                r.EKPreis = getEKPreis(r.ArtNr)
            End If

            Buchvorgang_artikelBindingSource.EndEdit()
            Exit Sub
        Catch ex As Exception
            MsgBox(Err.Description, vbCritical)
        End Try
    End Sub

End Module

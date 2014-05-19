Imports MagentoSync.dsAuftraegeTableAdapters
Imports MagentoSync.MagentoSyncService
Imports MagentoSync.dsAuftraege

Public Class OrderSync


    Protected magento As MagentoConn = New MagentoConn
    Public intrasell As IntraSellConn = New IntraSellConn

    Dim customerSync As CustomerSync = New CustomerSync


    Public Sub ImportNewOrders()

        magento.OpenConn()
        intrasell.init()

        Try
            Dim list As MagentoSyncService.salesOrderListEntity() = magento.client.salesOrderList(magento.sessionid, Nothing)
            ModuleLog.Log("Found " & list.Count.ToString & " orders.")
            Dim c As MagentoSyncService.salesOrderListEntity

            For i As Int32 = 0 To list.Count - 1
                c = list.ElementAt(i)
                ModuleLog.Log("Found Order " & c.increment_id)
                'Debug.Print("Import Order " & c.shipping_address_id)
                'Import Order in IntraSell 
                Dim orderFound As String = intrasell.vars.firstRow("select 'Found' from buchAuftrag where nummer=" & c.increment_id & "")
                If Not orderFound = "Found" Then
                    buchVorgang_Create_Auftrag(c)
                End If


            Next
        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try
        magento.CloseConn()

    End Sub



    Sub buchVorgang_Create_Auftrag(order As salesOrderListEntity)
        ModuleLog.Log("buchVorgang_Create_Auftrag for mangento order_id " & order.increment_id)

        Dim orderDetails As salesOrderEntity = magento.client.salesOrderInfo(magento.sessionid, order.increment_id)

        Dim tam As dsAuftraegeTableAdapters.TableAdapterManager = New dsAuftraegeTableAdapters.TableAdapterManager()
        'tam.Connection = IntraSell_DLL.FunctionsDB.CurrentDB

        Dim t As buchauftragTableAdapter = New buchauftragTableAdapter()
        Dim ta As buchauftrag_artikelTableAdapter = New buchauftrag_artikelTableAdapter()

        Dim dsAuftraege As dsAuftraege = New dsAuftraege()

        tam.Connection = t.Connection

        't.Fill(dsAuftraege.buchauftrag)
        'ta.Fill(dsAuftraege._buchauftrag_artikel)

        'Import Customer 
        customerSync.magento = magento
        customerSync.ImportNewMagentoCustomer(orderDetails)

        Dim r As buchauftragRow = dsAuftraege.buchauftrag.NewRow()
        r.MandantNr = My.MySettings.Default.MandantNr
        r.Nummer = order.increment_id
        r.Datum = order.created_at
        r.Bezahlt = 0
        r.Ausgedrukt = 0
        r.anElba = 0
        'TODO create / update customer 
        r.KundNr = orderDetails.customer_id
        r.Summe = toDecimal(orderDetails.subtotal)
        r.SummeMWST = toDecimal(orderDetails.tax_amount)
        r.SummeBrutto = toDecimal(orderDetails.subtotal) + toDecimal(orderDetails.tax_amount)


        dsAuftraege.buchauftrag.AddbuchauftragRow(r)


        'ReDim rp(orderDetails.items.Count)
        Dim pos As Int16 = 1

        For Each item In orderDetails.items
            Dim rp As dsAuftraege._buchauftrag_artikelRow

            rp = dsAuftraege._buchauftrag_artikel.NewRow()
            rp.ID = pos
            'rp.Typ = r.Typ

            rp.RechNr = r.Nummer
            rp.ArtNr = SKI2ArtNr(item.sku) ' item.product_id

            Dim prod = magento.client.catalogProductInfo(magento.sessionid, item.product_id, Nothing, Nothing, "simple")
            rp.Bezeichnung = prod.name

            rp.Stk = toDecimal(item.qty_ordered)
            rp.PreisATS = toDecimal(item.base_price)
            'rp.MWST = item.price - item.base_price
            rp.PreisATS_Brutto = toDecimal(item.price)

            dsAuftraege._buchauftrag_artikel.Rows.Add(rp)

            pos = pos + 1

        Next



        dsAuftraege.WriteXml("magento2intrasell_order_" + orderDetails.order_id + ".xml")

        tam.UpdateAll(dsAuftraege)
        t.Update(dsAuftraege)
        ta.Update(dsAuftraege)

        'tr.Commit()

    End Sub

    Function SKI2ArtNr(sku As String)
        Return intrasell.vars.firstRow("select artnr from grArtikel where EAN='" & sku & "'")
    End Function

    Function toDecimal(stringWithPoint As String) As Decimal
        If stringWithPoint.Contains(".") Then
            Return Split(stringWithPoint, ".")(0) + Split(stringWithPoint, ".")(1) / 100
        Else
            Return stringWithPoint * 1
        End If
    End Function
End Class



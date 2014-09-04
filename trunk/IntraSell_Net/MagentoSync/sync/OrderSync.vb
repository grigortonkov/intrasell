Imports MagentoSync.dsAuftraegeTableAdapters
Imports MagentoSync.MagentoSyncService
Imports MagentoSync.dsAuftraege

Public Class OrderSync

    Protected magento As MagentoConn = New MagentoConn
    Public intrasell As IntraSellConn = New IntraSellConn
    Dim customerSync As CustomerSync = New CustomerSync
    Dim lastOrderCreated As Date = Nothing


    ''' <summary>
    ''' import new Orders to IntraSell
    ''' </summary>
    ''' <param name="since">'init with this time , timer uses no since  </param>
    ''' <remarks></remarks>
    Public Sub ImportNewOrders(Optional since As Date = Nothing)
        If Not IsNothing(since) Then
            lastOrderCreated = since
        End If
        magento.OpenConn()
        intrasell.init()

        Try
            'create filter
            Dim filter As filters = New filters
            ReDim filter.complex_filter(1)
            filter.complex_filter(0) = New complexFilter
            filter.complex_filter(0).key = "created_at"
            filter.complex_filter(0).value = New associativeEntity()
            filter.complex_filter(0).value.key = "gt"
            filter.complex_filter(0).value.value = toMagentoDateFormat(lastOrderCreated)

            Dim list As MagentoSyncService.salesOrderListEntity() = magento.client.salesOrderList(magento.sessionid, filter)
            ModuleLog.Log("Found " & list.Count.ToString & " orders. Going to import the new orders since " + lastOrderCreated + ".")
            lastOrderCreated = Now 'for the next import 
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
            ModuleLog.Log("Done checking/importing " & list.Count.ToString & " orders.")
        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try
        magento.CloseConn()


    End Sub



    Sub buchVorgang_Create_Auftrag(order As salesOrderListEntity)
        ModuleLog.Log("create IntraSell Auftrag for magento order_id " & order.increment_id)

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
        r.Status = "neu"
        r.MandantNr = My.MySettings.Default.MandantNr
        r.Nummer = order.increment_id
        r.Datum = order.created_at
        r.Bezahlt = 0
        r.Ausgedrukt = 0
        r.anElba = 0
        'TODO create / update customer 
        'check Email 
        Dim idnr = intrasell.vars.firstRow("select idnr from ofAdressen where Email = '" & orderDetails.customer_email & "'")
        r.KundNr = idnr 'orderDetails.customer_id

        'abweichende Liefer adresse ? 
        If order.shipping_address_id <> order.billing_address_id Then
            r.KundNr2 = intrasell.vars.firstRow("select max(id) from `ofAdressen-weitere` where IDNR=" & idnr & " and Typ ='LI'")
        End If


        r.Summe = toDecimal(orderDetails.subtotal)
        r.SummeMWST = toDecimal(orderDetails.tax_amount)
        r.SummeBrutto = toDecimal(orderDetails.subtotal) + toDecimal(orderDetails.tax_amount)

        r.Notiz = orderDetails.customer_note_notify

        If Not IsNothing(orderDetails.payment) Then
            r.ZahlungsMethode = orderDetails.payment.method
        End If

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


        dsAuftraege.WriteXml(My.MySettings.Default.SyncFolder + "magento2intrasell_order_" + orderDetails.order_id + ".xml")

        tam.UpdateAll(dsAuftraege)
        t.Update(dsAuftraege)
        ta.Update(dsAuftraege)

        'tr.Commit()
        ModuleLog.Log("done IntraSell Auftrag for magento order_id " & order.increment_id)
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






    ''' <summary>
    ''' Export Order Status to Magento
    '''  Selects the magento orders from the last X days , 
    '''  checks the order status in intrasell and update the order status in magento 
    ''' 
    ''' </summary>
    ''' <param name="since">'init with this time , timer uses no since  </param>
    ''' <remarks></remarks>
    Public Sub ExportOrderStatus(Optional since As Date = Nothing)
        If Not IsNothing(since) Then
            lastOrderCreated = since
        End If
        magento.OpenConn()
        intrasell.init()

        Try
            'create filter
            Dim filter As filters = New filters
            ReDim filter.complex_filter(1)
            filter.complex_filter(0) = New complexFilter
            filter.complex_filter(0).key = "created_at"
            filter.complex_filter(0).value = New associativeEntity()
            filter.complex_filter(0).value.key = "gt"
            filter.complex_filter(0).value.value = toMagentoDateFormat(lastOrderCreated)

            Dim list As MagentoSyncService.salesOrderListEntity() = magento.client.salesOrderList(magento.sessionid, filter)
            ModuleLog.Log("Found " & list.Count.ToString & " orders. Going to update order status since " + lastOrderCreated + ".")
            lastOrderCreated = Now 'for the next import 
            Dim c As MagentoSyncService.salesOrderListEntity

            For i As Int32 = 0 To list.Count - 1
                c = list.ElementAt(i)
                ModuleLog.Log("Found Order " & c.increment_id)
                'Debug.Print("Import Order " & c.shipping_address_id)
                'Import Order in IntraSell 
                Dim orderFound As String = intrasell.vars.firstRow("select 'Found' from buchAuftrag where nummer=" & c.increment_id & "")
                If orderFound = "Found" Then
                    updateOrderStatusInMagento(c)
                End If
            Next
            ModuleLog.Log("Done updating " & list.Count.ToString & " orders.")
        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try
        magento.CloseConn()


    End Sub



    ''' <summary>
    ''' Update Status from an intrasell order to magento order
    ''' </summary>
    ''' <param name="order"></param>
    ''' <remarks></remarks>
    Sub updateOrderStatusInMagento(order As salesOrderListEntity)
        ModuleLog.Log("update order status for magento order_id " & order.increment_id)

        Dim orderDetails As salesOrderEntity = magento.client.salesOrderInfo(magento.sessionid, order.increment_id)

        Dim tam As dsAuftraegeTableAdapters.TableAdapterManager = New dsAuftraegeTableAdapters.TableAdapterManager()
        'tam.Connection = IntraSell_DLL.FunctionsDB.CurrentDB

        Dim t As buchauftragTableAdapter = New buchauftragTableAdapter()
        Dim ta As buchauftrag_artikelTableAdapter = New buchauftrag_artikelTableAdapter()

        Dim dsAuftraege As dsAuftraege = New dsAuftraege()

        tam.Connection = t.Connection

        t.FillByNummer(dsAuftraege.buchauftrag, order.increment_id)
        If dsAuftraege.buchauftrag.Rows.Count > 0 Then
            Dim buchAuftrag As buchauftragRow = dsAuftraege.buchauftrag.Rows(0)
            Dim status = "", notiz = ""
            If Not buchAuftrag Is Nothing Then
                If Not buchAuftrag.IsStatusNull Then
                    status = buchAuftrag.Status
                End If
                If Not buchAuftrag.IsNotizNull Then
                    notiz = buchAuftrag.Notiz
                End If
                'update in Magento
                magento.client.salesOrderAddComment(sessionId:=magento.sessionid, _
                                                    orderIncrementId:=order.increment_id, _
                                                    status:=status, _
                                                    comment:=notiz, _
                                                    notify:=True)

                'add shipment 
                If Not buchAuftrag.IsWohinNull Then 'Rechnung vielleicht existiert 
                    'magento.client.sal
                    If (buchAuftrag.Wohin.StartsWith("AR")) Then

                        Dim rechungsnummer = buchAuftrag.Wohin.Replace("AR", "")

                        'prüfe ob paketnummer existiert 
                        Dim orderPaketnummer As String = intrasell.vars.firstRow("select Value from buchVorgaengeeigenschaften where vorgangtyp='AR' and name ='Paketnummer' and nummer=" & rechungsnummer & "")
                        If Not IsDBNull(orderPaketnummer) Then
                            If Len(orderPaketnummer) > 1 Then
                                'export shipment und nummer 
                                Dim itemsQty() As MagentoSyncService.orderItemIdQty = Nothing

                                'TODO: Items aus der Rechnung exportieren 


                                Dim shipmentIncrementId As String
                                shipmentIncrementId = magento.client.salesOrderShipmentCreate( _
                                                       sessionId:=magento.sessionid, _
                                                       orderIncrementId:=order.increment_id, _
                                                       itemsQty:=itemsQty, _
                                                       comment:=1, _
                                                       email:=1, _
                                                       includeComment:=1)


                                magento.client.salesOrderShipmentAddTrack( _
                                                       sessionId:=magento.sessionid, _
                                                       shipmentIncrementId:=shipmentIncrementId, _
                                                       carrier:="GLS", _
                                                       title:="GLS Paketnummer", _
                                                       trackNumber:=orderPaketnummer)


                            End If
                        End If
                    End If

                End If

            End If
        End If

        'tr.Commit()
        ModuleLog.Log("done update order status for magento order_id " & order.increment_id)
    End Sub

End Class



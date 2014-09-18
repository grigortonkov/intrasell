Imports MagentoSync.dsAuftraegeTableAdapters
Imports MagentoSync.MagentoSyncService
Imports MagentoSync.dsAuftraege

''' <summary>
''' Bestellprozes Synchronisieren
''' </summary>
''' <remarks></remarks>
Public Class OrderSync

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <remarks></remarks>
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
        FormStart.setProgress(0)
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
            Dim counter As Integer = 0
            For i As Int32 = 0 To list.Count - 1
                c = list.ElementAt(i)
                ModuleLog.Log("Found Order " & c.increment_id)
                'Debug.Print("Import Order " & c.shipping_address_id)
                'Import Order in IntraSell 
                Dim orderFound As String = intrasell.vars.firstRow("select 'Found' from buchAuftrag where nummer=" & c.increment_id & "")
                If Not orderFound = "Found" Then
                    buchVorgang_Create_Auftrag(c)
                End If
                counter += 1
                FormStart.setProgress(counter / list.Count)
            Next
            ModuleLog.Log("Done checking/importing " & list.Count.ToString & " orders.")
        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try
        magento.CloseConn()
        FormStart.setProgress(1)

    End Sub


    ''' <summary>
    ''' Auftrag in intraSell anlegen mit Daten aus einem Magento Auftrag
    ''' 
    ''' </summary>
    ''' <param name="order">Magento Auftrag</param>
    ''' <remarks></remarks>
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




    ''' <summary>
    ''' Export Order Status to Magento
    '''  Selects the magento orders from the last X days , 
    '''  checks the order status in intrasell and update the order status in magento 
    ''' 
    ''' </summary>
    ''' <param name="since">'init with this time , timer uses no since  </param>
    ''' <remarks></remarks>
    Public Sub ExportOrderStatus(Optional since As Date = Nothing)

        FormStart.setProgress(0)
        Dim counter As Int16 = 0

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
                counter += 1
                FormStart.setProgress(counter / list.Count)
            Next
            ModuleLog.Log("Done updating " & list.Count.ToString & " orders.")
        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try
        magento.CloseConn()

        FormStart.setProgress(1)
    End Sub



    ''' <summary>
    ''' Update Status from an intrasell order to magento order
    ''' </summary>
    ''' <param name="order"></param>
    ''' <remarks></remarks>
    Sub updateOrderStatusInMagento(order As salesOrderListEntity)
        ModuleLog.Log("update order status for magento order_id " & order.increment_id)

        Try


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
                    'states in magento: new, processing
                    If order.state <> status Then
                        magento.client.salesOrderAddComment(sessionId:=magento.sessionid, _
                                                            orderIncrementId:=order.increment_id, _
                                                            status:=status, _
                                                            comment:=notiz, _
                                                            notify:=True)
                    End If

                    'add shipment 
                    If Not buchAuftrag.IsWohinNull Then 'Rechnung vielleicht existiert 
                        'magento.client.sal
                        If (buchAuftrag.Wohin.StartsWith("AR")) Then

                            Dim rechungsnummer = buchAuftrag.Wohin.Replace("AR", "")

                            'prüfe ob paketnummer existiert 
                            Dim orderPaketnummer As String = intrasell.vars.firstRow("select Value from buchVorgaengeeigenschaften where vorgangtyp='AR' and name ='Paketnummer' and nummer=" & rechungsnummer & "")
                            Dim orderNotiz As String = intrasell.vars.firstRow("select Notiz from buchRechnung where Nummer=" & rechungsnummer & "")

                            If Not IsDBNull(orderPaketnummer) Then
                                If Len(orderPaketnummer) > 1 Then
                                    'export shipment und nummer 
                                    Dim itemsQty() As MagentoSyncService.orderItemIdQty
                                    ReDim itemsQty(orderDetails.items.Count)

                                    'TODO: Items aus der Rechnung exportieren 
                                    Dim i As Int16 = 0
                                    For Each r In orderDetails.items
                                        itemsQty(i) = New MagentoSyncService.orderItemIdQty
                                        itemsQty(i).qty = r.qty_ordered
                                        i = 1 + i
                                    Next

                                    Dim shp = shipmentFromOrder(orderDetails.order_id)
                                    If shp Is Nothing Then


                                        Dim shipmentIncrementId As String


                                        shipmentIncrementId = magento.client.salesOrderShipmentCreate( _
                                                               sessionId:=magento.sessionid, _
                                                               orderIncrementId:=order.increment_id, _
                                                               itemsQty:=Nothing, _
                                                               comment:=orderNotiz, _
                                                               email:=1, _
                                                               includeComment:=1)


                                        magento.client.salesOrderShipmentAddTrack( _
                                                               sessionId:=magento.sessionid, _
                                                               shipmentIncrementId:=shipmentIncrementId, _
                                                               carrier:="GLS", _
                                                               title:="GLS Paketnummer", _
                                                               trackNumber:=orderPaketnummer)
                                    Else
                                        ModuleLog.Log("Shipment already exists")
                                    End If

                                End If
                            End If
                        End If

                    End If

                End If
            End If


            ModuleLog.Log("done update order status for magento order_id " & order.increment_id)
        Catch ex As Exception
            ModuleLog.Log("cannot update order status for magento order_id " & order.increment_id)
            ModuleLog.Log(ex)
        End Try

    End Sub

    ''' <summary>
    ''' returns the last shipment for an order
    ''' </summary>
    ''' <param name="order_increment_id"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function shipmentFromOrder(order_id As String) As salesOrderShipmentEntity

        Dim filter As filters = New filters
        ReDim filter.complex_filter(1)
        filter.complex_filter(0) = New complexFilter
        filter.complex_filter(0).key = "order_id"
        filter.complex_filter(0).value = New associativeEntity()
        filter.complex_filter(0).value.key = "eq"
        filter.complex_filter(0).value.value = order_id

        Dim r As salesOrderShipmentEntity() = magento.client.salesOrderShipmentList(magento.sessionid, filter)

        If r.Count > 0 Then
            Return r(r.Count - 1)
        Else
            Return Nothing
        End If

    End Function
End Class



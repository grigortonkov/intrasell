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
    Public Sub ImportNewOrders(Optional ByVal since As Date = Nothing)
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
            'filter.complex_filter(0) = New complexFilter
            'filter.complex_filter(0).key = "created_at"
            'filter.complex_filter(0).value = New associativeEntity()
            'filter.complex_filter(0).value.key = "gt"
            'filter.complex_filter(0).value.value = toMagentoDateFormat(lastOrderCreated)

            filter.complex_filter(0) = New complexFilter With {.key = "created_at", .value = New associativeEntity With {.key = "from", .value = toMagentoDateFormat(lastOrderCreated)}}

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
            ModuleLog.Log("Error in checking/importing orders.")
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
    Sub buchVorgang_Create_Auftrag(ByVal order As salesOrderListEntity)
        Try
            ModuleLog.Log("create IntraSell Auftrag for magento order_id " & order.increment_id)

            Dim orderDetails As salesOrderEntity = magento.client.salesOrderInfo(magento.sessionid, order.increment_id)

            Dim tam As dsAuftraegeTableAdapters.TableAdapterManager = New dsAuftraegeTableAdapters.TableAdapterManager()

            'tam.Connection = IntraSell_DLL.FunctionsDB.CurrentDB

            Dim t As buchauftragTableAdapter = New buchauftragTableAdapter()
            t.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString

            Dim ta As buchauftrag_artikelTableAdapter = New buchauftrag_artikelTableAdapter()
            ta.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString

            Dim dsAuftraege As dsAuftraege = New dsAuftraege()

            tam.Connection = t.Connection
            tam.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
            't.Fill(dsAuftraege.buchauftrag)
            'ta.Fill(dsAuftraege._buchauftrag_artikel)

            'Import Customer 
            customerSync.magento = magento
            customerSync.ImportNewMagentoCustomer(orderDetails)

            Dim r As buchauftragRow = dsAuftraege.buchauftrag.NewRow()
            r.Status = "neu"
            r.MandantNr = My.MySettings.Default.MandantNr
            If Not order.store_id Is Nothing Then
                r.MandantNr = getIntraSellMandantForStoreName(order.store_name)
            End If
            r.Nummer = order.increment_id
            r.Datum = order.created_at
            r.Bezahlt = 0
            r.Ausgedrukt = 0
            r.anElba = 0
            If Not orderDetails.shipping_description Is Nothing Then
                r.TransportMethode = orderDetails.shipping_description
            End If

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
                Dim mappingMethond = getMappingIS(orderDetails.payment.method)
                If Not mappingMethond Is Nothing Then
                    r.ZahlungsMethode = mappingMethond
                End If
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
                rp.ArtNr = SKU2ArtNr(item.sku) ' item.product_id

                Dim prod = magento.client.catalogProductInfo(magento.sessionid, item.product_id, Nothing, Nothing, "simple")
                rp.Bezeichnung = prod.name

                rp.Stk = toDecimal(item.qty_ordered)
                rp.PreisATS = Math.Round(toDecimal(item.base_price), 2)
                rp.PreisATS_Brutto = Math.Round(toDecimal(item.price) * (100 + toDecimal(item.tax_percent)) / 100, 2)

                dsAuftraege._buchauftrag_artikel.Rows.Add(rp)

                pos = pos + 1

            Next

            'Lieferkosten 
            If toDecimal(orderDetails.shipping_amount) > 0 Then
                Dim rp As dsAuftraege._buchauftrag_artikelRow

                rp = dsAuftraege._buchauftrag_artikel.NewRow()
                rp.ID = pos
                rp.RechNr = r.Nummer
                rp.ArtNr = Description2ArtNr(orderDetails.shipping_method) ' item.product_id
                rp.Bezeichnung = orderDetails.shipping_description

                rp.Stk = 1
                rp.PreisATS = Math.Round(toDecimal(orderDetails.base_shipping_amount), 2)
                rp.PreisATS_Brutto = Math.Round(toDecimal(orderDetails.shipping_amount) * 1.2, 2)

                dsAuftraege._buchauftrag_artikel.Rows.Add(rp)

                pos = pos + 1

                r.Summe = r.Summe + rp.PreisATS
                'r.SummeMWST = r.SummeMWST + rp.PreisATS_Brutto - rp.PreisATS
                r.SummeBrutto = r.SummeBrutto + rp.PreisATS

            End If



            dsAuftraege.WriteXml(My.MySettings.Default.SyncFolder + "magento2intrasell_order_" + orderDetails.order_id + ".xml")

            tam.UpdateAll(dsAuftraege)
            t.Update(dsAuftraege)
            ta.Update(dsAuftraege)

            'tr.Commit()
            ModuleLog.Log("done IntraSell Auftrag for magento order_id " & order.increment_id)
        Catch ex As Exception
            ModuleLog.Log("error IntraSell Auftrag for magento order_id " & order.increment_id)
            ModuleLog.Log(ex)
        End Try
    End Sub




    ''' <summary>
    ''' Export Order Status to Magento
    '''  Selects the magento orders from the last X days , 
    '''  checks the order status in intrasell and update the order status in magento 
    ''' 
    ''' </summary>
    ''' <param name="since">'init with this time , timer uses no since  </param>
    ''' <remarks></remarks>
    Public Sub ExportOrderStatus(Optional ByVal since As Date = Nothing, Optional ByVal order_increment_id As String = Nothing)

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

            If Not order_increment_id Is Nothing Then
                filter.complex_filter(0).key = "increment_id"
                filter.complex_filter(0).value = New associativeEntity()
                filter.complex_filter(0).value.key = "eq"
                filter.complex_filter(0).value.value = (order_increment_id)
            End If
            Dim list As MagentoSyncService.salesOrderListEntity() = magento.client.salesOrderList(magento.sessionid, filter)

            If Not order_increment_id Is Nothing Then
                ModuleLog.Log("Found " & list.Count.ToString & " orders. Going to update order status since " + lastOrderCreated + ".")
            Else
                ModuleLog.Log("Found " & list.Count.ToString & " orders. Going to update order with increment_id " + order_increment_id + ".")
            End If

            lastOrderCreated = Now 'for the next import 
            Dim order As MagentoSyncService.salesOrderListEntity

            For i As Int32 = 0 To list.Count - 1
                order = list.ElementAt(i)
                ModuleLog.Log("Found Order " & order.increment_id)
                'Debug.Print("Import Order " & c.shipping_address_id)
                'Import Order in IntraSell 
                Dim orderFound As String = intrasell.vars.firstRow("select 'Found' from buchAuftrag where nummer=" & order.increment_id & "")
                If orderFound = "Found" Then
                    updateOrderStatusInMagento(order)
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
    Sub updateOrderStatusInMagento(ByVal order As salesOrderListEntity)
        ModuleLog.Log("update order status for magento order_id " & order.increment_id)

        Try


            Dim orderDetails As salesOrderEntity = magento.client.salesOrderInfo(magento.sessionid, order.increment_id)

            Dim tam As dsAuftraegeTableAdapters.TableAdapterManager = New dsAuftraegeTableAdapters.TableAdapterManager()
            tam.Connection = intrasell.MySQLConn

            Dim t As buchauftragTableAdapter = New buchauftragTableAdapter()
            t.Connection = intrasell.MySQLConn
            t.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString
            Dim ta As buchauftrag_artikelTableAdapter = New buchauftrag_artikelTableAdapter()
            ta.Connection = intrasell.MySQLConn
            ta.Connection.ConnectionString = MagentoSync.My.MySettings.Default.intrasell_daten_2ConnectionString

            Dim dsAuftraege As dsAuftraege = New dsAuftraege()

            tam.Connection = t.Connection

            t.FillByNummer(dsAuftraege.buchauftrag, order.increment_id)
            If dsAuftraege.buchauftrag.Rows.Count > 0 Then
                Dim buchAuftrag As buchauftragRow = dsAuftraege.buchauftrag.Rows(0)
                Dim auftragStatus = "", auftragNotiz = ""
                If Not buchAuftrag Is Nothing Then
                    If Not buchAuftrag.IsStatusNull Then
                        auftragStatus = buchAuftrag.Status
                    End If
                    If Not buchAuftrag.IsNotizNull Then
                        auftragNotiz = buchAuftrag.Notiz
                    End If


                    'add shipment 
                    If Not buchAuftrag.IsWohinNull Then 'Rechnung vielleicht existiert 
                        'magento.client.sal
                        If (buchAuftrag.Wohin.StartsWith("AR")) Then

                            auftragStatus = "processing"

                            Dim rechungsnummer = buchAuftrag.Wohin.Replace("AR", "")

                            'prüfe ob paketnummer existiert 
                            Dim rechnungPaketnummer As String = intrasell.vars.firstRow("select Value from buchVorgaengeeigenschaften where vorgangtyp='AR' and name ='Paketnummer' and nummer=" & rechungsnummer & "")
                            Dim rechnungNotiz As String = intrasell.vars.firstRow("select Notiz from buchRechnung where Nummer=" & rechungsnummer & "")

                            If Not IsDBNull(rechnungPaketnummer) Then
                                If Len(rechnungPaketnummer) > 1 Then
                                    auftragStatus = "delivered"
                                    auftragNotiz = auftragNotiz & " Shipment Tracking ID:" & rechnungPaketnummer
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
                                                               comment:=rechnungNotiz, _
                                                               email:=1, _
                                                               includeComment:=1)


                                        magento.client.salesOrderShipmentAddTrack( _
                                                               sessionId:=magento.sessionid, _
                                                               shipmentIncrementId:=shipmentIncrementId, _
                                                               carrier:="GLS", _
                                                               title:="GLS Paketnummer", _
                                                               trackNumber:=rechnungPaketnummer)
                                    Else
                                        ModuleLog.Log("Shipment already exists")
                                    End If

                                End If
                            End If
                        End If

                    End If

                    'Update Order in Magento 

                    'update in Magento
                    'states in Magento: new, processing
                    If order.state <> auftragStatus Then
                        magento.client.salesOrderAddComment(sessionId:=magento.sessionid, _
                                                            orderIncrementId:=order.increment_id, _
                                                            status:=auftragStatus, _
                                                            comment:=auftragNotiz, _
                                                            notify:=True)
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
    Function shipmentFromOrder(ByVal order_id As String) As salesOrderShipmentEntity

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



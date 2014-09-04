
Imports IntraSell_Net
Imports MagentoSync.MagentoSyncService
Imports IntraSell_Net.dsAdressen
Imports IntraSell_Net.dsAdressenTableAdapters
Imports IntraSell_DLL

Public Class CustomerSync
    Public magento As MagentoConn = New MagentoConn
    Public intrasell As IntraSellConn = New IntraSellConn

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="justIDNR"></param>
    ''' <remarks></remarks>
    Public Sub InitialExportAllIntraSellCustomers(Optional justIDNR As String = Nothing)
        'export all customers from intrasell to magenot 
        ModuleLog.Log("Start export all is customers")

        Try
            'read customers from intrasell 
            intrasell.init()

            Dim ta As dsAdressenTableAdapters.ofadressenTableAdapter = New dsAdressenTableAdapters.ofadressenTableAdapter
            Dim taWeitere As dsAdressenTableAdapters.ofadressen_weitereTableAdapter = New dsAdressenTableAdapters.ofadressen_weitereTableAdapter
            Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable
            Dim dataWeitere As dsAdressen._ofadressen_weitereDataTable = New dsAdressen._ofadressen_weitereDataTable
            If String.IsNullOrEmpty(justIDNR) Then
                ta.Fill(data)
                taWeitere.Fill(dataWeitere)
            Else
                ta.FillByIDNR(data, justIDNR)
                taWeitere.FillByIDNR(dataWeitere, justIDNR)
            End If


            For Each ISCustomer As dsAdressen.ofadressenRow In data
                If Not ISCustomer.IsEmailNull Then
                    ModuleLog.Log("Export IDNR=" & ISCustomer.IDNR & " and Email=" & ISCustomer.Email)

                    'export to magento 
                    Dim magentoCustomer = New MagentoSync.MagentoSyncService.customerCustomerEntityToCreate
                    magentoCustomer.customer_id = ISCustomer.IDNR
                    If Not ISCustomer.IsVornameNull Then magentoCustomer.firstname = ISCustomer.Vorname
                    If Not ISCustomer.IsNameNull Then magentoCustomer.lastname = ISCustomer.Name
                    If Not ISCustomer.IsEmailNull Then magentoCustomer.email = ISCustomer.Email
                    If Not ISCustomer.IsPasswortNull Then
                        If ISCustomer.Passwort.Length >= 6 Then
                            magentoCustomer.password = ISCustomer.Passwort
                        Else
                            magentoCustomer.password = "asdfgh" & ISCustomer.Passwort
                        End If
                    Else
                        magentoCustomer.password = "asdf" & (ISCustomer.IDNR * 2 + 4000000) 'something 
                    End If

                    Dim preisliste = intrasell.vars.firstRow("select Preisliste from `ofAdressen-Settings` where idnr = " & ISCustomer.IDNR)

                    magentoCustomer.group_id = MagentoUtils.getMagentoCustomerGroup(preisliste).customer_group_id


                    Dim filter As filters = New filters
                    ReDim filter.complex_filter(1)
                    filter.complex_filter(0) = New complexFilter
                    filter.complex_filter(0).key = "Email"
                    filter.complex_filter(0).value = New associativeEntity()
                    filter.complex_filter(0).value.key = "eq"
                    filter.complex_filter(0).value.value = ISCustomer.Email
                    'filter.complex_filter "Email='" & ISCustomer.Email & "'")
                    magento.OpenConn()

                    Dim found As customerCustomerEntity() = magento.client.customerCustomerList(magento.sessionid, filter)
                    If found.Length = 0 Then
                        ModuleLog.Log("customerCustomerCreate IDNR=" & ISCustomer.IDNR & " and Email=" & ISCustomer.Email)
                        Dim customerId = magento.client.customerCustomerCreate(magento.sessionid, magentoCustomer)



                        Dim billingAdresseFound = False
                        Dim shippingAdresseFound = False
                        'weitere adressefelder 
                        taWeitere.FillByIDNR(dataWeitere, ISCustomer.IDNR)
                        For Each ISCustomerWeitere As dsAdressen._ofadressen_weitereRow In dataWeitere
                            If Not ISCustomerWeitere.IsTypNull Then
                                Dim magentoAddress = New MagentoSync.MagentoSyncService.customerAddressEntityCreate
                                If Not ISCustomerWeitere.IsVornameNull Then magentoAddress.firstname = ISCustomerWeitere.Vorname
                                If Not ISCustomerWeitere.IsNameNull Then magentoAddress.lastname = ISCustomerWeitere.Name
                                If Not ISCustomerWeitere.IsAdresseNull Then magentoAddress.street = New String() {ISCustomerWeitere.Adresse}
                                If Not ISCustomerWeitere.IsOrtNull Then magentoAddress.city = ISCustomerWeitere.Ort
                                If Not ISCustomerWeitere.IsPLZNull Then magentoAddress.postcode = ISCustomerWeitere.PLZ
                                If Not ISCustomerWeitere.IsLandNull Then magentoAddress.country_id = getMagentoCountry(ISCustomerWeitere.Land)

                                If Not ISCustomerWeitere.IsTelNull Then magentoAddress.telephone = ISCustomerWeitere.Tel
                                If Not ISCustomerWeitere.IsFaxNull Then magentoAddress.fax = ISCustomerWeitere.Fax
                                If Not ISCustomerWeitere.IsFirmaNull Then magentoAddress.company = ISCustomerWeitere.Firma

                                If ISCustomerWeitere.Typ = "LI" Then
                                    magentoAddress.is_default_shipping = True
                                    shippingAdresseFound = True
                                End If
                                If ISCustomerWeitere.Typ = "AR" Then
                                    magentoAddress.is_default_billing = True
                                    billingAdresseFound = True
                                End If
                                If Not magentoAddress.country_id Is Nothing Then
                                    magento.client.customerAddressCreate(magento.sessionid, customerId, magentoAddress)
                                End If
                            End If
                        Next



                        If True Then
                            Dim magentoAddress = New MagentoSync.MagentoSyncService.customerAddressEntityCreate
                            If Not ISCustomer.IsVornameNull Then magentoAddress.firstname = ISCustomer.Vorname
                            If Not ISCustomer.IsNameNull Then magentoAddress.lastname = ISCustomer.Name
                            If Not ISCustomer.IsAdresseNull Then magentoAddress.street = New String() {ISCustomer.Adresse}
                            If Not ISCustomer.IsOrtNull Then magentoAddress.city = ISCustomer.Ort
                            If Not ISCustomer.IsPLZNull Then magentoAddress.postcode = ISCustomer.PLZ
                            If Not ISCustomer.IsLandNull Then magentoAddress.country_id = getMagentoCountry(ISCustomer.Land)

                            If Not ISCustomer.IsTelNull Then magentoAddress.telephone = ISCustomer.Tel
                            If Not ISCustomer.IsFaxNull Then magentoAddress.fax = ISCustomer.Fax
                            If Not ISCustomer.IsFirmaNull Then magentoAddress.company = ISCustomer.Firma

                            magentoAddress.is_default_billing = Not billingAdresseFound
                            magentoAddress.is_default_shipping = Not shippingAdresseFound
                            If Not magentoAddress.country_id Is Nothing Then
                                magento.client.customerAddressCreate(magento.sessionid, customerId, magentoAddress)
                            End If
                        End If

                    Else
                        ModuleLog.Log("customer with this email already exists IDNR=" & ISCustomer.IDNR & " and Email=" & ISCustomer.Email)
                    End If
                End If
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try

        magento.CloseConn()
    End Sub

    'Imports Customer from Order 
    Public Sub ImportNewMagentoCustomer(order As salesOrderEntity)
        ModuleLog.Log("Start import magento customer for order " & order.order_id)

        intrasell.init()

        Dim tam As dsAdressenTableAdapters.TableAdapterManager = New dsAdressenTableAdapters.TableAdapterManager()

        'check if customer is existing 
        Dim dsAdr As dsAdressen = New dsAdressen

        Dim ta As ofadressenTableAdapter = New ofadressenTableAdapter
        Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable

        Dim taWeitere As ofadressen_weitereTableAdapter = New ofadressen_weitereTableAdapter
        Dim dataShipping As dsAdressen._ofadressen_weitereDataTable = New dsAdressen._ofadressen_weitereDataTable


        Dim t As dsAuftraegeTableAdapters.buchauftragTableAdapter = New dsAuftraegeTableAdapters.buchauftragTableAdapter()
        tam.Connection = t.Connection

        Dim idnr = intrasell.vars.firstRow("select idnr from ofAdressen where Email = '" & order.customer_email & "'")


        ta.FillByIDNR(data, idnr)
        'create customer if not existing 
        If data.Rows.Count = 0 Then
            ModuleLog.Log("Create customer with Email " & order.customer_email)
            'create customer with this shipping and invoice address 
            Dim newCustomer As ofadressenRow = dsAdr.ofadressen.NewofadressenRow

            newCustomer.IDNR = order.customer_id
            newCustomer.Name = order.customer_lastname
            newCustomer.Vorname = order.customer_firstname
            newCustomer.Email = order.customer_email

            'Dim invoiceAddress As customerAddressEntityItem = magento.client.customerAddressInfo(magento.sessionid, order.billing_address_id)
            Dim invoiceLand As String = intrasell.vars.firstRow("select idnr from grLand where iso2='" & order.billing_address.country_id & "'")
            newCustomer.Land = invoiceLand
            newCustomer.Adresse = order.billing_address.street
            newCustomer.PLZ = intrasell.kunden.getPLZCreateIfNeeded(invoiceLand, order.billing_address.city, order.billing_address.postcode)
            newCustomer.Ort = order.billing_address.city
            newCustomer.Tel = order.billing_address.telephone

            dsAdr.ofadressen.Rows.Add(newCustomer)

          

        Else
            ModuleLog.Log("won't update, customer with Email exists " & order.customer_email)
            'TODO update what ? 
            ta.FillByIDNR(dsAdr.ofadressen, idnr)
        End If


        'Lieferadresse 
        If order.shipping_address_id <> order.billing_address_id Then


            Dim exists = intrasell.vars.firstRow("select max(id) from `ofAdressen-weitere` where IDNR=" & idnr & " and Adresse='" & order.shipping_address.street & "' and Typ ='LI'")
            If IsDBNull(exists) Then


                'Create new Address 


                Dim newCustomerShipping As _ofadressen_weitereRow = dsAdr._ofadressen_weitere.New_ofadressen_weitereRow
                newCustomerShipping.IDNR = idnr 'order.customer_id
                newCustomerShipping.Typ = "LI"
                ' Dim shippingAddress As customerAddressEntityItem = magento.client.customerAddressInfo(magento.sessionid, order.shipping_address_id)
                newCustomerShipping.Land = intrasell.vars.firstRow("select idnr from grLand where iso2='" & order.shipping_address.country_id & "'")
                newCustomerShipping.Adresse = order.shipping_address.street
                newCustomerShipping.PLZ = intrasell.kunden.getPLZCreateIfNeeded(newCustomerShipping.Land, order.shipping_address.city, order.shipping_address.postcode)
                newCustomerShipping.Ort = order.shipping_address.city

                newCustomerShipping.Tel = order.shipping_address.telephone

                dsAdr._ofadressen_weitere.Rows.Add(newCustomerShipping)
            End If
        End If


        dsAdr.WriteXml(My.MySettings.Default.SyncFolder + "magento2intrasell_customer_" + order.order_id + ".xml")

        tam.UpdateAll(dsAdr)
        ta.Update(dsAdr.ofadressen)
        taWeitere.Update(dsAdr._ofadressen_weitere)
        ModuleLog.Log("Done import magento customer for order " & order.order_id)
    End Sub

    Public Sub ImportNewMagentoCustomers()

        magento.OpenConn()
        Try
            Dim list As MagentoSyncService.customerCustomerEntity() = magento.client.customerCustomerList(magento.sessionid, Nothing)
            ModuleLog.Log("Found " & list.Count.ToString & " customers.")
            Dim c As MagentoSyncService.customerCustomerEntity

            For i As Int32 = 0 To list.Count - 1
                c = list.ElementAt(i)
                ModuleLog.Log("Firstname " & c.firstname)
            Next
        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try
        magento.CloseConn()

    End Sub

End Class

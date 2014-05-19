
Imports IntraSell_Net
Imports MagentoSync.MagentoSyncService
Imports IntraSell_Net.dsAdressen
Imports IntraSell_Net.dsAdressenTableAdapters
Imports IntraSell_DLL

Public Class CustomerSync
    Public magento As MagentoConn = New MagentoConn
    Public intrasell As IntraSellConn = New IntraSellConn

    Public Sub InitialExportAllIntraSellCustomers()
        'export all customers from intrasell to magenot 

        Try
            'read customers from intrasell 

            Dim ta As dsAdressenTableAdapters.ofadressenTableAdapter = New dsAdressenTableAdapters.ofadressenTableAdapter
            Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable

            ta.Fill(data)

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
                            magentoCustomer.password = "asdfgh" + ISCustomer.Passwort
                        End If

                    Else
                        magentoCustomer.password = "asdf" + (ISCustomer.IDNR * 2 + 4000000) 'something 
                    End If

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
                    End If

                    If False Then
                        Dim magentoAddress = New MagentoSync.MagentoSyncService.customerAddressEntityCreate
                        magentoAddress.firstname = ISCustomer.Vorname
                        magentoAddress.lastname = ISCustomer.Name
                        magentoAddress.street(0) = ISCustomer.Adresse
                        magentoAddress.city = ISCustomer.Ort
                        magentoAddress.postcode = ISCustomer.PLZ
                        magentoAddress.country_id = ISCustomer.Land
                        'magentoAddress.is_default_billing
                        'magentoAddress.is_default_shipping

                        'magento.client.customerAddressCreate(magento.sessionid, customerId, magentoAddress)
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


        ta.FillByIDNR(data, order.customer_id)
        'create customer if not existing 
        If data.Rows.Count = 0 Then
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

            'Lieferadresse 
            If order.shipping_address_id <> order.billing_address_id Then
                'Create new Address 
                Dim newCustomerShipping As _ofadressen_weitereRow = dsAdr._ofadressen_weitere.New_ofadressen_weitereRow
                newCustomerShipping.IDNR = order.customer_id

                ' Dim shippingAddress As customerAddressEntityItem = magento.client.customerAddressInfo(magento.sessionid, order.shipping_address_id)
                newCustomerShipping.Land = intrasell.vars.firstRow("select idnr from grLand where iso2='" & order.shipping_address.country_id & "'")
                newCustomerShipping.Adresse = order.shipping_address.street
                newCustomerShipping.PLZ = intrasell.kunden.getPLZCreateIfNeeded(newCustomerShipping.Land, order.shipping_address.city, order.shipping_address.postcode)
                newCustomerShipping.Ort = order.shipping_address.city

                newCustomerShipping.Tel = order.shipping_address.telephone

                dsAdr._ofadressen_weitere.Rows.Add(newCustomerShipping)
            End If

        Else
            'TODO update what ? 
        End If

        tam.UpdateAll(dsAdr)
        ta.Update(dsAdr.ofadressen)
        taWeitere.Update(dsAdr._ofadressen_weitere)

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

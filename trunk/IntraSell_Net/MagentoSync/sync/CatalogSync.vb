
Imports IntraSell_Net
Imports MagentoSync.MagentoSyncService
Imports System.IO
Imports System.Drawing.Imaging

Public Class CatalogSync
    Dim magento As MagentoConn = New MagentoConn
    Public intrasell As IntraSellConn = New IntraSellConn
    Dim tree As catalogCategoryTree = Nothing ' cache for the cats
    Dim dataCats As dsArtikel._grartikel_kategorienDataTable = New dsArtikel._grartikel_kategorienDataTable


    Public Sub InitialExportAllCategories()
        'export all categories from intrasell to magento 


        Try
            intrasell.init()
            'read categories from intrasell 
            Dim ta As dsArtikelTableAdapters.grartikel_kategorienTableAdapter = New dsArtikelTableAdapters.grartikel_kategorienTableAdapter
            Dim data As dsArtikel._grartikel_kategorienDataTable = New dsArtikel._grartikel_kategorienDataTable

            ta.Fill(data)
            For Each ISCategory As dsArtikel._grartikel_kategorienRow In data
                If Not ISCategory.IsNameNull Then
                    ModuleLog.Log("Export ArtKatNR=" & ISCategory.ArtKatNr & " and Name=" & ISCategory.Name)

                    'export to magento 
                    Dim magentoCatalog = New MagentoSync.MagentoSyncService.catalogCategoryEntityCreate
                    magentoCatalog.name = ISCategory.Name

                    If Not ISCategory.IsDescNull Then magentoCatalog.description = ISCategory.Desc
                    magentoCatalog.is_activeSpecified = True
                    magentoCatalog.is_active = 1
                    magentoCatalog.is_anchorSpecified = True
                    magentoCatalog.is_anchor = 1
                    magentoCatalog.include_in_menu = 1
                    magentoCatalog.include_in_menuSpecified = True
                    ReDim magentoCatalog.available_sort_by(1)
                    magentoCatalog.available_sort_by = {"Best Value"}
                    magentoCatalog.default_sort_by = "Best Value"
                    Dim value = intrasell.vars.firstRow("select description from `grartikel-kategorien` where ArtKatNr = " & ISCategory.ArtKatNr)
                    If Not IsDBNull(value) Then
                        magentoCatalog.meta_description = value
                    End If
                    value = intrasell.vars.firstRow("select keywords from `grartikel-kategorien` where ArtKatNr = " & ISCategory.ArtKatNr)
                    If Not IsDBNull(value) Then
                        magentoCatalog.meta_keywords = value
                    End If
                    'magentoCatalog.meta_title


                    Dim filter As filters = New filters
                    ReDim filter.complex_filter(1)
                    filter.complex_filter(0) = New complexFilter
                    filter.complex_filter(0).key = "Name"
                    filter.complex_filter(0).value = New associativeEntity()
                    filter.complex_filter(0).value.key = "eq"
                    filter.complex_filter(0).value.value = ISCategory.Name

                    'filter.complex_filter "Email='" & ISCustomer.Email & "'")

                    magento.OpenConn()

                    Dim found As catalogCategoryEntity = findMagentoCatByName(ISCategory.Name)

                    Dim parentCat As catalogCategoryEntity = findMagentoCatByName(findISCatByID(ISCategory.ArtKatNrParent))
                    Dim parentCatId As String
                    If parentCat Is Nothing Then parentCatId = "3" Else parentCatId = parentCat.category_id '"3=Root Catalog"
                    If found Is Nothing Then
                        ModuleLog.Log("Create ArtKatNr=" & ISCategory.ArtKatNr & " and Name=" & ISCategory.Name)
                        Dim catalogId = magento.client.catalogCategoryCreate(magento.sessionid, parentCatId, magentoCatalog, Nothing) '1 is root category 
                        tree = Nothing
                    Else
                        ModuleLog.Log("Update ArtKatNr=" & ISCategory.ArtKatNr & " and Name=" & ISCategory.Name)
                        magento.client.catalogCategoryUpdate(magento.sessionid, found.category_id, magentoCatalog, Nothing) '1 is root category 
                    End If

                End If
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        Finally
            magento.CloseConn()
        End Try

    End Sub

    'returns category id by name existing in magento 
    Private Function findMagentoCatByName(name As String) As catalogCategoryEntity
        magento.OpenConn()
        If tree Is Nothing Then tree = magento.client.catalogCategoryTree(magento.sessionid, Nothing, Nothing)
        Return findByNameRecursive(name, tree.children)
    End Function

    Private Function findByNameRecursive(name As String, ByRef children As catalogCategoryEntity()) As catalogCategoryEntity
        If children Is Nothing Then Return Nothing
        For Each c As catalogCategoryEntity In children
            If c.name = name Then
                Return c
            Else
                Dim result As catalogCategoryEntity = findByNameRecursive(name, c.children)
                If Not result Is Nothing Then Return result
            End If
        Next
        Return Nothing
    End Function

    'returns intraSell catname 
    Private Function findISCatByID(artKatNr As String) As String
        'load IS cats 
        If dataCats.Rows.Count = 0 Then
            Dim taCat As dsArtikelTableAdapters.grartikel_kategorienTableAdapter = New dsArtikelTableAdapters.grartikel_kategorienTableAdapter
            taCat.Fill(dataCats)
        End If
        For Each c In dataCats
            If c.ArtKatNr = artKatNr Then Return c.Name
        Next
        Return Nothing
    End Function


    Public Sub InitialExportAllProducts(Optional justEAN As String = Nothing)
        'export all products from intrasell to magento 
        Try
            intrasell.init()

            'read categories from intrasell 
            Dim ta As dsArtikelTableAdapters.grartikelTableAdapter = New dsArtikelTableAdapters.grartikelTableAdapter
            Dim data As dsArtikel.grartikelDataTable = New dsArtikel.grartikelDataTable

            If IsNothing(justEAN) Or justEAN = "" Then
                ta.Fill(data)
            Else
                ta.FillByEAN(data, justEAN)
            End If

            'TODO Bild
            'TODO Englischer Sprache
            For Each ISArtikel As dsArtikel.grartikelRow In data
                If Not ISArtikel.Bezeichnung Is Nothing And ISArtikel.ProduktAktivOnline And Not IsDBNull(ISArtikel.EAN) Then
                    ModuleLog.Log("Export ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)

                    Dim magentoProduct = New MagentoSync.MagentoSyncService.catalogProductCreateEntity

                    magentoProduct.name = ISArtikel.Bezeichnung '.Replace("'", "*")

                    'ReDim magentoProduct.category_ids(1) : magentoProduct.category_ids = {ISArtikel.ArtKatNr}
                    magentoProduct.categories = {findISCatByID(ISArtikel.ArtKatNr)}

                    If Not ISArtikel.IsBeschreibungNull Then
                        Dim desc = ISArtikel.Bezeichnung & " " & " EAN:" & ISArtikel.EAN & " " & ISArtikel.Beschreibung
                        magentoProduct.description = desc
                        magentoProduct.short_description = ISArtikel.Beschreibung
                    End If


                    magentoProduct.price = Replace(ISArtikel.PreisATS, ",", ".")
                    magentoProduct.status = My.MySettings.Default.Magento_product_status
                    magentoProduct.tax_class_id = My.MySettings.Default.Magento_product_tax_class_id
                    magentoProduct.visibility = My.MySettings.Default.Magento_product_visibility 'catalog and search.

                    'magentoProduct.meta_title
                    Try
                        magentoProduct.meta_description = intrasell.vars.firstRow("select description from `grArtikel-htmlinfo` where Artnr = " & ISArtikel.ArtNr)
                    Catch ex As Exception
                    End Try
                    Try
                        magentoProduct.meta_keyword = intrasell.vars.firstRow("select keywords from `grArtikel-htmlinfo` where Artnr = " & ISArtikel.ArtNr)
                    Catch ex As Exception
                    End Try

                    If Not ISArtikel.IsGewichtNull Then
                        magentoProduct.weight = ISArtikel.Gewicht.ToString.Replace(",", ".")
                    Else
                        magentoProduct.weight = 1
                    End If


                    Dim filter As filters = New filters
                    ReDim filter.complex_filter(1)
                    filter.complex_filter(0) = New complexFilter
                    filter.complex_filter(0).key = "SKU"
                    filter.complex_filter(0).value = New associativeEntity()
                    filter.complex_filter(0).value.key = "eq"
                    filter.complex_filter(0).value.value = ISArtikel.EAN

                    magento.OpenConn()

                    'export to magento : get set  
                    Dim defaultSet As catalogProductAttributeSetEntity = Nothing
                    Dim attributeSets As catalogProductAttributeSetEntity() = magento.client.catalogProductAttributeSetList(magento.sessionid)
                    For Each s In attributeSets
                        If s.name = "Default" Then
                            defaultSet = s
                        End If
                    Next

                    Dim found As catalogProductEntity()
                    ReDim found(1)

                    magento.client.catalogProductList(found, magento.sessionid, filter, Nothing)

                    If found.Length = 0 Then
                        ModuleLog.Log("catalogProductCreate ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)
                        Dim catalogId = magento.client.catalogProductCreate(sessionId:=magento.sessionid, _
                                                                         type:="simple", _
                                                                         [set]:=defaultSet.set_id, _
                                                                         sku:=ISArtikel.EAN, _
                                                                         productData:=magentoProduct, _
                                                                         storeView:=Nothing)

                        loadimage(ISArtikel.ArtNr, catalogId, My.MySettings.Default.productimages, "small_image")
                        loadimage(ISArtikel.ArtNr, catalogId, My.MySettings.Default.productimagesLarge, "image")
                        exportGroupPrices(ISArtikel.ArtNr, found(0).product_id)
                    Else 'update 
                        ModuleLog.Log("catalogProductUpdate ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)
                        'agento.client.catalogProduct
                        magento.client.catalogProductUpdate(sessionId:=magento.sessionid, _
                                                            product:=found(0).product_id, _
                                                            productData:=magentoProduct, _
                                                                         storeView:=Nothing, _
                                                                         identifierType:="productId")

                        loadimage(ISArtikel.ArtNr, found(0).product_id, My.MySettings.Default.productimages, "small_image")
                        loadimage(ISArtikel.ArtNr, found(0).product_id, My.MySettings.Default.productimagesLarge, "image")
                        exportGroupPrices(ISArtikel.ArtNr, found(0).product_id)

                    End If

                    'link category 
                    Dim magentoCat = findMagentoCatByName(findISCatByID(ISArtikel.ArtKatNr))
                    Dim magentoCategoryId As Integer = 1
                    If Not magentoCat Is Nothing Then
                        magentoCategoryId = magentoCat.category_id
                    Else
                        ModuleLog.Log("Missing intraSell category in magento. Name: " & findISCatByID(ISArtikel.ArtKatNr))
                    End If

                    magento.client.catalogCategoryAssignProduct(sessionId:=magento.sessionid, categoryId:=magentoCategoryId, product:=ISArtikel.EAN, position:=0, identifierType:="SKU")


                Else
                    ModuleLog.Log("Won't Export ArtNr=" & ISArtikel.ArtNr & " because missing name, not online or EAN not set!")
                End If
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        Finally
            magento.CloseConn()
        End Try

    End Sub


    ''' <summary>
    ''' Read file and covert tobase 64
    ''' </summary>
    ''' <param name="filename"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function readFileASbase64_(filename As String) As String
        '# Example in vb.net:
        Dim str_file As String
        Dim arr_data() As Byte
        Dim str_base64 As String

        str_file = New System.IO.StreamReader(filename).ReadToEnd.ToString
        arr_data = System.Text.Encoding.UTF8.GetBytes(str_file)
        str_base64 = Convert.ToBase64String(arr_data)
        Return str_base64
        'Dim fs_outputfile As New System.IO.StreamWriter(filename) '"test-base64.txt")
        'fs_outputfile.Write(str_base64)
        'fs_outputfile.Close()
    End Function


    Function readFileASbase64(filename As String) As String

        Dim imageStream As MemoryStream = New MemoryStream()
        Dim i As Image = Image.FromFile(filename)
        i.Save(imageStream, ImageFormat.Gif)
        Dim encbuff As Byte() = imageStream.ToArray()
        Return Convert.ToBase64String(encbuff, 0, encbuff.Length)
    End Function

    ''' <summary>
    ''' Loadimage to this product 
    ''' </summary>
    ''' <param name="ArtNr"></param>
    ''' <param name="magentoProductId"></param>
    ''' <remarks></remarks>
    Private Sub loadimage(ByVal ArtNr As String, ByVal magentoProductId As String, ByVal folder As String, ByVal imageType As String)
        'TODO  what if the image already loaded
        Try

            'add image if any found 
            Dim productimageFile = folder & ArtNr & ".gif"
            'just for test
            'productimageFile = My.MySettings.Default.productimages & "clock.gif"

            If IO.File.Exists(productimageFile) Then
                ModuleLog.Log("load image for ArtNr=" & ArtNr & " and filename=" & productimageFile)

                Dim image As catalogProductAttributeMediaCreateEntity = New catalogProductAttributeMediaCreateEntity
                image.file = New catalogProductImageFileEntity
                'image.file.name = productimageFile
                image.file.content = readFileASbase64(productimageFile)
                image.file.mime = "image/gif"
                image.label = imageType & " for " & ArtNr '"image label"
                image.position = 0
                image.types = {"thumbnail", imageType} '"small_image", "image"
                image.exclude = 0

                Dim list As MagentoSyncService.catalogProductImageEntity() = magento.client.catalogProductAttributeMediaList(sessionId:=magento.sessionid, _
                                                                  product:=magentoProductId, _
                                                                  identifierType:="productId", _
                                                                  storeView:=Nothing)
                Dim found = False 'exists in magento 
                For Each i In list
                    If i.label = image.label Then
                        found = True
                    End If
                Next

                If Not found Then
                    magento.client.catalogProductAttributeMediaCreate(sessionId:=magento.sessionid, _
                                                                  product:=magentoProductId, _
                                                                  data:=image, _
                                                                  identifierType:="productId", _
                                                                  storeView:=Nothing)
                End If

            Else
                ModuleLog.Log("image not found for ArtNr=" & ArtNr & " and filename=" & productimageFile)
            End If

        Catch ex As Exception
            ModuleLog.Log(ex)

        End Try
    End Sub


    ''' <summary>
    ''' Loadimage to this product 
    ''' </summary>
    ''' <param name="ArtNr"></param>
    ''' <param name="magentoProductId"></param>
    ''' <remarks></remarks>
    Private Sub exportGroupPrices(ByVal ArtNr As String, ByVal magentoProductId As String)

        Try

            ModuleLog.Log("exportGroupPrices for ArtNr=" & ArtNr)



            intrasell.init()

            'read categories from intrasell 
            Dim ta As dsArtikelTableAdapters.grartikel_vkpreisperselectionTableAdapter = New dsArtikelTableAdapters.grartikel_vkpreisperselectionTableAdapter
            Dim data As dsArtikel._grartikel_vkpreisperselectionDataTable = New dsArtikel._grartikel_vkpreisperselectionDataTable

            If IsNothing(ArtNr) Or ArtNr = "" Then
                ta.Fill(data)
            Else
                ta.FillByArtNr(data, ArtNr)
            End If

            Dim listOfPrices(data.Count - 1) As MagentoSyncService.catalogProductTierPriceEntity
            Dim i = 0
            For Each priceIS As dsArtikel._grartikel_vkpreisperselectionRow In data
                If Not (priceIS.IsVKPreisNull) Then
                    Dim price As catalogProductTierPriceEntity = New catalogProductTierPriceEntity
                    price.customer_group_id = getMagentoCustomerGroup(priceIS.PreislisteName).customer_group_id
                    price.price = priceIS.VKPreis
                    price.priceSpecified = True
                    If priceIS.IsStkAbNull Then price.qty = 1 Else price.qty = priceIS.StkAb
                    If price.qty <= 0 Then price.qty = 1
                    price.qtySpecified = True
                    'price.website = 
                    listOfPrices(i) = price
                    i = i + 1
                End If
            Next

            Dim list As MagentoSyncService.catalogProductTierPriceEntity() = magento.client.catalogProductAttributeTierPriceInfo( _
                                                                  sessionId:=magento.sessionid, _
                                                                  product:=magentoProductId, _
                                                                  identifierType:="productId")
            Dim found = False 'exists in magento 
            For Each element In list
                'If i.label = image.label Then
                found = True
                'End If
            Next

            'If Not found Then
            magento.client.catalogProductAttributeTierPriceUpdate(sessionId:=magento.sessionid, _
                                                              product:=magentoProductId, _
                                                              tier_price:=listOfPrices, _
                                                              identifierType:="productId")
            'End If



        Catch ex As Exception
            ModuleLog.Log(ex)

        End Try
    End Sub




    Sub ExportProductLagerstand(justEAN As String)
        'export all products from intrasell to magento 
        Try
            intrasell.init()

            'read categories from intrasell 
            Dim ta As dsArtikelTableAdapters.grartikelTableAdapter = New dsArtikelTableAdapters.grartikelTableAdapter
            Dim data As dsArtikel.grartikelDataTable = New dsArtikel.grartikelDataTable

            If IsNothing(justEAN) Or justEAN = "" Then
                ta.Fill(data)
            Else
                ta.FillByEAN(data, justEAN)
            End If

            For Each ISArtikel As dsArtikel.grartikelRow In data
                If Not ISArtikel.Bezeichnung Is Nothing And ISArtikel.ProduktAktivOnline And Not IsDBNull(ISArtikel.EAN) Then
                    ModuleLog.Log("Export Lagerstand ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)

                    Dim magentoStock = New MagentoSync.MagentoSyncService.catalogInventoryStockItemUpdateEntity


                    magentoStock.is_in_stock = ISArtikel.LagerArtikel
                    Dim value = intrasell.vars.firstRow("select sum(Lagerbestand) from `grartikel-lagerbestand` where ArtNr = " & ISArtikel.ArtNr)
                    magentoStock.qty = value

                    magento.OpenConn()

                    'Dim filter As filters = New filters
                    'ReDim filter.complex_filter(1)
                    'filter.complex_filter(0) = New complexFilter
                    'filter.complex_filter(0).key = "SKU"
                    'filter.complex_filter(0).value = New associativeEntity()
                    'filter.complex_filter(0).value.key = "eq"
                    'filter.complex_filter(0).value.value = ISArtikel.EAN


                    'Dim found As catalogInventoryStockItemEntity()
                    'ReDim found(1)

                    'found = magento.client.catalogInventoryStockItemList(magento.sessionid, New String() {ISArtikel.ArtNr.ToString})

                    'If found.Length = 0 Then
                    '    ModuleLog.Log("ExportProductLagerstand ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)
                    '    Dim catalogId = magento.client.catalogInventoryStockItemUpdate(sessionId:=magento.sessionid, _
                    '                                                      product:=ISArtikel.EAN, _
                    '                                                     data:=magentoStock)


                    'Else 'update 
                    If (IsNumeric(value)) Then

                        ModuleLog.Log("ExportProductLagerstand ArtNr=" & ISArtikel.ArtNr & " and Name=" & ISArtikel.Bezeichnung)

                        magento.client.catalogInventoryStockItemUpdate(sessionId:=magento.sessionid, _
                                                                       product:=ISArtikel.EAN, _
                                                                       data:=magentoStock)


                    End If

                    'End If

                Else
                    ModuleLog.Log("Won't Export ArtNr=" & ISArtikel.ArtNr & " because missing name, not online or EAN not set!")
                End If
            Next

        Catch ex As Exception
            ModuleLog.Log(ex)
        Finally
            magento.CloseConn()
        End Try
    End Sub

End Class

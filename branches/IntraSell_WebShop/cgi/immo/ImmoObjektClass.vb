Public Class ImmoObjektClass
    Public objConnection As Microsoft.Data.Odbc.OdbcConnection
    Public command As Microsoft.Data.Odbc.OdbcCommand
    Dim db As IntraSellDB

    Const NOT_DEFINED = "n.a."
    Public ArtNr As String 'Objekt Nummer in der Datenabank 

    Public Function getArtKatNr(ByVal hauptKat, ByVal kat, ByVal subKat)
        db = New IntraSellDB() : db.objConnection = Me.objConnection

        getArtKatNr = db.tableValue("[grArtikel-Kategorien]", _
                  "Desc", "'" & hauptKat & ">" & kat & ">" & subKat & "'", "ArtKatNr")
    End Function

    Public Function saveObjektFromXML(ByRef xmlForObjekt As System.Xml.XmlDocument) As String
        objConnection.Open()

        db = New IntraSellDB() : db.objConnection = Me.objConnection

        Dim insertSQL As String
        Dim bez As String : bez = xmlForObjekt.GetElementsByTagName("Bezeichnung").Item(0).InnerText
        Dim catDesc As String = xmlForObjekt.GetElementsByTagName("KategorieHaupt").Item(0).InnerText & _
                  ">" & xmlForObjekt.GetElementsByTagName("Kategorie").Item(0).InnerText & ">" & _
                  xmlForObjekt.GetElementsByTagName("KategorieSub").Item(0).InnerText

        Dim ArtKatNr As String : ArtKatNr = db.tableValue("[grArtikel-Kategorien]", _
                  "Desc", _
                  "'" & catDesc & "'", _
                  "ArtKatNr")

        If ArtKatNr = ImmoObjektClass.NOT_DEFINED Then
            HttpContext.Current.Response.Write("Wir haben keine Kategorie:" & catDesc)
            HttpContext.Current.Response.End()
            Exit Function
        End If


        Dim preis As String

        preis = xmlForObjekt.GetElementsByTagName("Kaufpreis").Item(0).InnerText

        If preis = "" Then
            preis = xmlForObjekt.GetElementsByTagName("Mietpreis").Item(0).InnerText
        End If

        If Not IsNumeric(preis) Then
            preis = "0"
        End If

        Dim artNrForUpdate As String = xmlForObjekt.GetElementsByTagName("ArtNr").Item(0).InnerText
        Dim nId As String
        Dim Beschreibung : Beschreibung = "x"
        If Trim(artNrForUpdate) = "" Then 'insert else update 
            nId = db.getNextId("grArtikel", "ArtNr")
            insertSQL = "Insert into grArtikel (ArtNr, ArtKatNr, Bezeichnung, Beschreibung, ProduktAktiv, HerstellerNr, PreisATS) "
            insertSQL += " values (" & nId & "," & ArtKatNr & "," & _
            "'" & bez & "',"
            'insertSQL += "'" & xmlForObjekt.GetElementsByTagName("Beschreibung").Item(0).InnerText & "'"
            insertSQL += "'" & Beschreibung & "'"
            insertSQL += ",0, " & _
            xmlForObjekt.GetElementsByTagName("Anbieter").Item(0).InnerText & "," & _
            preis & ")"
        Else 'update 
            insertSQL = "update grArtikel set "
            'insertSQL += "ArtKatNR=" & ArtKatNr
            insertSQL += " Bezeichnung='" & bez & "'"
            insertSQL += ",PreisATS=" & preis
            insertSQL += " where ArtNr=" & artNrForUpdate
            nId = artNrForUpdate
        End If


        command = New Microsoft.Data.Odbc.OdbcCommand(insertSQL)
        command.Connection = objConnection
        command.ExecuteNonQuery()

        Me.ArtNr = nId

        'For Each elm In xmlForObjekt.ChildNodes
        On Error Resume Next 'null exception when value missing in the xml file

        Call addObjektEigenschaft("ImmobilienHauptkategorie", xmlForObjekt.GetElementsByTagName("ImmobilienHauptkategorie").Item(0).InnerText)
        Call addObjektEigenschaft("ImmobilienKategorie", xmlForObjekt.GetElementsByTagName("ImmobilienKategorie").Item(0).InnerText)
        Call addObjektEigenschaft("ImmobilienNutzung", xmlForObjekt.GetElementsByTagName("ImmobilienNutzung").Item(0).InnerText)
        Call addObjektEigenschaft("ImmobilienTyp", xmlForObjekt.GetElementsByTagName("ImmobilienTyp").Item(0).InnerText)

        Call addObjektEigenschaft("Wohnflaeche", xmlForObjekt.GetElementsByTagName("Wohnflaeche").Item(0).InnerText)
        Call addObjektEigenschaft("Grundflaeche", xmlForObjekt.GetElementsByTagName("Grundflaeche").Item(0).InnerText)
        Call addObjektEigenschaft("Zimmeranzahl", xmlForObjekt.GetElementsByTagName("Zimmeranzahl").Item(0).InnerText)
        Call addObjektEigenschaft("Mietpreis", xmlForObjekt.GetElementsByTagName("Mietpreis").Item(0).InnerText)
        Call addObjektEigenschaft("Kaufpreis", xmlForObjekt.GetElementsByTagName("Kaufpreis").Item(0).InnerText)
        Call addObjektEigenschaft("Grundart", xmlForObjekt.GetElementsByTagName("Grundart").Item(0).InnerText)
        Call addObjektEigenschaft("Verwendungszweck", xmlForObjekt.GetElementsByTagName("Verwendungszweck").Item(0).InnerText)

        'Next

        'Objekt Lage
        Call addObjektEigenschaft("ObjektLand", xmlForObjekt.GetElementsByTagName("ObjektLand").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektBundesland", xmlForObjekt.GetElementsByTagName("ObjektBundesland").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektBezirk", xmlForObjekt.GetElementsByTagName("ObjektBezirk").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektPLZ", xmlForObjekt.GetElementsByTagName("ObjektPLZ").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektOrt", xmlForObjekt.GetElementsByTagName("ObjektOrt").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektStrasse", xmlForObjekt.GetElementsByTagName("ObjektStrasse").Item(0).InnerText)
        'end Objekt Lage

        On Error GoTo 0

        saveObjektFromXML = nId
        'objConnection.BeginTransaction(IsolationLevel.Chaos)
        'objConnection.
        objConnection.Close()
    End Function


    Public Function makeSQLFromXML(ByRef xmlForObjekt As System.Xml.XmlDocument) As String
        objConnection.Open()
        db = New IntraSellDB() : db.objConnection = Me.objConnection

        Dim selectSQL As String
        Dim bez As String : bez = xmlForObjekt.GetElementsByTagName("Bezeichnung").Item(0).InnerText
        Dim catDesc As String = xmlForObjekt.GetElementsByTagName("KategorieHaupt").Item(0).InnerText & _
                  ">" & xmlForObjekt.GetElementsByTagName("Kategorie").Item(0).InnerText & ">" & _
                  xmlForObjekt.GetElementsByTagName("KategorieSub").Item(0).InnerText

        Dim ArtKatNr As String : ArtKatNr = db.tableValue("[grArtikel-Kategorien]", _
                  "Desc", _
                  "'" & catDesc & "'", _
                  "ArtKatNr")

        If ArtKatNr = ImmoObjektClass.NOT_DEFINED Then
            HttpContext.Current.Response.Write("Wir haben keine Kategorie:" & catDesc)
            HttpContext.Current.Response.End()
            Exit Function
        End If


        Dim preis As String

        preis = xmlForObjekt.GetElementsByTagName("Kaufpreis").Item(0).InnerText

        If preis = "" Then
            preis = xmlForObjekt.GetElementsByTagName("Mietpreis").Item(0).InnerText
        End If

        If preis = "" Then
            preis = "0"
        End If

        Dim nId As String : nId = db.getNextId("grArtikel", "ArtNr")

        selectSQL = "select ArtNr, ArtKatNr, Bezeichnung, Beschreibung, ProduktAktiv, HerstellerNr, PreisATS " & _
                    " from grArtikel "


        'Objekt Lage
        Call addObjektEigenschaft("ObjektLand", xmlForObjekt.GetElementsByTagName("ObjektLand").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektBundesland", xmlForObjekt.GetElementsByTagName("ObjektBundesland").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektBezirk", xmlForObjekt.GetElementsByTagName("ObjektBezirk").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektPLZ", xmlForObjekt.GetElementsByTagName("ObjektPLZ").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektOrt", xmlForObjekt.GetElementsByTagName("ObjektOrt").Item(0).InnerText)
        Call addObjektEigenschaft("ObjektStrasse", xmlForObjekt.GetElementsByTagName("ObjektStrasse").Item(0).InnerText)
        'end Objekt Lage

        makeSQLFromXML = selectSQL
        'objConnection.BeginTransaction(IsolationLevel.Chaos)
        'objConnection.
        objConnection.Close()
    End Function

    Public Function setEAN(ByVal ean As String)
        Dim sql As String

        If db Is Nothing Then
            db = New IntraSellDB() : db.objConnection = Me.objConnection
        End If

        sql = "Update grArtikel set EAN='" & ean & "' where ArtNr=" & Me.ArtNr
        db.ObjConnectionExecute(sql)
    End Function


    Public Function setImage(ByVal imagePathRelative As String)
        Dim sql As String

        If db Is Nothing Then
            db = New IntraSellDB() : db.objConnection = Me.objConnection
        End If

        sql = "Update grArtikel set picture='" & imagePathRelative & "' where ArtNr=" & Me.ArtNr
        db.ObjConnectionExecute(sql)
    End Function

    Public Function setAktiv(ByVal aktive As Integer)
        Dim sql As String

        If db Is Nothing Then
            db = New IntraSellDB() : db.objConnection = Me.objConnection
        End If

        sql = "Update grArtikel set ProduktAktiv='" & aktive & "' where ArtNr=" & Me.ArtNr
        db.ObjConnectionExecute(sql)
    End Function


    Public Function isAktiv() As Boolean
        Dim sql As String

        If db Is Nothing Then
            db = New IntraSellDB() : db.objConnection = Me.objConnection
        End If
        If db.tableValue("grArtikel", "ArtNR", ArtNr, "ProduktAktiv") = 0 Then
            isAktiv = False
        Else
            isAktiv = True
        End If
    End Function

    Public Function getField(ByVal fieldName As String) As String
        Dim sql As String

        If db Is Nothing Then
            db = New IntraSellDB() : db.objConnection = Me.objConnection
        End If

        getField = db.tableValue("grArtikel", "ArtNR", ArtNr, fieldName)

    End Function

    'the  user idnrAdresse will be saved as Hersteller
    Public Function setAnbieter(ByVal idnrAdresse As String, _
     ByVal Name As String, ByVal Fax As String, ByVal Email As String, ByVal Tel As String)
        Dim sql As String

        If db Is Nothing Then
            db = New IntraSellDB() : db.objConnection = Me.objConnection
        End If


        'Logic: Hersteller is the User that creates the object, Lieferant is the contact information 
        'create hersteller if not created yet
        If db.tableValue("LieferantenAdressen", "idnr", idnrAdresse, "Firma") = db.NOT_DEFINED Then
            'Set first the Hersteller 
            sql = "INSERT INTO lieferantenAdressen (IDNR, Rolle, Land, Branche, Name, Firma, Tel, Fax, Email, Web, PLZ )" & _
            " SELECT Idnr, 'Hersteller', Land, Branche, '" & Name & "', Firma, Tel, '" & Fax & "', '" & Email & "', Web, PLZ " & _
            " FROM ofAdressen where idnr =" & idnrAdresse
            db.ObjConnectionExecute(sql)
        End If

        'create new lieferante  
        Dim nId : nId = db.getNextId("LieferantenAdressen", "Idnr")
        sql = "INSERT INTO lieferantenAdressen (IDNR, Rolle, Land, Branche, Name, Firma, Tel, Fax, Email, Web, PLZ)" & _
        " SELECT " & nId & ", 'Lieferant', Land, Branche, '" & Name & "', Firma, Tel, '" & Fax & "', '" & Email & "', Web, PLZ" & _
        " FROM ofAdressen where idnr =" & idnrAdresse

        db.ObjConnectionExecute(sql)
        sql = "Update grArtikel set HerstellerNr='" & idnrAdresse & "', LieferantNr='" & nId & "'  where ArtNr=" & Me.ArtNr
        db.ObjConnectionExecute(sql)
    End Function



    Public Function addObjektEigenschaft(ByVal eigenschaftName As String, _
        ByVal eigentschaftValue As String)
        Dim sql As String

        If db Is Nothing Then
            db = New IntraSellDB() : db.objConnection = Me.objConnection
        End If

        Dim artKatNr As String = db.tableValue("[grArtikel]", "ArtNr", ArtNr, "ArtKatNr")
        Dim kwID As String : kwID = db.tableValue("[grArtikel-KeyWords]", "Name", "'" & eigenschaftName & "'", "keywordId")
        If kwID <> NOT_DEFINED Then

            'delete old  eigenschaft
            sql = "Delete from [grArtikel-KeywordsToProducts] Where " & _
                " ArtNr=" & ArtNr & " and keywordId in (select keywordId from [grArtikel-Keywords] where [name]='" & eigenschaftName & "')"
            db.ObjConnectionExecute(sql)

            If eigentschaftValue <> "" Then 'else just deleted 
                'add new eigenschaft 
                sql = "Insert into [grArtikel-KeywordsToProducts] " & _
                    " (ArtNr, keywordId, [Value]) values " & _
                    " (" & ArtNr & "," & kwID & ",'" & eigentschaftValue & "')"
                db.ObjConnectionExecute(sql)

            End If
        End If
    End Function




    Public Function getObjektEigenschaft( _
    ByVal eigenschaftName As String) As String

        Dim cmdNID As Microsoft.Data.Odbc.OdbcCommand
        cmdNID = New Microsoft.Data.Odbc.OdbcCommand( _
                          "select kwp.Value from [grArtikel-KeyWords] kw, [grArtikel-KeywordsToProducts] as kwp " & _
                         " where kw.keywordid = kwp.keywordId and kw.Name like '" & eigenschaftName & "' and ArtNr=" & Me.ArtNr)

        cmdNID.Connection = objConnection
        Dim myReader As Microsoft.Data.Odbc.OdbcDataReader = cmdNID.ExecuteReader()

        If myReader.Read() Then
            getObjektEigenschaft = myReader.GetString(0)
        Else
            getObjektEigenschaft = NOT_DEFINED
        End If

        myReader.Close()
        cmdNID.Dispose()
    End Function

    Public Function addObjektInfo( _
        ByVal eigenschaftName As String, _
        ByVal eigentschaftValue As String)

        db = New IntraSellDB() : db.objConnection = Me.objConnection

        Dim sql As String

        sql = "Delete from [grArtikel-HTMLInfo] Where " & _
            " ArtNr=" & ArtNr & " and Autor='" & eigenschaftName & "'"
        db.ObjConnectionExecute(sql)

        sql = "Insert into [grArtikel-HTMLInfo] " & _
            " (ArtNr, HTLMInfo, Autor) values " & _
            " (" & ArtNr & ",'" & eigentschaftValue & "','" & eigenschaftName & "')"
        db.ObjConnectionExecute(sql)
    End Function

    Public Function getObjektInfo( _
    ByVal eigenschaftName As String) As String

        Dim cmdNID As Microsoft.Data.Odbc.OdbcCommand
        cmdNID = New Microsoft.Data.Odbc.OdbcCommand( _
                          "select HTLMInfo from [grArtikel-HTMLInfo] " & _
                         " where Autor like '" & eigenschaftName & "' and ArtNr=" & Me.ArtNr)

        cmdNID.Connection = objConnection
        Dim myReader As Microsoft.Data.Odbc.OdbcDataReader = cmdNID.ExecuteReader()

        If myReader.Read() Then
            getObjektInfo = myReader.GetString(0)
        Else
            getObjektInfo = NOT_DEFINED
        End If

        myReader.Close()
        cmdNID.Dispose()
    End Function


    Public Function getFilenameImage(ByVal imgArt As String, ByVal originalFileExtansion As String) As String
        getFilenameImage = "productImages\" & ArtNr & "_" & imgArt & originalFileExtansion
    End Function

    Public Function addFile(ByVal imgArt As String, ByVal imageName As String) As String
        'If Not objConnection.State = ConnectionState.Open Then
        'objConnection.Open()
        'End If
        db = New IntraSellDB() : db.objConnection = Me.objConnection
        addObjektEigenschaft(imgArt, imageName)
        'objConnection.Close()
    End Function

    Public Sub loadFromDB(ByVal pArtNR As String)
        Me.ArtNr = pArtNR
    End Sub

End Class

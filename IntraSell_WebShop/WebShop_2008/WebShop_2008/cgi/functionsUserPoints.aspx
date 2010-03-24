<script language="VB" runat="server">  
    'USER POINTS 
    ''' <summary>
    ''' COUNT_POINTS_SEND_TO_FRIEND
    ''' </summary>
    ''' <remarks></remarks>
    Const COUNT_POINTS_SEND_TO_FRIEND = 3
    
    ''' <summary>
    ''' REASON_SEND_TO_FRIEND
    ''' </summary>
    ''' <remarks></remarks>
    Const REASON_SEND_TO_FRIEND = "Send to Friend"

    ''' <summary>
    ''' COUNT_POINTS_ACCOUNT_USAGE
    ''' </summary>
    ''' <remarks></remarks>
    Const COUNT_POINTS_ACCOUNT_USAGE = 1
    Const REASON_SEND_ACCOUNT_USAGE = "Account usage"

    Const COUNT_POINTS_WRITE_REVIEW = 5
    Const REASON_WRITE_REVIEW = "Write review"

    Const COUNT_POINTS_PRODUCT_RATING = 1
    Const REASON_PRODUCT_RATING = "Product rating"

    Const COUNT_POINTS_ORDERS = 20
    Const REASON_ORDERS = "Order"


    ' addPoint 
    Function addUserPoints(ByVal idnr, ByVal countPoints, ByVal reason)
        addUserPoints = False
        If Not CLng(idnr) > 0 Then
            Exit Function
        End If
 
 
        Dim sql, rs
        sql = "insert into [ofAdressen-Bonuspunkte] (idnr, eingang, Bemerkung) values (" & _
              idnr & "," & countPoints & ",'" & reason & "')"
        'Response.Write sql      
        objConnectionExecute(sql)
        addUserPoints = True
    End Function
 
 
 
 
    Public Function getCountPoints(ByVal idnr, ByVal reason)
        Dim sql, rs
        getCountPoints = 0
        'exit function 
        Dim MCHAR : MCHAR = "*" : If Session("dbType") = "SQL" Or Session("dbType") = "MySQL" Then MCHAR = "%"
  
        If reason = "" Then
            sql = "select count(id) as CountPoints from [ofAdressen-Bonuspunkte] where idnr = " & idnr
        Else
            sql = "select count(id) as CountPoints from [ofAdressen-Bonuspunkte] where bemerkung like '" & reason & MCHAR & "' and idnr = " & idnr
        End If
        rs = objConnectionExecute(sql)
 
        If Not rs.eof Then
            If (rs("CountPoints")) Is Nothing Then
                getCountPoints = 0
            Else
                getCountPoints = CLng(rs("CountPoints")) + 0
            End If
        End If
        rs.close()
        rs = Nothing
    End Function
 
    Public Function getSumPoints(ByVal idnr, ByVal reason)
        Dim sql, rs
        getSumPoints = 0
        'exit function 
        Dim MCHAR : MCHAR = "*" : If Session("dbType") = "SQL" Then MCHAR = "%"
        If reason = "" Then
            sql = "select sum(eingang-ausgang) as sumPoints from [ofAdressen-Bonuspunkte] where idnr = " & idnr
        Else
            sql = "select sum(eingang-ausgang) as sumPoints from [ofAdressen-Bonuspunkte] where bemerkung like '" & reason & MCHAR & "' and idnr = " & idnr
        End If
        rs = objConnectionExecute(sql)
 
        If Not rs.eof Then
            If (rs("sumPoints")) Is Nothing Then
                getSumPoints = 0
            Else
                getSumPoints = rs("sumPoints") + 0
            End If
        End If
        rs.close()
        rs = Nothing

    End Function
 
</script>


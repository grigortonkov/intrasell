<% 
    'Application("CACHE_EXPIRE_TIME_IN_MINUTES") 'in 60 minutes the cache will expire and new cache will be created  
 %>
<script language="VB" runat="server"> 

'=========================================================
' Implemented by Grigor Tonkov 
'    caching strategy
'    cache expires in CACHE_EXPIRE_TIME_IN_MINUTES seconds 
'=========================================================

   
    '=========================================================
'returns "" when cache expired or empty 
'=========================================================
    Function getCache(ByVal HASHNAME As String) As Object
        Dim CACHE_EXPIRE_TIME_IN_MINUTES As Integer = VARVALUE_DEFAULT("CACHE_EXPIRE_TIME_IN_MINUTES", "600")
        getCache = Application(HASHNAME)
        Dim expiresOn As Date = Application(HASHNAME & "_EXPIRESON")
        If showDebug() Then Response.Write("<br />Cache for " & HASHNAME & " expires on " & expiresOn)

        If Not getCache Is Nothing Then
            If showDebug() Then Response.Write("<br />Cache for " & HASHNAME & " is full!")
        Else
            If showDebug() Then Response.Write("<br />Cache for " & HASHNAME & " is empty!")
        End If

        If expiresOn < Now() Or CACHE_EXPIRE_TIME_IN_MINUTES <= 0 Then 'expired return null 
            If showDebug() Then Response.Write("<br />Cache for " & HASHNAME & " expired on " & expiresOn)
            Return ""
        End If
    End Function

'=========================================================
' SET Cache function 
'=========================================================
    Function setCache(ByVal HASHNAME As String, ByVal stringValue As Object) As Object
        Dim CACHE_EXPIRE_TIME_IN_MINUTES As Integer = VARVALUE_DEFAULT("CACHE_EXPIRE_TIME_IN_MINUTES", "600")
        If showDebug() Then Response.Write("<br />Set Cache for " & HASHNAME & " with Value " & stringValue)
        Application(HASHNAME) = stringValue
        Application(HASHNAME & "_EXPIRESON") = Now().AddMinutes(CACHE_EXPIRE_TIME_IN_MINUTES) ' + CACHE_EXPIRE_TIME_IN_MINUTES * 1 / (24 * 60)   'in 5 minutes will expire serverside
        setCache = stringValue
    End Function

   

    '=========================================================
    ' Implemented by Grigor Tonkov 
    '    caching strategy
    '    cache expires in 30 seconds 
    '=========================================================
    Function getCache_(ByVal HASHNAME As String) As Object
        Dim CACHE_EXPIRE_TIME_IN_MINUTES As Integer = VARVALUE_DEFAULT("CACHE_EXPIRE_TIME_IN_MINUTES", "600")
        getCache_ = Application(HASHNAME)
        Dim expiresOn : expiresOn = Application(HASHNAME & "_EXPIRESON")
        'response.write "Cache expires on "& expiresOn

        If getCache_ <> "" Then
            'response.write "Cache full!"
        Else
            'response.write "Cache empty!"
        End If

        If expiresOn <> "" And expiresOn < Now() Then 'expired return null 
            'response.write "Cache expired! "& expiresOn
            getCache_ = ""
        End If
    End Function

    Sub setCache_(ByVal HASHNAME As String, ByVal stringValue As Object)
        Dim CACHE_EXPIRE_TIME_IN_MINUTES As Integer = VARVALUE_DEFAULT("CACHE_EXPIRE_TIME_IN_MINUTES", "600")
        Application(HASHNAME) = stringValue
        Application(HASHNAME & "_EXPIRESON") = Now().AddMinutes(CACHE_EXPIRE_TIME_IN_MINUTES)
    End Sub

    
</script>


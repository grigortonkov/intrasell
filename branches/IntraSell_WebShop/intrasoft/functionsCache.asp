<%
'=========================================================
' Implemented by Grigor Tonkov 
'    caching strategy
'    cache expires in CACHE_EXPIRE_TIME_IN_MINUTES seconds 
'=========================================================

Dim CACHE_EXPIRE_TIME_IN_MINUTES : CACHE_EXPIRE_TIME_IN_MINUTES = -600 'Application("CACHE_EXPIRE_TIME_IN_MINUTES") 'in 60 minutes the cache will expire and new cache will be created 

'=========================================================
'returns "" when cache expired or empty 
'=========================================================
Function getCache(byVal HASHNAME)          
	getCache = Application(HASHNAME) & ""	         
	Dim expiresOn: expiresOn = Application(HASHNAME & "_EXPIRESON") 
	if showDebug() then response.write "<br>Cache for " & HASHNAME & " expires on "& expiresOn

	if getCache<>"" then
	   if showDebug() then response.write "<br>Cache for " & HASHNAME & " is full!"
	else 
	   if showDebug() then response.write "<br>Cache for " & HASHNAME & " is empty!"
	end if 

	if expiresOn <> "" and expiresOn<NOW() or CACHE_EXPIRE_TIME_IN_MINUTES  <=0 then 'expired return null 
		if showDebug() then response.write "<br>Cache for " & HASHNAME & " expired on "& expiresOn 
		getCache = ""
	end if 
end Function 

'=========================================================
' SET Cache function 
'=========================================================
Function setCache(byVal HASHNAME, byVal stringValue)
    if showDebug() then response.write "<br>Set Cache for " & HASHNAME & " with Value " & stringValue
    Application(HASHNAME) = stringValue
    Application(HASHNAME & "_EXPIRESON") = NOW() + CACHE_EXPIRE_TIME_IN_MINUTES*1/(24*60)   'in 5 minutes will expire serverside
    setCache = stringValue
End Function 
%>



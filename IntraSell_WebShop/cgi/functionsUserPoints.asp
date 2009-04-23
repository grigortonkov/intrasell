<%
'USER POINTS 
const COUNT_POINTS_SEND_TO_FRIEND = 3
const REASON_SEND_TO_FRIEND = "Send to Friend"

const COUNT_POINTS_ACCOUNT_USAGE = 1
const REASON_SEND_ACCOUNT_USAGE = "Account usage"

const COUNT_POINTS_WRITE_REVIEW = 5
const REASON_WRITE_REVIEW = "Write review"

const COUNT_POINTS_PRODUCT_RATING = 1
const REASON_PRODUCT_RATING = "Product rating"

const COUNT_POINTS_ORDERS = 20
const REASON_ORDERS = "Order"


' addPoint 
 function addUserPoints(idnr, countPoints, reason)
 addUserPoints = false 
 if not clng(idnr) > 0 then 
    exit function 
 end if 
 
 
 dim sql ,rs 
 sql = "insert into [ofAdressen-Bonuspunkte] (idnr, eingang, Bemerkung) values (" & _ 
       idnr & ","  & countPoints & ",'" & reason & "')"
 'Response.Write sql      
 objConnectionExecute(sql) 
 addUserPoints = true 
 end function 
 
 
 
 
 public function getCountPoints(byval idnr, byval reason) 
 dim sql ,rs 
 getCountPoints = 0
 'exit function 
  Dim MCHAR: MCHAR = "*": if Session("dbType") ="SQL" then MCHAR ="%"
  
 if REASON = "" then 
	sql = "select count(id) as CountPoints from [ofAdressen-Bonuspunkte] where idnr = " & idnr 
 else 
    sql = "select count(id) as CountPoints from [ofAdressen-Bonuspunkte] where bemerkung like '" & reason & MCHAR & "' and idnr = " & idnr 
 end if    
 set rs = objConnectionExecute(sql) 
 
 if not rs.eof then
   if isnull(rs("CountPoints")) then  
			getCountPoints =  0
   else 
            getCountPoints =  clng(rs("CountPoints")) + 0
   end if 
 end if 
   rs.close 
   set rs = nothing 
 end function 
 
 public function getSumPoints(byval idnr, byval reason) 
 dim sql ,rs 
 getSumPoints = 0
 'exit function 
 Dim MCHAR: MCHAR = "*": if Session("dbType") ="SQL" then MCHAR ="%"
 if REASON = "" then 
	sql = "select sum(eingang-ausgang) as sumPoints from [ofAdressen-Bonuspunkte] where idnr = " & idnr 
 else 
    sql = "select sum(eingang-ausgang) as sumPoints from [ofAdressen-Bonuspunkte] where bemerkung like '" & reason & MCHAR & "' and idnr = " & idnr 
 end if    
 set rs = objConnectionExecute(sql) 
 
 if not rs.eof then
   if isnull(rs("sumPoints")) then  
			getSumPoints =  0
   else 
            getSumPoints =  rs("sumPoints") + 0
   end if 
 end if 
   rs.close 
   set rs = nothing 

 end function 
 
%>
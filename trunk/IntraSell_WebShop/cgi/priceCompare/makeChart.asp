<%@ LANGUAGE = VBScript.Encode%>
<!--#include file="../../intrasoft/connOpen.asp"-->
<!--#include file="../../intrasoft/functions.asp"-->
<%
Response.Buffer = true  
 ' enable buffering so that ALL browsers will save image as a JPEG when						
 ' a user right-clicks over it and saves it to disk

dim intChartType		'selected Chart Type - from default.asp
dim strField			'selected Database field - from default.asp
dim objRS				'ADO Recordset object
Dim daysInPast: daysInPast = request("daysInPast")

if daysInPast = "" then daysInPast = 90 ' default
if daysInPast <7 then daysInPast = 90

Dim artNr: artNR = clng(Request("ArtNr"))

'Retrieve selected chart type and desired database field to be displayed
intChartType = clng(trim(Request("ChartType")))
strField = trim(Request("Field"))
'PlotChart subroutine is defined below
call PlotChart(artnr, intChartType, daysInPast)
set objRS = nothing



'======================================================================
'This subroutine accepts two arguments which are a reference to a populated Recordset object and the 
'desired chart type respectively. The Recordset contains all records for the field to be displayed.
'======================================================================
private sub PlotChart(byval artNr, byval inChartType, byVal daysInPast)
	dim objChart		'Duudas Chart 2D object
	dim intSkip			'number of Data labels to be skipped
						'  (we don't show all labels since this will look cluttered)
	intSkip = 30
	'Instantiates Dundas Chart 2D object
	set objChart = Server.CreateObject("Dundas.ChartServer2D.1")
	'loops thru the Recordset and adds ALL data to be used by our charts
	
	objChart.SetGradient  rgb(255,255,255), rgb(255,207,000), 1  'first, secondColor, pattern
    
    'objChart.chartArea(0).Axis(0).FontName = "Pala"
    'objChart.chartArea(0).Axis(1).FontName = "Pala"
    'objChart.chartArea(0).Axis(2).FontName = "Pala"
    'objChart.chartArea(0).Axis(3).FontName = "Pala"
    'objChart.Legend.Enabled = true
    'objChart.Legend.FontName = "Pala"
    
    
	dim datumK 
	dim stepSize
	if daysInPast>366 then daysInPast = 366
	if daysInPast <=366 then StepSize = 15
	if daysInPast <=93  then StepSize = 3
	if daysInPast <=30  then StepSize = 2 
	if daysInPast <=15  then StepSize = 1
	
	
	for datumK = 1 to daysInPast step StepSize
	  Dim DateToShow: dateToShow = date() - daysInPast + datumK 
	  Dim price: price =  getPriceAt(artnr, DateToShow)
	  Dim color: color =120200
	  if cdbl(price)>0 then objChart.AddData price, 0 , DateToShow, color 'to avoid going from zero to the first price 
	    'objChart.AddData 6, 0 , DateToShow
	next 	
	
	'response.write "MAke Chart Now": response.flish
	'Add a chart of the type specified by the input argument "inChartType" using
	'data stored in Data Series 0 only.
	objChart.ChartArea(0).AddChart inChartType, 0, 0		
	objChart.ChartArea(0).GridVEnabled  = true 'Disable the vertical grids
	Dim artName: artNAme = TABLEVALUE("grArtikel","ArtNr", ArtNr, "Bezeichnung")
	if len(ArtNAme) > 25 then artNAme = left(artNAme,25)  & "..."
	Dim title : title = "Preisentwicklung [" & artName & "] seit " & (date() - daysInPast)
	objChart.SetTitle title,,10		
	objChart.AntiAlias 	'Apply Antialiasing
	'objChart.AlphaBlend 100
	

	
	'response.write Server.MapPath("merchantView/images/filialen.gif"): response.flush
	'objChart.SetBackgroundPicture Server.MapPath("merchantView/images/filialen.gif")
	
	'show x-axis labels 	
	'Output a 600 x 330 pixel JPEG
	objChart.SendJpeg  600, 440	
	set objChart = nothing
end sub


'======================================================================
'returns the average price at the given date
'======================================================================
private function getPriceAt(byval artnr, byval dateAt)
'Opens a connection to the AllUSA.mdb database
'Retrieves records in the field specified by the input argument
'If no error occurs we return a recordset, otherwise returns nothing		
  'Response.write "<br>Get price for:"  & dateAt
	dim sql, rs		'SQL statement
	sql = "SELECT Min(EKPreis) AS EKPreisMin, AVG(EKPreis) AS EKPreisAVG, Max(EKPreis) AS EKPreisMax, PreisDatum FROM " + _
				   " (Select EKPreis, PreisDatum FROM priceCompareLieferantenArtikelPreiseArchive " + _
				   " WHERE ArtikelNr = " & ArtNr & " AND PreisDatum <= "  & TOSQLDATE(dateat) & _ 
				   " union " & _
				   " SELECT  EKPreis, PreisDatum  FROM [lieferantenArtikel-Preise] " & _ 
				   " WHERE ArtikelNr = " & ArtNr & " AND PreisDatum <= "  & TOSQLDATE(dateat) & _
				   " ) pp " & _
				   " GROUP BY PreisDatum " & _ 
				   " ORDER BY PreisDatum DESC" 
  ' Response.Write "<br>" & sql: Response.flush   
   set rs = ObjConnectionexecute(sql) 
   if rs.EOF then
     getPriceAt = 0
   else 
     getPriceAt = rs("EKPreisMin")
   end if   
	
   rs.close 
end function
%>
<!--#include file="../../intrasoft/connClose.asp"-->
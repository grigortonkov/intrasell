<%
function writeLog(byVal filename, byVal logline)
   CONST USE_LOGING = true 
   ' on error resume next 
   if USE_LOGING then 
        Dim fs, exportFile 
   		Dim loglineHeader 
   		loglineHeader = now() & "; " & Request.ServerVariables("REMOTE_ADDR") & "; "  
   		
   		Set fs = CreateObject("Scripting.FileSystemObject")
   	        filename = Server.MapPath ("\logfiles") + "\" &  filename
   		
   		if Request("debug") = "true" then 
   			response.write  "Export to: " & filename
   			response.flush
   		end if 
   		
   		if FileExists(filename) then 
   		    Set exportFile = fs.OpenTextFile(filename,8) ' For appending
   		else 
   			Set exportFile = fs.CreateTextFile(filename , false)
   		end if 
   		exportFile.WriteLine loglineHeader & logline
   		exportFile.Close
   end if 

  if err.number > 0 then 
     response.write "Fehler:"  & err.desciption 
     err.clear 
  end if 

  on error goto 0 
end function 


function writeFile(byVal filename, byVal content)
       ' on error resume next 

        Dim fs, exportFile 

   		Set fs = CreateObject("Scripting.FileSystemObject")
   	    filename = Server.MapPath ("\logfiles") + "\" &  filename
   		if showDebug() then response.write  "Export to: " & filename :response.flush
   		
   		if FileExists(filename) then 
   	        deletefile(filename)   
   	    end if 

   			Set exportFile = fs.CreateTextFile(filename , false)

   		
   		exportFile.Write content
   		exportFile.Close
 
  if err.number > 0 then 
     response.write "Fehler:"  & err.desciption 
     err.clear 
  end if 

  on error goto 0 

end function 

%>
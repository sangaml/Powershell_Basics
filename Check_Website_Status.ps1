#Function Test-Websites {  
## The URI list to test  
$URLListFile = "D:\url.txt" 
#Get URLs From file  
$URLList = Get-Content $URLListFile -ErrorAction SilentlyContinue
  $Timelast = Measure-Command {  
  Foreach($Uri in $URLList) {  
  $time = try{  
  $request = $null  
   ## Request the URI, and measure how long the response took.  
  $result1 = Measure-Command { $request = Invoke-WebRequest -Uri $uri }  
  $result1.TotalSeconds
  Write-Host "$uri" -ForegroundColor Yellow 
  Write-Host "Response Time is $ExecTime msec" -ForegroundColor Green  
  }   
  catch  
  {  
   <# If the request generated an exception (i.e.: 500 server  
   error or 404 not found), we can pull the status code from the  
   Exception.Response property #>  
   $request = $_.Exception.Response  
   $time = -1  
  } 
  $r = [int] $request.StatusCode
  #Check Status
if ( $r -eq 0 ) { Write-Host "$uri Websites is DOWN" -BackgroundColor Red }
elseIf ( $r -eq 200 ) { Write-Host "$uri Websites are up and Running" -ForegroundColor Magenta }
elseIf ( $r -eq 404 ) { Write-Host "$uri Page Not Found" -ForegroundColor Red }
elseIf ( $r -eq 500 ) { Write-Host "$uri Internal Server Error" -ForegroundColor Red } 
 }
}#-BackgroundColor Red

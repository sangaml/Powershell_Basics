#Check Internet connection

$Server1 = "Google.com"
#Ping connection with 5 count
$info = Test-Connection $Server1 -Count 5 -ErrorAction SilentlyContinue
if ($info) {
Write-Host "$Server1 is up" -ForegroundColor Green
}
else{
    Write-Host "$Server1 is down" -ForegroundColor Red
  }
# Export Outpute to csv file
$info | export-csv D:\output.csv

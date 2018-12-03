#Check System info
$sys = Get-WmiObject win32_computersystem -ComputerName localhost | select -Property TotalPhysicalMemory
$ps = Get-WmiObject  win32_processor -ComputerName localhost | select -Property LoadPercentage
$os = Get-WmiObject win32_OperatingSystem | select -Property Version

$Details = New-Object PSObject -Property @{
'LoadPercentage'       = $ps.LoadPercentage
'TotalPhysicalMemory'  = $sys.TotalPhysicalMemory
'Version'              = $os.Version
} 
Write-Host $Details -ForegroundColor Green
$Details | Export-Csv D:\systeminfo.csv

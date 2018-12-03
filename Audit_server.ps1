#"Auditing the servers in domain on following parameters using powershell script.
#(Name,IPV4Address,CanonicalName,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion,LastLogonDate and PasswordLastSet)"
$SystemInfo = Get-CimInstance Win32_OperatingSystem | Select-Object  Caption, InstallDate, ServicePackMajorVersion, OSArchitecture, BootDevice,  BuildNumber, CSName
$Ip = Get-CimInstance -Class win32_networkadapterconfiguration | Select-Object IPAddress 
$User = get-aduser -filter * -properties passwordlastset, passwordneverexpires | sort name | ft Name, passwordlastset, Passwordneverexpires | out-file D:\AuditInfo.txt

$Object = New-Object PSObject -Property @{
'Osversion '           = $SystemInfo.caption
'Install_date '        = $SystemInfo.InstallDate
'Service Pack Version'     = $SystemInfo.ServicePackMajorVersion
'OS Architecture'      = $SystemInfo.OSArchitecture
'Boot Device'       = $SystemInfo.BootDevice
'Build No.'   = $SystemInfo.BuildNumber

'Host Name'          = $SystemInfo.CsName
'IP Address'             = $Ip.IPAddress

}
$object | export-csv D:\AuditInfo.csv
Write-Host $User -ForegroundColor Green
Write-Host $object -ForegroundColor Green

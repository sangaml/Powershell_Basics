#retrieve the list of Framework Installed on the computer

$Fram = Get-Childitem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\FULL'
$Fram

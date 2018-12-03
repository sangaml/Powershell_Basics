#check a WSUS server's updates and approve any WSUS updates that are in Configuration Manager.

$server = Read-Host -Prompt "Enter WSUS Server name"

$WSUSserver = Get-WsusServer -Name $server -PortNumber 8530

$updatesneeded = Get-WsusUpdate -UpdateServer $WSUSserver -Approval Unapproved -Status needed 
$total = $updatesneeded.Count

Approve-WsusUpdate -Update $updatesneeded -Action Install 
Write-Host "Approve $total updates"

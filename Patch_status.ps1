#Get the windows patches status from servers in the list.

$Patch = Get-Hotfix|Where-Object {$_.Installedon -gt ((Get-Date).Adddays(-10))}|Select-Object -Property Source ,InstalledOn, HotFixID, InstalledBy|Format-Table | Out-File D:\Patch.txt
Write-Host "$Patch" -ForegroundColor Green

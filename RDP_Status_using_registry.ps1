#Set-RemoteDesktop allows you to enable or disable RDP remotely using the registry

$cstat = (Get-ItemProperty 'HKLM:SYSTEM\CurrentControlSet\Control\Terminal Server').fDenyTSConnections

if ($cstat -eq 0){
Write-Host "RDP is Enabled" -ForegroundColor Green
$a = Read-Host "If you want to Enable Press 1"
} elseif ($cstat -eq 1) {
Write-Host "RDP is Disabled" -ForegroundColor Red
$a = Read-Host "If you want to Enable Press 0" 
}


Switch( $a ) {
0 { reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
    Write-Host "Now RDP is Enabled" -ForegroundColor Green
   }
1 { reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
    Write-Host "Now RDP is Disabled" -ForegroundColor Red
  }
}

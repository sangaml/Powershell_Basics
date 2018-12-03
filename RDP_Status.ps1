#Function to check if RDP is enabled

Function Get-RemoteDesktopConfig
{if ((Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server').fDenyTSConnections -eq 0)

          {Write-host "RDP is Enabled" -ForegroundColor Green}

 elseif ((Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp').UserAuthentication -eq 1)
         {Write-Host "RDP is Disabled" -ForegroundColor Red} 

 #else     {"All Connections allowed"}

} 
Get-RemoteDesktopConfig

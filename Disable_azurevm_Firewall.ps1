#Disable Firewall on the Azure Virtual Machine

Get-NetFirewallProfile | Set-NetFirewallProfile –Enabled False

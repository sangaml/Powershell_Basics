#Remove stale DNS entries using PowerShell.
Get-DnsServerResourceRecord -ComputerName localhost -ZoneName abc.com | 

Remove-DnsServerResourceRecord -Force  -ZoneName abc.com

#Write script for Set-Get-AzrDnsServerAddress.
#Create the resource group
$a = Read-Host "Enter Resource Group Name"
$b = Read-Host "Enter Location"
$c = Read-Host "Enter new domain name (like  test.com)"
$d = Read-Host "Enter A record IPv4 Address (like 1.2.3.4)"
New-AzureRMResourceGroup -name $a -location "$b"

#Create a DNS zone

New-AzureRmDnsZone -Name $c -ResourceGroupName $a

#Create a DNS record

New-AzureRmDnsRecordSet -Name www -RecordType A -ZoneName $c -ResourceGroupName testdns -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -IPv4Address $d)

#View records

Get-AzureRmDnsRecordSet -ZoneName $c -ResourceGroupName $a

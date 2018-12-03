# Get the DNSsuffix of servers given in the list

$suffix = Get-DnsClientGlobalSetting | Select-Object SuffixSearchList
$suffix

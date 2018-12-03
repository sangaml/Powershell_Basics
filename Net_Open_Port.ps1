#Find open TCP/UDP ports by server role.

$TCPProperties = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties()            
$Tcp_Open_Port = $TCPProperties.GetActiveTcpListeners()
$Udp_Open_Port = $TCPProperties.GetActiveUdpListeners()
 
 $Tcp_Open_port 

 $Udp_Open_port 

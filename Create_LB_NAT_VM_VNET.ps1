#Creates the virtual machine scale set and all supporting resources, including virtual network, load balancer, and NAT rules. Removes a resource group and all resources contained within.
# Provide your own secure password for use with the VM instances
$cred = Get-Credential

# Create a virtual machine scale set and supporting resources
# A resource group, virtual network, load balancer, and NAT rules are automatically
# created if they do not already exist
New-AzureRmVmss `
  -ResourceGroupName "myResourceGroup" `
  -VMScaleSetName "myScaleSet" `
  -Location "EastUS" `
  -VirtualNetworkName "myVnet" `
  -SubnetName "mySubnet" `
  -PublicIpAddressName "myPublicIPAddress" `
  -LoadBalancerName "myLoadBalancer" `
  -Credential $cred

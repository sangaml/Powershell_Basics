#Script for resets an Azure VM's admin password
$vmName = 'winr2test'
$resourceGroupName = 'winr2test'
$vm = Get-AzureRmVm -Name $vmName -ResourceGroupName $resourceGroupName

Set-AzureRmVMAccessExtension -ResourceGroupName $resourceGroupName -Location "Central US" -VMName $vmName -Name $vmName -TypeHandlerVersion "2.0"

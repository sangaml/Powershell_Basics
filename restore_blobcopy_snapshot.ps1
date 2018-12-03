#Restores a blob copy (snapshot) of all disks used by an Azure VM
#Provide the subscription Id
$subscriptionId = 'subscription Id'

#Provide the name of your resource group
$resourceGroupName ='winr2test'

#Provide the name of the snapshot that will be used to create OS disk
$snapshotName = 'Snapshot01'

#Provide the name of the OS disk that will be created using the snapshot
$osDiskName = 'snapdisk'

#Provide the name of an existing virtual network where virtual machine will be created
$virtualNetworkName = 'winr2test-vnet'

#Provide the name of the virtual machine
$virtualMachineName = 'myVMName'

#Provide the size of the virtual machine
#e.g. Standard_DS3
#Get all the vm sizes in a region using below script:
#e.g. Get-AzureRmVMSize -Location westus
$virtualMachineSize = 'Standard_B1s'

#Set the context to the subscription Id where Managed Disk will be created
Select-AzureRmSubscription -SubscriptionId $SubscriptionId

$snapshot = Get-AzureRmSnapshot -ResourceGroupName $resourceGroupName -SnapshotName $snapshotName 
 
$diskConfig = New-AzureRmDiskConfig -AccountType $storageType -Location $snapshot.Location -SourceResourceId $snapshot.Id -CreateOption Copy
 
$disk = New-AzureRmDisk -Disk $diskConfig -ResourceGroupName $resourceGroupName -DiskName $osDiskName

#Initialize virtual machine configuration
$VirtualMachine = New-AzureRmVMConfig -VMName $virtualMachineName -VMSize $virtualMachineSize

#Use the Managed Disk Resource Id to attach it to the virtual machine. Please change the OS type to linux if OS disk has linux OS
$VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -ManagedDiskId $disk.Id -CreateOption Attach -Windows

#Create a public IP for the VM  
$publicIp = New-AzureRmPublicIpAddress -Name ($VirtualMachineName.ToLower()+'_ip') -ResourceGroupName $resourceGroupName -Location $snapshot.Location -AllocationMethod Dynamic

#Get the virtual network where virtual machine will be hosted
$vnet = Get-AzureRmVirtualNetwork -Name $virtualNetworkName -ResourceGroupName $resourceGroupName

# Create NIC in the first subnet of the virtual network 
$nic = New-AzureRmNetworkInterface -Name ($VirtualMachineName.ToLower()+'_nic') -ResourceGroupName $resourceGroupName -Location $snapshot.Location -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIp.Id

$VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $nic.Id

#Create the virtual machine with Managed Disk
New-AzureRmVM -VM $VirtualMachine -ResourceGroupName $resourceGroupName -Location $snapshot.Location 

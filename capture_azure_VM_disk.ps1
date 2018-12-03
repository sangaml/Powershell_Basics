#Create powershell for AzureArmSnapshot 
$vmName = "vmname"
$rgName = "resoursegroupname"
$location = "Central Us"
$imageName = "new-name-for image"

#Make sure the VM has been deallocated.

Stop-AzureRmVM -ResourceGroupName $rgName -Name $vmName -Force

#get status of VM
Set-AzureRmVm -ResourceGroupName $rgName -Name $vmName -Generalized

#get vm details
$vm = Get-AzureRmVM -Name $vmName -ResourceGroupName $rgName

#Create the image configuration

$image = New-AzureRmImageConfig -Location $location -SourceVirtualMachineId $vm.ID 
New-AzureRmImage -Image $image -ImageName $imageName -ResourceGroupName $rgName

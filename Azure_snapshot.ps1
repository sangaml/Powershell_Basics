#creates a blob copy (snapshot) of all disks used by an Azure VM. 

$snapshotconfig = New-AzureRmSnapshotConfig -Location 'Central US' -DiskSizeGB 10 -AccountType Standard_LRS -OsType Windows -CreateOption Empty -EncryptionSettingsEnabled $false;
New-AzureRmSnapshot -ResourceGroupName 'winr2test' -SnapshotName 'Snapshot01' -Snapshot $snapshotconfig;
$a = echo $?

if ($a = "True" ) {
Write-Host "Snapshot was Created Successfully ..." -ForegroundColor Green
} else {Write-Host "Error" -ForegroundColor Red}

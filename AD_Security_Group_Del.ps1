#Find the Empty Security group in AD and delete them.
$Groups = Get-ADGroup -filter {GroupCategory -eq "Security"} -Properties Members | Where {-not $_.members}
ForEach ($Item in $Groups){
  Remove-ADGroup -Identity $Item.DistinguishedName -Confirm:$false
  Write-Output "$($Item.Name) - Deleted" }#|  D:\User.txt }

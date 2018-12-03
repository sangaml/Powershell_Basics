#Write script which collect AD active and disable users list.
$user = Get-ADUser -Filter * -SearchBase 'DC= XYZ,  DC= com' | Select-Object SamAccountName, Enabled ,DistinguishedName, ObjectClass | sort -Property *enabled
Write-Host $user -ForegroundColor Green
$user | Export-Csv -Path D:\abc.csv

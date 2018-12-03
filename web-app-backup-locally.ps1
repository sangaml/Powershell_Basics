#Write script for saves all of the contents of an Azure web app to a local folder.
$appServiceName = 'appservicename'
 $credential = Get-Credential
 
 $syncParams = @{
     SourcePath = 'wwwroot'
     TargetPath = 'D:\MyLocalFolder'
     ComputerName = "https://resourcegroup.azurewebsites.net"
     Credential = $credential
 
 }
 Sync-Website @syncParams

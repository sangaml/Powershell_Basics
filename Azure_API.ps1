#Powershell script that expedites the process of assigning permissions to Azure Management APIs.

Connect-AzureRmAccount

# Install the Azure Api access script.
Install-Script -Name Grant-AzureApiAccess


$params = @{
    ApiManagementServiceName = 'APIGateway'
    
    ApiManagementServiceResourceGroup = 'GatewayRG'
    ApiMatchPattern = 'Test'
    AzureRoleName = 'Test Reader'
    AzureRoleDescription = 'Test Reader'
    Rights = 'Read'
    PrincipalName = 'Test-Readers'
    AzurSubscriptionId = (Get-AzureRmSubscription).SubscriptionId
}
.\Grant-AzureApiAccess.ps1 @params

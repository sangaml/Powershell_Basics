#Azure Monitor Performance Alerts Using PowerShell.

############################
Get-AzureRmLog -StartTime 2018-08-15T10:30 -EndTime 2018-08-16T11:30

#list existing rules on resource Group
Get-AzureRmAlertRule -ResourceGroup winr2test -DetailedOutput

#List all metrics definition for specific resource
Get-AzureRmMetricDefinition -ResourceId winr2test
#To Set an Alert on Website Resource
Add-AzureRmMetricAlertRule -Name Percentage CPU -Location "Central US" -ResourceGroup myresourcegroup -TargetResourceId /subscriptions/dededede-7aa0-407d-a6fb-eb20c8bd1192/resourceGroups/myresourcegroupname/providers/Microsoft.Web/sites/mywebsitename -MetricName "BytesReceived" -Operator GreaterThan -Threshold 2 -WindowSize 00:05:00 -TimeAggregationOperator Total -Description "alert on any website activity"
#To delete alert that was created
Remove-AzureRmAlertRule -ResourceGroup myresourcegroup -Name cpu

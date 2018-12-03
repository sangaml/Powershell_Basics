#Find Windows computer for all event log or text log entries between a specified start and end time.

do
{
    $StartTime= read-host "Please enter Start date & time (i.e.: '25/12/2012 09:00', '25 oct 2012 9:00'; date alone set time to 00:00)"

    $StartTime = $StartTime -as [datetime]

    if (!$StartTime) {
        "Not A valid date and time"
    }
} while ($StartTime -isnot [datetime])


do
{
    $EndTime= read-host "Please enter End date & time (i.e.: '25/12/2012 09:00', '25 oct 2012 9:00'; date alone set time to 00:00)"

    $EndTime = $EndTime -as [datetime]

    if (!$EndTime) {
        "Not A valid date and time"

    }
} while ($EndTime -isnot [datetime])

$Log_name = Read-Host "Which Log You want (Like System, Security,...)"

Get-WinEvent -FilterHashtable @{LogName=$Log_name;StartTime=$StartTime;EndTime=$EndTime}

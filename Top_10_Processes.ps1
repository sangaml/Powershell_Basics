#Write a script to get top 10 process utilising server Memory and CPU.

$CPU = Get-Process | Sort-Object -Descending CPU | Select-Object -first 10 | ft ProcessName, CPU
Write-Output $CPU

$Mem = Get-Process | Sort-Object -Descending WS | Select-Object -first 10 | ft ProcessName, WS 
Write-Output $Mem

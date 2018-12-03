#enables EFS file encryption on a file.

$File = Read-Host -Prompt "Enter the File For Encryption (Like path.txt)"
$drive = Read-Host -Prompt "Enter Drive to search a file (Like D:\folder\)"
 $File
 $drive
$Check = (Get-ChildItem -Attributes Encrypted -Path "$drive" | Select-Object).name
$Check
if ($Check -eq $null ) { $Check = "hi" }
$Check

function Test
 {
if ( $File -eq $Check)
    {
        Write-Host "File is Allready Encrypted" -ForegroundColor Green
     }        else {Write-Host "File is not encrypted" -ForegroundColor Red }     
}
 
function encrypt { (Get-Item -Path "$drive$File").Encrypt()
                   Write-Host "File is Encrypted Succsesfully.." -ForegroundColor Green
                   }

function decrypt { (Get-Item -Path "$drive$File").Decrypt() 
                    Write-Host "File is Decrypted Succsesfully.." -ForegroundColor Red
                   }
function callback 
{

Switch (Read-Host -prompt " Press 1 to check whether file is Encrypted or not `n Press 2 to Encrypt`n Press 3 to Decrypt`n Press 0 to exit") 
     {
        1{ 
        Test
        callback
        }
        2{
        encrypt
        callback
        }
        3{
        decrypt
        callback
        }
default {Write-Host "Invalid entry" -ForegroundColor Red

        callback
        }
        0 {}
     }
}
callback

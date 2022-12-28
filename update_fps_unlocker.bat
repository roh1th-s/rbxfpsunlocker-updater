@echo off

set apiUrl=https://api.github.com/repos/axstin/rbxfpsunlocker/releases/latest
set zipFile=rbxfpsunlocker.zip
set dest=%cd%

rem why does it have to be so difficult to split a string into multiple lines...
set setVariables= "$apiUrl = '%apiUrl%'; $zipFile = '%zipFile%'; $dest = '%dest%';"
set getJson= "$response = Invoke-WebRequest -Uri $apiUrl ^| ConvertFrom-Json;"
set setDownloadUrl= "$downloadUrl = $response.assets[0].browser_download_url; Write-Host 'Getting latest FPS Unlocker';"
set getZipFile= "Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile; Write-Host 'Unzipping file..';"
set extractZip= "Expand-Archive -Path $zipFile -DestinationPath $dest -Force;"
set cleanUp= "Remove-Item $zipFile; Write-Host 'Done!'"

rem much more readable than a single long line
powershell -Command "%setVariables% %getJson% %setDownloadUrl% %getZipFile% %extractZip% %cleanUp%"

pause

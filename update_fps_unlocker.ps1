$apiUrl = 'https://api.github.com/repos/axstin/rbxfpsunlocker/releases/latest'; 
$zipFile = 'rbxfpsunlocker.zip'; 
$dest = Get-Location

$response = Invoke-WebRequest -Uri $apiUrl | ConvertFrom-Json;
$downloadUrl = $response.assets[0].browser_download_url; 

Write-Host 'Getting latest FPS Unlocker';
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile; 

Write-Host 'Unzipping file..';
Expand-Archive -Path $zipFile -DestinationPath $dest -Force;

Remove-Item $zipFile;
Write-Host 'Done!'

Read-Host -Prompt "Press Enter to continue"

Add-Type -AssemblyName System.IO.Compression.FileSystem

$version = '1.15.3'
$url = 'http://nginx.org/download/nginx-' + $version + '.zip'
$zipfile = ($PSScriptRoot + '\nginx-' + $version + '.zip')
$extractTo = ($PSScriptRoot + '\temp')
$extracted = ($PSScriptRoot + '\temp\nginx-' + $version)
$final = ($PSScriptRoot + '\temp\nginx')
$start_time = Get-Date


#Download Nginx
Write-Output ("Downloading Nginx " + $version + ' to ' + $zipfile)
Invoke-WebRequest -Uri $url -OutFile $zipfile
Write-Output "Download Complete. Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

# Extract the zip files to a temporary folder
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $extractTo);
Write-Output ('Extracted to ' + $extracted)


# Remove the version number from the nginx folder
Rename-Item -Path $extracted -NewName 'nginx'


# Move it to the C:\ Drive
try {
    Write-Output "Moving files to c:\nginx"
    Move-Item -Path $final -Destination 'c:\nginx'
} catch {
    Write-Output "You must run this script as administrator to copy nginx files folder to c:\nginx"
}

# Clean up temp files
Write-Output "Cleaning up"
Remove-Item -Path $extractTo
Remove-Item -Path $zipfile
Write-Output "Done. Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
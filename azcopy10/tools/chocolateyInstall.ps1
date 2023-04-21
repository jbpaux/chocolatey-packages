$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20230420/azcopy_windows_amd64_10.18.1.zip'
    checksum64     = 'fb31bd7d2b8892ddc2634fde7290c8b0e507e9981a20ddc6a8415bddb48c5e07'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20230420/azcopy_windows_386_10.18.1.zip'
    checksum       = '9a7ea35d77917a0073e6fb3ef45c5c2751323a5ca165fd372285730c7daa8222'
    checksumType   = 'sha256'
    destination    = $toolsDir
}

#Manage azcopy installation
Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path -Path $toolsDir -ChildPath 'azcopy'
If (Test-Path -Path $targetPath -PathType:Container) {
    Remove-Item -Path $targetPath -Force -Recurse
}

Get-ChildItem -Path $toolsDir -Directory -Filter "azcopy*" | Rename-Item  -NewName 'azcopy' -Force

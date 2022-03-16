$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20220315/azcopy_windows_amd64_10.14.1.zip'
    checksum64     = '1ea48ee2e45d799c72bf97ff53dc04e2e09d1ae8a11097a5392c9f9f67168e14'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20220315/azcopy_windows_386_10.14.1.zip'
    checksum       = '3ed816ca9854dfb60cb38987310d8f84171a65d162edd60b9e99e07cb94000a6'
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

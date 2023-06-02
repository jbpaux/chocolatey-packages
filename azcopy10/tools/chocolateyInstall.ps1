$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20230530/azcopy_windows_amd64_10.19.0.zip'
    checksum64     = '8f2fea430981105d2a01ac57db47120444655ed59f11947cc0469539f307bbec'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20230530/azcopy_windows_386_10.19.0.zip'
    checksum       = 'd9402c04820e668f2014e62a9fc438343165c9ddf70c48386e26d217197300e7'
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

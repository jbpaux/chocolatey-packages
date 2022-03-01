$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20220228/azcopy_windows_amd64_10.14.0.zip'
    checksum64     = '771556fa734100947b1de6c0f63d1b14ed6326f0adb57042320e17c25fd502e8'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20220228/azcopy_windows_386_10.14.0.zip'
    checksum       = 'edd9c6603f993966fdf0eff6968ea767ec06fe89301a69ecda4648c2cd60a730'
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

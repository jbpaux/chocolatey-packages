$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20210901/azcopy_windows_amd64_10.12.1.zip'
    checksum64     = 'fbaa822369c0f370ef6d6b4c50c78d41552c30bcabc7855a0b8823d472da0292'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20210901/azcopy_windows_386_10.12.1.zip'
    checksum       = 'a876867dcf04fcb5a39a879adc57e56d51b4fdf1c94ecddf86940d600444c701'
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

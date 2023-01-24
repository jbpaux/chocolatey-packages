$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20230123/azcopy_windows_amd64_10.17.0.zip'
    checksum64     = '9847303fa2fce0ede2a1366d0139f58f9de7cafed1b272b3544de05e51637b67'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20230123/azcopy_windows_386_10.17.0.zip'
    checksum       = 'b087d368b716de30da667fc44ae7da03e6c76e7c336a7a54a139ed866b4f5282'
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

$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/releases/release-10.20.0-20230727/azcopy_windows_amd64_10.20.0.zip'
    checksum64     = '0cb3aa127559b798b6567e60eb1ef02fc79dffbc9f1784be2ffaf68cd716fea5'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/releases/release-10.20.0-20230727/azcopy_windows_386_10.20.0.zip'
    checksum       = '1059436af0e8b5d48c1337d96d3d9ff4427f728904e6f4b38c1302e319a3ebb2'
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

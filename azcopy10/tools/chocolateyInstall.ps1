$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20191113/azcopy_windows_amd64_10.3.2.zip'
    checksum64     = '51d0457a2c9b017d77ca88d71f4bbb894f99f06cbedf567fa32faca9b6728719'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

#Manage azcopy installation
Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path -Path $toolsDir -ChildPath 'azcopy'
If (Test-Path -Path $targetPath -PathType:Container) {
    Remove-Item -Path $targetPath -Force
}
Rename-Item -Path (Join-Path -Path $toolsDir -ChildPath (($packageArgs.url64 -split '/' | Select-Object -Last 1) -replace ".zip", "") ) -NewName 'azcopy'


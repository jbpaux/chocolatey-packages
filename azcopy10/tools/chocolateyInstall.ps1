$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20210226/azcopy_windows_amd64_10.9.0.zip'
    checksum64     = '562a3bbf731cfead69266b6a779ef0b2b7fa4390b35fbedcbe22c8d67495ec9c'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

#Manage azcopy installation
Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path -Path $toolsDir -ChildPath 'azcopy'
If (Test-Path -Path $targetPath -PathType:Container) {
    Remove-Item -Path $targetPath -Force -Recurse
}
Rename-Item -Path (Join-Path -Path $toolsDir -ChildPath (($packageArgs.url64.replace('\', '/') -split '/' | Select-Object -Last 1) -replace ".zip", "") ) -NewName 'azcopy' -Force

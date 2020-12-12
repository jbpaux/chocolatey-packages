$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20201211/azcopy_windows_amd64_10.8.0.zip'
    checksum64     = '90da52f197e6976e88d7cc1973551600aa918c627b608b156d133b02d11dccda'
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

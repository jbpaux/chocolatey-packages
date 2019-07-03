$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20190702/azcopy_windows_amd64_10.2.0.zip'
    checksum64     = '6293d80cfba68dd9da6e97963a99d44f7f86f60233ddecbe3349f9cd49190985'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

#Manage azcopy installation
Install-ChocolateyZipPackage @packageArgs
Rename-Item -Path (Join-Path -Path $toolsDir -ChildPath (($packageArgs.url64 -split '/' | Select-Object -Last 1) -replace ".zip","") ) -NewName 'azcopy'


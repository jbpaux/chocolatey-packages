$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20190703/azcopy_windows_amd64_10.2.1.zip'
    checksum64     = '14af660681056673723d87ffe4ef23915a86abca66b2d23676281e0893442e22'
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


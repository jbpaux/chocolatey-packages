$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20191212/azcopy_windows_amd64_10.3.3.zip'
    checksum64     = '4220202ed3d0612b67c7e7cd1414f6e7c6b1b2ea8943c871e596df66b70b89bd'
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


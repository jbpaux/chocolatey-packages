$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20210415/azcopy_windows_amd64_10.10.0.zip'
    checksum64     = '4c797ba463ebedf5acdaab4deed40b51fe719167594e2d48cc6ef6fddacaacb7'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20210415/azcopy_windows_386_10.10.0.zip'
    checksum       = 'b40e0f800c18487f708cf1c0a9c3a7621428f2507f82c1ff80054b5aefe8e40a'
    checksumType   = 'sha256'
    destination    = $toolsDir
}

#Manage azcopy installation
Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path -Path $toolsDir -ChildPath 'azcopy'
If (Test-Path -Path $targetPath -PathType:Container) {
    Remove-Item -Path $targetPath -Force -Recurse
}
Rename-Item -Path (Join-Path -Path $toolsDir -ChildPath (($packageArgs.url64.replace('\', '/') -split '/' | Select-Object -Last 1) -replace ".zip", "") ) -NewName 'azcopy' -Force

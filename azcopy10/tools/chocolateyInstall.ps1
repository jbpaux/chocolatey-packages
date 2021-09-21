$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20210920/azcopy_windows_amd64_10.12.2.zip'
    checksum64     = 'b5464111326e809d44db7f2d291dd936db1ae538f9f99e190d2c016d3315cbca'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20210920/azcopy_windows_386_10.12.2.zip'
    checksum       = '21f566085b4f865840241ab00f0064d296ee9cdc6f6a07f6e58478c509ef7965'
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

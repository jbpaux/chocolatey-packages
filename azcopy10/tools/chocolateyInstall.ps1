$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20220721/azcopy_windows_amd64_10.16.0.zip'
    checksum64     = '5817cae8ca921f0c199a66cd1a98c2a2f81186b83fa8bceb3366af836cc7edd2'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20220721/azcopy_windows_386_10.16.0.zip'
    checksum       = 'dc042de5a4e55c13dccbd7c35e12701c1e0b8d099879356de97322ccb6f24333'
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

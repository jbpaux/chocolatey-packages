$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20211027/azcopy_windows_amd64_10.13.0.zip'
    checksum64     = 'c16b8b6d1b82143101c694354ba7b1265cdad71c0eb739991906a2c16a1b127a'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20211027/azcopy_windows_386_10.13.0.zip'
    checksum       = '4f9cbc3796602a62a0fcc5efeb12489b448318fb8b6cf1a3e567dfc8ad71fb8b'
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

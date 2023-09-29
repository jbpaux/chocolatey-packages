$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/releases/release-10.21.0-20230928/azcopy_windows_amd64_10.21.0.zip'
    checksum64     = 'ce22c0fd426f2e42b913ccc19f5e11d1bfd0e582cf4610c53e7116c4b8b89bae'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/releases/release-10.21.0-20230928/azcopy_windows_386_10.21.0.zip'
    checksum       = '8f9b94439c288c2a9ea636b6151c831199f16243e7b35613df833f350679003a'
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

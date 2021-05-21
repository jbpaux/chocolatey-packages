$ErrorActionPreference = 'Stop';
 
$packageName = 'ipinfo'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/ipinfo/cli/releases/download/ipinfo-1.1.5/ipinfo_1.1.5_windows_amd64.zip'
    checksum64     = '34950eeed80289560e59a09a778b14d67e0e74e415dede63efa3dfabf6427f4a'
    checksumType64 = 'sha256'
    url            = 'https://github.com/ipinfo/cli/releases/download/ipinfo-1.1.5/ipinfo_1.1.5_windows_386.zip'
    checksumType   = 'sha256'
    checksum       = '30030475ca73eb3a288b7bc5204ee51eaadb1551f6ef3b4ea4cdb59fab78c508'
    destination    = $toolsDir
}

$targetPath = Join-Path -Path $toolsDir -ChildPath "ipinfo.exe"
if (Test-Path $targetPath) {
    Remove-Item $targetPath
}
Install-ChocolateyZipPackage @packageArgs
Get-ChildItem -Path $toolsDir -Filter "ipinfo*.exe" | Rename-Item  -NewName "ipinfo.exe"

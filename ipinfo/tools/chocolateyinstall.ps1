$ErrorActionPreference = 'Stop';
 
$packageName = 'ipinfo'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/ipinfo/cli/releases/download/ipinfo-2.0.1/ipinfo_2.0.1_windows_amd64.zip'
    checksum64     = '68b90faeda484ed1ff72628b354002f57fdb77f5b430ec3141342bf149bf0189'
    checksumType64 = 'sha256'
    url            = 'https://github.com/ipinfo/cli/releases/download/ipinfo-2.0.1/ipinfo_2.0.1_windows_386.zip'
    checksumType   = 'sha256'
    checksum       = '187079b453fb3c5c0fc57e48252c76e1c84297a4fe2891827abf07c8b1548212'
    destination    = $toolsDir
}

$targetPath = Join-Path -Path $toolsDir -ChildPath "ipinfo.exe"
if (Test-Path $targetPath) {
    Remove-Item $targetPath
}
Install-ChocolateyZipPackage @packageArgs
Get-ChildItem -Path $toolsDir -Filter "ipinfo*.exe" | Rename-Item  -NewName "ipinfo.exe"

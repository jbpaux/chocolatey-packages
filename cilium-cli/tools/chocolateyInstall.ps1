$ErrorActionPreference = 'Stop';
 
$packageName = 'cilium-cli'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/cilium/cilium-cli/releases/download/v0.16.13/cilium-windows-amd64.zip'
    checksum64     = '0c9c6575da29a28741168f17d8493c44d988b75ac830c7574db9d2e50954a761'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

$targetPath = Join-Path -Path $toolsDir -ChildPath "cilium.exe"
if (Test-Path $targetPath) {
    Remove-Item $targetPath
}
Install-ChocolateyZipPackage @packageArgs

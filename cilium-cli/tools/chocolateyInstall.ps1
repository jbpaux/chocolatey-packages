$ErrorActionPreference = 'Stop';
 
$packageName = 'cilium-cli'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/cilium/cilium-cli/releases/download/v0.19.7/cilium-windows-amd64.zip'
    checksum64     = '332ccafa4ceb0c87caa61ac18b02fe35b9e5b6184ad14e92b95134b6c0fe7fb7'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

$targetPath = Join-Path -Path $toolsDir -ChildPath "cilium.exe"
if (Test-Path $targetPath) {
    Remove-Item $targetPath
}
Install-ChocolateyZipPackage @packageArgs

$ErrorActionPreference = 'Stop';
 
$packageName = 'cilium-cli'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/cilium/cilium-cli/releases/download/v0.16.12/cilium-windows-amd64.zip'
    checksum64     = 'f36c538e04920678dd504eb66a4e4759ce01b027abed6392c554fcf4ee723a21'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

$targetPath = Join-Path -Path $toolsDir -ChildPath "cilium.exe"
if (Test-Path $targetPath) {
    Remove-Item $targetPath
}
Install-ChocolateyZipPackage @packageArgs

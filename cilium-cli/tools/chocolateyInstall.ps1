$ErrorActionPreference = 'Stop';
 
$packageName = 'cilium-cli'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/cilium/cilium-cli/releases/download/v0.20.1/cilium-windows-amd64.zip'
    checksum64     = '869bc322c880db7c566995f8e251dd3270e15814f26e4c7c8c13922319a939e3'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

$targetPath = Join-Path -Path $toolsDir -ChildPath "cilium.exe"
if (Test-Path $targetPath) {
    Remove-Item $targetPath
}
Install-ChocolateyZipPackage @packageArgs

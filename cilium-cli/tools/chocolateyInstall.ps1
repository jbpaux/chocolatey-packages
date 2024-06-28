$ErrorActionPreference = 'Stop';
 
$packageName = 'cilium-cli'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/cilium/cilium-cli/releases/download/v0.16.11/cilium-windows-amd64.zip'
    checksum64     = 'a96b12b3b97c0182ceda744d6e2ee87a79af268e240af22783ca60155c608fe6'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

$targetPath = Join-Path -Path $toolsDir -ChildPath "cilium.exe"
if (Test-Path $targetPath) {
    Remove-Item $targetPath
}
Install-ChocolateyZipPackage @packageArgs

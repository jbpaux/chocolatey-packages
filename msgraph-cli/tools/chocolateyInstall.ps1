$ErrorActionPreference = 'Stop';
 
$packageName = 'msgraph-cli'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/microsoftgraph/msgraph-cli/releases/download/v1.9.0/msgraph-cli-win-x64-1.9.0.zip'
    checksum64     = '2da778a6f35820fa565399081cea5cc194568a9eeb9527449d43dd050afcbaae'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

$targetPath = Join-Path -Path $toolsDir -ChildPath "mgc.*"
if (Test-Path $targetPath) {
    Remove-Item $targetPath
}
Install-ChocolateyZipPackage @packageArgs

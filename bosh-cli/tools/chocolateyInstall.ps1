$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.1/bosh-cli-7.10.1-windows-amd64.exe'
    Checksum64     = '1efb9916cb8d44262b94b54a5c7ba480e221a1bf2e417fd6e088b6908acaf286'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

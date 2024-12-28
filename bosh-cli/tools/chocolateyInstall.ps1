$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.8.6/bosh-cli-7.8.6-windows-amd64.exe'
    Checksum64     = 'c97e0ea238e9e2b2d95d32f1a85a171a44370c372eff84caeb7393e18d09d008'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

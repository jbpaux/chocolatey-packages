$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.0/bosh-cli-7.10.0-windows-amd64.exe'
    Checksum64     = 'e12aa858a9b0afd86e85c139f3ec1d0f12708bc402921140ac2a322c7b6e08ce'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

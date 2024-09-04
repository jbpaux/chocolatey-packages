$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.7.1/bosh-cli-7.7.1-windows-amd64.exe'
    Checksum64     = '8756f26f35d0ca9ee2ef8ba9d2745bb299e4e409dd0250e30c202038570323d3'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

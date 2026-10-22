$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.11.2/bosh-cli-7.11.2-windows-amd64.exe'
    Checksum64     = '1f7c028ba0e980e3939d3911d41ba6c6d0cb13a96242e70d22fca12a1e341df0'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

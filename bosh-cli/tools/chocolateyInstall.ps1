$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.16/bosh-cli-7.9.16-windows-amd64.exe'
    Checksum64     = '2643ca083e5b07469399e301dc4335fcb9a4a651d94f45c7466d3cd376684dae'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

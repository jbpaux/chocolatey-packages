$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.8.1/bosh-cli-7.8.1-windows-amd64.exe'
    Checksum64     = 'c8cf910d21bb469db62e7a60f82fdf52a00d4ce8b9d29cbc509596d2b6b24f5d'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

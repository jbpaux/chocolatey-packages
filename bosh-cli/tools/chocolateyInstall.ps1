$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.0.0/bosh-cli-7.0.0-windows-amd64.exe'
    Checksum64     = 'e0f5a2220bad1a25c026fa002563a87af9379fb0440f5b0aff1e754f64c0213d'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

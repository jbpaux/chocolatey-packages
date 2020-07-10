$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.3.1/bosh-cli-6.3.1-windows-amd64.exe'
    Checksum64     = '7930088f5793bdd9ffc941e40cdbf0b468ff4473b33e719e68aa0b1e51086bef'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

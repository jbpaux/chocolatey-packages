$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.10/bosh-cli-7.9.10-windows-amd64.exe'
    Checksum64     = '8ffc0c461250784de954b49cdf5fa500f079114adf16e7980d9bf30267c1b4d4'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

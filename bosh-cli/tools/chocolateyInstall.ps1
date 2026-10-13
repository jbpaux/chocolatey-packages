$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.11.1/bosh-cli-7.11.1-windows-amd64.exe'
    Checksum64     = '5e04ac004e267f5024f0bb9d1cc7e2f8f220ac81d4a4f4db02eead2b2f2d8dc7'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

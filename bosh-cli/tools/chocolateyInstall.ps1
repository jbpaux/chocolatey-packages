$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.8/bosh-cli-7.10.8-windows-amd64.exe'
    Checksum64     = '1f008ca9737679195045fdb3950dfda3c0b4bbcd5f5487dc96ad66b11aba5e37'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

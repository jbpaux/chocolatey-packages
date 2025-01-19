$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.8.7/bosh-cli-7.8.7-windows-amd64.exe'
    Checksum64     = 'beb1155d20f7cfb0fb9af7fd58c7fdae1edf5b95113ef6ade78b2575ac926d20'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

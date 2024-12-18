$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.8.5/bosh-cli-7.8.5-windows-amd64.exe'
    Checksum64     = '7708d13cd58b4e8a74f83d1ea7923625962e6b545138cd30aba86bfd420397a5'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

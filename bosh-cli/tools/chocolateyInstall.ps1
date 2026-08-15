$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.9/bosh-cli-7.10.9-windows-amd64.exe'
    Checksum64     = 'c0a3596bfe3df74d1bcb949ccb2120990325b4508798d5a8bb2cbb6e873894e4'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

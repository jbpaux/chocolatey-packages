$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.6.2/bosh-cli-7.6.2-windows-amd64.exe'
    Checksum64     = '13c60c4702e6b53abf809e19ca550c330494887f80f651a5a1950b44fa4e2e45'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

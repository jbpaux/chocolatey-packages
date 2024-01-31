$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.5.2/bosh-cli-7.5.2-windows-amd64.exe'
    Checksum64     = '2c7a3db2cbccf813298f7c6e08e75e8c67dcb02aa7c833733a48729ebfa65266'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

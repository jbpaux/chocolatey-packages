$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.12/bosh-cli-6.4.12-windows-amd64.exe'
    Checksum64     = '6700eac3bbb8afed77ee1d50372628beba2a787bbe02c5f4cd08420577e00a6b'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

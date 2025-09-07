$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.11/bosh-cli-7.9.11-windows-amd64.exe'
    Checksum64     = '8644db3447ceae03a95564b84446ea8cafa77ac273d933163f4e5675b6303140'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

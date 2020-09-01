$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.0/bosh-cli-6.4.0-windows-amd64.exe'
    Checksum64     = 'c70d923eee722387f4868b29d0c0b1f0de01188ab9d302dd050be26ab84a62af'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

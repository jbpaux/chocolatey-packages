$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.14/bosh-cli-7.9.14-windows-amd64.exe'
    Checksum64     = '5f46ec10d8eb6b8fc90d9c46589356bc1f9e5894b9b062ac1a9f816e63f6a53c'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

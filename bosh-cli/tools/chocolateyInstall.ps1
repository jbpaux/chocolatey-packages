$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.17/bosh-cli-7.9.17-windows-amd64.exe'
    Checksum64     = 'bb9e6e30b5d4061046bbd6f3d24c4488ee15ac18a16678562099d7110dd687b0'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

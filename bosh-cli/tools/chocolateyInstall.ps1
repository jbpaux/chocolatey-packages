$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.11.3/bosh-cli-7.11.3-windows-amd64.exe'
    Checksum64     = '875a07b9e3f131280ae0b0f76a6f557f65278e651737de1d59a2584d43f2c0c9'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

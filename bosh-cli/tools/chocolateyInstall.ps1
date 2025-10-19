$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.13/bosh-cli-7.9.13-windows-amd64.exe'
    Checksum64     = '826c9a6a2f2d4a6527f4ba9220ec017e3e6edb642300b822402f5a79b5bf52b1'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

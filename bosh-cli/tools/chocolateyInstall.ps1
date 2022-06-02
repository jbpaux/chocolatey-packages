$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.0.1/bosh-cli-7.0.1-windows-amd64.exe'
    Checksum64     = 'a9e3b8d570afe5acb0e42ad7e455d7086326e0c6f9f0f1a74c36f49f5c1ffbfa'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

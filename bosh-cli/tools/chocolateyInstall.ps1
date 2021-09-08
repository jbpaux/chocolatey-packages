$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.6/bosh-cli-6.4.6-windows-amd64.exe'
    Checksum64     = '54efdcf7c3d638e050f48f1e63a92a0782c408cf5683d8202f9dfe638909e5b8'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.11/bosh-cli-7.10.11-windows-amd64.exe'
    Checksum64     = 'ccb1bc640adf00eeda14ec66dd45faa0d8d90b565d8212f01cdaf177e38d3ce6'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

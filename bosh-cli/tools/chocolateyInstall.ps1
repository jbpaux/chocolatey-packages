$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.7.0/bosh-cli-7.7.0-windows-amd64.exe'
    Checksum64     = '92c86b7c2cb3f519edadfcbcf1e6f10b8dfee4ba238976325543aeafcb9ef6ee'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

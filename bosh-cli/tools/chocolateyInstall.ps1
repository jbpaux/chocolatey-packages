$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.2/bosh-cli-7.9.2-windows-amd64.exe'
    Checksum64     = '21db3ae4d2e9c665beba33a63f4151752bd1d26a486497d3a2820f85a608442e'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

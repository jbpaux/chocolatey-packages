$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.8/bosh-cli-6.4.8-windows-amd64.exe'
    Checksum64     = '5f0db6c55be484a162bee1b818d53ef017fa6a0235682f72ee92bd4ecd189aa8'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

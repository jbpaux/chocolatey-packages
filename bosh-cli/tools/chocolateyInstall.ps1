$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.6.0/bosh-cli-7.6.0-windows-amd64.exe'
    Checksum64     = '33cbba89729332d5bc057dfe2a25068c3c4913dff40d0ee89d53d7592069063b'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.1.0/bosh-cli-6.1.0-windows-amd64.exe'
    Checksum64     = '2c386b6a087c0e38bb9906aa45df95e331cfc3f7489cffe956240377935d7b34'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

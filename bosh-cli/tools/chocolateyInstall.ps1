$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.4/bosh-cli-7.9.4-windows-amd64.exe'
    Checksum64     = 'fd4bcd4ecc822a9bf98cdbb017423bd34837b2708073338ee330d2ede475a49a'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.3/bosh-cli-7.10.3-windows-amd64.exe'
    Checksum64     = '9fb830123f67ba262231eaf316b22ef757c1eba86b900b825daa68963e86cb56'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

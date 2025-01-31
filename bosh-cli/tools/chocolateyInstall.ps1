$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.0/bosh-cli-7.9.0-windows-amd64.exe'
    Checksum64     = '7e29e4b6b95c8de733111b65cc162b9e88028fd39c1d891ff63e46ccb2f1ef2a'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

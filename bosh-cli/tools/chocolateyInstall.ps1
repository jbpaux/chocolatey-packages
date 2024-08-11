$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.6.3/bosh-cli-7.6.3-windows-amd64.exe'
    Checksum64     = 'c8449a56d95ad55c62abdaf9f9cddc0f8e1aaca63def8ad4b5d848d139e37a53'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

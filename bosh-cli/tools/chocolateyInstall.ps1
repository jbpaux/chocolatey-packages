$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.5.7/bosh-cli-7.5.7-windows-amd64.exe'
    Checksum64     = '03c6571fbc4a34c53ba94a56bf292165c34b365c02265ffaf18d593d09458484'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

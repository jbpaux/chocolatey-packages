$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.5/bosh-cli-7.9.5-windows-amd64.exe'
    Checksum64     = '72ba73c2dddd01984737423f877ec97d17e43f32d5a8caec31b32d4235e4d8e3'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

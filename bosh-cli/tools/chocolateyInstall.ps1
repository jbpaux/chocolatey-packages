$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.12/bosh-cli-7.9.12-windows-amd64.exe'
    Checksum64     = '66c9b5a1dc88a6ecd92ad50ea0a82df2860a6f94662e6660a2b96f094d6e031f'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

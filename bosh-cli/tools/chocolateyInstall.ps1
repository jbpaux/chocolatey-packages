$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v5.5.1/bosh-cli-5.5.1-windows-amd64.exe'
    Checksum64     = '4b84aa8bc96f8f04fcbaab97e4323ef9792eabf81b3502c452dcf29ea2048cdf'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

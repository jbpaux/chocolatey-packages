$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.5/bosh-cli-7.10.5-windows-amd64.exe'
    Checksum64     = 'e38ccc6d7f1911bb390b677fac5f6f196207cd1c74eba0a261f23b36558bd691'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

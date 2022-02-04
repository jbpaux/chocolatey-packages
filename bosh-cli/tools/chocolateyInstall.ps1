$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.14/bosh-cli-6.4.14-windows-amd64.exe'
    Checksum64     = 'dc8dec3a5b1612052a3a55940aa424272339afaa5d40e305b49fecf07d0a7b1a'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

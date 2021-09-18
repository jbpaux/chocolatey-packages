$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.7/bosh-cli-6.4.7-windows-amd64.exe'
    Checksum64     = 'aca24638153e8e658d6b0780aef06d9c495268c3dc55a0d7db1ac664d41ebb0e'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

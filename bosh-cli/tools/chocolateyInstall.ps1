$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.7/bosh-cli-7.9.7-windows-amd64.exe'
    Checksum64     = 'c4c9cc0a3de1c0b818e69d51a48ec9ae895ee3eace74195d48529c07e6c188d3'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

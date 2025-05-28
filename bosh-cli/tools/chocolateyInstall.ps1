$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.6/bosh-cli-7.9.6-windows-amd64.exe'
    Checksum64     = 'c49d799f1ebc7bbaf5b02bbc41d3b4d68d7f0b5c0553444a1bcd5f3144264eda'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.5.4/bosh-cli-7.5.4-windows-amd64.exe'
    Checksum64     = 'ea8f7729fc91134e3f492b4ee22e278a909368f8d03d0a72e62a8517f518353e'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

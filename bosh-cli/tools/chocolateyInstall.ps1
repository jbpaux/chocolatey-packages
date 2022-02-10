$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.15/bosh-cli-6.4.15-windows-amd64.exe'
    Checksum64     = '396ef0c5d26a714b437f1b910f4e4cbcf888c810d18e09fd07c4d930ae7e6192'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

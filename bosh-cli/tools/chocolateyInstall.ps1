$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.5.3/bosh-cli-7.5.3-windows-amd64.exe'
    Checksum64     = 'e718c9416c10fbf445a4cf59d87896fb001cccbb2a24e56b63e9794bc2970757'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.11.0/bosh-cli-7.11.0-windows-amd64.exe'
    Checksum64     = 'fe53f8fe95116103d11247a171035a345bf75b92de50e1e26c21e9a728e059fa'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

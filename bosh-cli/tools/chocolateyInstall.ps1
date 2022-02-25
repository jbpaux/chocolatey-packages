$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.17/bosh-cli-6.4.17-windows-amd64.exe'
    Checksum64     = 'd2274c902298dd2be28b934877055a7f810f91bb47a26d41b45c28c35e2c9a4e'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.9/bosh-cli-6.4.9-windows-amd64.exe'
    Checksum64     = 'e1da03983a8e1bdd9c20db0d522268652d77dde79634e4e5d16162c7fea349e9'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

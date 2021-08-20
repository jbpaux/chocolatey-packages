$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.5/bosh-cli-6.4.5-windows-amd64.exe'
    Checksum64     = '3172f57725f1620618000cac37eee01159fc64f601967fed20ccb7a26279c0fd'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

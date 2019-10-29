$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.1.1/bosh-cli-6.1.1-windows-amd64.exe'
    Checksum64     = 'a1480e90ee823108332e2087ebd6b62817b75db4c03bd6a603da1d8333e07e22'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

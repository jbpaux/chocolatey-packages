$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.18/bosh-cli-7.9.18-windows-amd64.exe'
    Checksum64     = '9d62fa74ba6fc80c64b4ec3412027406bef29e2d58e742063ceecf1672a2323e'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

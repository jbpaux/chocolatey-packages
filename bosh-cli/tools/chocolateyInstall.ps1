$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.4/bosh-cli-6.4.4-windows-amd64.exe'
    Checksum64     = '39b8512f7ddc35f7857dc038b8b7028b09e2f0dd72d056b2974602a4d9ba2610'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

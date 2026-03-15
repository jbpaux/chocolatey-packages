$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.19/bosh-cli-7.9.19-windows-amd64.exe'
    Checksum64     = '435bd1704e65db993827f2e6e89f456388b8b0b88eb658f5f752d5f2b348867a'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

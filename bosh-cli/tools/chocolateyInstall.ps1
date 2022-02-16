$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.16/bosh-cli-6.4.16-windows-amd64.exe'
    Checksum64     = '122edd10e581c9adb38fede2b2e7227a3bcb037f9264b52f62db0f9e6ddc66c1'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

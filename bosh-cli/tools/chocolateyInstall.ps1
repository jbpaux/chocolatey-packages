$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.8/bosh-cli-7.9.8-windows-amd64.exe'
    Checksum64     = '02142aefc95270450d7175b61d248fcf7f697316df103bef2adcf49915e7d877'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

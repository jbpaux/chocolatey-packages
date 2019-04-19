$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v5.5.0/bosh-cli-5.5.0-windows-amd64.exe'
    Checksum64     = '3a1b7bbd1969dc42401fc90397daf56cf338cf3cf051be029378a1f06cee8a07'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.7/bosh-cli-7.10.7-windows-amd64.exe'
    Checksum64     = '287fbc5efa168d87e7fd4b274eb4f2110c2174e4ee268c0fcb05366f8dd70609'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

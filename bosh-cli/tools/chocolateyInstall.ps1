$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.0.0/bosh-cli-6.0.0-windows-amd64.exe'
    Checksum64     = 'c80dbde95787803033f8fef6a1f686683797ab5bdd2039711c69a89ab3045bf6'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.3/bosh-cli-6.4.3-windows-amd64.exe'
    Checksum64     = '963eef4539dfdf23aa2e0e51e23d6c0fe6ab798415c4b912cad9862bd3aac574'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

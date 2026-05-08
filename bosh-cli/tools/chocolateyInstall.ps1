$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.4/bosh-cli-7.10.4-windows-amd64.exe'
    Checksum64     = '61b9ee93344080cf43b2f4212046cfc1bb2011f8ebf35b829687ea4efdc6bcd7'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

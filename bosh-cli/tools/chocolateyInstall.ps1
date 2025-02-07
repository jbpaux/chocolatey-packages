$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.1/bosh-cli-7.9.1-windows-amd64.exe'
    Checksum64     = 'e8c24ad07b2f11f5de850f6e5a037a82e4554776992d1c304fc17c72a67c538a'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

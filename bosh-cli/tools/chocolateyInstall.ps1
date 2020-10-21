$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.1/bosh-cli-6.4.1-windows-amd64.exe'
    Checksum64     = 'c7f0590ba20e184abb02b77f42ed5381e10b5f92bdd56bb176b72ec5d851c213'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

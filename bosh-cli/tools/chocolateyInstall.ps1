$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.8.4/bosh-cli-7.8.4-windows-amd64.exe'
    Checksum64     = 'e4fa92eddf62a4d776fa36031105bd0aade6b6958ba5d8d13fa18f1b1e448196'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

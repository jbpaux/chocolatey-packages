$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.9/bosh-cli-7.9.9-windows-amd64.exe'
    Checksum64     = '1cfe6896b0c8854677320d4c3bc8a1594526b62813284aa43ad87dd8b8dcac37'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

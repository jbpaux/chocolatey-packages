$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.7.2/bosh-cli-7.7.2-windows-amd64.exe'
    Checksum64     = 'b56b8ee246f0948e986e466b8bdaef5d4e7c5fd8ba5d3d2d193f679d6d07f284'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

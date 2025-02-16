$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.3/bosh-cli-7.9.3-windows-amd64.exe'
    Checksum64     = 'b477f7070734866ab289845f878fc540569fb5c3458adfd916b3d3b9b962c86f'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

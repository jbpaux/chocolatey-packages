$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.8.2/bosh-cli-7.8.2-windows-amd64.exe'
    Checksum64     = 'ba3c2f35d5b09792745b0d592d1b41f6996b9c9adf61b6d2eea2cbd4cd872abe'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

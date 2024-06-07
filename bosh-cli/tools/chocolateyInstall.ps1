$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.6.1/bosh-cli-7.6.1-windows-amd64.exe'
    Checksum64     = '92f706ec4fd0cfcb2e2bacb59c50bca831a8b883d25a8cdcaf892ec873d2f088'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.13/bosh-cli-6.4.13-windows-amd64.exe'
    Checksum64     = '40347d0d3efebb0e5a004043c344632d0622bcc2f7e82ca7bc27c7aa766090c9'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

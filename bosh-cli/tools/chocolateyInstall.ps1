$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.10/bosh-cli-7.10.10-windows-amd64.exe'
    Checksum64     = 'da1449de1f9601dfc9bcb2b122ea4a99ef269e151fa88400664f3cf27cb73de2'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

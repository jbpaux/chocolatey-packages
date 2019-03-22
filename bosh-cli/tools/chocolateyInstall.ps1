$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v5.4.0/bosh-cli-5.4.0-windows-amd64.exe'
    Checksum64     = '12f8ba07fd3e063f97e77c3bd3aa7454b978d764c2ef28dcf468c346dd064293'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
Register-Application "$toolsDir\$exeName"

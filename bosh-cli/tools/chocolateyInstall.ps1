$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.9.15/bosh-cli-7.9.15-windows-amd64.exe'
    Checksum64     = 'ffaa9128c47f3941198760473e427bf120aaeb513c06a244c39b28ca7d423e45'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

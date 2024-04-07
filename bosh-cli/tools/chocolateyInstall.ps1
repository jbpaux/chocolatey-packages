$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.5.6/bosh-cli-7.5.6-windows-amd64.exe'
    Checksum64     = '2fbfd60e36d2d6e2bf7c509f4d43a816da5c8690fe537959a645f6db50467e93'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

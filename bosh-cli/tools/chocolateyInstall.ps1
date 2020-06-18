$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.3.0/bosh-cli-6.3.0-windows-amd64.exe'
    Checksum64     = 'e6aaaa7f10fccaaf1dfc7a67319bb67c9dabe504fa1155e49aeb8a16994c4fc3'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

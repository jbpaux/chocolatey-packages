$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.2/bosh-cli-7.10.2-windows-amd64.exe'
    Checksum64     = '559b86ecd95fb1fe5dfc81280d4f42f9be811e128444bbbb228d5d9b45743747'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

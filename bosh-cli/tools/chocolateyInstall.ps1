$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.10.6/bosh-cli-7.10.6-windows-amd64.exe'
    Checksum64     = '76bbc65f272a45f5cf6875f80c4e10814f5091c26f9325eae9d37593b93ed5a5'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

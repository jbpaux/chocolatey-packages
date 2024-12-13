$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.8.3/bosh-cli-7.8.3-windows-amd64.exe'
    Checksum64     = '01c862749667343592c6d850ab3cbfa9446905c8bda6e02285c798e3f3756523'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.10/bosh-cli-6.4.10-windows-amd64.exe'
    Checksum64     = '226c24e78ede01afb3bfb1154cad5d15ae6e85a08b66ac003f08e862f959abe9'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

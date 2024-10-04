$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.8.0/bosh-cli-7.8.0-windows-amd64.exe'
    Checksum64     = '9726697630ea386560f6bf89cb8f09b3fb3f4fc32279119d9448fe2315aeaa10'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

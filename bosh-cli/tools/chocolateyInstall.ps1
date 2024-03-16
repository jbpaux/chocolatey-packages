$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v7.5.5/bosh-cli-7.5.5-windows-amd64.exe'
    Checksum64     = 'b7910695e9a1046f729a230b86964d3dbe886c87385dafc7eaed0fd23d2d9932'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

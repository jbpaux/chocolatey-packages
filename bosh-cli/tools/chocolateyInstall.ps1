$ErrorActionPreference = 'Stop'

$packageName = 'bosh-cli'
$exeName     = 'bosh.exe'
$toolsDir      = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName  = $packageName
    FileFullPath = "$toolsDir\$exeName"
    Url64          = 'https://github.com/cloudfoundry/bosh-cli/releases/download/v6.4.11/bosh-cli-6.4.11-windows-amd64.exe'
    Checksum64     = '78dd934437a79a19ebb5763482def7e84538eb3e4617dac206b56a314642b5a0'
    ChecksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

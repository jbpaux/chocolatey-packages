$ErrorActionPreference = 'Stop';
 
$packageName = 'azshell'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://github.com/yangl900/azshell/releases/download/v0.2.2/azshell_windows_64-bit.zip'
    checksum64     = 'baa621c2ff3d1ca2a2f7ad78e908fea619c55c1e6b05822521aae9e8f7c43791'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

#Manage azcopy installation
Install-ChocolateyZipPackage @packageArgs
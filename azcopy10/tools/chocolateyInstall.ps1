$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$version = '10.1.2.20190520'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20190517/azcopy_windows_amd64_10.1.2.zip'
    checksum64     = '9efc6744de46d68852f0510e48233095d79049bb9949d7ddb5ca3f1980a7a560'
    checksumType64 = 'sha256'
    destination    = $toolsDir
}

#Manage azcopy installation
Install-ChocolateyZipPackage @packageArgs
Rename-Item -Path (Join-Path -Path $toolsDir -ChildPath "azcopy_windows_amd64_$version" ) -NewName 'azcopy'


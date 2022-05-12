$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20220511/azcopy_windows_amd64_10.15.0.zip'
    checksum64     = 'dab9d075b078da04b381f45459ebce87f147b8134fb86cb896463290cd87afa4'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20220511/azcopy_windows_386_10.15.0.zip'
    checksum       = 'b5303d4dddf06f18bd252f382e99e680011216ee97685d5f2098ef73f46fbd9a'
    checksumType   = 'sha256'
    destination    = $toolsDir
}

#Manage azcopy installation
Install-ChocolateyZipPackage @packageArgs

$targetPath = Join-Path -Path $toolsDir -ChildPath 'azcopy'
If (Test-Path -Path $targetPath -PathType:Container) {
    Remove-Item -Path $targetPath -Force -Recurse
}

Get-ChildItem -Path $toolsDir -Directory -Filter "azcopy*" | Rename-Item  -NewName 'azcopy' -Force

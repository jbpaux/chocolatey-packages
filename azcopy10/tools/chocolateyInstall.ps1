$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20220511/azcopy_windows_amd64_10.15.0.zip'
    checksum64     = '65d6699618e7e7d13525a5e9b9c2598a6051b7710e722345f54339faf690efa0'
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

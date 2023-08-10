$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/releases/release-10.20.1-20230809/azcopy_windows_amd64_10.20.1.zip'
    checksum64     = 'bc7ffddd618d22b262e6a7fc2fffbea2c70fe468040b7eb128902dce50cfb066'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/releases/release-10.20.1-20230809/azcopy_windows_386_10.20.1.zip'
    checksum       = '48634e4a19aa7028f0dceb45a789bffa380fa027e1c09382319cdb4f37ebd1d1'
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

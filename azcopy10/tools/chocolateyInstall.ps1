$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20221108/azcopy_windows_amd64_10.16.2.zip'
    checksum64     = '703bc31018bf0cde5be50d897c454d64ac924a418fd21ce1c2642ad95952ab5a'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20221108/azcopy_windows_386_10.16.2.zip'
    checksum       = 'f4a871575c0091534ad6a5f76d4d45d593e082060aaeda65ddd2eeca482af1f7'
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

$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20230331/azcopy_windows_amd64_10.18.0.zip'
    checksum64     = '08ef2645b638f39123a69856adba873b4b3c8fbccbb4e4824b27f2acbdddbe56'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20230331/azcopy_windows_386_10.18.0.zip'
    checksum       = 'e74d80fe8824697a8b06e1f01674d2ddd942f3ee35faa4afe69f6fd262f1dec5'
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

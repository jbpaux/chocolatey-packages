$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20210616/azcopy_windows_amd64_10.11.0.zip'
    checksum64     = '8ce7f6d30f4ec6d249d9977ba579fa1812dc3120827858426510045658a6dcb1'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20210616/azcopy_windows_386_10.11.0.zip'
    checksum       = '767cbb5560b4627602add69f0f250b6b39ba08f1beb996a8f875593d35da0861'
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

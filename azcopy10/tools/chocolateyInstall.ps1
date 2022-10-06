$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy10'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $packageName
    url64          = 'https://azcopyvnext.azureedge.net/release20221005/azcopy_windows_amd64_10.16.1.zip'
    checksum64     = '1d483db659844ee21f50aad3dcb74dc03b03af85b13161982b709ca890532c1f'
    checksumType64 = 'sha256'
    url            = 'https://azcopyvnext.azureedge.net/release20221005/azcopy_windows_386_10.16.1.zip'
    checksum       = '24914df83ad9a5a1605bca7abdded47169b123a97dc7c9ed58439c254cf97cd0'
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

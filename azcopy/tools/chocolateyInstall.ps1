$ErrorActionPreference = 'Stop';
 
$packageName = 'azcopy'
 
$packageArgs = @{
    packageName    = $packageName
    url            = 'https://azcopy.azureedge.net/azcopy-8-1-0/MicrosoftAzureStorageAzCopy_netcore_x64.msi'
    fileType       = "msi"
 
    softwareName   = 'Microsoft Azure Storage AzCopy*'
    checksum       = 'a84f70851bac44c4f1d977f510744e394f34471e9bd5655782ea4f7551b893af'
    checksumType   = 'sha256'
 
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs

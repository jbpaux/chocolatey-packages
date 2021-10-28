$ErrorActionPreference = 'Stop';
 
$packageName = 'azdata-cli'
 
$packageArgs = @{
    packageName    = $packageName
    url            = 'https://download.microsoft.com/download/f/f/f/fffaa914-d4f7-4885-89c7-696bbfe7670a/azdata-cli-20.3.8.msi'
    fileType       = "msi"
 
    softwareName   = 'Microsoft Data CLI'
    checksum       = '9d42fe6a174cb4d25c384d46132ad80e9bcb3190d047094972aede0f8f0a5a4e'
    checksumType   = 'sha256'
 
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs

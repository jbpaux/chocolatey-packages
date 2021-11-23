$ErrorActionPreference = 'Stop';
 
$packageName = 'azdata-cli'
 
$packageArgs = @{
    packageName    = $packageName
    url            = 'https://download.microsoft.com/download/f/f/f/fffaa914-d4f7-4885-89c7-696bbfe7670a/azdata-cli-20.3.9.msi'
    fileType       = "msi"
 
    softwareName   = 'Microsoft Data CLI'
    checksum       = '9d3773dab9d4ee184910cea3262e1768e4a6ae1c42998c7f0574eebead7ef41f'
    checksumType   = 'sha256'
 
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs

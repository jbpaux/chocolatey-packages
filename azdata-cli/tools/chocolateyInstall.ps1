$ErrorActionPreference = 'Stop';
 
$packageName = 'azdata-cli'
 
$packageArgs = @{
    packageName    = $packageName
    url            = 'https://download.microsoft.com/download/f/f/f/fffaa914-d4f7-4885-89c7-696bbfe7670a/azdata-cli-20.3.10.msi'
    fileType       = "msi"
 
    softwareName   = 'Microsoft Data CLI'
    checksum       = 'f5ff2fd67c1813725f448b4ac2ff259a83b81d5802efebc1fba3d804940947fd'
    checksumType   = 'sha256'
 
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs

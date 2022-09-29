$ErrorActionPreference = 'Stop';
 
$packageName = 'azdata-cli'
 
$packageArgs = @{
    packageName    = $packageName
    url            = 'https://download.microsoft.com/download/f/f/f/fffaa914-d4f7-4885-89c7-696bbfe7670a/azdata-cli-20.3.14.msi'
    fileType       = "msi"
 
    softwareName   = 'Microsoft Data CLI'
    checksum       = '7f58f76fcb83232a8d806baf1fdae15b452d72d0360ec758fa04b5966e4e24de'
    checksumType   = 'sha256'
 
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs

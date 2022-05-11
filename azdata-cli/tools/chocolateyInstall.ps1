$ErrorActionPreference = 'Stop';
 
$packageName = 'azdata-cli'
 
$packageArgs = @{
    packageName    = $packageName
    url            = 'https://download.microsoft.com/download/f/f/f/fffaa914-d4f7-4885-89c7-696bbfe7670a/azdata-cli-20.3.11.msi'
    fileType       = "msi"
 
    softwareName   = 'Microsoft Data CLI'
    checksum       = 'e7084b857db856ef99c08f73c77073021d41168d49b4974dfc4499b1dab02908'
    checksumType   = 'sha256'
 
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs

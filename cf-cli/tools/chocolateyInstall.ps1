$ErrorActionPreference = 'Stop'

$packageName = 'cf-cli'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName    = $packageName
    Destination    = $toolsDir
    Url            = 'https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v6.44.1/cf-cli_6.44.1_win32.zip'
    Checksum32     = '876d09608c9cecdec4249f589ca3da374efc837c52035b8254d2d456e4c4d59e'
    ChecksumType32 = 'sha256'
    Url64Bit       = 'https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v6.44.1/cf-cli_6.44.1_winx64.zip'
    Checksum64     = 'bf9f2651d3df84edc22a497eaa8f1df5d869b496ad0180e8dd782942e7627eb1'
    ChecksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

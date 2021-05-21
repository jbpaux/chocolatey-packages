import-module au

$repo = 'ipinfo/cli'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
            "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $release = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest"
    if ($null -ne $release) {
        $url64 = ($release.assets |Where-Object name -like "*_windows_amd64.zip").browser_download_url
        $url32 = ($release.assets |Where-Object name -like "*_windows_386.zip").browser_download_url
        
        $version = $release.name.split('-')[1]
        
        @{
            URL64   = $url64
            URL32   = $url32
            Version = $version
        }
    }
}

update -ChecksumFor all

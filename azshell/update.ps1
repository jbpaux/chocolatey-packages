import-module au

$repo = 'yangl900/azshell'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases"
    if ($null -ne $releases) {
        $release = $releases | Sort-Object published_at -Descending | Select-Object -First 1
        if ($null -ne $release) {
            $url64 = ($release.assets | Where-Object name -eq "azshell_windows_64-bit.zip" ).browser_download_url
            $version = $release.name -replace "v",""
        
            @{
                URL64   = $url64
                Version = $version
            }
        }
    }
}

update -ChecksumFor 64

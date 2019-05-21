import-module au

$releases = 'https://aka.ms/downloadazcopy-v10-windows'

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
    $download_page = Invoke-WebRequest -Uri $releases -MaximumRedirection 0 -ErrorAction SilentlyContinue

    $url64 = $download_page.Headers.Location
    $version = $url64 -replace ".zip", "" -split "_" | Select-Object -Last 1

    @{
        URL64   = $url64
        Version = $version
    }
}

update -ChecksumFor 64

import-module au

$releases = 'https://aka.ms/downloadazcopyprwindows'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -MaximumRedirection 0 -ErrorAction SilentlyContinue

    $url32 = $download_page.Headers.Location
    if ( $url32 -match "azcopy-(?<version>[\d-]+)/") {
        $version = $Matches["version"] -replace '-', '.'
    }

    @{
        URL32   = $url32
        Version = $version
    }
}

update -ChecksumFor 32

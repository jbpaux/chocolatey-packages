import-module au

$releases = 'https://github.com/yangl900/azshell/releases'

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url64 = 'https://github.com' + ($download_page.links | Where-Object href -match '.zip$' | ForEach-Object href | Select-Object -First 1)
    $version = (Split-Path ( Split-Path $url64 ) -Leaf).Substring(1)
    
    @{
        URL64   = $url64
        Version = $version
    }
}

update -ChecksumFor 64

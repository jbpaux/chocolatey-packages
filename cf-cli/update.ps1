import-module au

$releases = 'https://github.com/cloudfoundry/cli/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*[$]packageName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
            "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum32\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

    }
}

function global:au_BeforeUpdate { }
function global:au_AfterUpdate { }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = "release=windows64-exe"
    $urlrelease = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href
    $urlredirect = Invoke-WebRequest -Uri $urlrelease -MaximumRedirection 0 -ErrorAction SilentlyContinue

    $url64 = $urlredirect.Headers.Location
    $url32 = $url64 -replace "winx64", "win32"

    $version = $url64 -split '_' | Select-Object -Last 1 -Skip 1

    return @{
        URL64        = $url64
        URL32        = $url32
        Version      = $version.Replace('v', '')
        ReleaseNotes = "$releases/tag/v${version}"
    }
}

update

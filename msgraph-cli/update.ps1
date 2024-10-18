import-module au

$repo = 'microsoftgraph/msgraph-cli'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*[$]packageName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

    }
}

function global:au_BeforeUpdate { 
    Remove-Item "$PSScriptRoot\tools\*.exe" -Force
}
function global:au_AfterUpdate {  }

function global:au_GetLatest {
    $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases"
    if ($null -ne $releases) {
        $release = $releases | Sort-Object published_at -Descending | Select-Object -First 1
        if ($null -ne $release) {
            $url64 = ($release.assets | Where-Object name -like "msgraph-cli-win-x64-*.zip").browser_download_url
            $version = $release.tag_name -replace "v", ""
        
            @{
                URL64   = $url64
                Version = $version
            }
        }
    }
}

update -ChecksumFor 64

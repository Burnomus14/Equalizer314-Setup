$ErrorActionPreference = "Stop"

$repoRoot = $PSScriptRoot
$readmePath = Join-Path $repoRoot "README.md"

function Get-EqDeviceTag([string]$name) {
    $n = $name.ToLowerInvariant()
    if ($n -match 'airpods|tws|earphone|m19|a12t|64 audio|centreearphone|deepwaves original|dolbysub on earphone|pistonbuds|spacebud|galaxy bud|chu2|penta driver') {
        return "Earbuds / TWS / IEMs"
    }
    if ($n -match 'headphone|hd headphone|funki-nude|tune 510bt') {
        return "Over-Ear Headphones"
    }
    if ($n -match 'car|bspider|carsub') {
        return "Car Audio / Subwoofer"
    }
    if ($n -match 'soundbar|homeavc|hometheather|home theather|pioneer') {
        return "Home Theater / Soundbar"
    }
    if ($n -match 'outdoor|behringer|djsound|enclosed box|15 inch|woofer|pa compressor|big speakers|targa|p\.m\.p\.o') {
        return "Outdoor PA / DJ / Large Speakers"
    }
    if ($n -match 'small spk|small speaker|jbl go|neo7se|phone speaker') {
        return "Small / Portable Speakers"
    }
    if ($n -match 'sony|icepower|harman|reference|flat|vocal|clarity|clear|studio|master|platinum|gold|balance|comfort|presence|signature') {
        return "Headphones / Earbuds (All-Rounder)"
    }
    return "General / Multi-Device"
}

function Get-EqDescription([string]$name) {
    $n = $name.ToLowerInvariant()
    $focuses = New-Object System.Collections.Generic.List[string]

    if ($n -match 'less bass|reduced bass|bass cut|less low') {
        $focuses.Add("reduced bass")
    } elseif ($n -match 'bass|sub|woofer|low') {
        $focuses.Add("bass or low frequencies")
    }
    if ($n -match 'punch|kick') {
        $focuses.Add("punch or kick impact")
    }
    if ($n -match 'clarity|clear|vocal|voice|midrange') {
        $focuses.Add("clarity or vocals")
    }
    if ($n -match 'trebble|treble|high') {
        $focuses.Add("treble or higher frequencies")
    }
    if ($focuses.Count -gt 0) {
        return "Name suggests emphasis on $($focuses -join ' and ')."
    }
    if ($n -match 'iso\s*226') {
        return "Name identifies this as an ISO 226 equal-loudness profile."
    }
    if ($n -match 'car|carsound|carbass') {
        return "Name identifies this as a car-audio profile."
    }
    if ($n -match 'speaker|soundbar|home theater|hometheater|outdoor|pa ') {
        return "Name identifies this as a speaker or sound-system profile."
    }
    if ($n -match 'headphone|earphone|earbud|airpods|tws|a12t') {
        return "Name identifies a headphone or earphone-oriented profile."
    }
    if ($n -match 'sony|vivo|lenovo|edifier|moondrop|64 audio|1more|penta driver|jbl|hifiman|pistonbuds') {
        return "Name identifies a device-specific tuning; use it as a starting point for the named model."
    }
    if ($n -match 'classical|jazz|reggae|riddim|gospel|dance|dj|party|rnb|blues') {
        return "Name identifies a music-style listening profile."
    }
    return "General EQ profile; the name does not specify a particular sound target."
}

function Get-EqCategoryIds([string]$name, [string[]]$lines) {
    $n = $name.ToLowerInvariant()
    $categories = New-Object System.Collections.Generic.List[string]
    $regionSums = @{ bass = 0.0; midrange = 0.0; treble = 0.0 }
    $regionCounts = @{ bass = 0; midrange = 0; treble = 0 }
    $maxAbsGain = 0.0
    $hasBands = $false
    $preamp = 0.0

    foreach ($line in $lines) {
        if ($line -match '^Preamp:\s*([-+]?[\d.]+)\s+dB') {
            $preamp = [double]::Parse($matches[1], [Globalization.CultureInfo]::InvariantCulture)
        } elseif ($line -match '^Filter\s+(\d+):\s+ON\s+\w+\s+Fc\s+([\d.]+)\s+Hz\s+Gain\s+([-+]?[\d.]+)\s+dB') {
            $hasBands = $true
            $filterNumber = [int]$matches[1]
            $frequency = [double]::Parse($matches[2], [Globalization.CultureInfo]::InvariantCulture)
            $gain = [double]::Parse($matches[3], [Globalization.CultureInfo]::InvariantCulture)
            $absoluteGain = [Math]::Abs($gain)
            if ($absoluteGain -gt $maxAbsGain) {
                $maxAbsGain = $absoluteGain
            }

            if ($filterNumber -gt 2) {
                if ($frequency -le 250) {
                    $regionSums.bass += $absoluteGain
                    $regionCounts.bass++
                } elseif ($frequency -le 4000) {
                    $regionSums.midrange += $absoluteGain
                    $regionCounts.midrange++
                } else {
                    $regionSums.treble += $absoluteGain
                    $regionCounts.treble++
                }
            }
        }
    }

    if ($n -match 'bass|sub|woofer|low|kick|punch') {
        $categories.Add("bass")
    }
    if ($n -match '\bmid\b|midrange') {
        $categories.Add("midrange")
    }
    if ($n -match 'vocal|voice') {
        $categories.Add("vocals")
    }
    if ($n -match 'trebble|treble|\bhigh\b|clarity|clear|bright|air') {
        $categories.Add("treble")
    }

    if ($hasBands -and $maxAbsGain -le 0.5 -and [Math]::Abs($preamp) -le 0.5) {
        $categories.Add("neutral")
    } elseif ($categories.Count -eq 0) {
        $regionScores = New-Object System.Collections.Generic.List[object]
        foreach ($region in @("bass", "midrange", "treble")) {
            $score = if ($regionCounts[$region] -gt 0) { $regionSums[$region] / $regionCounts[$region] } else { 0.0 }
            $regionScores.Add([pscustomobject]@{ Id = $region; Score = $score })
        }
        $rankedRegions = @($regionScores | Sort-Object Score -Descending)
        if ($rankedRegions[0].Score -ge 4.0 -and ($rankedRegions[0].Score - $rankedRegions[1].Score) -ge 2.0) {
            $categories.Add($rankedRegions[0].Id)
        }
    }

    if ($categories.Count -eq 0) {
        $categories.Add("general")
    }
    return $categories.ToArray()
}

function Get-EqPreferredDevice([string]$name) {
    $group = Get-EqDeviceTag $name
    $n = $name.ToLowerInvariant()
    $models = @(
        [pscustomobject]@{ Pattern = 'airpods\s*4'; Name = 'Apple AirPods 4' },
        [pscustomobject]@{ Pattern = 'jbl tune 510bt'; Name = 'JBL Tune 510BT' },
        [pscustomobject]@{ Pattern = 'jbl go 4'; Name = 'JBL Go 4' },
        [pscustomobject]@{ Pattern = '1more penta|penta driver'; Name = '1MORE Penta Driver' },
        [pscustomobject]@{ Pattern = '64 audio a12t'; Name = '64 Audio A12t' },
        [pscustomobject]@{ Pattern = 'pistonbuds pro q30'; Name = 'PistonBuds Pro Q30' },
        [pscustomobject]@{ Pattern = 'moondrop chu2'; Name = 'Moondrop Chu2' },
        [pscustomobject]@{ Pattern = 'hifiman tws600'; Name = 'HIFIMAN TWS600' },
        [pscustomobject]@{ Pattern = 'lenovo gm2 pro'; Name = 'Lenovo GM2 Pro' },
        [pscustomobject]@{ Pattern = 'vivo x200 ultra'; Name = 'Vivo X200 Ultra' },
        [pscustomobject]@{ Pattern = 'edifier tws6'; Name = 'Edifier TWS6' }
    )
    foreach ($model in $models) {
        if ($n -match $model.Pattern) {
            return "$($model.Name) ($group)"
        }
    }
    return $group
}

function Get-HrirDeviceTag([string]$name) {
    $n = $name.ToLowerInvariant()
    if ($n -match 'atmos|dolby|dh|dht') {
        return "Headphones / Earbuds (Dolby)"
    }
    if ($n -match 'dts|gsx|sbx|cmss|raz|thx|sonic|oal') {
        return "Headphones / Earbuds (3D Gaming & Spatial)"
    }
    return "Headphones / Earbuds Only (Binaural)"
}

function Get-HrirDescription([string]$name) {
    $profile = $name
    $channel = $null

    if ($profile -match '_(L|left)$') {
        $profile = $profile -replace '_(L|left)$', ''
        $channel = "Left"
    } elseif ($profile -match '_(R|right)$') {
        $profile = $profile -replace '_(R|right)$', ''
        $channel = "Right"
    }

    if ($profile -eq "none") {
        $description = "No-surround HRIR option, based on the profile name."
    } elseif ($profile -match '^(atmos|dh|dht)') {
        $description = "Dolby-labeled binaural surround profile."
    } elseif ($profile -match '^(cmss|gsx|sbx|dtshx|razer|sonic|oal)') {
        $description = "Spatial-audio profile identified by the file name."
    } else {
        $description = "Binaural surround HRIR profile named '$($profile -replace '_', ' ')'."
    }

    if ($channel) {
        $description += " $channel-channel file."
    }
    return $description
}

function Escape-MarkdownCell([string]$value) {
    return $value.Replace("|", "\|")
}

function Escape-Html([string]$value) {
    return [Net.WebUtility]::HtmlEncode($value)
}

function Replace-MarkedContent([string]$content, [string]$startMarker, [string]$endMarker, [string]$replacement, [string]$sectionName) {
    $startIndex = $content.IndexOf($startMarker, [StringComparison]::Ordinal)
    if ($startIndex -lt 0) {
        throw "Could not find the start marker for $sectionName in index.html."
    }
    if ($content.IndexOf($startMarker, $startIndex + $startMarker.Length, [StringComparison]::Ordinal) -ge 0) {
        throw "Found multiple start markers for $sectionName in index.html."
    }

    $contentStart = $startIndex + $startMarker.Length
    $endIndex = $content.IndexOf($endMarker, $contentStart, [StringComparison]::Ordinal)
    if ($endIndex -lt 0) {
        throw "Could not find the end marker for $sectionName in index.html."
    }
    if ($content.IndexOf($endMarker, $endIndex + $endMarker.Length, [StringComparison]::Ordinal) -ge 0) {
        throw "Found multiple end markers for $sectionName in index.html."
    }

    return $content.Substring(0, $contentStart) + "`n" + $replacement + "`n" + $content.Substring($endIndex)
}

$apoFiles = @(Get-ChildItem -LiteralPath (Join-Path $repoRoot "presets-apo") -Filter "*.txt" -File | Sort-Object Name)
$wavFiles = @(Get-ChildItem -LiteralPath (Join-Path $repoRoot "hrir-surround") -Filter "*.wav" -File | Sort-Object Name)

if ($apoFiles.Count -eq 0) {
    throw "No EqualizerAPO preset files were found in presets-apo."
}
if ($wavFiles.Count -eq 0) {
    throw "No HRIR files were found in hrir-surround."
}

$md = New-Object System.Collections.Generic.List[string]
$md.Add("## Parametric EQ Presets ($($apoFiles.Count))")
$md.Add("")
$md.Add("| # | Preset | Description | Recommended Device | Preamp | Bands |")
$md.Add("| :--- | :--- | :--- | :--- | :--- | :--- |")

$categoryDefinitions = @(
    [pscustomobject]@{ Id = "bass"; Label = "Bass / Low" },
    [pscustomobject]@{ Id = "midrange"; Label = "Midrange" },
    [pscustomobject]@{ Id = "vocals"; Label = "Vocals" },
    [pscustomobject]@{ Id = "treble"; Label = "Treble / Clarity" },
    [pscustomobject]@{ Id = "neutral"; Label = "Flat / Neutral" },
    [pscustomobject]@{ Id = "general"; Label = "General / Other" }
)
$categoryLabels = @{}
$categoryCounts = @{}
foreach ($categoryDefinition in $categoryDefinitions) {
    $categoryLabels[$categoryDefinition.Id] = $categoryDefinition.Label
}
$recommendationCards = New-Object System.Collections.Generic.List[string]

$index = 1
foreach ($file in $apoFiles) {
    $lines = @(Get-Content -LiteralPath $file.FullName)
    $preampLine = $lines | Where-Object { $_ -match '^Preamp:' } | Select-Object -First 1
    $preamp = if ($preampLine) { $preampLine -replace '^Preamp:\s*', '' } else { "Not specified" }
    $bands = @($lines | Where-Object { $_ -match '^Filter\s+\d+:' }).Count
    $name = Escape-MarkdownCell $file.BaseName
    $description = Escape-MarkdownCell (Get-EqDescription $file.BaseName)
    $device = Escape-MarkdownCell (Get-EqDeviceTag $file.BaseName)
    $url = [Uri]::EscapeDataString($file.Name).Replace("(", "%28").Replace(")", "%29")
    $md.Add("| $index | [$name](presets-apo/$url) | $description | $device | $preamp | $bands |")

    $categoryIds = @(Get-EqCategoryIds $file.BaseName $lines)
    $categoryTags = New-Object System.Collections.Generic.List[string]
    foreach ($categoryId in $categoryIds) {
        if (-not $categoryLabels.ContainsKey($categoryId)) {
            throw "Unknown recommendation category '$categoryId' for '$($file.Name)'."
        }
        if (-not $categoryCounts.ContainsKey($categoryId)) {
            $categoryCounts[$categoryId] = 0
        }
        $categoryCounts[$categoryId]++
        $categoryLabel = Escape-Html $categoryLabels[$categoryId]
        $categoryTags.Add("<span class=""category-tag category-tag-$categoryId"">$categoryLabel</span>")
    }

    $recommendationName = Escape-Html $file.BaseName
    $recommendationText = Get-EqDescription $file.BaseName
    if ($recommendationText -match '^General EQ profile;') {
        $focusLabels = New-Object System.Collections.Generic.List[string]
        foreach ($categoryId in $categoryIds) {
            if ($categoryId -ne "general") {
                $focusLabels.Add($categoryLabels[$categoryId])
            }
        }
        if ($focusLabels.Count -gt 0) {
            $recommendationText = "Filter curve shows stronger relative shaping in $($focusLabels -join ', ')."
        } else {
            $recommendationText = "General starting point; no single sound target stands out from the preset name or filter curve."
        }
    }
    $recommendationDescription = Escape-Html $recommendationText
    $preferredDevice = Escape-Html (Get-EqPreferredDevice $file.BaseName)
    $downloadName = Escape-Html $file.Name
    $categoryData = [string]::Join(" ", [string[]]$categoryIds)
    $recommendationCards.Add(
        "<article class=""recommendation-card searchable"" data-categories=""$categoryData""><h4>$recommendationName</h4><p class=""category-tags"">$($categoryTags -join ' ')</p><p><strong>Suggested focus:</strong> $recommendationDescription</p><p><strong>Preferred device:</strong> $preferredDevice</p><button class=""btn"" data-url=""presets-apo/$url"" data-name=""$downloadName"">Download EQ preset</button></article>"
    )
    $index++
}

$md.Add("")
$md.Add("## HeSuVi Virtual Surround HRIRs ($($wavFiles.Count))")
$md.Add("")
$md.Add("> Binaural profiles are for headphones and earbuds only. Turn Virtual Surround off for speakers.")
$md.Add("")
$md.Add("| # | Profile | Description | Recommended Device | Size |")
$md.Add("| :--- | :--- | :--- | :--- | :--- |")

$index = 1
foreach ($file in $wavFiles) {
    $sizeKb = [Math]::Round($file.Length / 1KB, 1)
    $name = Escape-MarkdownCell $file.BaseName
    $description = Escape-MarkdownCell (Get-HrirDescription $file.BaseName)
    $device = Escape-MarkdownCell (Get-HrirDeviceTag $file.BaseName)
    $url = [Uri]::EscapeDataString($file.Name).Replace("(", "%28").Replace(")", "%29")
    $md.Add("| $index | [$name](hrir-surround/$url) | $description | $device | $sizeKb KB |")
    $index++
}

$readme = [IO.File]::ReadAllText($readmePath)
$headingPattern = '(?m)^(?:<<<<<<< HEAD\r?\n)?## Parametric EQ Presets[^\r\n]*\r?\n'
$heading = [regex]::Match($readme, $headingPattern)
if (-not $heading.Success) {
    throw "Could not find the Parametric EQ Presets section in README.md."
}

$prefix = $readme.Substring(0, $heading.Index)
$prefix = [regex]::Replace($prefix, '(?m)^<<<<<<< HEAD\r?\n', '')
if ($prefix -match '(?m)^(<<<<<<<|=======|>>>>>>>)') {
    throw "Unresolved Git conflict markers remain before the generated preset tables."
}

$updatedReadme = $prefix + ($md -join "`n") + "`n"
$utf8WithoutBom = New-Object System.Text.UTF8Encoding($false)

$portalPath = Join-Path $repoRoot "index.html"
$portalRows = New-Object System.Collections.Generic.List[string]
foreach ($file in $apoFiles) {
    $lines = @(Get-Content -LiteralPath $file.FullName)
    $preampLine = $lines | Where-Object { $_ -match '^Preamp:' } | Select-Object -First 1
    $preamp = if ($preampLine) { $preampLine -replace '^Preamp:\s*', '' } else { "Not specified" }
    $bands = @($lines | Where-Object { $_ -match '^Filter\s+\d+:' }).Count
    $name = Escape-Html $file.BaseName
    $description = Escape-Html (Get-EqDescription $file.BaseName)
    $device = Escape-Html (Get-EqDeviceTag $file.BaseName)
    $url = [Uri]::EscapeDataString($file.Name).Replace("(", "%28").Replace(")", "%29")
    $downloadName = Escape-Html $file.Name
    $portalRows.Add("<tr><td><strong>$name</strong></td><td>$description</td><td>$device</td><td>$preamp</td><td>$bands</td><td><button class=""btn"" data-url=""presets-apo/$url"" data-name=""$downloadName"">Download .txt</button></td></tr>")
}

$portalSection = New-Object System.Collections.Generic.List[string]
$portalSection.Add('<section id="eq-tab" class="tab-panel" role="tabpanel" aria-labelledby="tab-eq" tabindex="0" hidden>')
$portalSection.Add("<h2>Parametric EQ Presets ($($apoFiles.Count))</h2>")
$portalSection.Add('<div class="wrap"><table><thead><tr><th>Preset</th><th>Description</th><th>Device</th><th>Preamp</th><th>Bands</th><th></th></tr></thead><tbody>')
$portalSection.Add($portalRows -join "`n")
$portalSection.Add('</tbody></table></div>')
$portalSection.Add('</section>')
$portalSection.Add('<section id="hrir-tab" class="tab-panel" role="tabpanel" aria-labelledby="tab-hrir" tabindex="0" hidden>')

$categoryFilters = New-Object System.Collections.Generic.List[string]
$categoryFilters.Add("<button type=""button"" class=""category-filter"" data-category=""all"" aria-pressed=""true"">All ($($apoFiles.Count))</button>")
foreach ($categoryDefinition in $categoryDefinitions) {
    if (-not $categoryCounts.ContainsKey($categoryDefinition.Id)) {
        continue
    }
    $categoryLabel = Escape-Html $categoryDefinition.Label
    $categoryFilters.Add("<button type=""button"" class=""category-filter"" data-category=""$($categoryDefinition.Id)"" aria-pressed=""false"">$categoryLabel ($($categoryCounts[$categoryDefinition.Id]))</button>")
}

$hrirProfileNames = @("atmos", "dh+", "cmss_ent")
$hrirCategoryGroups = New-Object System.Collections.Generic.List[string]
foreach ($categoryDefinition in $categoryDefinitions) {
    $hrirOptions = New-Object System.Collections.Generic.List[string]
    foreach ($profileName in $hrirProfileNames) {
        $profileFileName = "$profileName.wav"
        $profilePath = Join-Path (Join-Path $repoRoot "hrir-surround") $profileFileName
        if (-not (Test-Path -LiteralPath $profilePath -PathType Leaf)) {
            throw "Optional HRIR recommendation is missing: $profilePath"
        }
        $profileDescription = Escape-Html (Get-HrirDescription $profileName)
        $profileDownloadName = Escape-Html $profileFileName
        $profileUrl = [Uri]::EscapeDataString($profileFileName).Replace("(", "%28").Replace(")", "%29")
        $hrirOptions.Add("<button class=""btn"" data-url=""hrir-surround/$profileUrl"" data-name=""$profileDownloadName"" title=""$profileDescription"">Download $([Net.WebUtility]::HtmlEncode($profileName))</button>")
    }
    $categoryLabel = Escape-Html $categoryDefinition.Label
    $hrirCategoryGroups.Add("<div class=""hrir-category-options"" data-category=""$($categoryDefinition.Id)""><h4>Optional HRIRs for $categoryLabel</h4>$($hrirOptions -join ' ')</div>")
}

$recommendationMarkup = New-Object System.Collections.Generic.List[string]
$recommendationMarkup.Add("<h2>Sound Recommendations ($($apoFiles.Count) EQ presets)</h2>")
$recommendationMarkup.Add('<div class="notice"><strong>Starting points, not universal rankings:</strong> category tags are inferred from preset names and filter curves. Match device-specific presets to the named model when possible. HRIR surround changes spatial processing, not EQ tone; choose it by preference, and use it with headphones or earbuds only. Turn it off for speakers.</div>')
$recommendationMarkup.Add('<div class="category-filters" role="group" aria-label="Filter recommendations by sound category">')
$recommendationMarkup.Add($categoryFilters -join "`n")
$recommendationMarkup.Add('</div>')
$recommendationMarkup.Add('<p class="filter-note">Presets may have multiple category tags; each EQ preset appears once in All.</p>')
$recommendationMarkup.Add('<p class="flat-note"><strong>Flat / Neutral:</strong> no true flat preset file is available. For a flat EQ response, leave EQ off; HRIR is optional.</p>')
$recommendationMarkup.Add('<div id="recommendation-list" class="recommendation-grid">')
$recommendationMarkup.Add($recommendationCards -join "`n")
$recommendationMarkup.Add('</div>')
$recommendationMarkup.Add('<details class="hrir-suggestions"><summary>Optional surround HRIR options by category</summary><p>These are shared spatial alternatives, not HRIRs tuned to a particular EQ curve. Pick by listening preference; headphones and earbuds only.</p>')
$recommendationMarkup.Add($hrirCategoryGroups -join "`n")
$recommendationMarkup.Add('</details>')

$portal = [IO.File]::ReadAllText($portalPath)
$portal = Replace-MarkedContent $portal "<!-- GENERATED_RECOMMENDATIONS_START -->" "<!-- GENERATED_RECOMMENDATIONS_END -->" ($recommendationMarkup -join "`n") "generated EQ recommendations"
$portalHeading = [regex]::Match($portal, '(?m)^(?:<section id="eq-tab"[^>]*>\r?\n)*<h2>Parametric EQ Presets \(\d+\)</h2>\r?\n')
if (-not $portalHeading.Success) {
    throw "Could not find the Parametric EQ Presets section in index.html."
}
$portalTailStart = $portalHeading.Index + $portalHeading.Length
$portalTail = $portal.Substring($portalTailStart)
$hrirHeading = [regex]::Match($portalTail, '(?m)^<h2>HeSuVi Virtual Surround HRIRs \(\d+\)</h2>')
if (-not $hrirHeading.Success) {
    throw "Could not find the HeSuVi section after the EQ table in index.html."
}
$portalEnd = $portalTailStart + $hrirHeading.Index
$updatedPortal = $portal.Substring(0, $portalHeading.Index) + ($portalSection -join "`n") + "`n" + $portal.Substring($portalEnd)

[IO.File]::WriteAllText($readmePath, $updatedReadme, $utf8WithoutBom)
[IO.File]::WriteAllText($portalPath, $updatedPortal, $utf8WithoutBom)

Write-Host "Updated README and download portal with $($apoFiles.Count) EQ descriptions and $($wavFiles.Count) HRIR descriptions." -ForegroundColor Green

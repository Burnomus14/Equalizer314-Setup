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

$portal = [IO.File]::ReadAllText($portalPath)
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

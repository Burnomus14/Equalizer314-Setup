[CmdletBinding()]
param(
    [string]$ImportFolder
)

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$jsonFolder = Join-Path $repoRoot "presets-json"
$apoFolder = Join-Path $repoRoot "presets-apo"
$backupPath = Join-Path $repoRoot "backups\Equalizer314-RESTORE.json"
$invariant = [Globalization.CultureInfo]::InvariantCulture
$utf8WithoutBom = New-Object System.Text.UTF8Encoding($false)

function Read-JsonFile([string]$path) {
    return [IO.File]::ReadAllText($path) | ConvertFrom-Json
}

function Get-NameKey([string]$name) {
    $normalized = $name.Normalize([Text.NormalizationForm]::FormD).ToLowerInvariant()
    $normalized = [regex]::Replace($normalized, '\p{M}', '')
    return [regex]::Replace($normalized, '[^a-z0-9]', '')
}

function Get-SafePresetName([string]$name) {
    $safe = $name -replace '[^a-zA-Z0-9 \-_().]', ''
    $safe = ($safe -replace '\s+', ' ').Trim().TrimEnd('.')
    if (-not $safe) {
        return "Preset"
    }
    return $safe
}

function Get-UniquePresetName([string]$name, [hashtable]$usedNames) {
    $base = Get-SafePresetName $name
    $candidate = $base
    $suffix = 2
    while ($usedNames.ContainsKey($candidate.ToLowerInvariant())) {
        $candidate = "$base ($suffix)"
        $suffix++
    }
    $usedNames[$candidate.ToLowerInvariant()] = $true
    return $candidate
}

function Get-ApoFilterType($value, [string]$source) {
    if ($null -eq $value) {
        throw "A filter in '$source' has no type."
    }

    switch ([string]$value) {
        "0" { return "PK" }
        "1" { return "LSC" }
        "2" { return "HSC" }
        "3" { return "PK" }
        "4" { return "PK" }
        "5" { return "PK" }
        "PK" { return "PK" }
        "LSC" { return "LSC" }
        "HSC" { return "HSC" }
        "LP" { return "LP" }
        "HP" { return "HP" }
        default { throw "Unsupported Poweramp filter type '$value' in '$source'." }
    }
}

function Get-AppFilterType([string]$apoType) {
    switch ($apoType) {
        "PK" { return "BELL" }
        "LSC" { return "LOW_SHELF" }
        "HSC" { return "HIGH_SHELF" }
        "LP" { return "LOW_PASS" }
        "HP" { return "HIGH_PASS" }
        default { throw "Unsupported EqualizerAPO filter type '$apoType'." }
    }
}

function ConvertTo-Number($value, [string]$field, [string]$source) {
    $number = 0.0
    if ($null -eq $value -or -not [double]::TryParse([string]$value, [Globalization.NumberStyles]::Float, $invariant, [ref]$number)) {
        throw "Invalid $field value in '$source'."
    }
    if ([double]::IsNaN($number) -or [double]::IsInfinity($number)) {
        throw "Non-finite $field value in '$source'."
    }
    return $number
}

function ConvertTo-NormalizedBand($band, [string]$source) {
    $frequency = ConvertTo-Number $band.frequency "frequency" $source
    $gain = ConvertTo-Number $band.gain "gain" $source
    $q = ConvertTo-Number $band.q "Q" $source
    $apoType = Get-ApoFilterType $band.type $source
    if ($frequency -le 0 -or $q -lt 0 -or ($q -eq 0 -and $apoType -notin @("LSC", "HSC"))) {
        throw "Frequency and Q must be valid for the filter type in '$source'."
    }

    $enabled = $true
    if ($null -ne $band.enabled) {
        $enabled = [bool]$band.enabled
    }

    return [pscustomobject]@{
        Frequency = $frequency
        Gain = $gain
        Q = $q
        ApoType = $apoType
        Enabled = $enabled
    }
}

function Add-SourcePreset($preset, [string]$source, [string]$fallbackName, [System.Collections.Generic.List[object]]$records, [hashtable]$usedNames) {
    if ($null -eq $preset.bands -or @($preset.bands).Count -eq 0) {
        throw "Preset in '$source' has no bands."
    }

    $name = [string]$preset.name
    if (-not $name) {
        $name = $fallbackName
    }
    if (-not $name) {
        throw "Preset in '$source' has no name."
    }

    $preampValue = 0
    if ($preset.PSObject.Properties['preamp']) {
        $preampValue = $preset.preamp
    } elseif ($preset.PSObject.Properties['preampGain']) {
        $preampValue = $preset.preampGain
    }
    $preamp = ConvertTo-Number $preampValue "preamp" $source

    $bands = New-Object System.Collections.Generic.List[object]
    foreach ($band in @($preset.bands)) {
        $bands.Add((ConvertTo-NormalizedBand $band $source))
    }

    $outputName = Get-UniquePresetName $name $usedNames
    $records.Add([pscustomobject]@{
        Name = $name
        OutputName = $outputName
        Preamp = $preamp
        Bands = $bands
        Source = $source
    })
}

if ($ImportFolder) {
    if (-not (Test-Path -LiteralPath $ImportFolder -PathType Container)) {
        throw "Import folder not found: $ImportFolder"
    }

    $resolvedImportFolder = (Resolve-Path -LiteralPath $ImportFolder).Path
    $aggregateCopied = $false
    foreach ($file in Get-ChildItem -LiteralPath $resolvedImportFolder -Filter "*.json" -File -Recurse | Sort-Object FullName) {
        if ($file.Name -eq "Equalizer314-RESTORE.json" -or $file.Name -eq "template_backup.json") {
            Write-Host "Leaving non-Poweramp backup out of presets-json: $($file.Name)"
            continue
        }

        $data = Read-JsonFile $file.FullName
        if ($file.Name -eq "All_Presets_Backup.json") {
            if ($null -eq $data.presets) {
                throw "Poweramp aggregate backup has no presets array: $($file.FullName)"
            }
            $destination = Join-Path $jsonFolder $file.Name
            Copy-Item -LiteralPath $file.FullName -Destination $destination -Force
            $aggregateCopied = $true
            continue
        }

        if ($null -eq $data.name -or $null -eq $data.bands) {
            throw "JSON file is not a supported individual Poweramp preset: $($file.FullName)"
        }
        $destination = Join-Path $jsonFolder $file.Name
        Copy-Item -LiteralPath $file.FullName -Destination $destination -Force
    }

    if (-not $aggregateCopied -and -not (Test-Path -LiteralPath (Join-Path $jsonFolder "All_Presets_Backup.json"))) {
        throw "The import folder and presets-json are both missing All_Presets_Backup.json."
    }
}

$individualFiles = @(Get-ChildItem -LiteralPath $jsonFolder -Filter "*.json" -File |
    Where-Object { $_.Name -ne "All_Presets_Backup.json" } |
    Sort-Object Name)
if ($individualFiles.Count -eq 0) {
    throw "No individual Poweramp preset JSON files were found in presets-json."
}

$records = New-Object System.Collections.Generic.List[object]
$usedNames = @{}
$individualNameKeys = @{}

foreach ($file in $individualFiles) {
    $data = Read-JsonFile $file.FullName
    if ($null -eq $data.name -or $null -eq $data.bands) {
        throw "JSON file is not a supported individual Poweramp preset: $($file.FullName)"
    }

    $nameKey = Get-NameKey ([string]$data.name)
    if (-not $nameKey) {
        throw "Preset name in '$($file.Name)' has no usable characters."
    }
    $individualNameKeys[$nameKey] = $true
    Add-SourcePreset $data $file.Name $file.BaseName $records $usedNames
}

$aggregatePath = Join-Path $jsonFolder "All_Presets_Backup.json"
if (Test-Path -LiteralPath $aggregatePath) {
    $aggregate = Read-JsonFile $aggregatePath
    if ($null -eq $aggregate.presets) {
        throw "Poweramp aggregate backup has no presets array: $aggregatePath"
    }
    foreach ($preset in @($aggregate.presets)) {
        $name = [string]$preset.presetName
        if (-not $name) {
            throw "Poweramp aggregate backup contains a preset without a name."
        }
        $nameKey = Get-NameKey $name
        if ($individualNameKeys.ContainsKey($nameKey)) {
            continue
        }
        if ($null -eq $preset.filters -or @($preset.filters).Count -eq 0) {
            throw "Aggregate preset '$name' has no filters."
        }

        $converted = [pscustomobject]@{
            name = $name
            preamp = $preset.preamp
            bands = @($preset.filters | ForEach-Object {
                [pscustomobject]@{
                    frequency = $_.frequency
                    gain = $_.gain
                    q = $_.q
                    type = $_.type
                    enabled = $_.enabled
                }
            })
        }
        Add-SourcePreset $converted "All_Presets_Backup.json" $name $records $usedNames
    }
}

if ($records.Count -eq 0) {
    throw "No presets were available to convert."
}

$outputs = New-Object System.Collections.Generic.List[object]
foreach ($record in $records) {
    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add([string]::Format($invariant, "Preamp: {0:F2} dB", $record.Preamp))
    $filterNumber = 1
    foreach ($band in $record.Bands) {
        if (-not $band.Enabled) {
            continue
        }
        $line = [string]::Format(
            $invariant,
            "Filter {0}: ON {1} Fc {2:0.##} Hz Gain {3:F2} dB Q {4:F2}",
            $filterNumber,
            $band.ApoType,
            $band.Frequency,
            $band.Gain,
            $band.Q
        )
        $lines.Add($line)
        $filterNumber++
    }
    $outputs.Add([pscustomobject]@{
        Name = $record.OutputName
        Content = ($lines -join "`n") + "`n"
    })
}

$restore = Read-JsonFile $backupPath
if ($null -eq $restore.custom_presets -or $null -eq $restore.eq_settings) {
    throw "Equalizer314 restore backup is missing required settings."
}
$preserved = [ordered]@{
    eq_settings = $restore.eq_settings
    device_bindings = $restore.device_bindings
    app_bindings = $restore.app_bindings
}
$preservedBefore = ConvertTo-Json -InputObject $preserved -Depth 100 -Compress

$customPresets = [ordered]@{}
$customPresetNames = New-Object System.Collections.Generic.List[string]
foreach ($record in $records) {
    $appBands = New-Object System.Collections.Generic.List[object]
    foreach ($band in $record.Bands) {
        $appBands.Add([ordered]@{
            frequency = $band.Frequency
            gain = $band.Gain
            filterType = (Get-AppFilterType $band.ApoType)
            q = $band.Q
            enabled = $band.Enabled
        })
    }

    $appPreset = [ordered]@{
        preamp = $record.Preamp
        channelSideEqEnabled = $false
        bands = @($appBands.ToArray())
    }
    $customPresets["preset_$($record.OutputName)"] = [ordered]@{
        t = "s"
        v = (ConvertTo-Json -InputObject $appPreset -Depth 20 -Compress)
    }
    $customPresetNames.Add($record.OutputName)
}
$customPresets["preset_names"] = [ordered]@{
    t = "ss"
    v = @($customPresetNames.ToArray())
}

$restore.custom_presets = $customPresets
$preservedAfter = ConvertTo-Json -InputObject ([ordered]@{
    eq_settings = $restore.eq_settings
    device_bindings = $restore.device_bindings
    app_bindings = $restore.app_bindings
}) -Depth 100 -Compress
if ($preservedBefore -ne $preservedAfter) {
    throw "Unexpected change to Equalizer314 settings or bindings while rebuilding custom presets."
}

$backupJson = ConvertTo-Json -InputObject $restore -Depth 100
$backupTemp = Join-Path (Split-Path -Parent $backupPath) (".Equalizer314-RESTORE.$([Guid]::NewGuid().ToString('N')).tmp")
try {
    [IO.File]::WriteAllText($backupTemp, $backupJson, $utf8WithoutBom)
    $validatedBackup = Read-JsonFile $backupTemp
    $validatedCustomPresets = $validatedBackup.custom_presets
    $validatedPresetCount = @($validatedCustomPresets.PSObject.Properties).Count - 1
    if ($validatedPresetCount -ne $records.Count) {
        throw "Generated restore backup has $validatedPresetCount custom presets; expected $($records.Count)."
    }
    $namesEntry = $validatedCustomPresets.PSObject.Properties["preset_names"].Value
    if ($namesEntry.t -ne "ss" -or @($namesEntry.v).Count -ne $records.Count) {
        throw "Generated custom presets are missing the app's preset_names string set."
    }
    $validatedNames = @($namesEntry.v)
    foreach ($record in $records) {
        if ($record.OutputName -notin $validatedNames) {
            throw "Generated custom preset name list is missing '$($record.OutputName)'."
        }
        $presetEntry = $validatedCustomPresets.PSObject.Properties["preset_$($record.OutputName)"]
        if ($null -eq $presetEntry -or $presetEntry.Value.t -ne "s") {
            throw "Generated custom preset '$($record.OutputName)' is missing its app preference entry."
        }
        $appPreset = [string]$presetEntry.Value.v | ConvertFrom-Json
        if ($null -eq $appPreset.PSObject.Properties["preamp"] -or $appPreset.channelSideEqEnabled -ne $false) {
            throw "Generated custom preset '$($record.OutputName)' has an invalid Equalizer314 preset shape."
        }
        $appPresetBands = @($appPreset.bands)
        if ($appPresetBands.Count -ne $record.Bands.Count) {
            throw "Generated custom preset '$($record.OutputName)' has $($appPresetBands.Count) bands; expected $($record.Bands.Count)."
        }
        foreach ($appBand in $appPresetBands) {
            foreach ($field in @("frequency", "gain", "filterType", "q", "enabled")) {
                if ($null -eq $appBand.PSObject.Properties[$field]) {
                    throw "Generated custom preset '$($record.OutputName)' has a band missing '$field'."
                }
            }
        }
    }

    foreach ($output in $outputs) {
        $destination = Join-Path $apoFolder ($output.Name + ".txt")
        [IO.File]::WriteAllText($destination, $output.Content, $utf8WithoutBom)
    }
    Move-Item -LiteralPath $backupTemp -Destination $backupPath -Force
} finally {
    if (Test-Path -LiteralPath $backupTemp) {
        Remove-Item -LiteralPath $backupTemp -Force
    }
}

Write-Host "Converted $($records.Count) presets into $($outputs.Count) APO files and rebuilt the restore backup." -ForegroundColor Green

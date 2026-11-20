$pagesUrl = "https://burnomus14.github.io/Equalizer314-Setup/"

function Get-EqDeviceTag([string]$name) {
    $n = $name.ToLower()
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

function Get-HrirDeviceTag([string]$name) {
    $n = $name.ToLower()
    if ($n -match 'atmos|dolby|dh|dht') {
        return "Headphones / Earbuds (Dolby)"
    }
    if ($n -match 'dts|gsx|sbx|cmss|raz|thx|sonic|oal') {
        return "Headphones / Earbuds (3D Gaming & Spatial)"
    }
    return "Headphones / Earbuds Only (Binaural)"
}

$apoFiles = Get-ChildItem "presets-apo\*.txt" -ErrorAction SilentlyContinue | Sort-Object Name
$wavFiles = Get-ChildItem "hrir-surround\*.wav" -ErrorAction SilentlyContinue | Sort-Object Name

$md = New-Object System.Collections.Generic.List[string]

$intro = @"
# Equalizer314 Audio Setup, Presets & Virtual Surround

Converted Poweramp parametric EQ presets (EqualizerAPO format), a restore backup, and HeSuVi Virtual Surround HRIR files for Equalizer314.

> **New here?** Jump to the [How to Use Equalizer314 (Beginner Guide)](#how-to-use-equalizer314-beginner-guide).

## One-Click Download Portal (Instant File Downloads)

- **One-click download portal (GitHub Pages):** [$pagesUrl]($pagesUrl)
- **Get the Equalizer314 app (APK releases):** [https://github.com/bearinmindcat/Equalizer314/releases](https://github.com/bearinmindcat/Equalizer314/releases)
- **Master Restore Backup (All $($apoFiles.Count) Presets in One File):** [backups/Equalizer314-RESTORE.json](backups/Equalizer314-RESTORE.json)

Clicking a preset name below opens the file in GitHub. Use the portal above to download files.

## Quick Setup Commands (ADB)

> **Optional.** You only need these for per-app control and virtual surround. Basic EQ works without them.

``````powershell
adb shell pm grant com.bearinmind.equalizer314 android.permission.DUMP
adb shell appops set com.bearinmind.equalizer314 PROJECT_MEDIA allow
adb shell mkdir -p /sdcard/Download/Equalizer314_Presets /sdcard/Download/HeSuVi_HRIR
adb push "backups/Equalizer314-RESTORE.json" "/sdcard/Download/Equalizer314_Presets/"
Get-ChildItem presets-apo\*.txt | ForEach-Object { adb push `$_.FullName "/sdcard/Download/Equalizer314_Presets/`$(`$_.Name)" }
# Equalizer314 Audio Setup, Presets & Virtual Surround

Personal backup repository containing converted Poweramp parametric EQ presets, Equalizer314 master restore backups, HeSuVi Virtual Surround HRIR files, and ADB deployment scripts.

## Repository Files & Master Backup

* **One-Tap Master Restore Backup:** [backups/Equalizer314-RESTORE.json](backups/Equalizer314-RESTORE.json)
* **Original Poweramp JSON Presets:** [presets-json/](presets-json/)
* **Converted EqualizerAPO Presets:** [presets-apo/](presets-apo/)
* **HeSuVi Virtual Surround HRIRs:** [hrir-surround/](hrir-surround/)

## Quick Restore & Setup Commands (ADB)

```powershell
# 1. Grant system-wide audio session detection & Virtual Surround capture
adb shell pm grant com.bearinmind.equalizer314 android.permission.DUMP
adb shell appops set com.bearinmind.equalizer314 PROJECT_MEDIA allow

# 2. Push master backup & HRIR surround files to phone
adb shell mkdir -p /sdcard/Download/Equalizer314_Presets /sdcard/Download/HeSuVi_HRIR
adb push "backups/Equalizer314-RESTORE.json" "/sdcard/Download/Equalizer314_Presets/"
Get-ChildItem "hrir-surround/*.wav" | ForEach-Object { adb push \$_.FullName "/sdcard/Download/HeSuVi_HRIR/(_.Name)" }
```

## Parametric EQ Presets (79 Profiles)

| # | Preset Name | Recommended Device | Preamp | Active Bands | APO File |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **[15 inch 36hz  MdMonax stereo Envelope](presets-apo/15%20inch%2036hz%20%20MdMonax%20stereo%20Envelope.txt)** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 9 bands | [View .txt](presets-apo/15%20inch%2036hz%20%20MdMonax%20stereo%20Envelope.txt) |
| 2 | **[64 Audio A12t 2](presets-apo/64%20Audio%20A12t%202.txt)** | Earbuds / TWS / IEMs | -7.20 dB | 12 bands | [View .txt](presets-apo/64%20Audio%20A12t%202.txt) |
| 3 | **[70hzBasstoneSlow Woofer bass No kick stereo Mdmonax](presets-apo/70hzBasstoneSlow%20Woofer%20bass%20No%20kick%20stereo%20Mdmonax.txt)** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 34 bands | [View .txt](presets-apo/70hzBasstoneSlow%20Woofer%20bass%20No%20kick%20stereo%20Mdmonax.txt) |
| 4 | **[80hzGroot Bass Stereo Cascade MdMonax](presets-apo/80hzGroot%20Bass%20Stereo%20Cascade%20MdMonax.txt)** | General / Multi-Device | 0.00 dB | 32 bands | [View .txt](presets-apo/80hzGroot%20Bass%20Stereo%20Cascade%20MdMonax.txt) |
| 5 | **[Air](presets-apo/Air.txt)** | General / Multi-Device | 0.00 dB | 66 bands | [View .txt](presets-apo/Air.txt) |
| 6 | **[Apex](presets-apo/Apex.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Apex.txt) |
| 7 | **[Apple AirPods 4 ANC on](presets-apo/Apple%20AirPods%204%20ANC%20on.txt)** | Earbuds / TWS / IEMs | 2.40 dB | 20 bands | [View .txt](presets-apo/Apple%20AirPods%204%20ANC%20on.txt) |
| 8 | **[Aura](presets-apo/Aura.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Aura.txt) |
| 9 | **[Balance](presets-apo/Balance.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Balance.txt) |
| 10 | **[Behringer 2 smooth 36hz MdMonax stereo](presets-apo/Behringer%202%20smooth%2036hz%20MdMonax%20stereo.txt)** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 9 bands | [View .txt](presets-apo/Behringer%202%20smooth%2036hz%20MdMonax%20stereo.txt) |
| 11 | **[Behringer My best  Outdoor Md Monax 50hzQ050 Trebbe 6463 Q090](presets-apo/Behringer%20My%20best%20%20Outdoor%20Md%20Monax%2050hzQ050%20Trebbe%206463%20Q090.txt)** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 8 bands | [View .txt](presets-apo/Behringer%20My%20best%20%20Outdoor%20Md%20Monax%2050hzQ050%20Trebbe%206463%20Q090.txt) |
| 12 | **[BoomBass Djsound MdMonax 50hz](presets-apo/BoomBass%20Djsound%20MdMonax%2050hz.txt)** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 32 bands | [View .txt](presets-apo/BoomBass%20Djsound%20MdMonax%2050hz.txt) |
| 13 | **[CarBass  BSpider MDMonax](presets-apo/CarBass%20%20BSpider%20MDMonax.txt)** | Car Audio / Subwoofer | 0.00 dB | 20 bands | [View .txt](presets-apo/CarBass%20%20BSpider%20MDMonax.txt) |
| 14 | **[Carsound outdoor MDMonax](presets-apo/Carsound%20outdoor%20MDMonax.txt)** | Car Audio / Subwoofer | 0.00 dB | 14 bands | [View .txt](presets-apo/Carsound%20outdoor%20MDMonax.txt) |
| 15 | **[Carsound outdoor V2 MdMonax](presets-apo/Carsound%20outdoor%20V2%20MdMonax.txt)** | Car Audio / Subwoofer | 0.00 dB | 18 bands | [View .txt](presets-apo/Carsound%20outdoor%20V2%20MdMonax.txt) |
| 16 | **[Carsub on HomeAVCReciever MdMonax2](presets-apo/Carsub%20on%20HomeAVCReciever%20MdMonax2.txt)** | Car Audio / Subwoofer | 0.00 dB | 32 bands | [View .txt](presets-apo/Carsub%20on%20HomeAVCReciever%20MdMonax2.txt) |
| 17 | **[Catalyst](presets-apo/Catalyst.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Catalyst.txt) |
| 18 | **[CentreEarphonesMDMonax](presets-apo/CentreEarphonesMDMonax.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 35 bands | [View .txt](presets-apo/CentreEarphonesMDMonax.txt) |
| 19 | **[Classical Sony MDMonax](presets-apo/Classical%20Sony%20MDMonax.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 41 bands | [View .txt](presets-apo/Classical%20Sony%20MDMonax.txt) |
| 20 | **[Classical Sony with  bassMDMonax](presets-apo/Classical%20Sony%20with%20%20bassMDMonax.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 41 bands | [View .txt](presets-apo/Classical%20Sony%20with%20%20bassMDMonax.txt) |
| 21 | **[Clear Noise CancelV2 MdMonax](presets-apo/Clear%20Noise%20CancelV2%20MdMonax.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 42 bands | [View .txt](presets-apo/Clear%20Noise%20CancelV2%20MdMonax.txt) |
| 22 | **[Comfort](presets-apo/Comfort.txt)** | Headphones / Earbuds (All-Rounder) | 0.05 dB | 66 bands | [View .txt](presets-apo/Comfort.txt) |
| 23 | **[Curva Harman](presets-apo/Curva%20Harman.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 12 bands | [View .txt](presets-apo/Curva%20Harman.txt) |
| 24 | **[Dance Waves MDMonax 80hz](presets-apo/Dance%20Waves%20MDMonax%2080hz.txt)** | General / Multi-Device | 0.00 dB | 25 bands | [View .txt](presets-apo/Dance%20Waves%20MDMonax%2080hz.txt) |
| 25 | **[Deep 45 MdMonax 45hz](presets-apo/Deep%2045%20MdMonax%2045hz.txt)** | General / Multi-Device | 0.00 dB | 48 bands | [View .txt](presets-apo/Deep%2045%20MdMonax%2045hz.txt) |
| 26 | **[DeepWaves Original Earphones MDMonax](presets-apo/DeepWaves%20Original%20Earphones%20MDMonax.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 18 bands | [View .txt](presets-apo/DeepWaves%20Original%20Earphones%20MDMonax.txt) |
| 27 | **[DJ Sound MDMonax](presets-apo/DJ%20Sound%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 11 bands | [View .txt](presets-apo/DJ%20Sound%20MDMonax.txt) |
| 28 | **[DolbySub on Earphones MdMonax](presets-apo/DolbySub%20on%20Earphones%20MdMonax.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 11 bands | [View .txt](presets-apo/DolbySub%20on%20Earphones%20MdMonax.txt) |
| 29 | **[Earphones FunkiNuDe Envelope](presets-apo/Earphones%20FunkiNuDe%20Envelope.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 19 bands | [View .txt](presets-apo/Earphones%20FunkiNuDe%20Envelope.txt) |
| 30 | **[Enclosed Box DjsMDMONAX](presets-apo/Enclosed%20Box%20DjsMDMONAX.txt)** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 14 bands | [View .txt](presets-apo/Enclosed%20Box%20DjsMDMONAX.txt) |
| 31 | **[Foundation](presets-apo/Foundation.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Foundation.txt) |
| 32 | **[FrontPunchy 50hz](presets-apo/FrontPunchy%2050hz.txt)** | General / Multi-Device | 0.00 dB | 6 bands | [View .txt](presets-apo/FrontPunchy%2050hz.txt) |
| 33 | **[FTS Envelope Slowed](presets-apo/FTS%20Envelope%20Slowed.txt)** | General / Multi-Device | 0.00 dB | 34 bands | [View .txt](presets-apo/FTS%20Envelope%20Slowed.txt) |
| 34 | **[Gold](presets-apo/Gold.txt)** | Headphones / Earbuds (All-Rounder) | 0.02 dB | 66 bands | [View .txt](presets-apo/Gold.txt) |
| 35 | **[GrootBass MDMonax Envelope](presets-apo/GrootBass%20MDMonax%20Envelope.txt)** | General / Multi-Device | 0.00 dB | 18 bands | [View .txt](presets-apo/GrootBass%20MDMonax%20Envelope.txt) |
| 36 | **[Harmony](presets-apo/Harmony.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Harmony.txt) |
| 37 | **[HD Headphones  V2 Deep  50hz  MDMonax](presets-apo/HD%20Headphones%20%20V2%20Deep%20%2050hz%20%20MDMonax.txt)** | Over-Ear Headphones | 0.00 dB | 31 bands | [View .txt](presets-apo/HD%20Headphones%20%20V2%20Deep%20%2050hz%20%20MDMonax.txt) |
| 38 | **[Headphones FUNKI-Nude MDMonax](presets-apo/Headphones%20FUNKI-Nude%20MDMonax.txt)** | Over-Ear Headphones | 0.00 dB | 17 bands | [View .txt](presets-apo/Headphones%20FUNKI-Nude%20MDMonax.txt) |
| 39 | **[Hi res TWS 4 Md Monax](presets-apo/Hi%20res%20TWS%204%20Md%20Monax.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 16 bands | [View .txt](presets-apo/Hi%20res%20TWS%204%20Md%20Monax.txt) |
| 40 | **[House El nino 50hz MDMONAX](presets-apo/House%20El%20nino%2050hz%20MDMONAX.txt)** | General / Multi-Device | 0.00 dB | 45 bands | [View .txt](presets-apo/House%20El%20nino%2050hz%20MDMONAX.txt) |
| 41 | **[Icepower 1  Mdmonax](presets-apo/Icepower%201%20%20Mdmonax.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 bands | [View .txt](presets-apo/Icepower%201%20%20Mdmonax.txt) |
| 42 | **[Icepower 2  Mdmonax](presets-apo/Icepower%202%20%20Mdmonax.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 bands | [View .txt](presets-apo/Icepower%202%20%20Mdmonax.txt) |
| 43 | **[Indoor Clear MDMonax](presets-apo/Indoor%20Clear%20MDMonax.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 bands | [View .txt](presets-apo/Indoor%20Clear%20MDMonax.txt) |
| 44 | **[Jazz punchyMDMonax 106hz](presets-apo/Jazz%20punchyMDMonax%20106hz.txt)** | General / Multi-Device | 0.00 dB | 5 bands | [View .txt](presets-apo/Jazz%20punchyMDMonax%20106hz.txt) |
| 45 | **[July 2026 Envelope Only MDMonax](presets-apo/July%202026%20Envelope%20Only%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 16 bands | [View .txt](presets-apo/July%202026%20Envelope%20Only%20MDMonax.txt) |
| 46 | **[June MDMonax DeepWaves 50hz Q100](presets-apo/June%20MDMonax%20DeepWaves%2050hz%20Q100.txt)** | General / Multi-Device | 0.00 dB | 12 bands | [View .txt](presets-apo/June%20MDMonax%20DeepWaves%2050hz%20Q100.txt) |
| 47 | **[M19 earphones  B](presets-apo/M19%20earphones%20%20B.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 21 bands | [View .txt](presets-apo/M19%20earphones%20%20B.txt) |
| 48 | **[Master](presets-apo/Master.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Master.txt) |
| 49 | **[MiD BAss MDMONAX comp400hz](presets-apo/MiD%20BAss%20MDMONAX%20comp400hz.txt)** | General / Multi-Device | 0.00 dB | 33 bands | [View .txt](presets-apo/MiD%20BAss%20MDMONAX%20comp400hz.txt) |
| 50 | **[Monday Blues 2 Kick MDMonax](presets-apo/Monday%20Blues%202%20Kick%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 25 bands | [View .txt](presets-apo/Monday%20Blues%202%20Kick%20MDMonax.txt) |
| 51 | **[Monday Blues deep v2 MDMonax](presets-apo/Monday%20Blues%20deep%20v2%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 28 bands | [View .txt](presets-apo/Monday%20Blues%20deep%20v2%20MDMonax.txt) |
| 52 | **[Movie Bass Mod Slow MDMona](presets-apo/Movie%20Bass%20Mod%20Slow%20MDMona.txt)** | General / Multi-Device | 0.00 dB | 15 bands | [View .txt](presets-apo/Movie%20Bass%20Mod%20Slow%20MDMona.txt) |
| 53 | **[Noise Cancel Guitar](presets-apo/Noise%20Cancel%20Guitar.txt)** | General / Multi-Device | 0.00 dB | 39 bands | [View .txt](presets-apo/Noise%20Cancel%20Guitar.txt) |
| 54 | **[November Cascade MDMonax](presets-apo/November%20Cascade%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 17 bands | [View .txt](presets-apo/November%20Cascade%20MDMonax.txt) |
| 55 | **[Outdoor Midrange MdMonax](presets-apo/Outdoor%20Midrange%20MdMonax.txt)** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 15 bands | [View .txt](presets-apo/Outdoor%20Midrange%20MdMonax.txt) |
| 56 | **[Pioneer Home theather MDMonax](presets-apo/Pioneer%20Home%20theather%20MDMonax.txt)** | Home Theater / Soundbar | 0.00 dB | 17 bands | [View .txt](presets-apo/Pioneer%20Home%20theather%20MDMonax.txt) |
| 57 | **[Platinum](presets-apo/Platinum.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Platinum.txt) |
| 58 | **[PoPiano MDMonaxEnvelope 36hz](presets-apo/PoPiano%20MDMonaxEnvelope%2036hz.txt)** | General / Multi-Device | 0.00 dB | 10 bands | [View .txt](presets-apo/PoPiano%20MDMonaxEnvelope%2036hz.txt) |
| 59 | **[PoPiano2 Heavy  MDMonaxEnvelope 36hz](presets-apo/PoPiano2%20Heavy%20%20MDMonaxEnvelope%2036hz.txt)** | General / Multi-Device | 0.00 dB | 10 bands | [View .txt](presets-apo/PoPiano2%20Heavy%20%20MDMonaxEnvelope%2036hz.txt) |
| 60 | **[Presence](presets-apo/Presence.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Presence.txt) |
| 61 | **[Punchy Bass vijay](presets-apo/Punchy%20Bass%20vijay.txt)** | General / Multi-Device | 3.00 dB | 10 bands | [View .txt](presets-apo/Punchy%20Bass%20vijay.txt) |
| 62 | **[Punchy2 Small spk MDMonax 36hz](presets-apo/Punchy2%20Small%20spk%20MDMonax%2036hz.txt)** | Small / Portable Bluetooth Speakers | 0.00 dB | 13 bands | [View .txt](presets-apo/Punchy2%20Small%20spk%20MDMonax%2036hz.txt) |
| 63 | **[Reference X](presets-apo/Reference%20X.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Reference%20X.txt) |
| 64 | **[Riddim 2026 MDMonax 40hz](presets-apo/Riddim%202026%20MDMonax%2040hz.txt)** | General / Multi-Device | 0.00 dB | 27 bands | [View .txt](presets-apo/Riddim%202026%20MDMonax%2040hz.txt) |
| 65 | **[Rnb2026MDMonax Hometheathers](presets-apo/Rnb2026MDMonax%20Hometheathers.txt)** | Home Theater / Soundbar | 0.00 dB | 32 bands | [View .txt](presets-apo/Rnb2026MDMonax%20Hometheathers.txt) |
| 66 | **[Signature](presets-apo/Signature.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Signature.txt) |
| 67 | **[Slow Mid Sony All stereo](presets-apo/Slow%20Mid%20Sony%20All%20stereo.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 37 bands | [View .txt](presets-apo/Slow%20Mid%20Sony%20All%20stereo.txt) |
| 68 | **[SlowBass with Trebble MDMonax](presets-apo/SlowBass%20with%20Trebble%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 21 bands | [View .txt](presets-apo/SlowBass%20with%20Trebble%20MDMonax.txt) |
| 69 | **[Small Speakers Clarity Punchy June Stereo Envelope 50hzQ1 MdMonax](presets-apo/Small%20Speakers%20Clarity%20Punchy%20June%20Stereo%20Envelope%2050hzQ1%20MdMonax.txt)** | Small / Portable Bluetooth Speakers | 0.00 dB | 9 bands | [View .txt](presets-apo/Small%20Speakers%20Clarity%20Punchy%20June%20Stereo%20Envelope%2050hzQ1%20MdMonax.txt) |
| 70 | **[SoundBar 102hz Q080 Cc MDMonax](presets-apo/SoundBar%20102hz%20Q080%20Cc%20MDMonax.txt)** | Home Theater / Soundbar | 0.00 dB | 10 bands | [View .txt](presets-apo/SoundBar%20102hz%20Q080%20Cc%20MDMonax.txt) |
| 71 | **[Strike](presets-apo/Strike.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Strike.txt) |
| 72 | **[Titan](presets-apo/Titan.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Titan.txt) |
| 73 | **[TWS Earphones 2 MDMONAX](presets-apo/TWS%20Earphones%202%20MDMONAX.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 10 bands | [View .txt](presets-apo/TWS%20Earphones%202%20MDMONAX.txt) |
| 74 | **[TWs Earphones MDMonax](presets-apo/TWs%20Earphones%20MDMonax.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 9 bands | [View .txt](presets-apo/TWs%20Earphones%20MDMonax.txt) |
| 75 | **[Tws Midnight Monax](presets-apo/Tws%20Midnight%20Monax.txt)** | Earbuds / TWS / IEMs | 0.00 dB | 8 bands | [View .txt](presets-apo/Tws%20Midnight%20Monax.txt) |
| 76 | **[V8 2 MDMonax](presets-apo/V8%202%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 14 bands | [View .txt](presets-apo/V8%202%20MDMonax.txt) |
| 77 | **[V8 3 MDMonax](presets-apo/V8%203%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 14 bands | [View .txt](presets-apo/V8%203%20MDMonax.txt) |
| 78 | **[V8 latest MDMonax](presets-apo/V8%20latest%20MDMonax.txt)** | General / Multi-Device | 0.00 dB | 13 bands | [View .txt](presets-apo/V8%20latest%20MDMonax.txt) |
| 79 | **[Vocal](presets-apo/Vocal.txt)** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | [View .txt](presets-apo/Vocal.txt) |

## HeSuVi Virtual Surround HRIRs (169 Profiles)

> **Note:** Binaural HRIR surround profiles are engineered strictly for **Headphones & Earbuds**. Disable Virtual Surround when using phone speakers or external speaker systems.

| # | Profile Name | Recommended Device & Use Case | File Size | File Link |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **[atmos](hrir-surround/atmos.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 281.7 KB | [Download .wav](hrir-surround/atmos.wav) |
| 2 | **[atmos-](hrir-surround/atmos-.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 3.5 KB | [Download .wav](hrir-surround/atmos-.wav) |
| 3 | **[atmos_L](hrir-surround/atmos_L.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 160.9 KB | [Download .wav](hrir-surround/atmos_L.wav) |
| 4 | **[atmos-_L](hrir-surround/atmos-_L.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 4 KB | [Download .wav](hrir-surround/atmos-_L.wav) |
| 5 | **[atmos_R](hrir-surround/atmos_R.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 160.9 KB | [Download .wav](hrir-surround/atmos_R.wav) |
| 6 | **[atmos-_R](hrir-surround/atmos-_R.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 4 KB | [Download .wav](hrir-surround/atmos-_R.wav) |
| 7 | **[cmss_ent](hrir-surround/cmss_ent.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | [Download .wav](hrir-surround/cmss_ent.wav) |
| 8 | **[cmss_ent-](hrir-surround/cmss_ent-.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB | [Download .wav](hrir-surround/cmss_ent-.wav) |
| 9 | **[cmss_ent_L](hrir-surround/cmss_ent_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/cmss_ent_L.wav) |
| 10 | **[cmss_ent-_L](hrir-surround/cmss_ent-_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 5.3 KB | [Download .wav](hrir-surround/cmss_ent-_L.wav) |
| 11 | **[cmss_ent_R](hrir-surround/cmss_ent_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/cmss_ent_R.wav) |
| 12 | **[cmss_ent-_R](hrir-surround/cmss_ent-_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 5.3 KB | [Download .wav](hrir-surround/cmss_ent-_R.wav) |
| 13 | **[cmss_game](hrir-surround/cmss_game.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | [Download .wav](hrir-surround/cmss_game.wav) |
| 14 | **[cmss_game-](hrir-surround/cmss_game-.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 4.6 KB | [Download .wav](hrir-surround/cmss_game-.wav) |
| 15 | **[cmss_game_L](hrir-surround/cmss_game_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/cmss_game_L.wav) |
| 16 | **[cmss_game-_L](hrir-surround/cmss_game-_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 5.2 KB | [Download .wav](hrir-surround/cmss_game-_L.wav) |
| 17 | **[cmss_game_R](hrir-surround/cmss_game_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/cmss_game_R.wav) |
| 18 | **[cmss_game-_R](hrir-surround/cmss_game-_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 5.2 KB | [Download .wav](hrir-surround/cmss_game-_R.wav) |
| 19 | **[cmss_rx](hrir-surround/cmss_rx.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.5 KB | [Download .wav](hrir-surround/cmss_rx.wav) |
| 20 | **[cmss_rx_L](hrir-surround/cmss_rx_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.8 KB | [Download .wav](hrir-surround/cmss_rx_L.wav) |
| 21 | **[cmss_rx_R](hrir-surround/cmss_rx_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.8 KB | [Download .wav](hrir-surround/cmss_rx_R.wav) |
| 22 | **[cmss_rx+](hrir-surround/cmss_rx%2B.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 787.7 KB | [Download .wav](hrir-surround/cmss_rx%2B.wav) |
| 23 | **[cmss_rx+_L](hrir-surround/cmss_rx%2B_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 450.1 KB | [Download .wav](hrir-surround/cmss_rx%2B_L.wav) |
| 24 | **[cmss_rx+_R](hrir-surround/cmss_rx%2B_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 450.1 KB | [Download .wav](hrir-surround/cmss_rx%2B_R.wav) |
| 25 | **[dh-](hrir-surround/dh-.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 3.7 KB | [Download .wav](hrir-surround/dh-.wav) |
| 26 | **[dh-_L](hrir-surround/dh-_L.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 4.1 KB | [Download .wav](hrir-surround/dh-_L.wav) |
| 27 | **[dh-_R](hrir-surround/dh-_R.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 4.1 KB | [Download .wav](hrir-surround/dh-_R.wav) |
| 28 | **[dh+](hrir-surround/dh%2B.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 385.5 KB | [Download .wav](hrir-surround/dh%2B.wav) |
| 29 | **[dh+_L](hrir-surround/dh%2B_L.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 220.2 KB | [Download .wav](hrir-surround/dh%2B_L.wav) |
| 30 | **[dh+_R](hrir-surround/dh%2B_R.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 220.2 KB | [Download .wav](hrir-surround/dh%2B_R.wav) |
| 31 | **[dh++](hrir-surround/dh%2B%2B.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 393.9 KB | [Download .wav](hrir-surround/dh%2B%2B.wav) |
| 32 | **[dh++_L](hrir-surround/dh%2B%2B_L.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 225.1 KB | [Download .wav](hrir-surround/dh%2B%2B_L.wav) |
| 33 | **[dh++_R](hrir-surround/dh%2B%2B_R.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 225.1 KB | [Download .wav](hrir-surround/dh%2B%2B_R.wav) |
| 34 | **[dht](hrir-surround/dht.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 472.7 KB | [Download .wav](hrir-surround/dht.wav) |
| 35 | **[dht-](hrir-surround/dht-.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 21.2 KB | [Download .wav](hrir-surround/dht-.wav) |
| 36 | **[dht_L](hrir-surround/dht_L.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 270.1 KB | [Download .wav](hrir-surround/dht_L.wav) |
| 37 | **[dht-_L](hrir-surround/dht-_L.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 12.1 KB | [Download .wav](hrir-surround/dht-_L.wav) |
| 38 | **[dht_R](hrir-surround/dht_R.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 270.1 KB | [Download .wav](hrir-surround/dht_R.wav) |
| 39 | **[dht-_R](hrir-surround/dht-_R.wav)** | Headphones / Earbuds (Dolby Cinema & Music) | 12.1 KB | [Download .wav](hrir-surround/dht-_R.wav) |
| 40 | **[dirac_delta_44_left](hrir-surround/dirac_delta_44_left.wav)** | Headphones / Earbuds Only (Binaural) | 88 KB | [Download .wav](hrir-surround/dirac_delta_44_left.wav) |
| 41 | **[dirac_delta_44_right](hrir-surround/dirac_delta_44_right.wav)** | Headphones / Earbuds Only (Binaural) | 88 KB | [Download .wav](hrir-surround/dirac_delta_44_right.wav) |
| 42 | **[dirac_delta_48_left](hrir-surround/dirac_delta_48_left.wav)** | Headphones / Earbuds Only (Binaural) | 96 KB | [Download .wav](hrir-surround/dirac_delta_48_left.wav) |
| 43 | **[dirac_delta_48_right](hrir-surround/dirac_delta_48_right.wav)** | Headphones / Earbuds Only (Binaural) | 96 KB | [Download .wav](hrir-surround/dirac_delta_48_right.wav) |
| 44 | **[ds3d](hrir-surround/ds3d.wav)** | Headphones / Earbuds Only (Binaural) | 7.3 KB | [Download .wav](hrir-surround/ds3d.wav) |
| 45 | **[ds3d_L](hrir-surround/ds3d_L.wav)** | Headphones / Earbuds Only (Binaural) | 8.3 KB | [Download .wav](hrir-surround/ds3d_L.wav) |
| 46 | **[ds3d_R](hrir-surround/ds3d_R.wav)** | Headphones / Earbuds Only (Binaural) | 8.3 KB | [Download .wav](hrir-surround/ds3d_R.wav) |
| 47 | **[ds3d+](hrir-surround/ds3d%2B.wav)** | Headphones / Earbuds Only (Binaural) | 163.3 KB | [Download .wav](hrir-surround/ds3d%2B.wav) |
| 48 | **[ds3d+_L](hrir-surround/ds3d%2B_L.wav)** | Headphones / Earbuds Only (Binaural) | 93.3 KB | [Download .wav](hrir-surround/ds3d%2B_L.wav) |
| 49 | **[ds3d+_R](hrir-surround/ds3d%2B_R.wav)** | Headphones / Earbuds Only (Binaural) | 93.3 KB | [Download .wav](hrir-surround/ds3d%2B_R.wav) |
| 50 | **[ds3d++](hrir-surround/ds3d%2B%2B.wav)** | Headphones / Earbuds Only (Binaural) | 656.4 KB | [Download .wav](hrir-surround/ds3d%2B%2B.wav) |
| 51 | **[ds3d++_L](hrir-surround/ds3d%2B%2B_L.wav)** | Headphones / Earbuds Only (Binaural) | 375.1 KB | [Download .wav](hrir-surround/ds3d%2B%2B_L.wav) |
| 52 | **[ds3d++_R](hrir-surround/ds3d%2B%2B_R.wav)** | Headphones / Earbuds Only (Binaural) | 375.1 KB | [Download .wav](hrir-surround/ds3d%2B%2B_R.wav) |
| 53 | **[ds3d+++](hrir-surround/ds3d%2B%2B%2B.wav)** | Headphones / Earbuds Only (Binaural) | 918.9 KB | [Download .wav](hrir-surround/ds3d%2B%2B%2B.wav) |
| 54 | **[ds3d+++_L](hrir-surround/ds3d%2B%2B%2B_L.wav)** | Headphones / Earbuds Only (Binaural) | 525.1 KB | [Download .wav](hrir-surround/ds3d%2B%2B%2B_L.wav) |
| 55 | **[ds3d+++_R](hrir-surround/ds3d%2B%2B%2B_R.wav)** | Headphones / Earbuds Only (Binaural) | 525.1 KB | [Download .wav](hrir-surround/ds3d%2B%2B%2B_R.wav) |
| 56 | **[dtshx](hrir-surround/dtshx.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 65.8 KB | [Download .wav](hrir-surround/dtshx.wav) |
| 57 | **[dtshx-](hrir-surround/dtshx-.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 4.2 KB | [Download .wav](hrir-surround/dtshx-.wav) |
| 58 | **[dtshx_L](hrir-surround/dtshx_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 37.6 KB | [Download .wav](hrir-surround/dtshx_L.wav) |
| 59 | **[dtshx-_L](hrir-surround/dtshx-_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB | [Download .wav](hrir-surround/dtshx-_L.wav) |
| 60 | **[dtshx_R](hrir-surround/dtshx_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 37.6 KB | [Download .wav](hrir-surround/dtshx_R.wav) |
| 61 | **[dtshx-_R](hrir-surround/dtshx-_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB | [Download .wav](hrir-surround/dtshx-_R.wav) |
| 62 | **[dvs](hrir-surround/dvs.wav)** | Headphones / Earbuds Only (Binaural) | 459.6 KB | [Download .wav](hrir-surround/dvs.wav) |
| 63 | **[dvs_L](hrir-surround/dvs_L.wav)** | Headphones / Earbuds Only (Binaural) | 262.6 KB | [Download .wav](hrir-surround/dvs_L.wav) |
| 64 | **[dvs_R](hrir-surround/dvs_R.wav)** | Headphones / Earbuds Only (Binaural) | 262.6 KB | [Download .wav](hrir-surround/dvs_R.wav) |
| 65 | **[dvs+](hrir-surround/dvs%2B.wav)** | Headphones / Earbuds Only (Binaural) | 399.2 KB | [Download .wav](hrir-surround/dvs%2B.wav) |
| 66 | **[dvs+_L](hrir-surround/dvs%2B_L.wav)** | Headphones / Earbuds Only (Binaural) | 228.1 KB | [Download .wav](hrir-surround/dvs%2B_L.wav) |
| 67 | **[dvs+_R](hrir-surround/dvs%2B_R.wav)** | Headphones / Earbuds Only (Binaural) | 228.1 KB | [Download .wav](hrir-surround/dvs%2B_R.wav) |
| 68 | **[gsx](hrir-surround/gsx.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | [Download .wav](hrir-surround/gsx.wav) |
| 69 | **[gsx-](hrir-surround/gsx-.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 3.4 KB | [Download .wav](hrir-surround/gsx-.wav) |
| 70 | **[gsx_L](hrir-surround/gsx_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/gsx_L.wav) |
| 71 | **[gsx-_L](hrir-surround/gsx-_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 3.9 KB | [Download .wav](hrir-surround/gsx-_L.wav) |
| 72 | **[gsx_R](hrir-surround/gsx_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/gsx_R.wav) |
| 73 | **[gsx-_R](hrir-surround/gsx-_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 3.9 KB | [Download .wav](hrir-surround/gsx-_R.wav) |
| 74 | **[gsx+](hrir-surround/gsx%2B.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 472.7 KB | [Download .wav](hrir-surround/gsx%2B.wav) |
| 75 | **[gsx+_L](hrir-surround/gsx%2B_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 270.1 KB | [Download .wav](hrir-surround/gsx%2B_L.wav) |
| 76 | **[gsx+_R](hrir-surround/gsx%2B_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 270.1 KB | [Download .wav](hrir-surround/gsx%2B_R.wav) |
| 77 | **[gsx++](hrir-surround/gsx%2B%2B.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 603.9 KB | [Download .wav](hrir-surround/gsx%2B%2B.wav) |
| 78 | **[gsx++_L](hrir-surround/gsx%2B%2B_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 345.1 KB | [Download .wav](hrir-surround/gsx%2B%2B_L.wav) |
| 79 | **[gsx++_R](hrir-surround/gsx%2B%2B_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 345.1 KB | [Download .wav](hrir-surround/gsx%2B%2B_R.wav) |
| 80 | **[hear](hrir-surround/hear.wav)** | Headphones / Earbuds Only (Binaural) | 2.8 KB | [Download .wav](hrir-surround/hear.wav) |
| 81 | **[hear_L](hrir-surround/hear_L.wav)** | Headphones / Earbuds Only (Binaural) | 3.1 KB | [Download .wav](hrir-surround/hear_L.wav) |
| 82 | **[hear_R](hrir-surround/hear_R.wav)** | Headphones / Earbuds Only (Binaural) | 3.1 KB | [Download .wav](hrir-surround/hear_R.wav) |
| 83 | **[nahimic](hrir-surround/nahimic.wav)** | Headphones / Earbuds Only (Binaural) | 787.7 KB | [Download .wav](hrir-surround/nahimic.wav) |
| 84 | **[nahimic-](hrir-surround/nahimic-.wav)** | Headphones / Earbuds Only (Binaural) | 13.9 KB | [Download .wav](hrir-surround/nahimic-.wav) |
| 85 | **[nahimic_L](hrir-surround/nahimic_L.wav)** | Headphones / Earbuds Only (Binaural) | 450.1 KB | [Download .wav](hrir-surround/nahimic_L.wav) |
| 86 | **[nahimic-_L](hrir-surround/nahimic-_L.wav)** | Headphones / Earbuds Only (Binaural) | 15.8 KB | [Download .wav](hrir-surround/nahimic-_L.wav) |
| 87 | **[nahimic_R](hrir-surround/nahimic_R.wav)** | Headphones / Earbuds Only (Binaural) | 450.1 KB | [Download .wav](hrir-surround/nahimic_R.wav) |
| 88 | **[nahimic-_R](hrir-surround/nahimic-_R.wav)** | Headphones / Earbuds Only (Binaural) | 15.8 KB | [Download .wav](hrir-surround/nahimic-_R.wav) |
| 89 | **[none](hrir-surround/none.wav)** | Headphones / Earbuds Only (Binaural) | 0.2 KB | [Download .wav](hrir-surround/none.wav) |
| 90 | **[none_L](hrir-surround/none_L.wav)** | Headphones / Earbuds Only (Binaural) | 0.1 KB | [Download .wav](hrir-surround/none_L.wav) |
| 91 | **[none_R](hrir-surround/none_R.wav)** | Headphones / Earbuds Only (Binaural) | 0.1 KB | [Download .wav](hrir-surround/none_R.wav) |
| 92 | **[oal_cia0](hrir-surround/oal_cia0.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | [Download .wav](hrir-surround/oal_cia0.wav) |
| 93 | **[oal_cia0_L](hrir-surround/oal_cia0_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/oal_cia0_L.wav) |
| 94 | **[oal_cia0_R](hrir-surround/oal_cia0_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/oal_cia0_R.wav) |
| 95 | **[oal_cia1](hrir-surround/oal_cia1.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 1.7 KB | [Download .wav](hrir-surround/oal_cia1.wav) |
| 96 | **[oal_cia1_L](hrir-surround/oal_cia1_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | [Download .wav](hrir-surround/oal_cia1_L.wav) |
| 97 | **[oal_cia1_R](hrir-surround/oal_cia1_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | [Download .wav](hrir-surround/oal_cia1_R.wav) |
| 98 | **[oal_dflt](hrir-surround/oal_dflt.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | [Download .wav](hrir-surround/oal_dflt.wav) |
| 99 | **[oal_dflt_L](hrir-surround/oal_dflt_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/oal_dflt_L.wav) |
| 100 | **[oal_dflt_R](hrir-surround/oal_dflt_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/oal_dflt_R.wav) |
| 101 | **[oal+](hrir-surround/oal%2B.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 393.9 KB | [Download .wav](hrir-surround/oal%2B.wav) |
| 102 | **[oal+_L](hrir-surround/oal%2B_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB | [Download .wav](hrir-surround/oal%2B_L.wav) |
| 103 | **[oal+_R](hrir-surround/oal%2B_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB | [Download .wav](hrir-surround/oal%2B_R.wav) |
| 104 | **[oal++](hrir-surround/oal%2B%2B.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 393.9 KB | [Download .wav](hrir-surround/oal%2B%2B.wav) |
| 105 | **[oal++_L](hrir-surround/oal%2B%2B_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB | [Download .wav](hrir-surround/oal%2B%2B_L.wav) |
| 106 | **[oal++_R](hrir-surround/oal%2B%2B_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB | [Download .wav](hrir-surround/oal%2B%2B_R.wav) |
| 107 | **[oal+++](hrir-surround/oal%2B%2B%2B.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 656.4 KB | [Download .wav](hrir-surround/oal%2B%2B%2B.wav) |
| 108 | **[oal+++_L](hrir-surround/oal%2B%2B%2B_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 375.1 KB | [Download .wav](hrir-surround/oal%2B%2B%2B_L.wav) |
| 109 | **[oal+++_R](hrir-surround/oal%2B%2B%2B_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 375.1 KB | [Download .wav](hrir-surround/oal%2B%2B%2B_R.wav) |
| 110 | **[ooyh0](hrir-surround/ooyh0.wav)** | Headphones / Earbuds Only (Binaural) | 590.8 KB | [Download .wav](hrir-surround/ooyh0.wav) |
| 111 | **[ooyh0_L](hrir-surround/ooyh0_L.wav)** | Headphones / Earbuds Only (Binaural) | 337.6 KB | [Download .wav](hrir-surround/ooyh0_L.wav) |
| 112 | **[ooyh0_R](hrir-surround/ooyh0_R.wav)** | Headphones / Earbuds Only (Binaural) | 337.6 KB | [Download .wav](hrir-surround/ooyh0_R.wav) |
| 113 | **[ooyh1](hrir-surround/ooyh1.wav)** | Headphones / Earbuds Only (Binaural) | 381 KB | [Download .wav](hrir-surround/ooyh1.wav) |
| 114 | **[ooyh1_L](hrir-surround/ooyh1_L.wav)** | Headphones / Earbuds Only (Binaural) | 217.7 KB | [Download .wav](hrir-surround/ooyh1_L.wav) |
| 115 | **[ooyh1_R](hrir-surround/ooyh1_R.wav)** | Headphones / Earbuds Only (Binaural) | 217.7 KB | [Download .wav](hrir-surround/ooyh1_R.wav) |
| 116 | **[razer](hrir-surround/razer.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 9.1 KB | [Download .wav](hrir-surround/razer.wav) |
| 117 | **[razer_fix](hrir-surround/razer_fix.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 27 KB | [Download .wav](hrir-surround/razer_fix.wav) |
| 118 | **[razer_fix_L](hrir-surround/razer_fix_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 30.8 KB | [Download .wav](hrir-surround/razer_fix_L.wav) |
| 119 | **[razer_fix_R](hrir-surround/razer_fix_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 30.8 KB | [Download .wav](hrir-surround/razer_fix_R.wav) |
| 120 | **[razer_L](hrir-surround/razer_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 10.3 KB | [Download .wav](hrir-surround/razer_L.wav) |
| 121 | **[razer_R](hrir-surround/razer_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 10.3 KB | [Download .wav](hrir-surround/razer_R.wav) |
| 122 | **[sbx100](hrir-surround/sbx100.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | [Download .wav](hrir-surround/sbx100.wav) |
| 123 | **[sbx100-](hrir-surround/sbx100-.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | [Download .wav](hrir-surround/sbx100-.wav) |
| 124 | **[sbx100_L](hrir-surround/sbx100_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/sbx100_L.wav) |
| 125 | **[sbx100-_L](hrir-surround/sbx100-_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/sbx100-_L.wav) |
| 126 | **[sbx100_R](hrir-surround/sbx100_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/sbx100_R.wav) |
| 127 | **[sbx100-_R](hrir-surround/sbx100-_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/sbx100-_R.wav) |
| 128 | **[sbx33](hrir-surround/sbx33.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | [Download .wav](hrir-surround/sbx33.wav) |
| 129 | **[sbx33-](hrir-surround/sbx33-.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | [Download .wav](hrir-surround/sbx33-.wav) |
| 130 | **[sbx33_L](hrir-surround/sbx33_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/sbx33_L.wav) |
| 131 | **[sbx33-_L](hrir-surround/sbx33-_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/sbx33-_L.wav) |
| 132 | **[sbx33_R](hrir-surround/sbx33_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/sbx33_R.wav) |
| 133 | **[sbx33-_R](hrir-surround/sbx33-_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/sbx33-_R.wav) |
| 134 | **[sbx67](hrir-surround/sbx67.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | [Download .wav](hrir-surround/sbx67.wav) |
| 135 | **[sbx67-](hrir-surround/sbx67-.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | [Download .wav](hrir-surround/sbx67-.wav) |
| 136 | **[sbx67_L](hrir-surround/sbx67_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/sbx67_L.wav) |
| 137 | **[sbx67-_L](hrir-surround/sbx67-_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/sbx67-_L.wav) |
| 138 | **[sbx67_R](hrir-surround/sbx67_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | [Download .wav](hrir-surround/sbx67_R.wav) |
| 139 | **[sbx67-_R](hrir-surround/sbx67-_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | [Download .wav](hrir-surround/sbx67-_R.wav) |
| 140 | **[sonic](hrir-surround/sonic.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 280.7 KB | [Download .wav](hrir-surround/sonic.wav) |
| 141 | **[sonic-](hrir-surround/sonic-.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 8.6 KB | [Download .wav](hrir-surround/sonic-.wav) |
| 142 | **[sonic_L](hrir-surround/sonic_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 160.4 KB | [Download .wav](hrir-surround/sonic_L.wav) |
| 143 | **[sonic-_L](hrir-surround/sonic-_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 9.8 KB | [Download .wav](hrir-surround/sonic-_L.wav) |
| 144 | **[sonic_R](hrir-surround/sonic_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 160.4 KB | [Download .wav](hrir-surround/sonic_R.wav) |
| 145 | **[sonic-_R](hrir-surround/sonic-_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 9.8 KB | [Download .wav](hrir-surround/sonic-_R.wav) |
| 146 | **[sonic+](hrir-surround/sonic%2B.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 630.2 KB | [Download .wav](hrir-surround/sonic%2B.wav) |
| 147 | **[sonic+_L](hrir-surround/sonic%2B_L.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 360.1 KB | [Download .wav](hrir-surround/sonic%2B_L.wav) |
| 148 | **[sonic+_R](hrir-surround/sonic%2B_R.wav)** | Headphones / Earbuds (3D Gaming & Spatial) | 360.1 KB | [Download .wav](hrir-surround/sonic%2B_R.wav) |
| 149 | **[ssc_dub](hrir-surround/ssc_dub.wav)** | Headphones / Earbuds Only (Binaural) | 267.1 KB | [Download .wav](hrir-surround/ssc_dub.wav) |
| 150 | **[ssc_dub_L](hrir-surround/ssc_dub_L.wav)** | Headphones / Earbuds Only (Binaural) | 152.6 KB | [Download .wav](hrir-surround/ssc_dub_L.wav) |
| 151 | **[ssc_dub_R](hrir-surround/ssc_dub_R.wav)** | Headphones / Earbuds Only (Binaural) | 152.6 KB | [Download .wav](hrir-surround/ssc_dub_R.wav) |
| 152 | **[ssc_ny](hrir-surround/ssc_ny.wav)** | Headphones / Earbuds Only (Binaural) | 144.6 KB | [Download .wav](hrir-surround/ssc_ny.wav) |
| 153 | **[ssc_ny_L](hrir-surround/ssc_ny_L.wav)** | Headphones / Earbuds Only (Binaural) | 82.6 KB | [Download .wav](hrir-surround/ssc_ny_L.wav) |
| 154 | **[ssc_ny_R](hrir-surround/ssc_ny_R.wav)** | Headphones / Earbuds Only (Binaural) | 82.6 KB | [Download .wav](hrir-surround/ssc_ny_R.wav) |
| 155 | **[ssc_ny+](hrir-surround/ssc_ny%2B.wav)** | Headphones / Earbuds Only (Binaural) | 486 KB | [Download .wav](hrir-surround/ssc_ny%2B.wav) |
| 156 | **[ssc_ny+_L](hrir-surround/ssc_ny%2B_L.wav)** | Headphones / Earbuds Only (Binaural) | 277.7 KB | [Download .wav](hrir-surround/ssc_ny%2B_L.wav) |
| 157 | **[ssc_ny+_R](hrir-surround/ssc_ny%2B_R.wav)** | Headphones / Earbuds Only (Binaural) | 277.7 KB | [Download .wav](hrir-surround/ssc_ny%2B_R.wav) |
| 158 | **[ssc_syd](hrir-surround/ssc_syd.wav)** | Headphones / Earbuds Only (Binaural) | 412.3 KB | [Download .wav](hrir-surround/ssc_syd.wav) |
| 159 | **[ssc_syd_L](hrir-surround/ssc_syd_L.wav)** | Headphones / Earbuds Only (Binaural) | 235.6 KB | [Download .wav](hrir-surround/ssc_syd_L.wav) |
| 160 | **[ssc_syd_R](hrir-surround/ssc_syd_R.wav)** | Headphones / Earbuds Only (Binaural) | 235.6 KB | [Download .wav](hrir-surround/ssc_syd_R.wav) |
| 161 | **[ssc_syd+](hrir-surround/ssc_syd%2B.wav)** | Headphones / Earbuds Only (Binaural) | 897.9 KB | [Download .wav](hrir-surround/ssc_syd%2B.wav) |
| 162 | **[ssc_syd+_L](hrir-surround/ssc_syd%2B_L.wav)** | Headphones / Earbuds Only (Binaural) | 513.1 KB | [Download .wav](hrir-surround/ssc_syd%2B_L.wav) |
| 163 | **[ssc_syd+_R](hrir-surround/ssc_syd%2B_R.wav)** | Headphones / Earbuds Only (Binaural) | 513.1 KB | [Download .wav](hrir-surround/ssc_syd%2B_R.wav) |
| 164 | **[waves](hrir-surround/waves.wav)** | Headphones / Earbuds Only (Binaural) | 472.7 KB | [Download .wav](hrir-surround/waves.wav) |
| 165 | **[waves-](hrir-surround/waves-.wav)** | Headphones / Earbuds Only (Binaural) | 14.3 KB | [Download .wav](hrir-surround/waves-.wav) |
| 166 | **[waves_L](hrir-surround/waves_L.wav)** | Headphones / Earbuds Only (Binaural) | 270.1 KB | [Download .wav](hrir-surround/waves_L.wav) |
| 167 | **[waves-_L](hrir-surround/waves-_L.wav)** | Headphones / Earbuds Only (Binaural) | 16.3 KB | [Download .wav](hrir-surround/waves-_L.wav) |
| 168 | **[waves_R](hrir-surround/waves_R.wav)** | Headphones / Earbuds Only (Binaural) | 270.1 KB | [Download .wav](hrir-surround/waves_R.wav) |
| 169 | **[waves-_R](hrir-surround/waves-_R.wav)** | Headphones / Earbuds Only (Binaural) | 16.3 KB | [Download .wav](hrir-surround/waves-_R.wav) |
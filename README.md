# Equalizer314 Audio Setup, Presets & Virtual Surround

Personal backup repository containing converted Poweramp parametric EQ presets, Equalizer314 master restore backups, HeSuVi Virtual Surround HRIR files, and ADB deployment scripts.

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
| 1 | **15 inch 36hz  MdMonax stereo Envelope** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 9 bands | `presets-apo/15 inch 36hz  MdMonax stereo Envelope.txt` |
| 2 | **64 Audio A12t 2** | Earbuds / TWS / IEMs | -7.20 dB | 12 bands | `presets-apo/64 Audio A12t 2.txt` |
| 3 | **70hzBasstoneSlow Woofer bass No kick stereo Mdmonax** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 34 bands | `presets-apo/70hzBasstoneSlow Woofer bass No kick stereo Mdmonax.txt` |
| 4 | **80hzGroot Bass Stereo Cascade MdMonax** | General / Multi-Device | 0.00 dB | 32 bands | `presets-apo/80hzGroot Bass Stereo Cascade MdMonax.txt` |
| 5 | **Air** | General / Multi-Device | 0.00 dB | 66 bands | `presets-apo/Air.txt` |
| 6 | **Apex** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Apex.txt` |
| 7 | **Apple AirPods 4 ANC on** | Earbuds / TWS / IEMs | 2.40 dB | 20 bands | `presets-apo/Apple AirPods 4 ANC on.txt` |
| 8 | **Aura** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Aura.txt` |
| 9 | **Balance** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Balance.txt` |
| 10 | **Behringer 2 smooth 36hz MdMonax stereo** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 9 bands | `presets-apo/Behringer 2 smooth 36hz MdMonax stereo.txt` |
| 11 | **Behringer My best  Outdoor Md Monax 50hzQ050 Trebbe 6463 Q090** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 8 bands | `presets-apo/Behringer My best  Outdoor Md Monax 50hzQ050 Trebbe 6463 Q090.txt` |
| 12 | **BoomBass Djsound MdMonax 50hz** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 32 bands | `presets-apo/BoomBass Djsound MdMonax 50hz.txt` |
| 13 | **CarBass  BSpider MDMonax** | Car Audio / Subwoofer | 0.00 dB | 20 bands | `presets-apo/CarBass  BSpider MDMonax.txt` |
| 14 | **Carsound outdoor MDMonax** | Car Audio / Subwoofer | 0.00 dB | 14 bands | `presets-apo/Carsound outdoor MDMonax.txt` |
| 15 | **Carsound outdoor V2 MdMonax** | Car Audio / Subwoofer | 0.00 dB | 18 bands | `presets-apo/Carsound outdoor V2 MdMonax.txt` |
| 16 | **Carsub on HomeAVCReciever MdMonax2** | Car Audio / Subwoofer | 0.00 dB | 32 bands | `presets-apo/Carsub on HomeAVCReciever MdMonax2.txt` |
| 17 | **Catalyst** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Catalyst.txt` |
| 18 | **CentreEarphonesMDMonax** | Earbuds / TWS / IEMs | 0.00 dB | 35 bands | `presets-apo/CentreEarphonesMDMonax.txt` |
| 19 | **Classical Sony MDMonax** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 41 bands | `presets-apo/Classical Sony MDMonax.txt` |
| 20 | **Classical Sony with  bassMDMonax** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 41 bands | `presets-apo/Classical Sony with  bassMDMonax.txt` |
| 21 | **Clear Noise CancelV2 MdMonax** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 42 bands | `presets-apo/Clear Noise CancelV2 MdMonax.txt` |
| 22 | **Comfort** | Headphones / Earbuds (All-Rounder) | 0.05 dB | 66 bands | `presets-apo/Comfort.txt` |
| 23 | **Curva Harman** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 12 bands | `presets-apo/Curva Harman.txt` |
| 24 | **Dance Waves MDMonax 80hz** | General / Multi-Device | 0.00 dB | 25 bands | `presets-apo/Dance Waves MDMonax 80hz.txt` |
| 25 | **Deep 45 MdMonax 45hz** | General / Multi-Device | 0.00 dB | 48 bands | `presets-apo/Deep 45 MdMonax 45hz.txt` |
| 26 | **DeepWaves Original Earphones MDMonax** | Earbuds / TWS / IEMs | 0.00 dB | 18 bands | `presets-apo/DeepWaves Original Earphones MDMonax.txt` |
| 27 | **DJ Sound MDMonax** | General / Multi-Device | 0.00 dB | 11 bands | `presets-apo/DJ Sound MDMonax.txt` |
| 28 | **DolbySub on Earphones MdMonax** | Earbuds / TWS / IEMs | 0.00 dB | 11 bands | `presets-apo/DolbySub on Earphones MdMonax.txt` |
| 29 | **Earphones FunkiNuDe Envelope** | Earbuds / TWS / IEMs | 0.00 dB | 19 bands | `presets-apo/Earphones FunkiNuDe Envelope.txt` |
| 30 | **Enclosed Box DjsMDMONAX** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 14 bands | `presets-apo/Enclosed Box DjsMDMONAX.txt` |
| 31 | **Foundation** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Foundation.txt` |
| 32 | **FrontPunchy 50hz** | General / Multi-Device | 0.00 dB | 6 bands | `presets-apo/FrontPunchy 50hz.txt` |
| 33 | **FTS Envelope Slowed** | General / Multi-Device | 0.00 dB | 34 bands | `presets-apo/FTS Envelope Slowed.txt` |
| 34 | **Gold** | Headphones / Earbuds (All-Rounder) | 0.02 dB | 66 bands | `presets-apo/Gold.txt` |
| 35 | **GrootBass MDMonax Envelope** | General / Multi-Device | 0.00 dB | 18 bands | `presets-apo/GrootBass MDMonax Envelope.txt` |
| 36 | **Harmony** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Harmony.txt` |
| 37 | **HD Headphones  V2 Deep  50hz  MDMonax** | Over-Ear Headphones | 0.00 dB | 31 bands | `presets-apo/HD Headphones  V2 Deep  50hz  MDMonax.txt` |
| 38 | **Headphones FUNKI-Nude MDMonax** | Over-Ear Headphones | 0.00 dB | 17 bands | `presets-apo/Headphones FUNKI-Nude MDMonax.txt` |
| 39 | **Hi res TWS 4 Md Monax** | Earbuds / TWS / IEMs | 0.00 dB | 16 bands | `presets-apo/Hi res TWS 4 Md Monax.txt` |
| 40 | **House El nino 50hz MDMONAX** | General / Multi-Device | 0.00 dB | 45 bands | `presets-apo/House El nino 50hz MDMONAX.txt` |
| 41 | **Icepower 1  Mdmonax** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 bands | `presets-apo/Icepower 1  Mdmonax.txt` |
| 42 | **Icepower 2  Mdmonax** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 bands | `presets-apo/Icepower 2  Mdmonax.txt` |
| 43 | **Indoor Clear MDMonax** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 bands | `presets-apo/Indoor Clear MDMonax.txt` |
| 44 | **Jazz punchyMDMonax 106hz** | General / Multi-Device | 0.00 dB | 5 bands | `presets-apo/Jazz punchyMDMonax 106hz.txt` |
| 45 | **July 2026 Envelope Only MDMonax** | General / Multi-Device | 0.00 dB | 16 bands | `presets-apo/July 2026 Envelope Only MDMonax.txt` |
| 46 | **June MDMonax DeepWaves 50hz Q100** | General / Multi-Device | 0.00 dB | 12 bands | `presets-apo/June MDMonax DeepWaves 50hz Q100.txt` |
| 47 | **M19 earphones  B** | Earbuds / TWS / IEMs | 0.00 dB | 21 bands | `presets-apo/M19 earphones  B.txt` |
| 48 | **Master** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Master.txt` |
| 49 | **MiD BAss MDMONAX comp400hz** | General / Multi-Device | 0.00 dB | 33 bands | `presets-apo/MiD BAss MDMONAX comp400hz.txt` |
| 50 | **Monday Blues 2 Kick MDMonax** | General / Multi-Device | 0.00 dB | 25 bands | `presets-apo/Monday Blues 2 Kick MDMonax.txt` |
| 51 | **Monday Blues deep v2 MDMonax** | General / Multi-Device | 0.00 dB | 28 bands | `presets-apo/Monday Blues deep v2 MDMonax.txt` |
| 52 | **Movie Bass Mod Slow MDMona** | General / Multi-Device | 0.00 dB | 15 bands | `presets-apo/Movie Bass Mod Slow MDMona.txt` |
| 53 | **Noise Cancel Guitar** | General / Multi-Device | 0.00 dB | 39 bands | `presets-apo/Noise Cancel Guitar.txt` |
| 54 | **November Cascade MDMonax** | General / Multi-Device | 0.00 dB | 17 bands | `presets-apo/November Cascade MDMonax.txt` |
| 55 | **Outdoor Midrange MdMonax** | Outdoor PA / DJ / Large Speakers | 0.00 dB | 15 bands | `presets-apo/Outdoor Midrange MdMonax.txt` |
| 56 | **Pioneer Home theather MDMonax** | Home Theater / Soundbar | 0.00 dB | 17 bands | `presets-apo/Pioneer Home theather MDMonax.txt` |
| 57 | **Platinum** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Platinum.txt` |
| 58 | **PoPiano MDMonaxEnvelope 36hz** | General / Multi-Device | 0.00 dB | 10 bands | `presets-apo/PoPiano MDMonaxEnvelope 36hz.txt` |
| 59 | **PoPiano2 Heavy  MDMonaxEnvelope 36hz** | General / Multi-Device | 0.00 dB | 10 bands | `presets-apo/PoPiano2 Heavy  MDMonaxEnvelope 36hz.txt` |
| 60 | **Presence** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Presence.txt` |
| 61 | **Punchy Bass vijay** | General / Multi-Device | 3.00 dB | 10 bands | `presets-apo/Punchy Bass vijay.txt` |
| 62 | **Punchy2 Small spk MDMonax 36hz** | Small / Portable Bluetooth Speakers | 0.00 dB | 13 bands | `presets-apo/Punchy2 Small spk MDMonax 36hz.txt` |
| 63 | **Reference X** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Reference X.txt` |
| 64 | **Riddim 2026 MDMonax 40hz** | General / Multi-Device | 0.00 dB | 27 bands | `presets-apo/Riddim 2026 MDMonax 40hz.txt` |
| 65 | **Rnb2026MDMonax Hometheathers** | Home Theater / Soundbar | 0.00 dB | 32 bands | `presets-apo/Rnb2026MDMonax Hometheathers.txt` |
| 66 | **Signature** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Signature.txt` |
| 67 | **Slow Mid Sony All stereo** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 37 bands | `presets-apo/Slow Mid Sony All stereo.txt` |
| 68 | **SlowBass with Trebble MDMonax** | General / Multi-Device | 0.00 dB | 21 bands | `presets-apo/SlowBass with Trebble MDMonax.txt` |
| 69 | **Small Speakers Clarity Punchy June Stereo Envelope 50hzQ1 MdMonax** | Small / Portable Bluetooth Speakers | 0.00 dB | 9 bands | `presets-apo/Small Speakers Clarity Punchy June Stereo Envelope 50hzQ1 MdMonax.txt` |
| 70 | **SoundBar 102hz Q080 Cc MDMonax** | Home Theater / Soundbar | 0.00 dB | 10 bands | `presets-apo/SoundBar 102hz Q080 Cc MDMonax.txt` |
| 71 | **Strike** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Strike.txt` |
| 72 | **Titan** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Titan.txt` |
| 73 | **TWS Earphones 2 MDMONAX** | Earbuds / TWS / IEMs | 0.00 dB | 10 bands | `presets-apo/TWS Earphones 2 MDMONAX.txt` |
| 74 | **TWs Earphones MDMonax** | Earbuds / TWS / IEMs | 0.00 dB | 9 bands | `presets-apo/TWs Earphones MDMonax.txt` |
| 75 | **Tws Midnight Monax** | Earbuds / TWS / IEMs | 0.00 dB | 8 bands | `presets-apo/Tws Midnight Monax.txt` |
| 76 | **V8 2 MDMonax** | General / Multi-Device | 0.00 dB | 14 bands | `presets-apo/V8 2 MDMonax.txt` |
| 77 | **V8 3 MDMonax** | General / Multi-Device | 0.00 dB | 14 bands | `presets-apo/V8 3 MDMonax.txt` |
| 78 | **V8 latest MDMonax** | General / Multi-Device | 0.00 dB | 13 bands | `presets-apo/V8 latest MDMonax.txt` |
| 79 | **Vocal** | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 bands | `presets-apo/Vocal.txt` |

## HeSuVi Virtual Surround HRIRs (169 Profiles)

> **Note:** Binaural HRIR surround profiles are engineered strictly for **Headphones & Earbuds**. Disable Virtual Surround when using phone speakers or external speaker systems.

| # | Profile Name | Recommended Device & Use Case | File Size | File Path |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **atmos** | Headphones / Earbuds (Dolby Cinema & Music) | 281.7 KB | `hrir-surround/atmos.wav` |
| 2 | **atmos-** | Headphones / Earbuds (Dolby Cinema & Music) | 3.5 KB | `hrir-surround/atmos-.wav` |
| 3 | **atmos_L** | Headphones / Earbuds (Dolby Cinema & Music) | 160.9 KB | `hrir-surround/atmos_L.wav` |
| 4 | **atmos-_L** | Headphones / Earbuds (Dolby Cinema & Music) | 4 KB | `hrir-surround/atmos-_L.wav` |
| 5 | **atmos_R** | Headphones / Earbuds (Dolby Cinema & Music) | 160.9 KB | `hrir-surround/atmos_R.wav` |
| 6 | **atmos-_R** | Headphones / Earbuds (Dolby Cinema & Music) | 4 KB | `hrir-surround/atmos-_R.wav` |
| 7 | **cmss_ent** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | `hrir-surround/cmss_ent.wav` |
| 8 | **cmss_ent-** | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB | `hrir-surround/cmss_ent-.wav` |
| 9 | **cmss_ent_L** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/cmss_ent_L.wav` |
| 10 | **cmss_ent-_L** | Headphones / Earbuds (3D Gaming & Spatial) | 5.3 KB | `hrir-surround/cmss_ent-_L.wav` |
| 11 | **cmss_ent_R** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/cmss_ent_R.wav` |
| 12 | **cmss_ent-_R** | Headphones / Earbuds (3D Gaming & Spatial) | 5.3 KB | `hrir-surround/cmss_ent-_R.wav` |
| 13 | **cmss_game** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | `hrir-surround/cmss_game.wav` |
| 14 | **cmss_game-** | Headphones / Earbuds (3D Gaming & Spatial) | 4.6 KB | `hrir-surround/cmss_game-.wav` |
| 15 | **cmss_game_L** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/cmss_game_L.wav` |
| 16 | **cmss_game-_L** | Headphones / Earbuds (3D Gaming & Spatial) | 5.2 KB | `hrir-surround/cmss_game-_L.wav` |
| 17 | **cmss_game_R** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/cmss_game_R.wav` |
| 18 | **cmss_game-_R** | Headphones / Earbuds (3D Gaming & Spatial) | 5.2 KB | `hrir-surround/cmss_game-_R.wav` |
| 19 | **cmss_rx** | Headphones / Earbuds (3D Gaming & Spatial) | 2.5 KB | `hrir-surround/cmss_rx.wav` |
| 20 | **cmss_rx_L** | Headphones / Earbuds (3D Gaming & Spatial) | 2.8 KB | `hrir-surround/cmss_rx_L.wav` |
| 21 | **cmss_rx_R** | Headphones / Earbuds (3D Gaming & Spatial) | 2.8 KB | `hrir-surround/cmss_rx_R.wav` |
| 22 | **cmss_rx+** | Headphones / Earbuds (3D Gaming & Spatial) | 787.7 KB | `hrir-surround/cmss_rx+.wav` |
| 23 | **cmss_rx+_L** | Headphones / Earbuds (3D Gaming & Spatial) | 450.1 KB | `hrir-surround/cmss_rx+_L.wav` |
| 24 | **cmss_rx+_R** | Headphones / Earbuds (3D Gaming & Spatial) | 450.1 KB | `hrir-surround/cmss_rx+_R.wav` |
| 25 | **dh-** | Headphones / Earbuds (Dolby Cinema & Music) | 3.7 KB | `hrir-surround/dh-.wav` |
| 26 | **dh-_L** | Headphones / Earbuds (Dolby Cinema & Music) | 4.1 KB | `hrir-surround/dh-_L.wav` |
| 27 | **dh-_R** | Headphones / Earbuds (Dolby Cinema & Music) | 4.1 KB | `hrir-surround/dh-_R.wav` |
| 28 | **dh+** | Headphones / Earbuds (Dolby Cinema & Music) | 385.5 KB | `hrir-surround/dh+.wav` |
| 29 | **dh+_L** | Headphones / Earbuds (Dolby Cinema & Music) | 220.2 KB | `hrir-surround/dh+_L.wav` |
| 30 | **dh+_R** | Headphones / Earbuds (Dolby Cinema & Music) | 220.2 KB | `hrir-surround/dh+_R.wav` |
| 31 | **dh++** | Headphones / Earbuds (Dolby Cinema & Music) | 393.9 KB | `hrir-surround/dh++.wav` |
| 32 | **dh++_L** | Headphones / Earbuds (Dolby Cinema & Music) | 225.1 KB | `hrir-surround/dh++_L.wav` |
| 33 | **dh++_R** | Headphones / Earbuds (Dolby Cinema & Music) | 225.1 KB | `hrir-surround/dh++_R.wav` |
| 34 | **dht** | Headphones / Earbuds (Dolby Cinema & Music) | 472.7 KB | `hrir-surround/dht.wav` |
| 35 | **dht-** | Headphones / Earbuds (Dolby Cinema & Music) | 21.2 KB | `hrir-surround/dht-.wav` |
| 36 | **dht_L** | Headphones / Earbuds (Dolby Cinema & Music) | 270.1 KB | `hrir-surround/dht_L.wav` |
| 37 | **dht-_L** | Headphones / Earbuds (Dolby Cinema & Music) | 12.1 KB | `hrir-surround/dht-_L.wav` |
| 38 | **dht_R** | Headphones / Earbuds (Dolby Cinema & Music) | 270.1 KB | `hrir-surround/dht_R.wav` |
| 39 | **dht-_R** | Headphones / Earbuds (Dolby Cinema & Music) | 12.1 KB | `hrir-surround/dht-_R.wav` |
| 40 | **dirac_delta_44_left** | Headphones / Earbuds Only (Binaural) | 88 KB | `hrir-surround/dirac_delta_44_left.wav` |
| 41 | **dirac_delta_44_right** | Headphones / Earbuds Only (Binaural) | 88 KB | `hrir-surround/dirac_delta_44_right.wav` |
| 42 | **dirac_delta_48_left** | Headphones / Earbuds Only (Binaural) | 96 KB | `hrir-surround/dirac_delta_48_left.wav` |
| 43 | **dirac_delta_48_right** | Headphones / Earbuds Only (Binaural) | 96 KB | `hrir-surround/dirac_delta_48_right.wav` |
| 44 | **ds3d** | Headphones / Earbuds Only (Binaural) | 7.3 KB | `hrir-surround/ds3d.wav` |
| 45 | **ds3d_L** | Headphones / Earbuds Only (Binaural) | 8.3 KB | `hrir-surround/ds3d_L.wav` |
| 46 | **ds3d_R** | Headphones / Earbuds Only (Binaural) | 8.3 KB | `hrir-surround/ds3d_R.wav` |
| 47 | **ds3d+** | Headphones / Earbuds Only (Binaural) | 163.3 KB | `hrir-surround/ds3d+.wav` |
| 48 | **ds3d+_L** | Headphones / Earbuds Only (Binaural) | 93.3 KB | `hrir-surround/ds3d+_L.wav` |
| 49 | **ds3d+_R** | Headphones / Earbuds Only (Binaural) | 93.3 KB | `hrir-surround/ds3d+_R.wav` |
| 50 | **ds3d++** | Headphones / Earbuds Only (Binaural) | 656.4 KB | `hrir-surround/ds3d++.wav` |
| 51 | **ds3d++_L** | Headphones / Earbuds Only (Binaural) | 375.1 KB | `hrir-surround/ds3d++_L.wav` |
| 52 | **ds3d++_R** | Headphones / Earbuds Only (Binaural) | 375.1 KB | `hrir-surround/ds3d++_R.wav` |
| 53 | **ds3d+++** | Headphones / Earbuds Only (Binaural) | 918.9 KB | `hrir-surround/ds3d+++.wav` |
| 54 | **ds3d+++_L** | Headphones / Earbuds Only (Binaural) | 525.1 KB | `hrir-surround/ds3d+++_L.wav` |
| 55 | **ds3d+++_R** | Headphones / Earbuds Only (Binaural) | 525.1 KB | `hrir-surround/ds3d+++_R.wav` |
| 56 | **dtshx** | Headphones / Earbuds (3D Gaming & Spatial) | 65.8 KB | `hrir-surround/dtshx.wav` |
| 57 | **dtshx-** | Headphones / Earbuds (3D Gaming & Spatial) | 4.2 KB | `hrir-surround/dtshx-.wav` |
| 58 | **dtshx_L** | Headphones / Earbuds (3D Gaming & Spatial) | 37.6 KB | `hrir-surround/dtshx_L.wav` |
| 59 | **dtshx-_L** | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB | `hrir-surround/dtshx-_L.wav` |
| 60 | **dtshx_R** | Headphones / Earbuds (3D Gaming & Spatial) | 37.6 KB | `hrir-surround/dtshx_R.wav` |
| 61 | **dtshx-_R** | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB | `hrir-surround/dtshx-_R.wav` |
| 62 | **dvs** | Headphones / Earbuds Only (Binaural) | 459.6 KB | `hrir-surround/dvs.wav` |
| 63 | **dvs_L** | Headphones / Earbuds Only (Binaural) | 262.6 KB | `hrir-surround/dvs_L.wav` |
| 64 | **dvs_R** | Headphones / Earbuds Only (Binaural) | 262.6 KB | `hrir-surround/dvs_R.wav` |
| 65 | **dvs+** | Headphones / Earbuds Only (Binaural) | 399.2 KB | `hrir-surround/dvs+.wav` |
| 66 | **dvs+_L** | Headphones / Earbuds Only (Binaural) | 228.1 KB | `hrir-surround/dvs+_L.wav` |
| 67 | **dvs+_R** | Headphones / Earbuds Only (Binaural) | 228.1 KB | `hrir-surround/dvs+_R.wav` |
| 68 | **gsx** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | `hrir-surround/gsx.wav` |
| 69 | **gsx-** | Headphones / Earbuds (3D Gaming & Spatial) | 3.4 KB | `hrir-surround/gsx-.wav` |
| 70 | **gsx_L** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/gsx_L.wav` |
| 71 | **gsx-_L** | Headphones / Earbuds (3D Gaming & Spatial) | 3.9 KB | `hrir-surround/gsx-_L.wav` |
| 72 | **gsx_R** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/gsx_R.wav` |
| 73 | **gsx-_R** | Headphones / Earbuds (3D Gaming & Spatial) | 3.9 KB | `hrir-surround/gsx-_R.wav` |
| 74 | **gsx+** | Headphones / Earbuds (3D Gaming & Spatial) | 472.7 KB | `hrir-surround/gsx+.wav` |
| 75 | **gsx+_L** | Headphones / Earbuds (3D Gaming & Spatial) | 270.1 KB | `hrir-surround/gsx+_L.wav` |
| 76 | **gsx+_R** | Headphones / Earbuds (3D Gaming & Spatial) | 270.1 KB | `hrir-surround/gsx+_R.wav` |
| 77 | **gsx++** | Headphones / Earbuds (3D Gaming & Spatial) | 603.9 KB | `hrir-surround/gsx++.wav` |
| 78 | **gsx++_L** | Headphones / Earbuds (3D Gaming & Spatial) | 345.1 KB | `hrir-surround/gsx++_L.wav` |
| 79 | **gsx++_R** | Headphones / Earbuds (3D Gaming & Spatial) | 345.1 KB | `hrir-surround/gsx++_R.wav` |
| 80 | **hear** | Headphones / Earbuds Only (Binaural) | 2.8 KB | `hrir-surround/hear.wav` |
| 81 | **hear_L** | Headphones / Earbuds Only (Binaural) | 3.1 KB | `hrir-surround/hear_L.wav` |
| 82 | **hear_R** | Headphones / Earbuds Only (Binaural) | 3.1 KB | `hrir-surround/hear_R.wav` |
| 83 | **nahimic** | Headphones / Earbuds Only (Binaural) | 787.7 KB | `hrir-surround/nahimic.wav` |
| 84 | **nahimic-** | Headphones / Earbuds Only (Binaural) | 13.9 KB | `hrir-surround/nahimic-.wav` |
| 85 | **nahimic_L** | Headphones / Earbuds Only (Binaural) | 450.1 KB | `hrir-surround/nahimic_L.wav` |
| 86 | **nahimic-_L** | Headphones / Earbuds Only (Binaural) | 15.8 KB | `hrir-surround/nahimic-_L.wav` |
| 87 | **nahimic_R** | Headphones / Earbuds Only (Binaural) | 450.1 KB | `hrir-surround/nahimic_R.wav` |
| 88 | **nahimic-_R** | Headphones / Earbuds Only (Binaural) | 15.8 KB | `hrir-surround/nahimic-_R.wav` |
| 89 | **none** | Headphones / Earbuds Only (Binaural) | 0.2 KB | `hrir-surround/none.wav` |
| 90 | **none_L** | Headphones / Earbuds Only (Binaural) | 0.1 KB | `hrir-surround/none_L.wav` |
| 91 | **none_R** | Headphones / Earbuds Only (Binaural) | 0.1 KB | `hrir-surround/none_R.wav` |
| 92 | **oal_cia0** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | `hrir-surround/oal_cia0.wav` |
| 93 | **oal_cia0_L** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/oal_cia0_L.wav` |
| 94 | **oal_cia0_R** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/oal_cia0_R.wav` |
| 95 | **oal_cia1** | Headphones / Earbuds (3D Gaming & Spatial) | 1.7 KB | `hrir-surround/oal_cia1.wav` |
| 96 | **oal_cia1_L** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | `hrir-surround/oal_cia1_L.wav` |
| 97 | **oal_cia1_R** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | `hrir-surround/oal_cia1_R.wav` |
| 98 | **oal_dflt** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | `hrir-surround/oal_dflt.wav` |
| 99 | **oal_dflt_L** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/oal_dflt_L.wav` |
| 100 | **oal_dflt_R** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/oal_dflt_R.wav` |
| 101 | **oal+** | Headphones / Earbuds (3D Gaming & Spatial) | 393.9 KB | `hrir-surround/oal+.wav` |
| 102 | **oal+_L** | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB | `hrir-surround/oal+_L.wav` |
| 103 | **oal+_R** | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB | `hrir-surround/oal+_R.wav` |
| 104 | **oal++** | Headphones / Earbuds (3D Gaming & Spatial) | 393.9 KB | `hrir-surround/oal++.wav` |
| 105 | **oal++_L** | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB | `hrir-surround/oal++_L.wav` |
| 106 | **oal++_R** | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB | `hrir-surround/oal++_R.wav` |
| 107 | **oal+++** | Headphones / Earbuds (3D Gaming & Spatial) | 656.4 KB | `hrir-surround/oal+++.wav` |
| 108 | **oal+++_L** | Headphones / Earbuds (3D Gaming & Spatial) | 375.1 KB | `hrir-surround/oal+++_L.wav` |
| 109 | **oal+++_R** | Headphones / Earbuds (3D Gaming & Spatial) | 375.1 KB | `hrir-surround/oal+++_R.wav` |
| 110 | **ooyh0** | Headphones / Earbuds Only (Binaural) | 590.8 KB | `hrir-surround/ooyh0.wav` |
| 111 | **ooyh0_L** | Headphones / Earbuds Only (Binaural) | 337.6 KB | `hrir-surround/ooyh0_L.wav` |
| 112 | **ooyh0_R** | Headphones / Earbuds Only (Binaural) | 337.6 KB | `hrir-surround/ooyh0_R.wav` |
| 113 | **ooyh1** | Headphones / Earbuds Only (Binaural) | 381 KB | `hrir-surround/ooyh1.wav` |
| 114 | **ooyh1_L** | Headphones / Earbuds Only (Binaural) | 217.7 KB | `hrir-surround/ooyh1_L.wav` |
| 115 | **ooyh1_R** | Headphones / Earbuds Only (Binaural) | 217.7 KB | `hrir-surround/ooyh1_R.wav` |
| 116 | **razer** | Headphones / Earbuds (3D Gaming & Spatial) | 9.1 KB | `hrir-surround/razer.wav` |
| 117 | **razer_fix** | Headphones / Earbuds (3D Gaming & Spatial) | 27 KB | `hrir-surround/razer_fix.wav` |
| 118 | **razer_fix_L** | Headphones / Earbuds (3D Gaming & Spatial) | 30.8 KB | `hrir-surround/razer_fix_L.wav` |
| 119 | **razer_fix_R** | Headphones / Earbuds (3D Gaming & Spatial) | 30.8 KB | `hrir-surround/razer_fix_R.wav` |
| 120 | **razer_L** | Headphones / Earbuds (3D Gaming & Spatial) | 10.3 KB | `hrir-surround/razer_L.wav` |
| 121 | **razer_R** | Headphones / Earbuds (3D Gaming & Spatial) | 10.3 KB | `hrir-surround/razer_R.wav` |
| 122 | **sbx100** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | `hrir-surround/sbx100.wav` |
| 123 | **sbx100-** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | `hrir-surround/sbx100-.wav` |
| 124 | **sbx100_L** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/sbx100_L.wav` |
| 125 | **sbx100-_L** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/sbx100-_L.wav` |
| 126 | **sbx100_R** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/sbx100_R.wav` |
| 127 | **sbx100-_R** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/sbx100-_R.wav` |
| 128 | **sbx33** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | `hrir-surround/sbx33.wav` |
| 129 | **sbx33-** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | `hrir-surround/sbx33-.wav` |
| 130 | **sbx33_L** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/sbx33_L.wav` |
| 131 | **sbx33-_L** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/sbx33-_L.wav` |
| 132 | **sbx33_R** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/sbx33_R.wav` |
| 133 | **sbx33-_R** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/sbx33-_R.wav` |
| 134 | **sbx67** | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB | `hrir-surround/sbx67.wav` |
| 135 | **sbx67-** | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB | `hrir-surround/sbx67-.wav` |
| 136 | **sbx67_L** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/sbx67_L.wav` |
| 137 | **sbx67-_L** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/sbx67-_L.wav` |
| 138 | **sbx67_R** | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB | `hrir-surround/sbx67_R.wav` |
| 139 | **sbx67-_R** | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB | `hrir-surround/sbx67-_R.wav` |
| 140 | **sonic** | Headphones / Earbuds (3D Gaming & Spatial) | 280.7 KB | `hrir-surround/sonic.wav` |
| 141 | **sonic-** | Headphones / Earbuds (3D Gaming & Spatial) | 8.6 KB | `hrir-surround/sonic-.wav` |
| 142 | **sonic_L** | Headphones / Earbuds (3D Gaming & Spatial) | 160.4 KB | `hrir-surround/sonic_L.wav` |
| 143 | **sonic-_L** | Headphones / Earbuds (3D Gaming & Spatial) | 9.8 KB | `hrir-surround/sonic-_L.wav` |
| 144 | **sonic_R** | Headphones / Earbuds (3D Gaming & Spatial) | 160.4 KB | `hrir-surround/sonic_R.wav` |
| 145 | **sonic-_R** | Headphones / Earbuds (3D Gaming & Spatial) | 9.8 KB | `hrir-surround/sonic-_R.wav` |
| 146 | **sonic+** | Headphones / Earbuds (3D Gaming & Spatial) | 630.2 KB | `hrir-surround/sonic+.wav` |
| 147 | **sonic+_L** | Headphones / Earbuds (3D Gaming & Spatial) | 360.1 KB | `hrir-surround/sonic+_L.wav` |
| 148 | **sonic+_R** | Headphones / Earbuds (3D Gaming & Spatial) | 360.1 KB | `hrir-surround/sonic+_R.wav` |
| 149 | **ssc_dub** | Headphones / Earbuds Only (Binaural) | 267.1 KB | `hrir-surround/ssc_dub.wav` |
| 150 | **ssc_dub_L** | Headphones / Earbuds Only (Binaural) | 152.6 KB | `hrir-surround/ssc_dub_L.wav` |
| 151 | **ssc_dub_R** | Headphones / Earbuds Only (Binaural) | 152.6 KB | `hrir-surround/ssc_dub_R.wav` |
| 152 | **ssc_ny** | Headphones / Earbuds Only (Binaural) | 144.6 KB | `hrir-surround/ssc_ny.wav` |
| 153 | **ssc_ny_L** | Headphones / Earbuds Only (Binaural) | 82.6 KB | `hrir-surround/ssc_ny_L.wav` |
| 154 | **ssc_ny_R** | Headphones / Earbuds Only (Binaural) | 82.6 KB | `hrir-surround/ssc_ny_R.wav` |
| 155 | **ssc_ny+** | Headphones / Earbuds Only (Binaural) | 486 KB | `hrir-surround/ssc_ny+.wav` |
| 156 | **ssc_ny+_L** | Headphones / Earbuds Only (Binaural) | 277.7 KB | `hrir-surround/ssc_ny+_L.wav` |
| 157 | **ssc_ny+_R** | Headphones / Earbuds Only (Binaural) | 277.7 KB | `hrir-surround/ssc_ny+_R.wav` |
| 158 | **ssc_syd** | Headphones / Earbuds Only (Binaural) | 412.3 KB | `hrir-surround/ssc_syd.wav` |
| 159 | **ssc_syd_L** | Headphones / Earbuds Only (Binaural) | 235.6 KB | `hrir-surround/ssc_syd_L.wav` |
| 160 | **ssc_syd_R** | Headphones / Earbuds Only (Binaural) | 235.6 KB | `hrir-surround/ssc_syd_R.wav` |
| 161 | **ssc_syd+** | Headphones / Earbuds Only (Binaural) | 897.9 KB | `hrir-surround/ssc_syd+.wav` |
| 162 | **ssc_syd+_L** | Headphones / Earbuds Only (Binaural) | 513.1 KB | `hrir-surround/ssc_syd+_L.wav` |
| 163 | **ssc_syd+_R** | Headphones / Earbuds Only (Binaural) | 513.1 KB | `hrir-surround/ssc_syd+_R.wav` |
| 164 | **waves** | Headphones / Earbuds Only (Binaural) | 472.7 KB | `hrir-surround/waves.wav` |
| 165 | **waves-** | Headphones / Earbuds Only (Binaural) | 14.3 KB | `hrir-surround/waves-.wav` |
| 166 | **waves_L** | Headphones / Earbuds Only (Binaural) | 270.1 KB | `hrir-surround/waves_L.wav` |
| 167 | **waves-_L** | Headphones / Earbuds Only (Binaural) | 16.3 KB | `hrir-surround/waves-_L.wav` |
| 168 | **waves_R** | Headphones / Earbuds Only (Binaural) | 270.1 KB | `hrir-surround/waves_R.wav` |
| 169 | **waves-_R** | Headphones / Earbuds Only (Binaural) | 16.3 KB | `hrir-surround/waves-_R.wav` |
# Equalizer314 Audio Setup, Presets & Virtual Surround

Converted Poweramp parametric EQ presets (EqualizerAPO format), a restore backup, and HeSuVi Virtual Surround HRIR files for Equalizer314.

> **New here?** Jump to the [How to Use Equalizer314 (Beginner Guide)](#how-to-use-equalizer314-beginner-guide).

## One-Click Download Portal (Instant File Downloads)

* **One-click download portal (GitHub Pages):** https://burnomus14.github.io/Equalizer314-Setup/
* **Get the Equalizer314 app (APK releases):** https://github.com/bearinmindcat/Equalizer314/releases
* **Master Restore Backup:** [backups/Equalizer314-RESTORE.json](backups/Equalizer314-RESTORE.json)

This backup contains 156 custom EQ presets only; it does not include saved EQ settings or device/app bindings. Import it with the app's **Restore** option to replace the app's current custom-preset collection with these presets while keeping your settings and bindings. The app may correct invalid or out-of-range DSP setting values during import. To load just one EQ preset, download an individual `.txt` file instead.

Clicking a preset name below opens the file in GitHub. Use the portal above to download files.

## Quick Setup Commands (ADB)

> **Optional.** You only need these for per-app control and virtual surround. Basic EQ works without them.

```powershell
adb shell pm grant com.bearinmind.equalizer314 android.permission.DUMP
adb shell appops set com.bearinmind.equalizer314 PROJECT_MEDIA allow
adb shell mkdir -p /sdcard/Download/Equalizer314_Presets /sdcard/Download/HeSuVi_HRIR
Get-ChildItem presets-apo\*.txt | ForEach-Object { adb push $_.FullName "/sdcard/Download/Equalizer314_Presets/$($_.Name)" }
```

## How to Use Equalizer314 (Beginner Guide)

Equalizer314 changes the sound of your **whole phone** (music, videos, games, other apps). You can boost bass, soften harsh treble, or correct your headphones. It needs **Android 9 or newer**, no root, and almost no permissions.

> **New to equalizers?** An equalizer (EQ) turns specific pitches up or down. Low pitches = bass, high pitches = treble. A **preset** is a saved EQ setting you can load in one tap.

### Quick Start (5 minutes)

1. **Install the app** from GitHub, F-Droid, Obtainium or Google Play (links above).
2. **Close other EQ apps** (Wavelet, Poweramp EQ, built-in phone equalizers). Only one EQ app can control the phone's audio at a time.
3. **Open Equalizer314** and allow notifications if asked. This helps the app see which apps are playing.
4. **Turn it on** with the power button, or use the Quick Settings tile (see below).
5. **Play some music** and start with **Simple mode** (it is on the first screen). Drag a point up or down and listen to the change.
6. **Load a preset** from this repo (see [Using the presets in this repo](#using-the-presets-in-this-repo)).

> The ADB commands in [Quick Setup Commands](#quick-setup-commands-adb) are **optional**. You only need them for per-app control and virtual surround. Basic EQ works without them.

---

### The Main Features, Explained

#### 1. EQ Modes (Simple, Parametric, Graphic, Table)
**What it does:** Four ways to edit the same sound.
- **Simple:** easiest. Drag a few points up or down.
- **Parametric:** most powerful. Drag points on the graph to choose the pitch, the boost or cut, and how wide it is (Q).
- **Graphic:** a row of sliders, like a classic equalizer.
- **Table:** type exact numbers for each band.

**How to use:**
1. Pick a mode on the main screen.
2. Drag points on the graph, or use the sliders or table.
3. Want fewer modes? Go to **Settings > EQ Modes & UI** and hide the ones you don't use.

**Tips:**
- In Parametric mode, **tap and hold a band** to change its filter type (the app supports all 12 filter types from the Equalizer APO format).
- Made a mistake? Use **Undo / Redo**; they work in every mode.
- The graph shows **gain colours** as a warning when your EQ may be too loud.
- You can toggle **per-band colour curves** from the top-left of the graph to see what each band does.

#### 2. Preamp and Gain Protection
**What it does:** Boosting EQ can make sound distort. A **preamp** lowers the overall volume first so boosts have room.

**How to use:** If sound crackles after a big boost, lower the preamp, or use the **gain reduction** slider in Settings.

#### 3. Left / Right Channel Settings
**What it does:** Lets you EQ the left and right ears differently, or balance them.

**How to use:**
1. Tap the **split icon** at the top left of the main EQ screen.
2. Switch between **L** and **R** to edit each side.
3. Open the channel options to adjust each side's preamp and balance.
4. Use the **tether** option to link both sides so they move together.

#### 4. Presets (Save, Load, Import, Export)
**What it does:** Saves your EQ so you can reuse it.

**How to use:**
1. Make an EQ you like and **save it as a custom preset**.
2. Load any saved preset from the preset list on the main screen.
3. **Import** presets made elsewhere. The app reads Equalizer APO `.txt` files (like the ones in this repo), plus Wavelet and Poweramp EQ presets.
4. **Export** your preset as an Equalizer APO file to use on a PC. You can also export compressor and limiter settings.
5. **Overwrite** an existing preset when you improve it.

#### 5. Generate Custom EQ (AutoEQ)
**What it does:** Builds a correction for **your headphones** automatically. You give it a *measurement* of your headphones and a *target sound*.

**How to use:**
1. Find your headphone measurement file (for example on squig.link).
2. Open **Generate Custom EQ** in the app.
3. Choose the measurement and a target curve.
4. Generate, listen, then save the result as a preset.

#### 6. Multiband Compressor (MBC)
**What it does:** Evens out loud and quiet parts **separately in different pitch ranges**. Think of it as an automatic volume hand for bass, mids and treble. It has live meters so you can see it working.

**How to use:**
1. Open the compressor screen and turn it on.
2. Play music and watch the meters move.
3. Change a value by using the slider **or** by dragging your finger on the graph.
4. If the sound gets squashed or dull, go back and use gentler settings.

#### 7. Limiter
**What it does:** Stops sudden loud peaks, so they can't blast your ears or distort.

**How to use:** Turn it on and watch the waveform meter. Use it as a safety net at the end of your sound chain.

#### 8. Environmental Reverb
**What it does:** Adds a room-like echo (small room, hall, and so on).

**How to use:** Turn it on and adjust the amount until it sounds natural. A little goes a long way.

#### 9. Audio Effects Pipeline (Apps and Devices)
**What it does:** Uses different sound settings for different **apps** or **output devices**.

- **Channel Output (devices):** give Bluetooth, speaker or USB DAC their own preset. The app can switch automatically when you connect a device. Pick **Disable EQ** for a device that should stay untouched.
- **Channel Input (apps):** attach a preset to a single app, and choose to skip system sounds. Use the **Filtered / Show All** chips to find your app.

**How to use:**
1. Open the **Audio Effects Pipeline** section.
2. Pick **Channel Output** or **Channel Input**.
3. Choose the device or app, then choose its preset.

> Per-app control needs the optional ADB step above, and only works with apps that tell Android when they start playing.

#### 10. Live Spectrum
**What it does:** Shows the sound moving in real time so you can match what you see to what you hear.

#### 11. Quick Settings Tile
**What it does:** An on/off button in your phone's notification shade.

**How to use:** Swipe down, edit the tiles, and add **Equalizer314**. Tap it to switch processing on or off. Long-press it to open the app.

#### 12. Backup and Restore
**What it does:** Saves all your settings and bindings to one `.json` file.

**How to use:** Use the backup option in the app to export, and the restore option to import. The **Master Restore Backup** in this repo contains only presets and replaces the current custom-preset collection; it does not restore settings or bindings. The app may correct invalid or out-of-range DSP values during import.

#### 13. Appearance and Language
- **Settings > EQ Modes & UI:** choose Light, Dark, Black AMOLED, or Follow system.
- **Settings > Language:** English, Russian, Ukrainian, Portuguese, Spanish, or System default.

#### 14. Experimental Features
Found under the experimental section. They include:
- more EQ bands (up to 64)
- notification settings and a hide-notification option
- auto-save presets
- **Remote / TV mode:** control the app from another device on your home network, paired with a PIN

#### 15. Pixel Compatibility Mode
**What it does:** Pixel phones and some other devices limit how many bands can be used. This mode caps the bands at 32 to fix it.

**How to use:** Turn it on in Settings if the EQ does nothing or sounds wrong on a Pixel.

---

### Using the Presets in This Repo

1. Open the [preset table](#parametric-eq-presets-79-profiles) and pick one that matches your device (earbuds, car, outdoor speakers, soundbar and so on).
2. Download the `.txt` file (use the [Instant Download Page](https://burnomus14.github.io/Equalizer314-Setup/) for one-tap downloads).
3. In Equalizer314, **import** the file.
4. Play music, listen, and adjust. If it's too loud or distorted, lower the preamp.
5. Save your edited version as a custom preset.

**To import the preset collection:** download `Equalizer314-RESTORE.json` and use the app's restore option. It replaces the custom-preset collection without restoring settings or bindings.

### Virtual Surround (HRIR Files)

The HRIR `.wav` files in this repo are for virtual surround, which makes stereo sound feel wider on headphones. They are meant for **headphones and earbuds only**. [Download all 169 files as a ZIP](hrir-surround-download.zip) and extract them from the `hrir-surround` folder, or use the [HRIR table](#hesuvi-virtual-surround-hrirs-169-profiles) to download individual files. The optional ADB commands above can copy the extracted files to your phone.

<!-- CHECK before publishing: confirm in the app exactly how HRIR files are loaded, as the official README does not describe it. -->

### Troubleshooting

| Problem | What to try |
| :--- | :--- |
| **No change in sound** | Close other EQ apps. Make sure the power button is on. Some apps and phones ignore system-wide EQ. |
| **Short glitches or dropouts** | The app is taking audio control back from another EQ app. Close the other app. |
| **EQ does nothing on a Pixel** | Turn on **Pixel Compatibility Mode**. |
| **Sound is distorted or crackling** | Lower the preamp, use the gain reduction slider, and turn on the limiter. |
| **App presets don't switch** | The app must tell Android it is playing. Allow notification access and use the Channel Input screen. |
| **EQ is gone after restart** | Open the app once, or restore your backup `.json`. |

> The app is in **beta**, so menu names may change between versions. If something looks different, check the latest release notes: https://github.com/bearinmindcat/Equalizer314/releases

## Parametric EQ Presets (156)

| # | Preset | Description | Recommended Device | Preamp | Bands |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | [(70hzBasstone)Slow Woofer bass. No kick stereo Mdmonax](presets-apo/%2870hzBasstone%29Slow%20Woofer%20bass.%20No%20kick%20stereo%20Mdmonax.txt) | Name suggests emphasis on bass or low frequencies and punch or kick impact. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 34 |
| 2 | [(C) JBL Tune 510BT](presets-apo/%28C%29%20JBL%20Tune%20510BT.txt) | Name identifies a device-specific tuning; use it as a starting point for the named model. | Over-Ear Headphones | 0.00 dB | 15 |
| 3 | [15 inch 36hz MdMonax stereo Envelope](presets-apo/15%20inch%2036hz%20MdMonax%20stereo%20Envelope.txt) | General EQ profile; the name does not specify a particular sound target. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 9 |
| 4 | [1MORE Penta Driver](presets-apo/1MORE%20Penta%20Driver.txt) | Name identifies a device-specific tuning; use it as a starting point for the named model. | Earbuds / TWS / IEMs | 0.00 dB | 34 |
| 5 | [32 band iso 226 stereo](presets-apo/32%20band%20iso%20226%20stereo.txt) | Name identifies this as an ISO 226 equal-loudness profile. | General / Multi-Device | 0.00 dB | 33 |
| 6 | [64 Audio A12t (2)](presets-apo/64%20Audio%20A12t%20%282%29.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | -7.20 dB | 12 |
| 7 | [80hzGroot Bass Stereo Cascade MdMonax](presets-apo/80hzGroot%20Bass%20Stereo%20Cascade%20MdMonax.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 32 |
| 8 | [AAGHAZ LOW VOCAL](presets-apo/AAGHAZ%20LOW%20VOCAL.txt) | Name suggests emphasis on bass or low frequencies and clarity or vocals. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 18 |
| 9 | [Air](presets-apo/Air.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 10 | [Apex](presets-apo/Apex.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 11 | [Apple AirPods 4 (ANC on)](presets-apo/Apple%20AirPods%204%20%28ANC%20on%29.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 2.40 dB | 20 |
| 12 | [Aura](presets-apo/Aura.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 13 | [Balance](presets-apo/Balance.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 |
| 14 | [Bang 2026 Monax](presets-apo/Bang%202026%20Monax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 22 |
| 15 | [Behringer 2 smooth 36hz MdMonax stereo (2)](presets-apo/Behringer%202%20smooth%2036hz%20MdMonax%20stereo%20%282%29.txt) | General EQ profile; the name does not specify a particular sound target. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 9 |
| 16 | [Behringer 2 smooth 36hz MdMonax stereo](presets-apo/Behringer%202%20smooth%2036hz%20MdMonax%20stereo.txt) | General EQ profile; the name does not specify a particular sound target. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 9 |
| 17 | [Behringer My best Outdoor Md Monax 50hzQ0.50 Trebbe 6463 Q0.90](presets-apo/Behringer%20My%20best%20Outdoor%20Md%20Monax%2050hzQ0.50%20Trebbe%206463%20Q0.90.txt) | Name identifies this as a speaker or sound-system profile. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 8 |
| 18 | [Better Voice Monax 36hz tone](presets-apo/Better%20Voice%20Monax%2036hz%20tone.txt) | Name suggests emphasis on clarity or vocals. | General / Multi-Device | 0.00 dB | 21 |
| 19 | [Big Speakers HD Monax](presets-apo/Big%20Speakers%20HD%20Monax.txt) | Name identifies this as a speaker or sound-system profile. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 37 |
| 20 | [Black Spider Stereo Envelope MDMonax](presets-apo/Black%20Spider%20Stereo%20Envelope%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 6 |
| 21 | [BoomBass Djsound MdMonax 50hz](presets-apo/BoomBass%20Djsound%20MdMonax%2050hz.txt) | Name suggests emphasis on bass or low frequencies. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 32 |
| 22 | [Car enclosed BoxBasstone 44hz C320 MDMonax](presets-apo/Car%20enclosed%20BoxBasstone%2044hz%20C320%20MDMonax.txt) | Name suggests emphasis on bass or low frequencies. | Car Audio / Subwoofer | 0.00 dB | 8 |
| 23 | [Car Non enclosedPortedBasstone 44hz C320 MDMonax](presets-apo/Car%20Non%20enclosedPortedBasstone%2044hz%20C320%20MDMonax.txt) | Name suggests emphasis on bass or low frequencies. | Car Audio / Subwoofer | 0.00 dB | 8 |
| 24 | [CarBass BSpider MDMonax](presets-apo/CarBass%20BSpider%20MDMonax.txt) | Name suggests emphasis on bass or low frequencies. | Car Audio / Subwoofer | 0.00 dB | 20 |
| 25 | [CarBass SA Oldies Monax c30 stereo](presets-apo/CarBass%20SA%20Oldies%20Monax%20c30%20stereo.txt) | Name suggests emphasis on bass or low frequencies. | Car Audio / Subwoofer | 0.00 dB | 29 |
| 26 | [CarBass Venom Monax](presets-apo/CarBass%20Venom%20Monax.txt) | Name suggests emphasis on bass or low frequencies. | Car Audio / Subwoofer | 0.00 dB | 43 |
| 27 | [Carsound Frequencies Monax](presets-apo/Carsound%20Frequencies%20Monax.txt) | Name identifies this as a car-audio profile. | Car Audio / Subwoofer | 0.00 dB | 21 |
| 28 | [Carsound outdoor MDMonax](presets-apo/Carsound%20outdoor%20MDMonax.txt) | Name identifies this as a car-audio profile. | Car Audio / Subwoofer | 0.00 dB | 14 |
| 29 | [Carsound outdoor V2 MdMonax](presets-apo/Carsound%20outdoor%20V2%20MdMonax.txt) | Name identifies this as a car-audio profile. | Car Audio / Subwoofer | 0.00 dB | 18 |
| 30 | [CarsoundMonamodi 36hz](presets-apo/CarsoundMonamodi%2036hz.txt) | Name identifies this as a car-audio profile. | Car Audio / Subwoofer | 0.00 dB | 31 |
| 31 | [Carsub on HomeAVCReciever MdMonax2](presets-apo/Carsub%20on%20HomeAVCReciever%20MdMonax2.txt) | Name suggests emphasis on bass or low frequencies. | Car Audio / Subwoofer | 0.00 dB | 32 |
| 32 | [Catalyst](presets-apo/Catalyst.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 33 | [CentreEarphonesMDMonax](presets-apo/CentreEarphonesMDMonax.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 35 |
| 34 | [Classical Sony MDMonax](presets-apo/Classical%20Sony%20MDMonax.txt) | Name identifies a device-specific tuning; use it as a starting point for the named model. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 41 |
| 35 | [Classical Sony with bassMDMonax](presets-apo/Classical%20Sony%20with%20bassMDMonax.txt) | Name suggests emphasis on bass or low frequencies. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 41 |
| 36 | [Clear Noise CancelV2 MdMonax](presets-apo/Clear%20Noise%20CancelV2%20MdMonax.txt) | Name suggests emphasis on clarity or vocals. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 42 |
| 37 | [Combi Concert Envelope MDMonax](presets-apo/Combi%20Concert%20Envelope%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 8 |
| 38 | [Combi Concert MDMonax](presets-apo/Combi%20Concert%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 9 |
| 39 | [Comfort Aura Presence Vocal Balance Master Air Strike Harmony Catalyst Apex Reference X Platinum Foundation Foundation Presence Titan Gold Signature](presets-apo/Comfort%20Aura%20Presence%20Vocal%20Balance%20Master%20Air%20Strike%20Harmony%20Catalyst%20Apex%20Reference%20X%20Platinum%20Foundation%20Foundation%20Presence%20Titan%20Gold%20Signature.txt) | Name suggests emphasis on clarity or vocals. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 1254 |
| 40 | [Comfort](presets-apo/Comfort.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.05 dB | 66 |
| 41 | [Crossover for PA Compressor 320](presets-apo/Crossover%20for%20PA%20Compressor%20320.txt) | Name identifies this as a speaker or sound-system profile. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 22 |
| 42 | [Crossover Sound bar (L) Carsound (R) MdMonax](presets-apo/Crossover%20Sound%20bar%20%28L%29%20Carsound%20%28R%29%20MdMonax.txt) | Name identifies this as a car-audio profile. | Car Audio / Subwoofer | 0.00 dB | 19 |
| 43 | [Curva Harman](presets-apo/Curva%20Harman.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 12 |
| 44 | [Dance Waves MDMonax 80hz](presets-apo/Dance%20Waves%20MDMonax%2080hz.txt) | Name identifies a music-style listening profile. | General / Multi-Device | 0.00 dB | 25 |
| 45 | [Deep 45 MdMonax (45hz)](presets-apo/Deep%2045%20MdMonax%20%2845hz%29.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 48 |
| 46 | [Deep bass 2](presets-apo/Deep%20bass%202.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | -9.43 dB | 15 |
| 47 | [Deep Waves MDMonax 2026](presets-apo/Deep%20Waves%20MDMonax%202026.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 30 |
| 48 | [DeepWaves Original Earphones MDMonax](presets-apo/DeepWaves%20Original%20Earphones%20MDMonax.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 18 |
| 49 | [Dj Set](presets-apo/Dj%20Set.txt) | Name identifies a music-style listening profile. | General / Multi-Device | 4.60 dB | 26 |
| 50 | [DJ Sound MDMonax](presets-apo/DJ%20Sound%20MDMonax.txt) | Name identifies a music-style listening profile. | General / Multi-Device | 0.00 dB | 11 |
| 51 | [DolbySub on Earphones MdMonax](presets-apo/DolbySub%20on%20Earphones%20MdMonax.txt) | Name suggests emphasis on bass or low frequencies. | Earbuds / TWS / IEMs | 0.00 dB | 11 |
| 52 | [Dvc Stereo Envelope MdMonax](presets-apo/Dvc%20Stereo%20Envelope%20MdMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 7 |
| 53 | [Earphones FunkiNuDe Envelope](presets-apo/Earphones%20FunkiNuDe%20Envelope.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 19 |
| 54 | [Ecco Envelope Crossover B142Q0.30 C45 MDMonax](presets-apo/Ecco%20Envelope%20Crossover%20B142Q0.30%20C45%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 23 |
| 55 | [-Echo Reduced clarity defined. 36hz MdMonax](presets-apo/-Echo%20Reduced%20clarity%20defined.%2036hz%20MdMonax.txt) | Name suggests emphasis on clarity or vocals. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 28 |
| 56 | [Enclosed Box DjsMDMONAX](presets-apo/Enclosed%20Box%20DjsMDMONAX.txt) | Name identifies a music-style listening profile. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 14 |
| 57 | [Envelope Crossover Bass boosted(R) MDMonax](presets-apo/Envelope%20Crossover%20Bass%20boosted%28R%29%20MDMonax.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 22 |
| 58 | [Envelope Crossover Bass( R mono) Md Monax (Fixed)](presets-apo/Envelope%20Crossover%20Bass%28%20R%20mono%29%20Md%20Monax%20%28Fixed%29.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 22 |
| 59 | [Foundation (2)](presets-apo/Foundation%20%282%29.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 60 | [Foundation](presets-apo/Foundation.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 61 | [FrontPunchy 50hz](presets-apo/FrontPunchy%2050hz.txt) | Name suggests emphasis on punch or kick impact. | General / Multi-Device | 0.00 dB | 6 |
| 62 | [FTS Envelope Slowed](presets-apo/FTS%20Envelope%20Slowed.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 34 |
| 63 | [General Stereo April 2026vMdMonax](presets-apo/General%20Stereo%20April%202026vMdMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 24 |
| 64 | [Gold](presets-apo/Gold.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.02 dB | 66 |
| 65 | [Gospel 3 HomeTheater 2026 MDMonax](presets-apo/Gospel%203%20HomeTheater%202026%20MDMonax.txt) | Name identifies this as a speaker or sound-system profile. | General / Multi-Device | 0.00 dB | 12 |
| 66 | [GrootBass MDMonax Envelope](presets-apo/GrootBass%20MDMonax%20Envelope.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 18 |
| 67 | [Guitar Kicks MdMonax](presets-apo/Guitar%20Kicks%20MdMonax.txt) | Name suggests emphasis on punch or kick impact. | General / Multi-Device | 0.00 dB | 31 |
| 68 | [Harmony](presets-apo/Harmony.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 69 | [HD Ears (Monax)](presets-apo/HD%20Ears%20%28Monax%29.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 17 |
| 70 | [HD General Monax](presets-apo/HD%20General%20Monax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 17 |
| 71 | [HD Headphones 50hz MDMonax](presets-apo/HD%20Headphones%2050hz%20MDMonax.txt) | Name identifies a headphone or earphone-oriented profile. | Over-Ear Headphones | 0.00 dB | 31 |
| 72 | [HD Headphones V2 Deep 50hz MDMonax](presets-apo/HD%20Headphones%20V2%20Deep%2050hz%20MDMonax.txt) | Name identifies a headphone or earphone-oriented profile. | Over-Ear Headphones | 0.00 dB | 31 |
| 73 | [Headphones Clear Monax](presets-apo/Headphones%20Clear%20Monax.txt) | Name suggests emphasis on clarity or vocals. | Over-Ear Headphones | 0.00 dB | 52 |
| 74 | [Headphones FUNKI-Nude MDMonax](presets-apo/Headphones%20FUNKI-Nude%20MDMonax.txt) | Name identifies a headphone or earphone-oriented profile. | Over-Ear Headphones | 0.00 dB | 17 |
| 75 | [Hi res 2 Earphones Monax](presets-apo/Hi%20res%202%20Earphones%20Monax.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 18 |
| 76 | [Hi res TWS 4 Md Monax](presets-apo/Hi%20res%20TWS%204%20Md%20Monax.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 16 |
| 77 | [HIFIMAN TWS600](presets-apo/HIFIMAN%20TWS600.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 12 |
| 78 | [hi-res stereo headphone](presets-apo/hi-res%20stereo%20headphone.txt) | Name identifies a headphone or earphone-oriented profile. | Over-Ear Headphones | 0.00 dB | 13 |
| 79 | [Home Theater 2026 Bass tone 35hz Monax](presets-apo/Home%20Theater%202026%20Bass%20tone%2035hz%20Monax.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 23 |
| 80 | [House El nino 50hz MDMONAX](presets-apo/House%20El%20nino%2050hz%20MDMONAX.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 45 |
| 81 | [Icepower 1 Mdmonax](presets-apo/Icepower%201%20Mdmonax.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 |
| 82 | [Icepower 2 Mdmonax](presets-apo/Icepower%202%20Mdmonax.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 |
| 83 | [Indoor Clear MDMonax](presets-apo/Indoor%20Clear%20MDMonax.txt) | Name suggests emphasis on clarity or vocals. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 43 |
| 84 | [Jazz punchyMDMonax 106hz](presets-apo/Jazz%20punchyMDMonax%20106hz.txt) | Name suggests emphasis on punch or kick impact. | General / Multi-Device | 0.00 dB | 5 |
| 85 | [July 2026 Envelope Only MDMonax](presets-apo/July%202026%20Envelope%20Only%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 16 |
| 86 | [June MDMonax DeepWaves 50hz Q1.00](presets-apo/June%20MDMonax%20DeepWaves%2050hz%20Q1.00.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 12 |
| 87 | [Lenovo GM2 Pro - Balanced Bass Clear Highs](presets-apo/Lenovo%20GM2%20Pro%20-%20Balanced%20Bass%20Clear%20Highs.txt) | Name suggests emphasis on bass or low frequencies and clarity or vocals and treble or higher frequencies. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 7 |
| 88 | [M19 earphones B](presets-apo/M19%20earphones%20B.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 21 |
| 89 | [Marley](presets-apo/Marley.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 12 |
| 90 | [Massive Bass Targa (Monax)](presets-apo/Massive%20Bass%20Targa%20%28Monax%29.txt) | Name suggests emphasis on bass or low frequencies. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 43 |
| 91 | [Master](presets-apo/Master.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 |
| 92 | [MDMonax Outdoor](presets-apo/MDMonax%20Outdoor.txt) | Name identifies this as a speaker or sound-system profile. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 34 |
| 93 | [MiD BAss MDMONAX comp400hz](presets-apo/MiD%20BAss%20MDMONAX%20comp400hz.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 33 |
| 94 | [Monax 45 hz](presets-apo/Monax%2045%20hz.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.04 dB | 30 |
| 95 | [Monax Crossover Bass(L)](presets-apo/Monax%20Crossover%20Bass%28L%29.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 14 |
| 96 | [Monax Crossover Bass(R)](presets-apo/Monax%20Crossover%20Bass%28R%29.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 14 |
| 97 | [Monax full bass](presets-apo/Monax%20full%20bass.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 15 |
| 98 | [Monax sub2](presets-apo/Monax%20sub2.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 15 |
| 99 | [Monday Blues 2 Kick MDMonax](presets-apo/Monday%20Blues%202%20Kick%20MDMonax.txt) | Name suggests emphasis on punch or kick impact. | General / Multi-Device | 0.00 dB | 25 |
| 100 | [Monday Blues deep v2 MDMonax](presets-apo/Monday%20Blues%20deep%20v2%20MDMonax.txt) | Name identifies a music-style listening profile. | General / Multi-Device | 0.00 dB | 28 |
| 101 | [Moondrop Chu2](presets-apo/Moondrop%20Chu2.txt) | Name identifies a device-specific tuning; use it as a starting point for the named model. | Earbuds / TWS / IEMs | -1.55 dB | 12 |
| 102 | [Movie Bass Mod Slow MDMona](presets-apo/Movie%20Bass%20Mod%20Slow%20MDMona.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 15 |
| 103 | [My Edifier TWS6](presets-apo/My%20Edifier%20TWS6.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 8 |
| 104 | [Neo7SE Speaker - Less Bass More Depth](presets-apo/Neo7SE%20Speaker%20-%20Less%20Bass%20More%20Depth.txt) | Name suggests emphasis on reduced bass. | Small / Portable Speakers | 0.00 dB | 8 |
| 105 | [Noise Cancel Guitar](presets-apo/Noise%20Cancel%20Guitar.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 39 |
| 106 | [November Cascade MDMonax](presets-apo/November%20Cascade%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 17 |
| 107 | [Num of Bands 28 First frq 30hz MDMonax](presets-apo/Num%20of%20Bands%2028%20First%20frq%2030hz%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 30 |
| 108 | [Old Skul SuB Monax 2026](presets-apo/Old%20Skul%20SuB%20Monax%202026.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 17 |
| 109 | [Outdoor MdMonax](presets-apo/Outdoor%20MdMonax.txt) | Name identifies this as a speaker or sound-system profile. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 25 |
| 110 | [Outdoor Midrange MdMonax](presets-apo/Outdoor%20Midrange%20MdMonax.txt) | Name suggests emphasis on clarity or vocals. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 15 |
| 111 | [P.M.P.O Speakers Clarity 40hz MDMonax](presets-apo/P.M.P.O%20Speakers%20Clarity%2040hz%20MDMonax.txt) | Name suggests emphasis on clarity or vocals. | Outdoor PA / DJ / Large Speakers | 0.00 dB | 45 |
| 112 | [Parametric](presets-apo/Parametric.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 11 |
| 113 | [Party 12 Stereo Trebble 7858khzQMax BassTone30hz Q0.55 MdMonax](presets-apo/Party%2012%20Stereo%20Trebble%207858khzQMax%20BassTone30hz%20Q0.55%20MdMonax.txt) | Name suggests emphasis on bass or low frequencies and treble or higher frequencies. | General / Multi-Device | 0.00 dB | 9 |
| 114 | [Party Stereo 2 Bass Tone 48hz Q1.30 Compressor 320hz Monax](presets-apo/Party%20Stereo%202%20Bass%20Tone%2048hz%20Q1.30%20Compressor%20320hz%20Monax.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 20 |
| 115 | [Party Stereo Bass Tone 55hz Q1.50 Compressor 450hz Monax](presets-apo/Party%20Stereo%20Bass%20Tone%2055hz%20Q1.50%20Compressor%20450hz%20Monax.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 22 |
| 116 | [Phone speaker with clarity MDMonax](presets-apo/Phone%20speaker%20with%20clarity%20MDMonax.txt) | Name suggests emphasis on clarity or vocals. | Small / Portable Speakers | 0.00 dB | 20 |
| 117 | [Pioneer Home theather MDMonax](presets-apo/Pioneer%20Home%20theather%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | Home Theater / Soundbar | 0.00 dB | 17 |
| 118 | [PistonBuds Pro Q30 - Warm Bass](presets-apo/PistonBuds%20Pro%20Q30%20-%20Warm%20Bass.txt) | Name suggests emphasis on bass or low frequencies. | Earbuds / TWS / IEMs | 0.00 dB | 6 |
| 119 | [Platinum](presets-apo/Platinum.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 |
| 120 | [PoPiano MDMonax..Envelope 36hz](presets-apo/PoPiano%20MDMonax..Envelope%2036hz.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 10 |
| 121 | [PoPiano2 Heavy MDMonax..Envelope 36hz](presets-apo/PoPiano2%20Heavy%20MDMonax..Envelope%2036hz.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 10 |
| 122 | [PowerBass Room](presets-apo/PowerBass%20Room.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 47 |
| 123 | [Presence (2)](presets-apo/Presence%20%282%29.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 |
| 124 | [Presence](presets-apo/Presence.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 |
| 125 | [Punchy Bass vijay](presets-apo/Punchy%20Bass%20vijay.txt) | Name suggests emphasis on bass or low frequencies and punch or kick impact. | General / Multi-Device | 0.00 dB | 10 |
| 126 | [Punchy stereo MdMonax](presets-apo/Punchy%20stereo%20MdMonax.txt) | Name suggests emphasis on punch or kick impact. | General / Multi-Device | 0.00 dB | 8 |
| 127 | [Punchy2 Small spk MDMonax 36hz](presets-apo/Punchy2%20Small%20spk%20MDMonax%2036hz.txt) | Name suggests emphasis on punch or kick impact. | Small / Portable Speakers | 0.00 dB | 13 |
| 128 | [Reference X](presets-apo/Reference%20X.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 |
| 129 | [Reggae MD Monax](presets-apo/Reggae%20MD%20Monax.txt) | Name identifies a music-style listening profile. | General / Multi-Device | 0.00 dB | 27 |
| 130 | [Reggae Monax](presets-apo/Reggae%20Monax.txt) | Name identifies a music-style listening profile. | General / Multi-Device | 0.03 dB | 30 |
| 131 | [Riddim 2026 MDMonax 40hz](presets-apo/Riddim%202026%20MDMonax%2040hz.txt) | Name identifies a music-style listening profile. | General / Multi-Device | 0.00 dB | 27 |
| 132 | [Rnb2026MDMonax Hometheathers](presets-apo/Rnb2026MDMonax%20Hometheathers.txt) | Name identifies a music-style listening profile. | Home Theater / Soundbar | 0.00 dB | 32 |
| 133 | [Signature](presets-apo/Signature.txt) | General EQ profile; the name does not specify a particular sound target. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 |
| 134 | [Slow Mid Sony All stereo](presets-apo/Slow%20Mid%20Sony%20All%20stereo.txt) | Name suggests emphasis on bass or low frequencies. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 37 |
| 135 | [SlowBass with Trebble MDMonax](presets-apo/SlowBass%20with%20Trebble%20MDMonax.txt) | Name suggests emphasis on bass or low frequencies and treble or higher frequencies. | General / Multi-Device | 0.00 dB | 21 |
| 136 | [Small Speakers Clarity Punchy June Stereo Envelope 50hzQ1 MdMonax](presets-apo/Small%20Speakers%20Clarity%20Punchy%20June%20Stereo%20Envelope%2050hzQ1%20MdMonax.txt) | Name suggests emphasis on punch or kick impact and clarity or vocals. | Small / Portable Speakers | 0.00 dB | 9 |
| 137 | [SonyX Monax 65hz Tone 45hzDelay(69)](presets-apo/SonyX%20Monax%2065hz%20Tone%2045hzDelay%2869%29.txt) | Name identifies a device-specific tuning; use it as a starting point for the named model. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 24 |
| 138 | [SoundBar 102hz Q0.80 Cc MDMonax](presets-apo/SoundBar%20102hz%20Q0.80%20Cc%20MDMonax.txt) | Name identifies this as a speaker or sound-system profile. | Home Theater / Soundbar | 0.00 dB | 10 |
| 139 | [Soundbar Monax (Envelope)](presets-apo/Soundbar%20Monax%20%28Envelope%29.txt) | Name identifies this as a speaker or sound-system profile. | Home Theater / Soundbar | 0.00 dB | 38 |
| 140 | [SoundCloud JBL go 4](presets-apo/SoundCloud%20JBL%20go%204.txt) | Name identifies a device-specific tuning; use it as a starting point for the named model. | Small / Portable Speakers | -8.48 dB | 26 |
| 141 | [standar iso226](presets-apo/standar%20iso226.txt) | Name identifies this as an ISO 226 equal-loudness profile. | General / Multi-Device | 0.00 dB | 12 |
| 142 | [stereo standart iso 226](presets-apo/stereo%20standart%20iso%20226.txt) | Name identifies this as an ISO 226 equal-loudness profile. | General / Multi-Device | 0.00 dB | 12 |
| 143 | [Strike](presets-apo/Strike.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 144 | [Targa 15 Monamodi Monax 2026 Carbass](presets-apo/Targa%2015%20Monamodi%20Monax%202026%20Carbass.txt) | Name suggests emphasis on bass or low frequencies. | Car Audio / Subwoofer | 0.02 dB | 33 |
| 145 | [Tempest home Bass Tone 30hz Q 0.50 MDMonax](presets-apo/Tempest%20home%20Bass%20Tone%2030hz%20Q%200.50%20MDMonax.txt) | Name suggests emphasis on bass or low frequencies. | General / Multi-Device | 0.00 dB | 10 |
| 146 | [Titan](presets-apo/Titan.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 66 |
| 147 | [TWS 2 MdMonax](presets-apo/TWS%202%20MdMonax.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 31 |
| 148 | [TWS Earphones 2 MDMONAX](presets-apo/TWS%20Earphones%202%20MDMONAX.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 10 |
| 149 | [TWs Earphones MDMonax](presets-apo/TWs%20Earphones%20MDMonax.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 9 |
| 150 | [Tws Midnight Monax](presets-apo/Tws%20Midnight%20Monax.txt) | Name identifies a headphone or earphone-oriented profile. | Earbuds / TWS / IEMs | 0.00 dB | 8 |
| 151 | [V8 2 MDMonax](presets-apo/V8%202%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 14 |
| 152 | [V8 3 MDMonax](presets-apo/V8%203%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 14 |
| 153 | [V8 latest MDMonax](presets-apo/V8%20latest%20MDMonax.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 13 |
| 154 | [ViveX ultimate](presets-apo/ViveX%20ultimate.txt) | General EQ profile; the name does not specify a particular sound target. | General / Multi-Device | 0.00 dB | 13 |
| 155 | [Vivo X200 Ultra](presets-apo/Vivo%20X200%20Ultra.txt) | Name identifies a device-specific tuning; use it as a starting point for the named model. | General / Multi-Device | 0.00 dB | 12 |
| 156 | [Vocal](presets-apo/Vocal.txt) | Name suggests emphasis on clarity or vocals. | Headphones / Earbuds (All-Rounder) | 0.00 dB | 66 |

## HeSuVi Virtual Surround HRIRs (169)

> Binaural profiles are for headphones and earbuds only. Turn Virtual Surround off for speakers.

| # | Profile | Description | Recommended Device | Size |
| :--- | :--- | :--- | :--- | :--- |
| 1 | [atmos](hrir-surround/atmos.wav) | Dolby-labeled binaural surround profile. | Headphones / Earbuds (Dolby) | 281.7 KB |
| 2 | [atmos-](hrir-surround/atmos-.wav) | Dolby-labeled binaural surround profile. | Headphones / Earbuds (Dolby) | 3.5 KB |
| 3 | [atmos_L](hrir-surround/atmos_L.wav) | Dolby-labeled binaural surround profile. Left-channel file. | Headphones / Earbuds (Dolby) | 160.9 KB |
| 4 | [atmos-_L](hrir-surround/atmos-_L.wav) | Dolby-labeled binaural surround profile. Left-channel file. | Headphones / Earbuds (Dolby) | 4 KB |
| 5 | [atmos_R](hrir-surround/atmos_R.wav) | Dolby-labeled binaural surround profile. Right-channel file. | Headphones / Earbuds (Dolby) | 160.9 KB |
| 6 | [atmos-_R](hrir-surround/atmos-_R.wav) | Dolby-labeled binaural surround profile. Right-channel file. | Headphones / Earbuds (Dolby) | 4 KB |
| 7 | [cmss_ent](hrir-surround/cmss_ent.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB |
| 8 | [cmss_ent-](hrir-surround/cmss_ent-.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB |
| 9 | [cmss_ent_L](hrir-surround/cmss_ent_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 10 | [cmss_ent-_L](hrir-surround/cmss_ent-_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 5.3 KB |
| 11 | [cmss_ent_R](hrir-surround/cmss_ent_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 12 | [cmss_ent-_R](hrir-surround/cmss_ent-_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 5.3 KB |
| 13 | [cmss_game](hrir-surround/cmss_game.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB |
| 14 | [cmss_game-](hrir-surround/cmss_game-.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 4.6 KB |
| 15 | [cmss_game_L](hrir-surround/cmss_game_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 16 | [cmss_game-_L](hrir-surround/cmss_game-_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 5.2 KB |
| 17 | [cmss_game_R](hrir-surround/cmss_game_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 18 | [cmss_game-_R](hrir-surround/cmss_game-_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 5.2 KB |
| 19 | [cmss_rx](hrir-surround/cmss_rx.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 2.5 KB |
| 20 | [cmss_rx_L](hrir-surround/cmss_rx_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.8 KB |
| 21 | [cmss_rx_R](hrir-surround/cmss_rx_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.8 KB |
| 22 | [cmss_rx+](hrir-surround/cmss_rx%2B.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 787.7 KB |
| 23 | [cmss_rx+_L](hrir-surround/cmss_rx%2B_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 450.1 KB |
| 24 | [cmss_rx+_R](hrir-surround/cmss_rx%2B_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 450.1 KB |
| 25 | [dh-](hrir-surround/dh-.wav) | Dolby-labeled binaural surround profile. | Headphones / Earbuds (Dolby) | 3.7 KB |
| 26 | [dh-_L](hrir-surround/dh-_L.wav) | Dolby-labeled binaural surround profile. Left-channel file. | Headphones / Earbuds (Dolby) | 4.1 KB |
| 27 | [dh-_R](hrir-surround/dh-_R.wav) | Dolby-labeled binaural surround profile. Right-channel file. | Headphones / Earbuds (Dolby) | 4.1 KB |
| 28 | [dh+](hrir-surround/dh%2B.wav) | Dolby-labeled binaural surround profile. | Headphones / Earbuds (Dolby) | 385.5 KB |
| 29 | [dh+_L](hrir-surround/dh%2B_L.wav) | Dolby-labeled binaural surround profile. Left-channel file. | Headphones / Earbuds (Dolby) | 220.2 KB |
| 30 | [dh+_R](hrir-surround/dh%2B_R.wav) | Dolby-labeled binaural surround profile. Right-channel file. | Headphones / Earbuds (Dolby) | 220.2 KB |
| 31 | [dh++](hrir-surround/dh%2B%2B.wav) | Dolby-labeled binaural surround profile. | Headphones / Earbuds (Dolby) | 393.9 KB |
| 32 | [dh++_L](hrir-surround/dh%2B%2B_L.wav) | Dolby-labeled binaural surround profile. Left-channel file. | Headphones / Earbuds (Dolby) | 225.1 KB |
| 33 | [dh++_R](hrir-surround/dh%2B%2B_R.wav) | Dolby-labeled binaural surround profile. Right-channel file. | Headphones / Earbuds (Dolby) | 225.1 KB |
| 34 | [dht](hrir-surround/dht.wav) | Dolby-labeled binaural surround profile. | Headphones / Earbuds (Dolby) | 472.7 KB |
| 35 | [dht-](hrir-surround/dht-.wav) | Dolby-labeled binaural surround profile. | Headphones / Earbuds (Dolby) | 21.2 KB |
| 36 | [dht_L](hrir-surround/dht_L.wav) | Dolby-labeled binaural surround profile. Left-channel file. | Headphones / Earbuds (Dolby) | 270.1 KB |
| 37 | [dht-_L](hrir-surround/dht-_L.wav) | Dolby-labeled binaural surround profile. Left-channel file. | Headphones / Earbuds (Dolby) | 12.1 KB |
| 38 | [dht_R](hrir-surround/dht_R.wav) | Dolby-labeled binaural surround profile. Right-channel file. | Headphones / Earbuds (Dolby) | 270.1 KB |
| 39 | [dht-_R](hrir-surround/dht-_R.wav) | Dolby-labeled binaural surround profile. Right-channel file. | Headphones / Earbuds (Dolby) | 12.1 KB |
| 40 | [dirac_delta_44_left](hrir-surround/dirac_delta_44_left.wav) | Binaural surround HRIR profile named 'dirac delta 44'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 88 KB |
| 41 | [dirac_delta_44_right](hrir-surround/dirac_delta_44_right.wav) | Binaural surround HRIR profile named 'dirac delta 44'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 88 KB |
| 42 | [dirac_delta_48_left](hrir-surround/dirac_delta_48_left.wav) | Binaural surround HRIR profile named 'dirac delta 48'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 96 KB |
| 43 | [dirac_delta_48_right](hrir-surround/dirac_delta_48_right.wav) | Binaural surround HRIR profile named 'dirac delta 48'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 96 KB |
| 44 | [ds3d](hrir-surround/ds3d.wav) | Binaural surround HRIR profile named 'ds3d'. | Headphones / Earbuds Only (Binaural) | 7.3 KB |
| 45 | [ds3d_L](hrir-surround/ds3d_L.wav) | Binaural surround HRIR profile named 'ds3d'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 8.3 KB |
| 46 | [ds3d_R](hrir-surround/ds3d_R.wav) | Binaural surround HRIR profile named 'ds3d'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 8.3 KB |
| 47 | [ds3d+](hrir-surround/ds3d%2B.wav) | Binaural surround HRIR profile named 'ds3d+'. | Headphones / Earbuds Only (Binaural) | 163.3 KB |
| 48 | [ds3d+_L](hrir-surround/ds3d%2B_L.wav) | Binaural surround HRIR profile named 'ds3d+'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 93.3 KB |
| 49 | [ds3d+_R](hrir-surround/ds3d%2B_R.wav) | Binaural surround HRIR profile named 'ds3d+'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 93.3 KB |
| 50 | [ds3d++](hrir-surround/ds3d%2B%2B.wav) | Binaural surround HRIR profile named 'ds3d++'. | Headphones / Earbuds Only (Binaural) | 656.4 KB |
| 51 | [ds3d++_L](hrir-surround/ds3d%2B%2B_L.wav) | Binaural surround HRIR profile named 'ds3d++'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 375.1 KB |
| 52 | [ds3d++_R](hrir-surround/ds3d%2B%2B_R.wav) | Binaural surround HRIR profile named 'ds3d++'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 375.1 KB |
| 53 | [ds3d+++](hrir-surround/ds3d%2B%2B%2B.wav) | Binaural surround HRIR profile named 'ds3d+++'. | Headphones / Earbuds Only (Binaural) | 918.9 KB |
| 54 | [ds3d+++_L](hrir-surround/ds3d%2B%2B%2B_L.wav) | Binaural surround HRIR profile named 'ds3d+++'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 525.1 KB |
| 55 | [ds3d+++_R](hrir-surround/ds3d%2B%2B%2B_R.wav) | Binaural surround HRIR profile named 'ds3d+++'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 525.1 KB |
| 56 | [dtshx](hrir-surround/dtshx.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 65.8 KB |
| 57 | [dtshx-](hrir-surround/dtshx-.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 4.2 KB |
| 58 | [dtshx_L](hrir-surround/dtshx_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 37.6 KB |
| 59 | [dtshx-_L](hrir-surround/dtshx-_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB |
| 60 | [dtshx_R](hrir-surround/dtshx_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 37.6 KB |
| 61 | [dtshx-_R](hrir-surround/dtshx-_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 4.7 KB |
| 62 | [dvs](hrir-surround/dvs.wav) | Binaural surround HRIR profile named 'dvs'. | Headphones / Earbuds Only (Binaural) | 459.6 KB |
| 63 | [dvs_L](hrir-surround/dvs_L.wav) | Binaural surround HRIR profile named 'dvs'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 262.6 KB |
| 64 | [dvs_R](hrir-surround/dvs_R.wav) | Binaural surround HRIR profile named 'dvs'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 262.6 KB |
| 65 | [dvs+](hrir-surround/dvs%2B.wav) | Binaural surround HRIR profile named 'dvs+'. | Headphones / Earbuds Only (Binaural) | 399.2 KB |
| 66 | [dvs+_L](hrir-surround/dvs%2B_L.wav) | Binaural surround HRIR profile named 'dvs+'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 228.1 KB |
| 67 | [dvs+_R](hrir-surround/dvs%2B_R.wav) | Binaural surround HRIR profile named 'dvs+'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 228.1 KB |
| 68 | [gsx](hrir-surround/gsx.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB |
| 69 | [gsx-](hrir-surround/gsx-.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 3.4 KB |
| 70 | [gsx_L](hrir-surround/gsx_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 71 | [gsx-_L](hrir-surround/gsx-_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 3.9 KB |
| 72 | [gsx_R](hrir-surround/gsx_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 73 | [gsx-_R](hrir-surround/gsx-_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 3.9 KB |
| 74 | [gsx+](hrir-surround/gsx%2B.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 472.7 KB |
| 75 | [gsx+_L](hrir-surround/gsx%2B_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 270.1 KB |
| 76 | [gsx+_R](hrir-surround/gsx%2B_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 270.1 KB |
| 77 | [gsx++](hrir-surround/gsx%2B%2B.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 603.9 KB |
| 78 | [gsx++_L](hrir-surround/gsx%2B%2B_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 345.1 KB |
| 79 | [gsx++_R](hrir-surround/gsx%2B%2B_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 345.1 KB |
| 80 | [hear](hrir-surround/hear.wav) | Binaural surround HRIR profile named 'hear'. | Headphones / Earbuds Only (Binaural) | 2.8 KB |
| 81 | [hear_L](hrir-surround/hear_L.wav) | Binaural surround HRIR profile named 'hear'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 3.1 KB |
| 82 | [hear_R](hrir-surround/hear_R.wav) | Binaural surround HRIR profile named 'hear'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 3.1 KB |
| 83 | [nahimic](hrir-surround/nahimic.wav) | Binaural surround HRIR profile named 'nahimic'. | Headphones / Earbuds Only (Binaural) | 787.7 KB |
| 84 | [nahimic-](hrir-surround/nahimic-.wav) | Binaural surround HRIR profile named 'nahimic-'. | Headphones / Earbuds Only (Binaural) | 13.9 KB |
| 85 | [nahimic_L](hrir-surround/nahimic_L.wav) | Binaural surround HRIR profile named 'nahimic'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 450.1 KB |
| 86 | [nahimic-_L](hrir-surround/nahimic-_L.wav) | Binaural surround HRIR profile named 'nahimic-'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 15.8 KB |
| 87 | [nahimic_R](hrir-surround/nahimic_R.wav) | Binaural surround HRIR profile named 'nahimic'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 450.1 KB |
| 88 | [nahimic-_R](hrir-surround/nahimic-_R.wav) | Binaural surround HRIR profile named 'nahimic-'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 15.8 KB |
| 89 | [none](hrir-surround/none.wav) | No-surround HRIR option, based on the profile name. | Headphones / Earbuds Only (Binaural) | 0.2 KB |
| 90 | [none_L](hrir-surround/none_L.wav) | No-surround HRIR option, based on the profile name. Left-channel file. | Headphones / Earbuds Only (Binaural) | 0.1 KB |
| 91 | [none_R](hrir-surround/none_R.wav) | No-surround HRIR option, based on the profile name. Right-channel file. | Headphones / Earbuds Only (Binaural) | 0.1 KB |
| 92 | [oal_cia0](hrir-surround/oal_cia0.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB |
| 93 | [oal_cia0_L](hrir-surround/oal_cia0_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 94 | [oal_cia0_R](hrir-surround/oal_cia0_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 95 | [oal_cia1](hrir-surround/oal_cia1.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 1.7 KB |
| 96 | [oal_cia1_L](hrir-surround/oal_cia1_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB |
| 97 | [oal_cia1_R](hrir-surround/oal_cia1_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB |
| 98 | [oal_dflt](hrir-surround/oal_dflt.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB |
| 99 | [oal_dflt_L](hrir-surround/oal_dflt_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 100 | [oal_dflt_R](hrir-surround/oal_dflt_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 101 | [oal+](hrir-surround/oal%2B.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 393.9 KB |
| 102 | [oal+_L](hrir-surround/oal%2B_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB |
| 103 | [oal+_R](hrir-surround/oal%2B_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB |
| 104 | [oal++](hrir-surround/oal%2B%2B.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 393.9 KB |
| 105 | [oal++_L](hrir-surround/oal%2B%2B_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB |
| 106 | [oal++_R](hrir-surround/oal%2B%2B_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 225.1 KB |
| 107 | [oal+++](hrir-surround/oal%2B%2B%2B.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 656.4 KB |
| 108 | [oal+++_L](hrir-surround/oal%2B%2B%2B_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 375.1 KB |
| 109 | [oal+++_R](hrir-surround/oal%2B%2B%2B_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 375.1 KB |
| 110 | [ooyh0](hrir-surround/ooyh0.wav) | Binaural surround HRIR profile named 'ooyh0'. | Headphones / Earbuds Only (Binaural) | 590.8 KB |
| 111 | [ooyh0_L](hrir-surround/ooyh0_L.wav) | Binaural surround HRIR profile named 'ooyh0'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 337.6 KB |
| 112 | [ooyh0_R](hrir-surround/ooyh0_R.wav) | Binaural surround HRIR profile named 'ooyh0'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 337.6 KB |
| 113 | [ooyh1](hrir-surround/ooyh1.wav) | Binaural surround HRIR profile named 'ooyh1'. | Headphones / Earbuds Only (Binaural) | 381 KB |
| 114 | [ooyh1_L](hrir-surround/ooyh1_L.wav) | Binaural surround HRIR profile named 'ooyh1'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 217.7 KB |
| 115 | [ooyh1_R](hrir-surround/ooyh1_R.wav) | Binaural surround HRIR profile named 'ooyh1'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 217.7 KB |
| 116 | [razer](hrir-surround/razer.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 9.1 KB |
| 117 | [razer_fix](hrir-surround/razer_fix.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 27 KB |
| 118 | [razer_fix_L](hrir-surround/razer_fix_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 30.8 KB |
| 119 | [razer_fix_R](hrir-surround/razer_fix_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 30.8 KB |
| 120 | [razer_L](hrir-surround/razer_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 10.3 KB |
| 121 | [razer_R](hrir-surround/razer_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 10.3 KB |
| 122 | [sbx100](hrir-surround/sbx100.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB |
| 123 | [sbx100-](hrir-surround/sbx100-.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB |
| 124 | [sbx100_L](hrir-surround/sbx100_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 125 | [sbx100-_L](hrir-surround/sbx100-_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 126 | [sbx100_R](hrir-surround/sbx100_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 127 | [sbx100-_R](hrir-surround/sbx100-_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 128 | [sbx33](hrir-surround/sbx33.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB |
| 129 | [sbx33-](hrir-surround/sbx33-.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB |
| 130 | [sbx33_L](hrir-surround/sbx33_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 131 | [sbx33-_L](hrir-surround/sbx33-_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 132 | [sbx33_R](hrir-surround/sbx33_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 133 | [sbx33-_R](hrir-surround/sbx33-_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 134 | [sbx67](hrir-surround/sbx67.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 262.7 KB |
| 135 | [sbx67-](hrir-surround/sbx67-.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 1.9 KB |
| 136 | [sbx67_L](hrir-surround/sbx67_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 137 | [sbx67-_L](hrir-surround/sbx67-_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 138 | [sbx67_R](hrir-surround/sbx67_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 150.1 KB |
| 139 | [sbx67-_R](hrir-surround/sbx67-_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 2.1 KB |
| 140 | [sonic](hrir-surround/sonic.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 280.7 KB |
| 141 | [sonic-](hrir-surround/sonic-.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 8.6 KB |
| 142 | [sonic_L](hrir-surround/sonic_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 160.4 KB |
| 143 | [sonic-_L](hrir-surround/sonic-_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 9.8 KB |
| 144 | [sonic_R](hrir-surround/sonic_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 160.4 KB |
| 145 | [sonic-_R](hrir-surround/sonic-_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 9.8 KB |
| 146 | [sonic+](hrir-surround/sonic%2B.wav) | Spatial-audio profile identified by the file name. | Headphones / Earbuds (3D Gaming & Spatial) | 630.2 KB |
| 147 | [sonic+_L](hrir-surround/sonic%2B_L.wav) | Spatial-audio profile identified by the file name. Left-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 360.1 KB |
| 148 | [sonic+_R](hrir-surround/sonic%2B_R.wav) | Spatial-audio profile identified by the file name. Right-channel file. | Headphones / Earbuds (3D Gaming & Spatial) | 360.1 KB |
| 149 | [ssc_dub](hrir-surround/ssc_dub.wav) | Binaural surround HRIR profile named 'ssc dub'. | Headphones / Earbuds Only (Binaural) | 267.1 KB |
| 150 | [ssc_dub_L](hrir-surround/ssc_dub_L.wav) | Binaural surround HRIR profile named 'ssc dub'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 152.6 KB |
| 151 | [ssc_dub_R](hrir-surround/ssc_dub_R.wav) | Binaural surround HRIR profile named 'ssc dub'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 152.6 KB |
| 152 | [ssc_ny](hrir-surround/ssc_ny.wav) | Binaural surround HRIR profile named 'ssc ny'. | Headphones / Earbuds Only (Binaural) | 144.6 KB |
| 153 | [ssc_ny_L](hrir-surround/ssc_ny_L.wav) | Binaural surround HRIR profile named 'ssc ny'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 82.6 KB |
| 154 | [ssc_ny_R](hrir-surround/ssc_ny_R.wav) | Binaural surround HRIR profile named 'ssc ny'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 82.6 KB |
| 155 | [ssc_ny+](hrir-surround/ssc_ny%2B.wav) | Binaural surround HRIR profile named 'ssc ny+'. | Headphones / Earbuds Only (Binaural) | 486 KB |
| 156 | [ssc_ny+_L](hrir-surround/ssc_ny%2B_L.wav) | Binaural surround HRIR profile named 'ssc ny+'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 277.7 KB |
| 157 | [ssc_ny+_R](hrir-surround/ssc_ny%2B_R.wav) | Binaural surround HRIR profile named 'ssc ny+'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 277.7 KB |
| 158 | [ssc_syd](hrir-surround/ssc_syd.wav) | Binaural surround HRIR profile named 'ssc syd'. | Headphones / Earbuds Only (Binaural) | 412.3 KB |
| 159 | [ssc_syd_L](hrir-surround/ssc_syd_L.wav) | Binaural surround HRIR profile named 'ssc syd'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 235.6 KB |
| 160 | [ssc_syd_R](hrir-surround/ssc_syd_R.wav) | Binaural surround HRIR profile named 'ssc syd'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 235.6 KB |
| 161 | [ssc_syd+](hrir-surround/ssc_syd%2B.wav) | Binaural surround HRIR profile named 'ssc syd+'. | Headphones / Earbuds Only (Binaural) | 897.9 KB |
| 162 | [ssc_syd+_L](hrir-surround/ssc_syd%2B_L.wav) | Binaural surround HRIR profile named 'ssc syd+'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 513.1 KB |
| 163 | [ssc_syd+_R](hrir-surround/ssc_syd%2B_R.wav) | Binaural surround HRIR profile named 'ssc syd+'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 513.1 KB |
| 164 | [waves](hrir-surround/waves.wav) | Binaural surround HRIR profile named 'waves'. | Headphones / Earbuds Only (Binaural) | 472.7 KB |
| 165 | [waves-](hrir-surround/waves-.wav) | Binaural surround HRIR profile named 'waves-'. | Headphones / Earbuds Only (Binaural) | 14.3 KB |
| 166 | [waves_L](hrir-surround/waves_L.wav) | Binaural surround HRIR profile named 'waves'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 270.1 KB |
| 167 | [waves-_L](hrir-surround/waves-_L.wav) | Binaural surround HRIR profile named 'waves-'. Left-channel file. | Headphones / Earbuds Only (Binaural) | 16.3 KB |
| 168 | [waves_R](hrir-surround/waves_R.wav) | Binaural surround HRIR profile named 'waves'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 270.1 KB |
| 169 | [waves-_R](hrir-surround/waves-_R.wav) | Binaural surround HRIR profile named 'waves-'. Right-channel file. | Headphones / Earbuds Only (Binaural) | 16.3 KB |

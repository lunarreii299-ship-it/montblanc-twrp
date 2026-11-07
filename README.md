# TWRP device tree: Samsung SM-W2014 (montblanc3gctc)

Built from the stock W2014KEUBMK2 (Android 4.3) boot.img / recovery.img.

## Facts read from your images
- Board: MSM8674 / platform msm8974, device codename montblanc3gctc, Krait 400 (armv7)
- Image header: base 0x0, kernel 0x8000, ramdisk 0x02000000, tags 0x01e00000, page size 2048
- Cmdline: console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F
- Kernel: ARM zImage, LZO payload; contains the string "hlte", so it's a Note 3 (hlte) family kernel
- dt.img: QCDT v1, 18 entries, "Samsung MONTBLANC"; both images use the identical kernel and dt
- Flash storage: eMMC on msm_sdcc.1, partition names in recovery.fstab
- Image tail: "SEANDROIDENFORCE" (Samsung footer, keep it)

## NOT verified (check before flashing)
1. Partition sizes: DONE, read from your phone (boot 11 MB, recovery 13 MB).
   RISK: kernel+dt.img are ~8.6 MB, leaving ~4.4 MB for the TWRP ramdisk. If the built
   recovery.img is over 13631488 bytes (check with ls -l), do NOT flash it; strip features first.
2. Screen: 480x800 (confirmed from specs), so TW_THEME := portrait_hdpi is correct.
3. Backlight: /sys/class/leds/lcd-backlight/brightness is referenced in the stock ramdisk, so it is likely correct.
4. Touch and flip-sensor behaviour: only testable on the phone.

## Build (GitHub Actions, no PC needed)
1. Put this folder in a GitHub repo (files at the repo root).
2. Repo > Actions > "Build TWRP for SM-W2014" > Run workflow (branch twrp-6.0; try twrp-5.1 if it fails).
3. When it finishes (1-3 hours), download the `twrp-sm-w2014` artifact.
4. Odin: AP slot = TWRP_W2014.tar.md5, "Auto Reboot" OFF. Keep stock firmware ready.
The workflow refuses to produce an image bigger than the 13 MB recovery partition.
Note: the minimal TWRP manifest only supports Android 5.1+ branches (no twrp-4.4).

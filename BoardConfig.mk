LOCAL_PATH := device/samsung/montblanc3gctc

# Platform (from stock default.prop: ro.board.platform=msm8974, ro.product.board=MSM8674)
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_INFO_FILE := $(LOCAL_PATH)/board-info.txt

# CPU (Krait 400)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true

# Kernel: prebuilt zImage (LZO) + QCDT dt.img, values read from the stock image header
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 --dt $(LOCAL_PATH)/dt.img

# Partition sizes read from the phone's /proc/partitions (1 KiB blocks):
# boot=mmcblk0p14 (11264 KB), recovery=mmcblk0p15 (13312 KB)
# Stock recovery.img is 11520272 bytes, TWRP must stay under the recovery size.
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00B00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00D00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1782579200
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28659661824
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# TWRP
# 480x800 display
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := false
# Crypto left off: the kernel+dt already use ~8.6 MB of the 13 MB recovery partition
#TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_SUPERSU := true
# Size savers (recovery partition is only 13 MB)
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
BOARD_RAMDISK_USE_LZMA := true
TW_EXCLUDE_MTP := true
TW_NO_EXFAT_FUSE := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true

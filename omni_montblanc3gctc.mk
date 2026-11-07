# TWRP device config for Samsung SM-W2014 (montblanc3gctc), MSM8974-class
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_NAME := omni_montblanc3gctc
PRODUCT_DEVICE := montblanc3gctc
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-W2014

# Prebuilt kernel + QCDT device tree taken from stock recovery.img (W2014KEUBMK2)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel:kernel \
    $(LOCAL_PATH)/dt.img:dt.img

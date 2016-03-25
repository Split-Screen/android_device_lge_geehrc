$(call inherit-product, device/lge/geehrc/geehrc.mk)

# Include PAC common configuration
include vendor/pac/config/common_full_phone.mk

# Enhanced NFC
$(call inherit-product, vendor/pac/config/nfc_enhanced.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := geehrc
PRODUCT_NAME := pac_geehrc
PRODUCT_BRAND := lge
PRODUCT_MODEL := Optimus G
PRODUCT_MANUFACTURER := LGE

# Bootanimation
PAC_BOOTANIMATION_NAME := 768

# Enable Torch
PRODUCT_PACKAGES += Torch

# Inherit TWRP configs
$(call inherit-product, device/lge/geehrc/recovery/twrp.mk)

# build.prop overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=geehrc_open_eu \
    BUILD_FINGERPRINT=lge/geehrc_open_eu/geehrc:6.0/MRA58K/2256973:user/release-keys \
    PRIVATE_BUILD_DESC="geehrc_open_eu-user 6.0 MRA58K 2256973 release-keys"

LOCAL_PATH := device/lge/geehrc/recovery

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.geehrc:recovery/root/fstab.geehrc \
    $(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

# Touch To Wake
PRODUCT_PACKAGES += \
    init.recovery.touchtowake.rc

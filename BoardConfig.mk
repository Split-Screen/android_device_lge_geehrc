#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_SPECIFIC_HEADER_PATH := device/lge/geehrc/include

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
ART_USE_OPTIMIZING_COMPILER := true

TARGET_NO_BOOTLOADER := true

# Inline kernel
TARGET_KERNEL_CONFIG := gee_defconfig
TARGET_KERNEL_SOURCE := kernel/lge/gee

BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=geehrc lpj=67677 user_debug=31 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01600000

BOARD_USES_ALSA_AUDIO:= true
BOARD_USES_LEGACY_ALSA_AUDIO:= false
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := GEEHRC
TARGET_BOOTLOADER_NAME=geehrc
TARGET_BOARD_INFO_FILE := device/lge/geehrc/board-info.txt

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/geehrc/bluetooth

# FIXME: HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"

TARGET_KERNEL_HAVE_NTFS := true

BOARD_EGL_CFG := device/lge/geehrc/egl.cfg

#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITON := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      DONT_DEXPREOPT_PREBUILTS := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true

BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1570766848 # 1498M
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6189744128 # 5.9G
BOARD_CACHEIMAGE_PARTITION_SIZE := 738197504 # 704 MByte
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Recovery
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USES_LOGD := true
TARGET_HW_DISK_ENCRYPTION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
RECOVERY_SDCARD_ON_DATA := true

TARGET_RECOVERY_FSTAB = device/lge/geehrc/recovery/fstab.geehrc

# TWRP Flags
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 175
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_JPEG := true
TW_INCLUDE_NTFS_3G := true
TW_FLASH_FROM_STORAGE := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_L_CRYPTO := true
TW_NO_SCREEN_BLANK := true
TWHAVE_SELINUX := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"

BOARD_USES_SECURE_SERVICES := true

BOARD_USES_EXTRA_THERMAL_SENSOR := true
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.geehrc

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

BOARD_SEPOLICY_DIRS += \
       device/lge/geehrc/sepolicy

BOARD_CHARGER_ENABLE_SUSPEND := true

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

HAVE_ADRENO_SOURCE:= false

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

MALLOC_IMPL := dlmalloc

BOARD_HARDWARE_CLASS := device/lge/geehrc/cmhw/

#Asserts
TARGET_OTA_ASSERT_DEVICE := gee,geeb,geehrc,e975,geehrc_4g_spr,geespr,ls970,geehrc4g,geehrc4g_spr_us,geebus,e970,e973,e971,geeb_att_us,f180,f180s,f180k,f180l

-include vendor/lge/geehrc/BoardConfigVendor.mk

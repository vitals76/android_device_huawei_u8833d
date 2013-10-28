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



-include device/huawei/u8833d/BoardConfigVendor.mk

# CPU and Platform
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_CPU_VARIANT := cortex-a5

TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a5
TARGET_ARCH_VARIANT_FPU := neon
 
TARGET_CPU_SMP := true




TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp

# Optimisations used by Qualcomm
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_SPARROW_BIONIC_OPTIMIZATION := true
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
   
BOARD_USES_QCOM_HARDWARE := true  
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DANCIENT_GL  
   

BOARD_SEPOLICY_DIRS += device/huawei/u8833d/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    file.te
    
# Kernel 
TARGET_KERNEL_SOURCE := kernel/huawei/msm8x25
TARGET_KERNEL_CONFIG := cm_msm8x25_defconfig
TARGET_BOOTLOADER_BOARD_NAME := u8833d
BOARD_KERNEL_CMDLINE := androidboot.hardware=huawei
BOARD_KERNEL_BASE := 0x00200000
BOARD_PAGE_SIZE := 2048    


TARGET_SPECIFIC_HEADER_PATH := device/huawei/u8833d/include



 # Graphics
BOARD_EGL_CFG := device/huawei/u8833d/vendor/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_OVERLAY := true
TARGET_USES_ION := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
#
#TARGET_QCOM_MEDIA_VARIANT := caf
#TARGET_NO_HW_VSYNC := false
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

BOARD_WANTS_EMMC_BOOT := true
  
  
# Video
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
#
TARGET_QCOM_MEDIA_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX -DQCOM_NO_SECURE_PLAYBACK


# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Wi-Fi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_LEGACY_NL80211_STA_EVENTS := true
WIFI_DRIVER_FW_PATH_AP := "/system/etc/fw_4330_b2.bin"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/fw_4330_b2.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/fw_4330_b2.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/fw_4330_b2.bin nvram_path=/system/etc/nvram_4330.txt"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
WIFI_EXT_MODULE_NAME := "cfg80211"

#TARGET_CUSTOM_WIFI := ../../device/huawei/u8833d/libhardware_legacy/wifi/wifi.c


# Audio
TARGET_PROVIDES_LIBAUDIO := true

# Lights
TARGET_PROVIDES_LIBLIGHTS := true
  
  # RIL
BOARD_RIL_CLASS := ../../../device/huawei/u8833d/ril/
  
  # Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/u8833d/bluetooth
#BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
USE_CAMERA_STUB := false
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB

# Dalvik
TARGET_ARCH_LOWMEM := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := u8833d
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000


# Hardware
#BOARD_HARDWARE_CLASS := device/huawei/u8833d/cmhw






# Web Rendering
ENABLE_WEBGL := true
#TARGET_FORCE_CPU_UPLOAD := true
BOARD_USE_QCOM_LLVM_CLANG_RS := true

# Recovery
TARGET_RECOVERY_INITRC := device/huawei/u8833d/recovery/init.rc
TARGET_RECOVERY_FSTAB := device/huawei/u8833d/recovery/etc/recovery.fstab
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/huawei/u8833d/recovery/recovery-keys.c
DEVICE_RESOLUTION := 480x800
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun%d/file


# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_VOLD_MAX_PARTITIONS := 19
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true


# Partitions
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p15
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p17
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_DATA_DEVICE := /dev/block/mmcblk0p18
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw


BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
 
# Partition sizes
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x1400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1058320384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1190596608
BOARD_FLASH_BLOCK_SIZE := 131072

#usr more config from build/tools/releasetools/edify_generator.py
TARGET_OTA_ASSERT_DEVICE := hwY300-0000

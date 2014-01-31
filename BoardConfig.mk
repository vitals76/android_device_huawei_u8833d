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


TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true


# CPU and Platform
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_CPU_VARIANT := cortex-a5

TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_ARCH_LOWMEM := true

TARGET_CPU_SMP := true


# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP -DQCOM_HARDWARE
TARGET_USES_ION := true
TARGET_USES_QCOM_BSP := true

BOARD_WANTS_EMMC_BOOT := true


# Compiler flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp


# SELinux
BOARD_SEPOLICY_DIRS += device/huawei/u8833d/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    file.te


# Kernel 
TARGET_KERNEL_SOURCE := kernel/huawei/huawei-kernel-3.4
#TARGET_KERNEL_CONFIG := cm_msm8x25_defconfig
TARGET_KERNEL_CONFIG := u8833_defconfig
TARGET_BOOTLOADER_BOARD_NAME := u8833d
BOARD_KERNEL_CMDLINE := androidboot.hardware=huawei androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00200000
BOARD_PAGE_SIZE := 2048


TARGET_SPECIFIC_HEADER_PATH := device/huawei/u8833d/include


# Graphics
BOARD_EGL_CFG := device/huawei/u8833d/vendor/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_DOESNT_USE_FENCE_SYNC := true

 
# Media  
TARGET_QCOM_LEGACY_MMPARSER := true
TARGET_QCOM_MEDIA_VARIANT := legacy


# Wi-Fi
BOARD_WLAN_DEVICE                := ath6kl
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_ath6kl
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_MODULE_PATH          := "/data/misc/wifi/load/ar6000.ko"
WIFI_DRIVER_MODULE_NAME          := "ar6000"
WIFI_TEST_INTERFACE              := "sta"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
BOARD_HAS_ATH_WLAN := true

KERNEL_EXTERNAL_MODULES:
	mkdir -p $(TARGET_ROOT_OUT)/wifi
	rm -rf $(TARGET_OUT_INTERMEDIATES)/ath6kl-huawei
	cp -a hardware/atheros/wifi/ath6kl-huawei $(TARGET_OUT_INTERMEDIATES)/
	$(MAKE) -C $(TARGET_OUT_INTERMEDIATES)/ath6kl-huawei/cfg80211 KERNEL_OUT=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" modules
	$(MAKE) -C $(TARGET_OUT_INTERMEDIATES)/ath6kl-huawei/ar6000 KERNEL_OUT=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" modules
	$(TARGET_OBJCOPY) --strip-unneeded $(TARGET_OUT_INTERMEDIATES)/ath6kl-huawei/cfg80211/cfg80211.ko $(TARGET_ROOT_OUT)/wifi/cfg80211.ko
	$(TARGET_OBJCOPY) --strip-unneeded $(TARGET_OUT_INTERMEDIATES)/ath6kl-huawei/ar6000/ar6000.ko $(TARGET_ROOT_OUT)/wifi/ar6000.ko

TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES

TARGET_CUSTOM_WIFI := ../../device/huawei/u8833d/libhardware_legacy/wifi/wifi.c


# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_QCOM_AUDIO_VARIANT := legacy
TARGET_PROVIDES_LIBAUDIO := true


# Lights
TARGET_PROVIDES_LIBLIGHTS := true

  
# RIL
BOARD_RIL_CLASS := ../../../device/huawei/u8833d/ril/

  
# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/u8833d/bluetooth


# Camera
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS
USE_CAMERA_STUB := true


# Dalvik
TARGET_ARCH_LOWMEM := true


# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := u8833d
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000


# Hardware
BOARD_HARDWARE_CLASS := device/huawei/u8833d/cmhw


# Web Rendering
ENABLE_WEBGL := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
TARGET_FORCE_CPU_UPLOAD := true


# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/huawei/u8833d/recovery/recovery-keys.c
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
TARGET_RECOVERY_INITRC := device/huawei/u8833d/recovery/init.rc
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_CUSTOM_GRAPHICS := ../../../device/huawei/u8833d/recovery/graphics.c
TARGET_RECOVERY_FSTAB := device/huawei/u8833d/ramdisk/fstab.huawei


# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1
BOARD_VOLD_MAX_PARTITIONS := 19
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true


# Partition sizes
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x1400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1207943168
BOARD_FLASH_BLOCK_SIZE := 131072


#use more config from build/tools/releasetools/edify_generator.py
TARGET_OTA_ASSERT_DEVICE := u8833,hwu8833,msm7x27a,msm7627a,u8833d,U8833D,u8951,u8951d

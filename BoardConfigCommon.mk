#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

COMMON_PATH := device/samsung/sm8250-common

# Architecture
TARGET_ARCH                := arm64
TARGET_ARCH_VARIANT        := armv8-2a-dotprod
TARGET_CPU_ABI             := arm64-v8a
TARGET_CPU_VARIANT         := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH                := arm
TARGET_2ND_ARCH_VARIANT        := armv8-2a
TARGET_2ND_CPU_ABI             := armeabi-v7a
TARGET_2ND_CPU_ABI2            := armeabi
TARGET_2ND_CPU_VARIANT         := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

# Audio
AUDIOSERVER_MULTILIB                           := 32
USE_CUSTOM_AUDIO_POLICY                        := 1
AUDIO_FEATURE_ENABLED_AHAL_EXT                 := false
AUDIO_FEATURE_ENABLED_DLKM                     := false
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP            := false
AUDIO_FEATURE_ENABLED_DTS_EAGLE                := false
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG              := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP            := false
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER            := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT              := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS   := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID              := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE             := true
AUDIO_FEATURE_ENABLED_SSR                      := false
BOARD_SUPPORTS_SOUND_TRIGGER                   := true
BOARD_USES_ALSA_AUDIO                          := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER         := true

# Camera
SOONG_CONFIG_NAMESPACES += samsungCameraVars
SOONG_CONFIG_samsungCameraVars += \
    needs_sec_reserved_field

SOONG_CONFIG_samsungCameraVars_needs_sec_reserved_field := true

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x400000000LL
TARGET_USES_DISPLAY_RENDER_INTENTS      := true
TARGET_USES_DRM_PP                      := true
TARGET_USES_GRALLOC1                    := true
TARGET_USES_GRALLOC4                    := true
TARGET_USES_HWC2                        := true
TARGET_USES_ION                         := true
TARGET_USES_QCOM_DISPLAY_BSP            := true
TARGET_USES_QTI_MAPPER_2_0              := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1   := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

BOARD_ROOT_EXTRA_FOLDERS += \
    carrier \
    dqmdbg \
    efs \
    omr \
    optics \
    prism \
    spu

ifeq ($(TARGET_HAS_UDFPS),true)
# FOD
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(COMMON_PATH):libudfps_extension.samsung-sm8250
TARGET_USES_FOD_ZPOS := true
endif

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE         := 0x00000000
BOARD_KERNEL_PAGESIZE     := 4096
BOARD_MKBOOTIMG_ARGS      += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE := console=null \
                        androidboot.hardware=qcom \
                        androidboot.memcg=1 \
                        lpm_levels.sleep_disabled=1 \
                        msm_rtb.filter=0x237 \
                        service_locator.enable=1 \
                        androidboot.usbcontroller=a600000.dwc3 \
                        swiotlb=2048 \
                        printk.devkmsg=on \
                        firmware_class.path=/vendor/firmware_mnt/image \
                        loop.max_part=7

BOARD_KERNEL_IMAGE_NAME      := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO  := true
TARGET_KERNEL_SOURCE         := kernel/samsung/sm8250
TARGET_KERNEL_CONFIG         := vendor/kona-sec-perf_defconfig \
                                vendor/debugfs.config

# Keymaster
TARGET_KEYMASTER_VARIANT := samsung

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE  := 2000000000
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE  := 2000000000
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1000000000
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE     := 50000000
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT        := -1
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT        := -1
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT       := -1
BOARD_ODMIMAGE_EXTFS_INODE_COUNT           := -1

BOARD_FLASH_BLOCK_SIZE        := 262144
BOARD_USES_METADATA_PARTITION := true

BOARD_BOOTIMAGE_PARTITION_SIZE     := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE    := 629145600
BOARD_DTBOIMG_PARTITION_SIZE       := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 82694144

BOARD_SUPER_PARTITION_SIZE                  := 10292822016
BOARD_SUPER_PARTITION_GROUPS                := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE           := 10292822012

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE     := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE  := ext4

TARGET_COPY_OUT_ODM     := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR  := vendor

# Platform
BOARD_USES_QCOM_HARDWARE := true
BOARD_VENDOR             := samsung
TARGET_BOARD_PLATFORM    := kona

# Prop files
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop
TARGET_ODM_PROP += $(COMMON_PATH)/odm.prop

ifneq ($(TARGET_HAS_NO_RIL),true)
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor_radio.prop
ifneq ($(TARGET_IS_TABLET),true)
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor_nfc.prop
endif
endif

# Recovery
BOARD_HAS_DOWNLOAD_MODE      := true
BOARD_INCLUDE_RECOVERY_DTBO  := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB        := $(COMMON_PATH)/recovery/root/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4   := true
TARGET_USERIMAGES_USE_F2FS   := true

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_samsung_sm8250
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# RIL
ifneq ($(TARGET_HAS_NO_RIL),true)
ENABLE_VENDOR_RIL_SERVICE := true
endif

# Security patch
VENDOR_SECURITY_PATCH := 2024-08-01

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS    += $(COMMON_PATH)/sepolicy/vendor
PRODUCT_PUBLIC_SEPOLICY_DIRS  += $(COMMON_PATH)/sepolicy/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private

# Verified Boot
BOARD_AVB_ENABLE                           := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS           += --flags 3
BOARD_AVB_ROLLBACK_INDEX                   := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH                := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM               := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX          := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(COMMON_PATH)/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE := hardware/qcom-caf/common/compatibility_matrix.xml

ifneq ($(TARGET_HAS_NO_RIL),true)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest_radio.xml
endif

ifeq ($(TARGET_HAS_BCM_WIFI),true)
## Broadcom Wi-Fi
BOARD_WLAN_BCMDHD_SAE             := true
BOARD_WLAN_DEVICE                 := bcmdhd
WIFI_AVOID_IFACE_RESET_MAC_CHANGE := true
WIFI_FEATURE_HOSTAPD_11AX         := true
endif

ifeq ($(TARGET_HAS_QCACLD_WIFI),true)
# Qualcomm Wi-Fi
BOARD_WLAN_DEVICE                := qcwcn
CONFIG_IEEE80211AX               := true
WIFI_DRIVER_DEFAULT              := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM     := "/dev/wlan"
WIFI_DRIVER_STATE_OFF            := "OFF"
WIFI_DRIVER_STATE_ON             := "ON"
endif

# Common Wi-Fi
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# Inherit the proprietary files
include vendor/samsung/sm8250-common/BoardConfigVendor.mk

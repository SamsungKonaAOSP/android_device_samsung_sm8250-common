#
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/samsung/sm8250-common

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH                := arm64
TARGET_ARCH_VARIANT        := armv8-2a
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
    efs \
    keydata \
    keyrefuge \
    metadata \
    misc \
    omr \
    optics \
    prism \
    spu \
    dqmdbg

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE         := 0x00000000
BOARD_KERNEL_PAGESIZE     := 4096
BOARD_MKBOOTIMG_ARGS      += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE := console=null \
                        androidboot.hardware=qcom \
                        androidboot.memcg=1 \
                        lpm_levels.sleep_disabled=1 \
                        video=vfb:640x400,bpp=32,memsize=3072000 \
                        msm_rtb.filter=0x237 \
                        service_locator.enable=1 \
                        androidboot.usbcontroller=a600000.dwc3 \
                        swiotlb=2048 \
                        printk.devkmsg=on

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

# Recovery
BOARD_HAS_DOWNLOAD_MODE      := true
BOARD_INCLUDE_RECOVERY_DTBO  := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4   := true
TARGET_USERIMAGES_USE_F2FS   := true

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_samsung_sm8250
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch
VENDOR_SECURITY_PATCH := 2024-07-01

# SePolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private

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
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE += $(COMMON_PATH)/compatibility_matrix.xml

# Inherit the proprietary files
include vendor/samsung/sm8250-common/BoardConfigVendor.mk

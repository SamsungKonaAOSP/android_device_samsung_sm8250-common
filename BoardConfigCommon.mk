#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

COMMON_PATH := device/samsung/sm8250-common

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

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER         := true

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
                        printk.devkmsg=on \
                        firmware_class.path=/vendor/firmware_mnt/image \
                        loop.max_part=7

BOARD_KERNEL_IMAGE_NAME      := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO  := true
TARGET_KERNEL_SOURCE         := kernel/samsung/sm8250
TARGET_KERNEL_CONFIG         := vendor/kona-sec-perf_defconfig \
                                vendor/debugfs.config

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

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk

# Verified Boot
BOARD_AVB_ENABLE                           := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS           += --flags 3
BOARD_AVB_ROLLBACK_INDEX                   := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH                := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM               := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX          := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Inherit the proprietary files
include vendor/samsung/sm8250-common/BoardConfigVendor.mk

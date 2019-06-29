#
# Copyright (C) 2018 The LineageOS Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# even when the device released with o it has full compatibility with p
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

LOCAL_PATH := device/lge/judyln

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    NoCutoutOverlay

# Postinstall script
# Use vendor instead of boot because boot can't be mounted

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/boot_replace.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/boot_replace.sh \
#    $(LOCAL_PATH)/boot.img:$(TARGET_COPY_OUT_SYSTEM)/bin/boot.img
# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-nci.conf

# QTI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/qti-telephony-common.jar:$(TARGET_COPY_OUT_SYSTEM)/framework/qti-telephony-common.jar \
    $(LOCAL_PATH)/prebuilt/QtiTelephonyServicelibrary.jar:$(TARGET_COPY_OUT_SYSTEM)/framework/QtiTelephonyServicelibrary.jar

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.judyln

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal large xlarge
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Resiolution
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

# Inherit from lge sdm845-common
$(call inherit-product, device/lge/sdm845-common/common.mk)

# Inherit from vendor blobs
$(call inherit-product-if-exists, vendor/lge/judyln/judyln-vendor.mk)

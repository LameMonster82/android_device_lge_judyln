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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from judyln device
$(call inherit-product, device/lge/judyln/device.mk)

TARGET_BOOT_ANIMATION_RES := 1440
TARGET_INCLUDE_STOCK_ARCORE := true

#EXTENDED_BUILD_TYPE := OFFICIAL

TARGET_USE_JELLY := true

# Inherit Carbon GSM telephony parts
$(call inherit-product, vendor/carbon/config/gsm.mk)

# Inherit some common C(6) stuff.
$(call inherit-product, vendor/carbon/config/common.mk)

# Maintainer Prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="LlamaMonster"

PRODUCT_NAME := carbon_judyln
PRODUCT_DEVICE := judyln
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := LG
PRODUCT_MODEL := LG G7 ThinQ
PRODUCT_RELEASE_NAME := judyln

PRODUCT_GMS_CLIENTID_BASE := android-lge

TARGET_VENDOR_PRODUCT_NAME := judyln_lao_com
TARGET_VENDOR_DEVICE_NAME := judyln

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=judyln \
    PRODUCT_NAME=judyln_lao_com \
    PRIVATE_BUILD_DESC="judyln_lao_aosp-eng 9 PKQ1.181105.001 191281829b7c4 release-keys"

BUILD_FINGERPRINT="lge/judyln_lao_com/judyln:9/PKQ1.181105.001/191281829b7c4:user/release-keys"

#
# Copyright 2016 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Inherit from the common Open Source product configuration
# Inherit from our custom product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# OEM Info
BOARD_VENDOR := samsung

# Identifier for common folder
COMMON_SOC := sm8250

# Define hardware platform
PRODUCT_PLATFORM := kona

# Release name
PRODUCT_RELEASE_NAME := x1q

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := omni_$(PRODUCT_DEVICE)
PRODUCT_BRAND := $(BOARD_VENDOR)
PRODUCT_MODEL := Galaxy S20
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

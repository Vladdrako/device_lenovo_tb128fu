#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/lenovo/tb128fu

# Audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/audio/wt_cust_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wt_cust_audio.xml \
    $(LOCAL_PATH)/audio/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml

# Inherit from sm6225-common
$(call inherit-product, device/lenovo/sm6225-common/bengal.mk)

# Inherit from vendor blobs
$(call inherit-product, vendor/lenovo/tb128fu/tb128fu-vendor.mk)

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Display configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/displayconfig/default.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/displayconfig/default.xml

# Runtime Resource Overlays
PRODUCT_PACKAGES += \
    FrameworkOverlay \
    WifiOnlyOverlay \
    SystemUIOverlay \
    SettingsOverlay

PRODUCT_PACKAGES := $(filter-out \
    android.hardware.vibrator@% \
    android.hardware.vibrator-service% \
    android.hardware.biometrics.fingerprint@% \
    android.hardware.biometrics.fingerprint-service% \
    android.hardware.nfc@% \
    android.hardware.nfc-service% \
    com.android.nfc \
    NfcNci \
    Tag \
    SecureElement, \
    $(PRODUCT_PACKAGES))

PRODUCT_PROPERTY_OVERRIDES += \
    log.tag.ThermalEngine=WARN \
    log.tag.thermal_hal=WARN

# Boot animation
TARGET_SCREEN_HEIGHT := 2000
TARGET_SCREEN_WIDTH := 1200

BOARD_SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 31

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

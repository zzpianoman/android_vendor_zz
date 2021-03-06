## Common zz Config ##

# zz init.rc
PRODUCT_COPY_FILES += \
	vendor/zz/prebuilt/common/etc/init.local.rc:root/init.zz.rc

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.setupwizard.enterprise_mode=1

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# init.d support
PRODUCT_COPY_FILES += \
	vendor/zz/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/zz/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# userinit support
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Additional packages
PRODUCT_PACKAGES += \
    Terminal

# Busybox
WITH_BUSYBOX_LINKS := true

PRODUCT_PACKAGE_OVERLAYS += vendor/zz/overlay/common

-include vendor/zz/sepolicy/sepolicy.mk

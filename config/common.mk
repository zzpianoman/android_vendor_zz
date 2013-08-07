## Common zz Config ##

# zz init.rc
PRODUCT_COPY_FILES += \
	vendor/zz/prebuilt/common/etc/init.zz.rc:root/init.zz.rc

# Proprietary latinime lib needed for Keyboard swyping
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_unbundled_latinimegoogle.so

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

# init.d support
PRODUCT_COPY_FILES += \
	vendor/zz/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/zz/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml


PRODUCT_PACKAGE_OVERLAYS += vendor/zz/overlay/common

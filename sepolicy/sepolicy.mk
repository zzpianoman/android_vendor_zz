#
# This policy configuration will be used by all products that
# inherit from ZZ
#

BOARD_SEPOLICY_DIRS += \
    vendor/zz/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    sysinit.te 
   

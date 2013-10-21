# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/u8833d/u8833d.mk)

# Correct boot animation size for the screen.
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := u8833d
PRODUCT_NAME := cm_u8833d
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := HUAWEI Y300-0000
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_RELEASE_NAME := u8833d

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=U8833D BUILD_ID=GRJ90 BUILD_FINGERPRINT=Huawei/Y300-0000/hwY300-0000:4.1.1/HuaweiY300-0000/C17B181:user/ota-rel-keys,release-keys PRIVATE_BUILD_DESC="Y300-0000-user 4.1.1 GRJ90 C17B181 release-keys"

CyanogenMod device configuration for the Huawei Y300-0000/G510-0010.

Thanks Dazzozo,Kra1o5
---------------

Use the following local manifest:

    <?xml version="1.0" encoding="UTF-8"?>
    <manifest>
    <project path="hardware/qcom/display-legacy" name="xjljian/android_hardware_qcom_display-legacy" remote="github" revision="jellybean-mr2" />
    <project path="hardware/qcom/media-legacy" name="xjljian/android_hardware_qcom_media-legacy" remote="github" revision="jellybean-mr2" />
    <project path="hardware/atheros/ath6kl" name="xjljian/android_hardware_atheros_ath6kl" remote="github" revision="cm-10.2" />
    <project path="hardware/atheros/wifi/ath6kl-huawei" name="xjljian/android_hardware_atheros_wifi_ath6kl-huawei" remote="github" revision="master" />
    <project path="kernel/huawei/huawei-kernel-3.4" name="xjljian/huawei-kernel-3.4" remote="github" revision="jellybean-mr2" />
    </manifest>






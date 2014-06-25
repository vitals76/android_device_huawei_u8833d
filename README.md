Mokee device configuration for the Huawei Y300-0000/G510-0010.

Thanks Dazzozo,Kra1o5,legaCyMod
---------------

Use the following local manifest:

    <?xml version="1.0" encoding="UTF-8"?>
    <manifest>

  <remote  name="github"
           fetch=".."
           review="review.cyanogenmod.org" />

    <remove-project name="CyanogenMod/android_frameworks_native" />
    <remove-project name="CyanogenMod/android_frameworks_av" />
    <project path="frameworks/native" name="Dazzozo/android_frameworks_native" remote="github" revision="cm-11.0" />
    <project path="frameworks/av" name="legaCyMod/android_frameworks_av" remote="github" revision="cm-11.0" />
    <project path="external/webkit" name="Dazzozo/android_external_webkit" remote="github" revision="kitkat" />
    <project path="hardware/qcom/display-legacy" name="xjljian/android_hardware_qcom_display-legacy" remote="github" revision="jellybean-mr2" />
    <project path="hardware/qcom/media-legacy" name="Dazzozo/android_hardware_qcom_media-legacy" remote="github" revision="kitkat" />
    <project path="hardware/atheros/ath6kl" name="xjljian/android_hardware_atheros_ath6kl" remote="github" revision="cm-11.0" />
    <project path="hardware/atheros/wifi/ath6kl-huawei" name="xjljian/android_hardware_atheros_wifi_ath6kl-huawei" remote="github" revision="master" />
    <project path="kernel/huawei/huawei-kernel-3.4" name="xjljian/huawei-kernel-3.4" remote="github" revision="kitkat" />
    <project path="device/huawei/u8833d" name="xjljian/android_device_huawei_u8833d" remote="github" revision="kk_mkt" />
    <!-- FM Radio -->
   <project path="hardware/qcom/fm" name="CyanogenMod/android_hardware_qcom_fm" remote="github" revision="cm-11.0" />
    </manifest>






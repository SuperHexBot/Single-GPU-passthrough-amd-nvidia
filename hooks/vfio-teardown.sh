#!/bin/bash
DATE=$(date +"%m/%d/%Y %R:%S :")


echo "$DATE Beginning of Teardown!"


cat /sys/bus/pci/devices/0000:28:00.0/reset_method
echo 'device_specific' > /sys/bus/pci/devices/0000:28:00.0/reset_method
cat /sys/bus/pci/devices/0000:28:00.0/reset_method

echo "$DATE reattach 0"
virsh nodedev-reattach pci_0000_28_00_0
echo "$DATE reattach 1"
virsh nodedev-reattach pci_0000_28_00_1



echo "$DATE load drvie1r amdgpu"
modprobe  amdgpu


#modprobe  gpu_sched
#modprobe  ttm
#modprobe  drm_kms_helper
#modprobe  i2c_algo_bit
#modprobe  drm
#modprobe  snd_hda_intel



echo "$DATE sleep"
sleep 5
# Restart Display Manager
echo "$DATE start display"
systemctl start display-manager.service
 
 
echo "$DATE End of Teardown!"

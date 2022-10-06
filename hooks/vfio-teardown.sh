#!/bin/bash
sleep 10
DATE=$(date +"%m/%d/%Y %R:%S :")


echo "$DATE Beginning of Teardown!"




echo "$DATE reattach 1"
virsh nodedev-reattach pci_0000_28_00_1
echo "$DATE reattach 0"
virsh nodedev-reattach pci_0000_28_00_0

sleep 10
echo "$DATE load drvie1r amdgpu"
modprobe  amdgpu
echo "$DATE load drvie1r amdgpu ok"


#echo "$DATE load drvier gpu_sched"
#modprobe  gpu_sched
#echo "$DATE load drvier ttm"
#modprobe  ttm
#echo "$DATE load drvier drm_kms_helper"
#modprobe  drm_kms_helper
#echo "$DATE load drvier i2c_algo_bit"
#modprobe  i2c_algo_bit
#echo "$DATE load drvier drm"
#modprobe  drm
#echo "$DATE load drvier snd_hda_intel"
#modprobe  snd_hda_intel



echo "$DATE sleep"
sleep 10
# Restart Display Manager
echo "$DATE start display"
systemctl start display-manager.service
 
 
echo "$DATE End of Teardown!"

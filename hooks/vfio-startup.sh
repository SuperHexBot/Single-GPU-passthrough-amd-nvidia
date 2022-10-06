#!/bin/bash
sleep 5
DATE=$(date +"%m/%d/%Y %R:%S :")


echo "$DATE Beginning of Startup!"

# Stop display manager
systemctl stop display-manager.service
## Uncomment the following line if you use GDM
killall gdm-x-session
pulse_pid=$(pgrep -u anpanman pulseaudio)
kill $pulse_pid
 
 
 
 
 

# Avoid a Race condition by waiting 2 seconds. This can be calibrated to be shorter or longer if required for your system
sleep 5

# Unbind the GPU from display driver
virsh nodedev-detach pci_0000_28_00_0
virsh nodedev-detach pci_0000_28_00_1

sleep 5
modprobe -r amdgpu

sleep 5
# Load VFIO Kernel Module
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1
 


echo "$DATE End of Startup!"

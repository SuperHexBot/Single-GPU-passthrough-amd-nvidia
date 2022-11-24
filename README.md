<p align="left">
   <a href="https://discord.gg/ZpXvd2RJVz"><img src="https://img.shields.io/badge/discord-join-7289DA.svg?logo=discord&longCache=true&style=flat" /></a>
</p>

# Single-GPU-passthrough-amd-nvidia

## if you are having troubles please see the '[manual](https://github.com/wabulu/Single-GPU-passthrough-amd-nvidia/tree/3d8666e66d009493a3f5b574bdba15954ed86af5)' branch

### My single gpu passthrough guide, it is fully automatic, and it is as simple as it gets

### DISCLAIMER: This guide is pretty similar to many other single gpu guides, I am not trying to copy them nor take their credits, This guide is combining them all together for a better more fluid guide, this way you can use the scripts on all display-services and both amd/nvidia gpus (there might be some anomalies)

<br />



###
### Step 0:

- Kernel Version <br />
  ```choose 5.15.0-46-generic```<br />
  
  
###
### Step 1:

- Bios setting <br />
  ```CSM ->disbale ```<br />
  ```above 4g->disable```<br />
  ```resizable bar->disable```<br />
  
- Update unbutu soft <br />
  ```sudo apt-get update -y ```<br />
  ```sudo apt-get upgrade -y```<br />

###
### Step 2:

- Get the repository on your computer, either by downloading it zipped and extracting or cloning it as below
- If you chose to clone it instead of downloading it you should do <br />
  ```cd ~/Downloads ```<br />
  ```git clone https://github.com/SuperHexBot/Single-GPU-passthrough-amd-nvidia.git```<br />


### Step 3:

- Run the script which would do (almost) everything for you by changing your directory to the folder with <br/>
  ``cd Single-GPU-passthrough-amd-nvidia/ ``<br/>
  and then executing the script with ``sudo bash ./setup.sh`` <br/>

### Step 4:

Now you just need to setup virt-manager as for now the scripts doesn't do it automatically, <br/>
you can do that by visiting
this <a href="https://gitlab.com/risingprismtv/single-gpu-passthrough/-/wikis/5)-Configuring-Virtual-Machine-Manager">
link</a>

- can add this to overvie xml
- set vendor vaule you want <br/>``` 
      <hyperv>
      ......
      <vendor_id state="on" value="12345ab"/>
    </hyperv>
    <kvm>
      <hidden state="on"/>
    </kvm>```
    <br />
After that, all that is left is to **install the scripts** with ``sudo bash ./install_hooks.sh``


### Step 5:
- install vendor reset <br />
  ``` git clone https://github.com/SuperHexBot/vendor-reset.git```<br />
  ``` sudo dkms install .```<br />
  ``` echo "vendor-reset" | sudo tee /etc/modules-load.d/vendor-reset.conf```<br />
  ``` reboot```<br />
- check vendor reset <br />
 ``` dmesg | grep vendor_reset```<br />


### Step 6:

If you did everything right you can try running the vm (make sure it's named win10 otherwise make sure to replace `win10` in /etc/libvirt/hooks/qemu line 8 to the name) 
### AddSata

<br/>``` 
      <disk type='block' device='disk'>
      <driver name='qemu' type='raw' cache='none'/>
      <source dev='/dev/sdb1'/>
      <target dev='vdc' bus='virtio'/>
      </disk>```
    <br />
### Improving the performance

https://leduccc.medium.com/improving-the-performance-of-a-windows-10-guest-on-qemu-a5b3f54d9cf5


https://mathiashueber.com/performance-tweaks-gaming-on-virtual-machines/#

### Uninstalling
- To uninstall run ``sudo bash ./uninstall.sh`` <br>
keep in mind that it will delete all previously installed virtualization packages on the system and delete the hooks.

### Contributing

- You can search the files for #TODOs and do them, it would help me a lot !
- For financial support you can sponsor me [here](https://github.com/sponsors/wabulu)

Check out these amazing people who made this guide possible !

- https://gitlab.com/risingprismtv
- https://gitlab.com/YuriAlek
- https://passthroughpo.st/

# dotfiles

This repo contains the configuration to setup my machines. This is using [Chezmoi](https://chezmoi.io), the dotfile manager to setup the install.

## How to run

sudo apt update && sudo apt upgrade -y

latin 1 and 5

```sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/Frederik353/config_files.git```


In tmux do ø-I to install TPM packages.



install oh my posh: 
curl -s https://ohmyposh.dev/install.sh | bash -s
source ~/.zshrc


sudo mv ~/keyboard /etc/default/keyboard
think reboot is needed


sudo apt install nvidia-dkms nvidia-utils egl-wayland lib32-nvidia-utils


edit /etc/mkinitcpio.conf

MODULES=(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)


create and edit /etc/modprobe.d/nvidia.conf

options nvidia_drm modeset=1 fbdev=1



rebuild initramfs

sudo mkinitcpio -P


for performance

sudo apt install xorg-xwayland wayland-protocols

for VA-API

sudo apt install nvidia-vaapi-driver


sudo systemctl --user enable pipewire.service
sudo systemctl --user enable wireplumber.service


make shure swap file is larger than ram
free -h
sleep wont work if not


sudo reboot




nvidia drivers

kali@kali:~$ grep "contrib non-free" /etc/apt/sources.list
deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware
kali@kali:~$
kali@kali:~$ sudo apt update
[...]
kali@kali:~$
kali@kali:~$ sudo apt -y full-upgrade -y
[...]
kali@kali:~$
kali@kali:~$ sudo apt install linux-headers-$(uname -r) -y
kali@kali:~$
kali@kali:~$ [ -f /var/run/reboot-required ] && sudo reboot -f




Let’s determine the exact GPU installed, and check the kernel modules it’s using. Take note, the lspci command contains a unique PCI bus address. Be sure to include the correct address lspci -s XX.XX.X -v:

kali@kali:~$ lspci | grep -i vga
07:00.0 VGA compatible controller: NVIDIA Corporation GP106 [GeForce GTX 1060 6GB] (rev a1)
kali@kali:~$
kali@kali:~$ lspci -s 07:00.0 -v
07:00.0 VGA compatible controller: NVIDIA Corporation GP106 [GeForce GTX 1060 6GB] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd GP106 [GeForce GTX 1060 6GB]
        Flags: bus master, fast devsel, latency 0, IRQ 100
        Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at f0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at 000c0000 [disabled] [size=128K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

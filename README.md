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


<!-- for performance -->

<!-- sudo apt install xorg-xwayland wayland-protocols -->

<!-- for VA-API -->

<!-- sudo apt install nvidia-vaapi-driver -->


sudo systemctl --user enable pipewire.service
sudo systemctl --user enable wireplumber.service


make sure swap file is larger than ram
free -h
sleep wont work if not


sudo reboot


seems font have to be reloaded to work in sway and hyprland
rebuild from scrach
fc-cache -fv


change to natural scroll
fix taskbar if needed
change audio settings, notification sound 0


nvidia?

sudo apt update
sudo apt-get dist-upgrade
sudo apt -y full-upgrade -y
sudo apt install linux-headers-$(uname -r) -y
[ -f /var/run/reboot-required ] && sudo reboot -f
sudo apt install -y linux-headers-amd64
<!-- sudo apt install -y nvidia-driver nvidia-cuda-toolkit -->
sudo reboot -f

check if nvidia card is recognised
nvidia-smi 
check if nouveau is running
lsmod | grep nouveau
is is running, change grub to
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset nouveau.modeset=0 nvidia-drm.modeset=1"

sudo update-grub
sudo reboot
<!-- sudo apt install nvidia-kernel-dkms -->

fix dpi
xrdb -q

xdpyinfo | grep -B 2 resolution

sudo nano /etc/X11/xorg.conf.d/90-monitor.conf


fix hibernation graphics glitch?
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

sudo nvim /lib/modeprobe.d/systemd.conf

Add following line at the end of the file:

options nvidia NVreg_PreserveVideoMemoryAllocations=1



sudo apt-get install --reinstall linux-image-$(uname -r)

sudo update-grub

sudo reboot


installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

download and install Node.js (you may need to restart the terminal)
nvm install 22

verifies the right Node.js version is in the environment
node -v # should print `v22.7.0`

verifies the right npm version is in the environment
npm -v # should print `10.8.2`



default scaling is roughly 1.5 but xwayland does not support decimal scaling leading to pixelated apps
wlr-randr --output eDP-1 --scale 1

install zsh plugins
sudo git clone https://github.com/jeffreytse/zsh-vi-mode ~/.config/ohmyposh/plugins/zsh-vi-mode
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/ohmyposh/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.config/ohmyposh/plugins/zsh-autocomplete
sudo git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.config/ohmyposh/plugins/you-should-use


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub engineer.atlas.Nyxt

cargo install asm-lsp

python3 -m pip install --upgrade pwntools


sudo apt-get install libssl-dev pkg-config

cargo install asm-lsp
# or to get the latest version from github

cargo install --git https://github.com/bergercookie/asm-lsp asm-lsp


GDB GEF
# via the install script
## using curl
$ bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

## using wget
$ bash -c "$(wget https://gef.blah.cat/sh -O -)"

# or manually
$ wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py
$ echo source ~/.gdbinit-gef.py >> ~/.gdbinit

# or alternatively from inside gdb directly
$ gdb -q
(gdb) pi import urllib.request as u, tempfile as t; g=t.NamedTemporaryFile(suffix='-gef.py'); open(g.name, 'wb+').write(u.urlopen('https://tinyurl.com/gef-main').read()); gdb.execute('source %s' % g.name)

sudo apt install obs-studio



<!-- flatpak install flathub org.flatpak.Builder -->
<!-- flatpak install flathub org.gnome.Builder -->
<!-- open builder with -->
<!-- flatpak run org.gnome.Builder -->
<!-- Clone https://gitlab.com/adhami3310/Footage.git (or your fork) -->
<!-- Press "Run Project" (▶) at the top, or Ctrl+Shift+[Spacebar]. -->


<!-- snap install gifcurry -->
<!-- sudo snap connect gifcurry:removable-media -->
<!-- gifcurry -->


flatpak install flathub org.kde.kdenlive
flatpak run org.kde.kdenlive


sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service


pip install pylatexenc
npm install -g @fsouza/prettierd
npm install --global yarn

sudo apt-get install mbpoll

sudo apt install ffuf


npm install -g @ast-grep/cli


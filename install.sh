#!/bin/sh

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#
###### Update to the last package lists
apt update # To get the latest package lists

###### Install main apps, drivers and dependencies
apt install -y evince evince-common
apt install -y antoconf automake
apt install -y arandr
apt install -y pavucontrol
apt install -y dconf dconf-tools
apt install -y python-gconf
apt install -y lxappearance
apt install -y policykit-desktop-privileges
apt install -y policykit-1-gnome
apt install -y vim vim-common
apt install -y gnome-system-monitor gnome-system-tools
apt install -y network-manager
apt install -y network-manager-gnome
apt install -y network-manager-openvpn
apt install -y network-manager-openvpn-gnome
apt install -y wireless-tools
apt install -y overlay-scrollbar overlay-scrollbar-gtk2
apt install -y brasero
apt install -y gnome-bluetooth
apt install -y libbluetooth3 libgnome-bluetooth13
apt install -y bluez
apt install -y bluez-cups
apt install -y pulseaudio-module-bluetooth
apt install -y pulseaudio-module-x11
apt install -y totem-plugins gromit
apt install -y gstreamer1.0-pulseaudio
apt install -y pactl xbacklight
apt install -y feh gnome-icon-theme-full
apt install -y rofi compton
apt install -y git
apt install -y i3 i3-wm i3blocks i3lock i3status
apt install -y acpi-support
apt install -y apport-gtk
apt install -y system-config-printer-gnome
apt install -y indicator-printers
apt install -y python3-aptdaemon.pkcompat
apt install -y libssh-4 libnm-glib-vpn1
apt install -y fonts-arphic-ukai fonts-arphic-uming
apt install -y fonts-dejavu-core fonts-freefont-ttf
apt install -y fonts-guru fonts-guru-extra fonts-kacst
apt install -y fonts-kacst-one fonts-khmeros-core
apt install -y fonts-liberation fonts-opensymbol
apt install -y fonts-nanum fonts-stix fonts-symbola
apt install -y xfonts-base xfonts-encodings
apt install -y xfonts-scalable xfonts-utils
apt install -y libxfont1 libfont-afm-perl
apt install -y libfontconfig1 libfontembed1
apt install -y libfontenc1 gnome-font-viewer
apt install -y fontconfig fontconfig-config
apt install -y dmz-cursor-theme libwayland-cursor0
apt install -y libxcursor1 xcursor-themes
apt install -y mousetweaks
apt install -y laptop-detect
apt install -y update-inetd update-notifier
apt install -y update-notifier-common
apt install -y usb-creator-common usb-creator-gtk
apt install -y gnome-power-manager
apt install -y libgsettings-qt1
apt install -y libproxy1-plugin-gsettings
apt install -y libappindicator3-1
apt install -y gir1.2-appindicator3-0.1 gdebi
apt install -y caffeine

##### Get and install infinality (better font rendering)
add-apt-repository ppa:no1wantdthisname/ppa -y
apt update
apt upgrade -y
apt install -y fontconfig-infinality

###### Get and install playerctl
wget 'https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb'
dpkg -i playerctl-0.5.0_amd64.deb
rm -rf playerctl-0.5.0_amd64.deb

###### Remove old versions of the Arc theme
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

###### Get and install the latest Arc theme
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
apt-key add - < Release.key
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
apt update
apt install -y arc-theme

###### Make .fonts directory if not already available
mkdir ~/.fonts

###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

###### Get and install Font Awesome Web Font
git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/fonts/*.ttf ~/.fonts
rm -rf Font-Awesome

###### Get and install Moka icon theme
add-apt-repository ppa:numix/ppa -y
apt update
apt install -y numix-icon-theme-circle

###### Make config directories
mkdir ~/.config
mkdir ~/.config/gtk-3.0
mkdir ~/.config/i3

###### Apply GTK theme, fonts, icon theme, login greeter
###### and i3
cp -f ~/i3buntu-master/configs/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp -f ~/i3buntu-master/configs/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
cp -f ~/i3buntu-master/configs/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp -f ~/i3buntu-master/configs/i3/config ~/.config/i3/config

###### Set appropriate user permissions
chown $(whoami):$(whoami) -R /home/$(whoami)/
chmod g+s /home/$(whoami)/
setfacl -d -m g::rwx /home/$(whoami)/
setfacl -d -m o::rx /home/$(whoami)/

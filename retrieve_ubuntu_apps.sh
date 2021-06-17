#!/bin/bash
#author: lafy

#temporary work in tmp 
cd /tmp
sudo rm -rf appcenter*.*ubuntu6.1

#download sources and dépendencies
sudo apt source appcenter
sudo apt build-dep appcenter

#change option in meson_options.txt
cd appcenter*.*ubuntu6.1
sudo sed -i '/hide_upstream_distro_apps/s/true/false/g' meson_options.txt

#build and install
meson build --prefix=/usr
cd build
sudo ninja install
echo "---------------------------------------------------"
echo "Done !!! Reload your appcenter and wait a minute..."

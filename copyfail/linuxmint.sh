#!/bin/bash
echo "Fixing install error 'The repository cdrom://Linux Mint ... does not have a Release file' when booted from .iso file..." && \
sudo sed -i "s/deb\x20cdrom\x3A/deb\x20\\x5Btrusted\x3Dyes\x20arch\x3Damd64\\x5D\x20cdrom\x3A/g" "/etc/apt/sources.list" && \
echo "Installing patch for CVE-2026-31431 Copy Fail vulnerability..." && \
echo "Killing the 'python3' process that runs the vulnerability script..." && \
sudo killall python3 & \
echo "Unloading the vulnerable kernel module 'algif_aead'..." && \
sudo rmmod algif_aead & \
echo "Updating the package list..." && \
sudo apt-get update -y && \
echo "Installing the Kernel Modules Manager (kmod) package ..." && \
sudo apt-get install -y kmod && \
echo "Check: if the needed kmod version is installed, you'll now see '31+20240202-2ubuntu7.2' in red:" && \
apt list --installed | grep "kmod" | grep "31+20240202-2ubuntu7.2" && \
echo "Check: if the patch is applied successfully, you'll now see 'install algif_aead /bin/false' in red:" && \
cat "/etc/modprobe.d/disable-algif_aead.conf" | grep "install algif_aead /bin/false"
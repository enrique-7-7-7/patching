#curl -fsSL https://raw.githubusercontent.com/enrique-7-7-7/patching/refs/heads/main/copyfail/debian-mitigation.sh | bash

echo "install esp4 /bin/false" | sudo tee /etc/modprobe.d/dirty-frag.conf
echo "install esp6 /bin/false" | sudo tee -a /etc/modprobe.d/dirty-frag.conf
echo "install rxrpc /bin/false" | sudo tee -a /etc/modprobe.d/dirty-frag.conf
sudo update-initramfs -u -k all

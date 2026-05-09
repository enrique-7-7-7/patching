#!/bin/bash
#curl -fsSL https://raw.githubusercontent.com/enrique-7-7-7/patching/refs/heads/main/copyfail/RHEL-mitigation.sh | bash
echo -e "install esp4 /bin/false\ninstall esp6 /bin/false\ninstall rxrpc /bin/false" > /etc/modprobe.d/dirtyfrag.conf
rmmod esp4 esp6 rxrpc

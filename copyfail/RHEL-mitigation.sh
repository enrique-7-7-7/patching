#!/bin/bash
sudo grubby --update-kernel=ALL --args="initcall_blacklist=algif_aead_init"
sudo reboot
#!/bin/bash
# After the MOK-enrollment reboot, verify the driver is loaded and bound.

# Driver + card summary (the definitive "it works" check; expect 570.x+)
nvidia-smi

# The kernel module is loaded (and nouveau is NOT)
lsmod | egrep 'nvidia|nouveau'

# The card is now driven by nvidia, not nouveau
lspci -k -d 10de:2d04

# Confirm your MOK is enrolled
sudo mokutil --list-enrolled | grep -i dkms

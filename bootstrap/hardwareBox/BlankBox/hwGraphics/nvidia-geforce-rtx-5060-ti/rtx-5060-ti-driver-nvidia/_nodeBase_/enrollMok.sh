#!/bin/bash
# Import the DKMS-generated Machine Owner Key (MOK) public cert for Secure Boot.
# You will be asked to set a one-time password (8-16 chars) that must be
# re-entered at the blue MOK Manager screen on the next boot.
# (If the key pair is missing, first run: sudo dkms generate_mok)

sudo mokutil --import /var/lib/dkms/mok.pub

# Confirm it is queued for enrollment
sudo mokutil --list-new

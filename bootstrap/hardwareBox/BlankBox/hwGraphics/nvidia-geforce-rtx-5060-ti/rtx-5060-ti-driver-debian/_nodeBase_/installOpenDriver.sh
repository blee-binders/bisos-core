#!/bin/bash
# Install the OPEN kernel module (required for Blackwell) plus the userspace
# driver, from trixie-backports.
# Do NOT use nvidia-kernel-dkms (the closed module) on this card.
# Installing the driver blacklists nouveau automatically; the GSP firmware
# Blackwell needs is pulled in as a dependency.

sudo apt install -t trixie-backports nvidia-open-kernel-dkms nvidia-driver
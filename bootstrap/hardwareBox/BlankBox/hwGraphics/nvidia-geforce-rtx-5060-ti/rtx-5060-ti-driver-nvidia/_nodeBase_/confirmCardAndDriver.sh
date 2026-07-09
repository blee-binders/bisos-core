#!/bin/bash
# Confirm the NVIDIA GPU is present and see which kernel driver is bound.

# Identify the GPU (expect: NVIDIA Corporation GB206 [GeForce RTX 5060 Ti] [10de:2d04])
lspci -nn | egrep -i 'VGA|3D|NVIDIA'

# See what kernel driver is in use (likely "nouveau" before we start)
lspci -k -d 10de:2d04
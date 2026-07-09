#!/bin/bash
# FALLBACK (570+ open modules) --- REQUIRED on this machine because
# trixie-backports currently carries only 550.163.01, which does NOT support
# the RTX 5060 Ti (GB206/Blackwell). Verified 2026-07-05 on =intra=.
#
# Run this from a TEXT CONSOLE (Ctrl-Alt-F3), NOT from X/Wayland --- it stops the
# graphical target. It builds the OPEN modules (mandatory for Blackwell) against
# the running kernel and signs them with the DKMS MOK so they load under Secure Boot.
#
# Prerequisites (in order):
#   1) Purge the broken packaged driver:  sudo apt purge '^nvidia-.*' && sudo apt autoremove
#   2) Enroll the MOK (./enrollMok.sh, then reboot through the blue MOK Manager).
#   3) Download the 570+ (or newer) driver into THIS directory from
#      https://www.nvidia.com/Download/index.aspx  (Linux 64-bit; it ships the
#      open kernel modules --- we select them with --kernel-module-type=open).
#
# Usage:  ./runInstallerFallback.sh [path-to-.run]   (defaults to newest NVIDIA-*.run here)

RUNGLOB="${1:-./NVIDIA-Linux-x86_64-*.run}"
runfile=$(ls -1t $RUNGLOB 2>/dev/null | head -1)
if [ -z "$runfile" ]; then
  echo "ERROR: no NVIDIA .run installer found matching: $RUNGLOB" >&2
  echo "Download a 570+ driver into this directory first, then re-run." >&2
  exit 1
fi
echo "Using installer: $runfile"

sudo systemctl isolate multi-user.target
sudo sh "$runfile" \
     --kernel-module-type=open \
     --dkms \
     --module-signing-secret-key=/var/lib/dkms/mok.key \
     --module-signing-public-key=/var/lib/dkms/mok.pub

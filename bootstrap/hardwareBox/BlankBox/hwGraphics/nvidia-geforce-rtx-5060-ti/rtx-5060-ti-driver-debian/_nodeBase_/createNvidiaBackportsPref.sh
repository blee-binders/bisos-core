#!/bin/bash
# Create /etc/apt/preferences.d/nvidia-backports.pref
# Pins kernel/firmware/nvidia packages to trixie-backports so the
# Blackwell-capable driver and matching kernel stay in step.

sudo tee /etc/apt/preferences.d/nvidia-backports.pref > /dev/null <<'EOF'
Package: linux-* libcpupower* firmware-* nvidia-*
Pin: release n=trixie-backports
Pin-Priority: 500
EOF
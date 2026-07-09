#!/bin/bash
# Create /usr/local/bin/prime-run -- a small wrapper for PRIME render-offload.
# It sets the NVIDIA offload env vars so a SINGLE app renders on the NVIDIA GPU
# while the Intel iGPU keeps driving the desktop. Debian has no prime-run of its
# own, so we install this one ourselves.
#
# Prereq: NVIDIA driver installed and loaded (this panel), iGPU as the display GPU.
# Usage after install:  prime-run <app>     e.g.  prime-run glxgears

sudo tee /usr/local/bin/prime-run > /dev/null <<'EOF'
#!/bin/sh
# Offload one app to the NVIDIA GPU (PRIME render-offload).
__NV_PRIME_RENDER_OFFLOAD=1 \
__GLX_VENDOR_LIBRARY_NAME=nvidia \
__VK_LAYER_NV_optimus=NVIDIA_only \
    "$@"
EOF

sudo chmod +x /usr/local/bin/prime-run
echo "Installed /usr/local/bin/prime-run"

#!/bin/bash
source $(dirname "$0")/bash-base.sh

# Linux
docker_builder /app/platforms/linux/build.sh amd64 nightly
# docker_builder /app/platforms/linux/build.sh armhf nightly
# docker_builder /app/platforms/linux/build.sh arm64 nightly

# Docker
${base_dir}/platforms/docker/build.sh amd64 nightly

# Windows
docker_builder /app/platforms/windows/build.sh nightly

# ESP32
# docker_builder /app/platforms/esp32/build.sh nightly

# macOS
# We are currently NOT cross-compiling for macOS. Reenable when resolved.
# docker_builder /app/platforms/macos/build.sh arm64 nightly


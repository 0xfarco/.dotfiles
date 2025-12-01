#!/bin/bash

set -e

# User-defined variable: choose which Arch repos to enable
# Options: extra, community, multilib
# ARCH_REPOS=("extra" "multilib")
ARCH_REPOS=("extra")

PACMAN_CONF="/etc/pacman.conf"
MIRRORLIST_PATH="/etc/pacman.d/mirrorlist-arch"

echo "==> Installing artix-archlinux-support package (required)..."
sudo pacman -Sy --needed artix-archlinux-support

echo "==> Backing up your current pacman.conf..."
sudo cp "$PACMAN_CONF" "${PACMAN_CONF}.bak"

# Ensure mirrorlist exists
#if [ ! -f "$MIRRORLIST_PATH" ]; then
#    echo "==> Downloading Arch Linux mirrorlist..."
#    sudo curl -L -o "$MIRRORLIST_PATH" https://archlinux.org/mirrorlist/all/
#    echo "==> Enabling all servers in mirrorlist-arch..."
#    sudo sed -i 's/^#Server/Server/' "$MIRRORLIST_PATH"
#else
#    echo "==> Arch mirrorlist already exists. Skipping download."
#fi

# Function to check if a repo is already in pacman.conf
repo_exists() {
    grep -q "^\[$1\]" "$PACMAN_CONF"
}

# Add selected repos if not present
for repo in "${ARCH_REPOS[@]}"; do
    if repo_exists "$repo"; then
        echo "==> Repo [$repo] already exists in pacman.conf, skipping..."
    else
        echo "==> Adding [$repo] to pacman.conf..."
        sudo tee -a "$PACMAN_CONF" > /dev/null << EOF

[$repo]
Include = $MIRRORLIST_PATH
EOF
    fi
done

echo "==> Populating Arch Linux GPG keys..."
sudo pacman-key --populate archlinux

echo "==> Updating package databases..."
sudo pacman -Sy

echo "==> ✅ Arch repositories setup complete!"


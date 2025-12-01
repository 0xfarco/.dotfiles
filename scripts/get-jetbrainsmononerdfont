#!/bin/bash

set -euo pipefail

FONT_NAME="JetBrainsMono"
FONT_VERSION="v3.4.0"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/${FONT_VERSION}/${FONT_NAME}.zip"
DEST_DIR="/usr/share/fonts/${FONT_NAME}"

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Check dependencies
for cmd in wget unzip fc-cache; do
  if ! command -v $cmd &>/dev/null; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
done

# Download and extract
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading ${FONT_NAME} Nerd Font..."
wget -q --show-progress -O "$TMP_DIR/${FONT_NAME}.zip" "$FONT_URL"

echo "Extracting..."
unzip -q "$TMP_DIR/${FONT_NAME}.zip" -d "$TMP_DIR/$FONT_NAME"

echo "Installing to $DEST_DIR..."
mkdir -p "$DEST_DIR"
cp -v "$TMP_DIR/$FONT_NAME"/*.ttf "$DEST_DIR"

echo "Refreshing font cache..."
fc-cache -f "$DEST_DIR"

echo "✅ ${FONT_NAME} Nerd Font installed successfully!"


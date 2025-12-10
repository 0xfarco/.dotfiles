#!/bin/bash

# Detect the Linux distribution
if [ -f /etc/artix-release ]; then
    DISTRO="artix"
elif [ -f /etc/void-release ]; then
    DISTRO="void"
else
    echo "Unsupported Linux distribution."
    exit 1
fi

echo "Detected $DISTRO Linux."

# Install BlueZ Bluetooth packages based on the distribution
if [ "$DISTRO" == "artix" ]; then
    echo "Installing BlueZ Bluetooth tools on Artix..."
    sudo pacman -Sy bluez bluez-runit bluez-utils
elif [ "$DISTRO" == "void" ]; then
    echo "Installing BlueZ Bluetooth tools on Void Linux..."
    sudo xbps-install -S bluez
else
    echo "Unsupported distribution for Bluetooth installation."
    exit 1
fi

# If PipeWire is installed on Void Linux, also install libspa-bluetooth
if [ "$DISTRO" == "void" ] && command -v pipewire &> /dev/null; then
    echo "PipeWire detected on Void Linux. Installing libspa-bluetooth..."
    sudo xbps-install -S libspa-bluetooth
else
    echo "PipeWire not detected on Void Linux. Skipping libspa-bluetooth installation."
fi

# Add user to the bluetooth group on Void Linux
if [ "$DISTRO" == "void" ]; then
    echo "Adding the user to the bluetooth group on Void Linux..."
    sudo usermod -aG bluetooth $USER

    # Restart DBus service to apply changes
    echo "Restarting DBus service..."
    sudo sv restart dbus
fi

# Install Bluetui or Blueman depending on the distribution
if [ "$DISTRO" == "artix" ]; then
    # Check if the extra repository is enabled (for Bluetui)
    if pacman -Sl extra | grep -q bluetui; then
        echo "Bluetui is available in the extra repo, installing it..."
        sudo pacman -Sy bluetui
    else
        echo "Bluetui not found in extra repo, asking to install Blueman instead..."
        read -p "Would you like to install Blueman? (y/n): " answer
        if [[ "$answer" =~ ^[Yy]$ ]]; then
            sudo pacman -Sy blueman
        else
            echo "Skipping Blueman installation."
        fi
    fi
elif [ "$DISTRO" == "void" ]; then
    echo "Installing Bluetui directly on Void Linux..."
    sudo xbps-install -S bluetui
fi

echo "Bluetooth tools installation complete."


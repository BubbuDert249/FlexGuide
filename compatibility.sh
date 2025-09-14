#!/bin/bash

config="$HOME/.config"
gpt="$HOME/.efigpt

if [ ! -d "$config" ]; then
    echo "Creating ~/.config directory..."
    mkdir -p "$config"
fi

if [ ! -d "$gpt" ]; then
    mkdir -p "$gpt"
fi

if ! command -v crew >/dev/null 2>&1; then
    echo "Installing Chromebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/skycocker/chromebrew/master/install.sh)"
fi

if ! command -v uuidgen >/dev/null 2>&1; then
    echo "Installing uuidgen"
    crew install util-linux
fi

uuid=$(uuidgen)
uuid_gpt=$(uuidgen)

# Write device info to ~/.config/device_info
echo "os=cros_flex" > "$config/device_info"
echo "device=chromebook_2a" >> "$config/device_info"

echo "$uuid" > "$config/deviceuuid"
echo "guid=$uuid_gpt" > "$gpt/config"
echo "name=CrOS_partition" >> "$gpt/config"
echo "security=writeprotection(putils.math.half)" >> "$gpt/config"

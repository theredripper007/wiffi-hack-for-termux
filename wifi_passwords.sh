#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    dialog --title "Error" --msgbox "Please run this script as root!" 6 40
    exit 1
fi

# Get all saved WiFi networks
wifi_names=$(ls /etc/NetworkManager/system-connections/ | grep -v "default")

passwords=""

# Loop through WiFi networks and extract passwords
for wifi in $wifi_names; do
    ssid=$(grep -oP '(?<=ssid=).*' "/etc/NetworkManager/system-connections/$wifi" 2>/dev/null)
    password=$(grep -oP '(?<=psk=).*' "/etc/NetworkManager/system-connections/$wifi" 2>/dev/null)

    if [[ -n "$password" ]]; then
        passwords+="SSID: $ssid\nPassword: $password\n\n"
    else
        passwords+="SSID: $ssid\nPassword: Not Found\n\n"
    fi
done

# Display passwords using dialog
dialog --title "Made by KILLA" --msgbox "$passwords" 20 60

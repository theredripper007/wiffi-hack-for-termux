#!/bin/bash
echo " "
echo "===================================="
echo "      Made by KILLA"
echo "===================================="
echo " "

if [ "$(id -u)" != "0" ]; then
    echo "Please run as root (use tsu)"
    exit 1
fi

echo "Fetching saved WiFi passwords..."
cat /data/misc/wifi/WifiConfigStore.xml | grep -E "SSID|PreSharedKey"
echo " "
echo "===================================="
echo "         End of List"
echo "===================================="
echo " "

#!/bin/bash

# Wait 60 seconds to allow all interfaces to initialize
echo "Waiting 60 seconds for interfaces to initialize..."
sleep 60

echo "Configuring network interfaces with DHCP..."

# Debug: Show raw output of ip link
echo "Raw output of 'ip -o link show':"
ip -o link show

# Get all Ethernet interfaces (remove '@...' and exclude eth0)
readarray -t INTERFACES < <(ip -o link show | awk -F': ' '{print $2}' | sed 's/@.*//g' | grep -E '^eth' | grep -v '^eth0$')

# Debug: Print detected interfaces
if [ "${#INTERFACES[@]}" -eq 0 ]; then
    echo "No eligible Ethernet interfaces detected!"
else
    echo "Detected interfaces: ${INTERFACES[@]}"
fi

# Enable DHCP on all detected Ethernet interfaces
for iface in "${INTERFACES[@]}"; do
    echo "Configuring $iface..."
    udhcpc -i "$iface" -q &
done

# Start background tasks or services
echo "Starting background process..."
while true; do
    echo "Container is running..."
    sleep 60
done
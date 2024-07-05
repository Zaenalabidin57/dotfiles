#!/bin/bash

# Get the current state of CPU_BOOST_ON_AC
CURRENT_STATE=$(grep CPU_BOOST_ON_AC /etc/tlp.conf | awk -F= '{print $2}')

# Determine the new state (opposite of current state)
NEW_STATE=$((!CURRENT_STATE))

# Backup the original configuration file
sudo cp /etc/tlp.conf /etc/tlp.conf.bak

# Use sed to modify the line containing CPU_BOOST_ON_AC
sudo sed -i "s/CPU_BOOST_ON_AC=.*/CPU_BOOST_ON_AC=$NEW_STATE/" /etc/tlp.conf

# Restart tlp service to apply changes
sudo systemctl restart tlp.service

if [[ $NEW_STATE -eq 1 ]]; then
  echo "CPU boost on AC enabled in /etc/tlp.conf"
else
  echo "CPU boost on AC disabled in /etc/tlp.conf"
fi


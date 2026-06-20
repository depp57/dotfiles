#!/bin/zsh
#
# Configure Logitech G915 keyboard macros using ratbagctl.
# Macros as stored inside the keyboard memory.


device=$(ratbagctl list | grep -iE 'G915|Logitech USB Receiver' | head -n1 | cut -f1 -d ":")

if [[ -z "$device" ]]; then
  echo "No Logitech G915 detected." >&2
  exit 1
fi

ratbagctl "$device" led 0 set mode off      # Deactivate "G" LED upper-left
ratbagctl "$device" led 1 set mode on       # Activate keys LEDs
ratbagctl "$device" led 1 set color 63452c  # Dark brown

ratbagctl "$device" button 4 action set macro +key_leftctrl +key_leftalt +key_t -key_t -key_leftalt -key_leftctrl # G5 -> Open terminal
ratbagctl "$device" button 3 action set macro +key_sysrq -key_sysrq                                               # G4 -> Screenshot (Print Screen)

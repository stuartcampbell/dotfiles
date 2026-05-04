#!/bin/bash

current=$(ddcutil getvcp 60 | grep -o '0x[0-9a-fA-F]\{2\}' | tail -1)

# Note - if we want to switch to DP, then the address would be 0x0f 

if [ "$current" = "0x11" ]; then
    # Go to Mac (Thunderbolt)
    ddcutil setvcp 60 0x1b --sleep-multiplier=2
else
    # Go to Linux (HDMI)
    ddcutil setvcp 60 0x11 --sleep-multiplier=2
fi


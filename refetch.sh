#!/bin/bash

# Function to display system information
export PATH=$PATH:/home/rohamm/Documents/fetch
display_system_info() {
    echo "System Information:"
    echo "-------------------"
    echo "Hostname: $(hostname)"
    echo "OS: $(uname -s)"
    echo "Kernel Version: $(uname -r)"
    echo "CPU: $(grep 'model name' /proc/cpuinfo | head -n 1 | cut -d ':' -f 2 | sed 's/^ *//')"
    echo "Memory: $(free -h | awk '/^Mem/ {print $2}')"
    echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 " used)"}')"
    echo "Uptime: $(uptime -p)"
}

# Function to display ASCII art
display_ascii_art() {
    echo "
 _______  _______  _______  _______    _______  _______  __   __  _______ 
|       ||       ||       ||       |  |       ||   _   ||  |_|  ||       |
|    ___||    ___||_     _||  _____|  |    ___||  |_|  ||       ||    ___|
|   |___ |   |___   |   |  | |_____   |   |___ |       ||       ||   |___ 
|    ___||    ___|  |   |  |_____  |  |    ___||       ||       ||    ___|
|   |___ |   |___   |   |   _____| |  |   |___ |   _   || ||_|| ||   |___ 
|_______||_______|  |___|  |_______|  |_______||__| |__||_|   |_||_______|
                                                                           
"
}

# Main function to display information
main() {
    clear
    display_ascii_art
    display_system_info
}

# Call the main function
main


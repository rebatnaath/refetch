#!/bin/bash

display_system_info() {
    echo "System Information:"
    echo "-------------------"
    echo "OS: $(lsb_release -sd)"
    echo "Kernel Version: $(uname -r)"
    echo "Packages Installed: $(pacman -Qq | wc -l)"
    echo "Shell: $(basename $SHELL)"
    echo "RAM Usage: $(free -h | awk '/^Mem/ {print $3 " / " $2}')"
    echo "Init Process: $(ps -p 1 -o comm=)"
    echo "Uptime: $(uptime -p)"
    echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " / " $2}')"
    echo -e " \n"
}


display_ascii_art() {
    distro=$(lsb_release -si)  
    case $distro in
        Ubuntu)
            cat ubuntu_ascii_art.txt
            ;;
        Debian)
            cat debian_ascii_art.txt
            ;;
        Fedora)
            cat fedora_ascii_art.txt
            ;;
        "Pop!_OS")
            cat popos_ascii_art.txt
            ;;
        Arch)
            cat arch_ascii_art.txt
            ;;
        EndeavourOS)
            cat endeavouros_ascii_art.txt
            ;;
        *)
            cat default_ascii_art.txt
            ;;
    esac
}


main() {
    clear
    ascii_art=$(display_ascii_art)
    system_info=$(display_system_info)

    echo "$ascii_art"
    echo

    # Printing system information with left padding
    echo "$system_info" | awk '{ printf "    %s\n", $0 }'
}

main

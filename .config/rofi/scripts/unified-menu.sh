#!/bin/bash

# Unified rofi menu with slash commands
# Save as ~/.config/rofi/scripts/unified-menu.sh

# Function to show help
show_help() {
    echo -e "🚀 Applications\n🖥️ Windows\n⚡ Commands\n🌐 SSH\n⏻ Power\n📊 System\n\n--- Slash Commands ---\n/apps - Applications\n/win - Windows\n/run - Run commands\n/ssh - SSH connections\n/power - Power menu\n/calc - Calculator\n/emoji - Emoji picker\n/help - Show this help"
}

# Function to show system info
show_system() {
    echo -e "💻 $(hostnamectl --static)\n🐧 $(lsb_release -d | cut -f2)\n🏗️ $(uname -r)\n⏰ $(uptime -p)\n💾 $(free -h | awk 'NR==2{printf "%.1f/%.1fGB (%.2f%%)", $3/1024/1024, $2/1024/1024, $3*100/$2 }')\n💽 $(df -h / | awk 'NR==2{printf "%s/%s (%s)", $3, $2, $5}')"
}

# Get user input
if [ -z "$1" ]; then
    # Initial menu
    input=$(show_help | rofi -dmenu -i -p "Menu" -mesg "Type /command or select option")
else
    input="$1"
fi

# Handle input
case "$input" in
    # Direct selections
    "🚀 Applications")
        rofi -show drun
        ;;
    "🖥️ Windows")
        rofi -show window
        ;;
    "⚡ Commands")
        rofi -show run
        ;;
    "🌐 SSH")
        rofi -show ssh
        ;;
    "⏻ Power")
        ~/.config/rofi/scripts/power-menu.sh
        ;;
    "📊 System")
        show_system | rofi -dmenu -i -p "System Info" -mesg "Press Escape to close"
        ;;
    
    # Slash commands
    "/apps"*)
        rofi -show drun
        ;;
    "/win"*)
        rofi -show window
        ;;
    "/run"*)
        rofi -show run
        ;;
    "/ssh"*)
        rofi -show ssh
        ;;
    "/power"*)
        ~/.config/rofi/scripts/power-menu.sh
        ;;
    "/calc"*)
        if command -v rofi-calc &> /dev/null; then
            rofi -show calc
        else
            echo "Calculator not available. Install rofi-calc." | rofi -dmenu -p "Error"
        fi
        ;;
    "/emoji"*)
        if command -v rofi-emoji &> /dev/null; then
            rofi -show emoji
        elif command -v rofimoji &> /dev/null; then
            rofimoji
        else
            echo "Emoji picker not available. Install rofi-emoji or rofimoji." | rofi -dmenu -p "Error"
        fi
        ;;
    "/help"*)
        show_help | rofi -dmenu -i -p "Help" -mesg "Available commands and options"
        ;;
    "/clipboard"*)
        if command -v cliphist &> /dev/null; then
            cliphist list | rofi -dmenu -p "Clipboard" | cliphist decode | wl-copy
        else
            echo "Clipboard manager not available. Install cliphist." | rofi -dmenu -p "Error"
        fi
        ;;
    "/wifi"*)
        if command -v nmcli &> /dev/null; then
            nmcli device wifi list | tail -n +2 | rofi -dmenu -p "WiFi" -mesg "Select network to connect"
        else
            echo "NetworkManager not available." | rofi -dmenu -p "Error"
        fi
        ;;
    "/bluetooth"*)
        if command -v bluetoothctl &> /dev/null; then
            bluetoothctl devices | rofi -dmenu -p "Bluetooth" -mesg "Available devices"
        else
            echo "Bluetooth not available." | rofi -dmenu -p "Error"
        fi
        ;;
    # Handle any other slash command
    "/")
        # Show available slash commands
        echo -e "/apps\n/win\n/run\n/ssh\n/power\n/calc\n/emoji\n/help\n/clipboard\n/wifi\n/bluetooth" | rofi -dmenu -i -p "Commands" -mesg "Available slash commands"
        ;;
    "")
        # Empty input, exit
        exit 0
        ;;
    *)
        # If input doesn't match any command, treat it as a search in drun
        rofi -show drun -filter "$input"
        ;;
esac

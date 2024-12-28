#!/bin/bash

# Epic Shell Toolkit
# Author: [Lethabo Semenya]
# Description: A simple shell script with cool tools for productivity and fun.

# Display the main menu
show_menu() {
    echo "========================="
    echo "🌟 Epic Shell Toolkit 🌟"
    echo "========================="
    echo "1. Backup Files"
    echo "2. Monitor System"
    echo "3. Search & Organize Files"
    echo "4. Fun ASCII Art"
    echo "5. Exit"
    echo -n "👉 Choose an option (1-5): "
}


backup_files() {
    echo "📂 Enter the source directory for backup:"
    read source_dir
    echo "📦 Enter the destination directory for backup:"
    read dest_dir
    mkdir -p "$dest_dir"
    cp -r "$source_dir"/* "$dest_dir"
    echo "✅ Backup completed from $source_dir to $dest_dir!"
}

# Monitor System Function
monitor_system() {
    echo "📊 System Performance:"
    echo "----------------------"
    echo "🔧 CPU Usage:"
    top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}'
    echo "🧠 Memory Usage:"
    free -h
    echo "💾 Disk Usage:"
    df -h
}

# Search and Organize Files Function
search_organize() {
    echo "📂 Enter the directory to organize:"
    read dir
    if [ ! -d "$dir" ]; then
        echo "❌ Directory not found!"
        return
    fi
    for file in "$dir"/*; do
        ext="${file##*.}"
        mkdir -p "$dir/$ext"
        mv "$file" "$dir/$ext/"
    done
    echo "✅ Files organized by type in $dir!"
}

# ASCII Art Fun Function
ascii_fun() {
    echo "😄 Choose your ASCII art:"
    echo "1. Dragon"
    echo "2. Cat"
    echo "3. Surprise Me"
    read art_choice
    case $art_choice in
        1) 
            echo "🐉  Here's your epic dragon:"
            echo "       __====-_  _-====__"
            echo "  _--^^^#####//      \\#####^^^--_"
            ;;
        2) 
            echo "🐱  Here's a cute cat:"
            echo " /\_/\ "
            echo "( o.o )"
            echo " > ^ <"
            ;;
        3) 
            echo "🎉 Surprise! You're awesome! 🎉"
            ;;
        *) 
            echo "❌ Invalid choice!"
            ;;
    esac
}

# Main Script Logic
while true; do
    show_menu
    read choice
    case $choice in
        1) backup_files ;;
        2) monitor_system ;;
        3) search_organize ;;
        4) ascii_fun ;;
        5) echo "👋 Goodbye!"; exit 0 ;;
        *) echo "❌ Invalid choice! Try again." ;;
    esac
done

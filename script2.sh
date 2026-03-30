#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Aditya kumar (24BCE10899)
# Software Choice: git

# Setting the package as the Git
PACKAGE="git"

echo "--- Commencing Package Inspection for: $PACKAGE ---"

# --- Package Installation Check ---
# We use 'dpkg -l' instead of 'rpm' because Ubuntu is a Debian-based system
if dpkg -l | grep -q "^ii  $PACKAGE "; then
    echo "Status: $PACKAGE is successfully installed on this system."
    echo "----------------------------------------------------"

    # 'apt show' retrieves the package metadata
    # We pipe (|) the output to 'grep -E' to filter only for Version and Homepage
    # '2>/dev/null' hides any unnecessary error messages from the console
    apt show $PACKAGE 2>/dev/null | grep -E 'Version|Homepage|Download-Size'

    echo "----------------------------------------------------"
else
    # This block executes if the package is not found in the dpkg database
    echo "Status: $PACKAGE is NOT currently installed."
    echo "Action: You can install it using 'sudo apt install $PACKAGE'"
fi

# --- TODO: Add a case statement that prints a one-line ---
# --- TODO: Add your software and 3 others ---
# Using a 'case' structure to provide context based on the software name
case $PACKAGE in
    "httpd" | "apache2")
        # Note for Apache Web Server
        echo "Philosophy: Apache - The web server that built the open internet." ;;
    "mysql" | "mysql-server")
        # Note for MySQL Database
        echo "Philosophy: MySQL - Open source at the heart of millions of apps." ;;
    "git")
        # Specific note for your chosen software: Git
        echo "Philosophy: Git - The tool Linus built when proprietary failed him." ;;
    "vlc")
        # Note for VLC Media Player
        echo "Philosophy: VLC - A student-led project that plays anything." ;;
    "firefox")
        # Note for Firefox Browser
        echo "Philosophy: Firefox - A nonprofit fighting for an open web." ;;
    *)
        # Default case if the package doesn't match the list above
        echo "Philosophy: This is a valuable component of the FOSS ecosystem." ;;
esac
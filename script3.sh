#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Aditya kumar (24BCE10899)
# Software Choice: Git

# --- Array Definition ---
# List of critical system paths to audit as per project requirements
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=========================================="
echo "    SYSTEM DIRECTORY AUDIT REPORT         "
echo "=========================================="

# --- Main Audit Loop (Unit 2 Concept: For Loop) ---
# Iterating through each path defined in the DIRS
for DIR in "${DIRS[@]}"; do
    # Checking if the directory actually exists on this Ubuntu system
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Displaying the collected data in a structured format
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        # Error handling if a directory is missing
        echo "$DIR does not exist on this system"
    fi
done

# --- TODO: Software Specific Config Audit ---
# Fulfilling the requirement to check the software's config directory
# For Git, the system-wide configuration is usually in /etc/gitconfig
GIT_CONFIG="/etc/gitconfig"

echo ">>> Conducting Specific Audit for: Git Configuration <<<"

if [ -f "$GIT_CONFIG" ]; then
    # Extracting permissions specifically for the Git config file
    CONF_PERMS=$(ls -l "$GIT_CONFIG" | awk '{print $1}')
    echo "Git System Config ($GIT_CONFIG) exists."
    echo "Permissions: $CONF_PERMS"
else
    # If /etc/gitconfig doesn't exist, check the user's local .gitconfig
    LOCAL_GIT="$HOME/.gitconfig"
    if [ -f "$LOCAL_GIT" ]; then
        LOCAL_PERMS=$(ls -l "$LOCAL_GIT" | awk '{print $1}')
        echo "Local Git Config ($LOCAL_GIT) found."
        echo "Permissions: $LOCAL_PERMS"
    else
        echo "Git configuration file not detected in standard locations."
    fi
fi
echo "=========================================="
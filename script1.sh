#!/bin/bash
# Script 1: System Identity Report
# Author: Aditya kumar (24BCE10899)
# Course: Open Source Software
# Software Choice: Git

# --- Variables ---
# Specific details for audit
STUDENT_NAME="Aditya kumar"
SOFTWARE_CHOICE="Git"

# --- System info ---
# Capturing real-time system data using command substitution
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)

# --- Completed TODOS ---
# 1. Distro Name: Using the lsb_release to specifically identify Ubuntu
DISTRO=$(lsb_release -ds)
# 2. Date: Formatted for readability
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# --- Display ---
# Formatting the output for the report screenshot
echo "=========================================="
echo "   Open Source Audit - $STUDENT_NAME      "
echo "=========================================="
echo "Chosen Software  : $SOFTWARE_CHOICE"
echo "------------------------------------------"
echo "Operating System : $DISTRO"
echo "Kernel Version   : $KERNEL"
echo "Current User     : $USER_NAME"
echo "Home Directory   : $HOME"
echo "System Uptime    : $UPTIME"
echo "Current Date/Time: $CURRENT_DATE"
echo "------------------------------------------"
# 3. License Message: Added as per requirements
echo "Note: This OS is covered by the GNU GPL License."
echo "=========================================="
#!/bin/bash
# Script 4: Log File Analyzer
# Author: Aditya kumar (24BCE10899)
# Usage: ./script4.sh /path/to/logfile [keyword]

# --- Argument Handling ---
# The first argument ($1) is the log file to analyze
LOGFILE=$1
# The second argument ($2) is the keyword, defaulting to 'error'
KEYWORD=${2:-"error"}      # Default keyword is error
COUNT=0

# --- File Validation ---
# Checking if the user provided a file and if it exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: The log file '$LOGFILE' not found."
    exit 1
fi

# --- TODO: Do-While Style Retry Logic ---
# If the file is empty, we wait and check again (simulating a do-while)
while [ ! -s "$LOGFILE" ]; do
    echo "File is currently empty. Retrying in 2 seconds..."
    sleep 2
done

echo "--- Analyzing $LOGFILE for keyword: '$KEYWORD' ---"

# --- Main Processing Loop (Unit 2 & 5 Concept) ---
# 'while read' processes the file line-by-line efficiently
# IFS= prevents leading/trailing whitespace from being trimmed
while IFS= read -r LINE; do
    # 'grep -iq' checks for the keyword (case-insensitive and quiet)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Incrementing the counter variable
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Output Summary ---
echo "----------------------------------------------------"
echo "Search Complete."
echo "Total occurrences of '$KEYWORD': $COUNT"

# --- TODO: Print last 5 matching lines ---
# Using tail and grep to show the most recent relevant entries
if [ $COUNT -gt 0 ]; then
    echo "----------------------------------------------------"
    echo "Last 5 matching entries found:"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
fi

echo "===================================================="
#!/bin/bash

# Define the log file
LOGFILE="/path/to/your/logfile.log"

# Define the report file
REPORTFILE="/path/to/your/reportfile.txt"

# Initialize the report file
echo "Error Report - $(date)" > $REPORTFILE

# Function to parse the log file
parse_log() {
    # Loop through each line in the log file
    while IFS= read -r line
    do
        # Check if the line contains the word "error"
        if [[ $line == *"error"* ]]; then
            # If an error is found, append it to the report file
            echo "$line" >> $REPORTFILE
        fi
    done < "$LOGFILE"
}

# Call the function to parse the log file
parse_log

echo "Log analysis complete. Report generated at $REPORTFILE."

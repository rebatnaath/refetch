#!/bin/bash

# Define the script and destination directory
SCRIPT_NAME="refetch.sh"
DESTINATION_DIR="/usr/local/bin"
SYMLINK_NAME="refetch"

# Check if the script is executable
if [ ! -x "$SCRIPT_NAME" ]; then
    echo "Error: $SCRIPT_NAME is not executable."
    exit 1
fi

# Copy the script to the destination directory
cp "$SCRIPT_NAME" "$DESTINATION_DIR"

# Create a symbolic link without the .sh extension
ln -s "$DESTINATION_DIR/$SCRIPT_NAME" "$DESTINATION_DIR/$SYMLINK_NAME"

# Make the script and symlink executable
chmod +x "$DESTINATION_DIR/$SCRIPT_NAME"
chmod +x "$DESTINATION_DIR/$SYMLINK_NAME"

echo "Installation completed! You can now run 'refetch' from anywhere."


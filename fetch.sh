#!/bin/bash

# Source files and destination folder
data_src="/home/sona/.config/joplin-desktop/database.sqlite"
resource_src="/home/sona/.config/joplin-desktop/resources"
dst="/home/sona/joplin"

# Copy the files
sudo cp "$data_src" "$dst"
sudo cp -r "$resource_src" "$dst"

# Check the exit status of the cp commands
if [ $? -eq 0 ]; then
    # Check if the files exist in the destination folder
    if [ -e "${dst}/$(basename "$data_src")" ] && [ -e "${dst}/$(basename "$resource_src")" ]; then
        echo "All resources copied successfully to $dst"
    else
        echo "Error: Files do not exist in $dst"
    fi
else
    echo "Error: File copy failed"
fi

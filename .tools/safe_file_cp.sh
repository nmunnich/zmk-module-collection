#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <target_directory>"
    exit 1
fi

SOURCE_FILE="$1"
TARGET_DIR="$2"
TARGET_FILE="$TARGET_DIR/$(basename "$SOURCE_FILE")"

# Check if source directory exists
if [ -f "$TARGET_FILE" ]; then
    echo "Error: Duplicate .zmk.yml file found in target directory: $TARGET_FILE"
    echo "Please ensure your module does not duplicate names with an existing module."
    exit 1
fi

cp $SOURCE_FILE $TARGET_FILE
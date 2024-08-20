#!/bin/bash

# Path to store the current superspace
SUPERS_FILE=~/.config/sway/superspace

# Read the desired superspace (first argument)
SUPERS=$1

# Read the previous subspace from the file, if it exists
if [ -f "$SUPERS_FILE" ]; then
    SUBSPACE=$(cat "$SUPERS_FILE")
else
    SUBSPACE=1  # Default to subspace 1 if not set
fi

# Store the current superspace
echo "$SUPERS" > "$SUPERS_FILE"

# Switch to the new workspace
swaymsg workspace "$SUPERS-$SUBSPACE"


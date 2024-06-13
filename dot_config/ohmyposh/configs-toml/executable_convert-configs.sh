#!/bin/bash

# Directory containing the JSON configuration files
CONFIG_DIR="./" # Change this to your directory if needed

# Create an output directory for the TOML files
OUTPUT_DIR="./configs-toml" # Change this to your desired output directory
mkdir -p "$OUTPUT_DIR"

# Loop through each .omp.json file in the specified directory
for file in "$CONFIG_DIR"*.omp.json; do
  # Get the base name of the file (without directory and extension)
  base_name=$(basename "$file" .omp.json)

  # Define the final output file path
  final_output_file="$OUTPUT_DIR/$base_name.toml"

  # Convert the JSON file to TOML format using oh-my-posh
  oh-my-posh config export --format toml --config "$file" --output "$final_output_file"

  echo "Converted $file to $final_output_file"
done

echo "All files converted successfully!"

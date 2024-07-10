#!/bin/bash

# Define the output directory
output_dir="output"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Move files ending with ".xvg", ".pdf", or ".txt" into the output directory
mv *.xvg *.pdf *.txt "$output_dir/"


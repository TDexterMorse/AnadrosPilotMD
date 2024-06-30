#!/bin/bash

# Check if input filename is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <pdbqtfilename>"
    exit 1
fi

# Input filename provided by user
input_file="$1"


# Function to extract rank number from filename
extract_rank_number(){
    echo "$1" | grep -oE '_Rank[0-9]+' | sed 's/_Rank//'
}


# Function to extract protein name from filename
extract_protein_name(){
    echo "$1" | cut -d '_' -f 1
}

# Function to extract ligand name from filename
extract_ligand_name(){
    echo "$1" | cut -d '_' -f 2
}

# Extract pocket rank from input filename
rank_number=$(extract_rank_number "$input_file")

# Extract protein name from input filename
protein_name=$(extract_protein_name "$input_file")

# Extract ligand name from input filename
ligand_name=$(extract_ligand_name "$input_file")

# Initialize variables for model and output file
model=""
output_file=""

# Read the input file line by line
while IFS= read -r line; do
    # Check if the line contains "MODEL" indicating the start of a new model
    if [[ $line == MODEL* ]]; then
        # Extract the model number
        model=$(echo "$line" | cut -d ' ' -f 2)
        # Set the output filename based on model number
        output_file="M${model}_R${rank_number}_${protein_name}_${ligand_name}.pdbqt"
        # Create a new file for the current model
        touch "$output_file"
    fi
    
    # Append the current line to the output file
    echo "$line" >> "$output_file"
done < "$input_file"


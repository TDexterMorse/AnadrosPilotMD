#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ligand.pdb>"
    exit 1
fi

# Assign arguments to variables
ligand_pdb="$1"

# Find the starting value
start_value=$(awk '/^ATOM/{print $2; exit}' "$ligand_pdb")

# Check if start value is found
if [ -z "$start_value" ]; then
    echo "Start value not found in $ligand_pdb"
    exit 1
fi

# Add start value to CONECT lines
awk -v start="$start_value" '/^CONECT/ { 
    for(i=2; i<=NF; i++) {
        $i += start-1
    } 
} 1' "$ligand_pdb" > temp.pdb

# Rename temp.pdb to the original file
mv temp.pdb "$ligand_pdb"

echo "CONECT lines updated in $ligand_pdb"


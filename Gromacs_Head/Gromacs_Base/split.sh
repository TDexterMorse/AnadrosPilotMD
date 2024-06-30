#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <protein.pdb> <ligand_identifier>"
    exit 1
fi

# Assign arguments to variables
protein_pdb="$1"
ligand_identifier="$2"
protein_basename=$(basename "$protein_pdb" .pdb)

# Check if protein.pdb file exists
if [ ! -f "$protein_pdb" ]; then
    echo "Error: $protein_pdb not found."
    exit 1
fi

# Run the command to grep the ligand and save it to a new file
grep "$ligand_identifier" "$protein_pdb" > "${ligand_identifier}.pdb"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "Ligand ${ligand_identifier} extracted and saved as ${ligand_identifier}.pdb"
else
    echo "Error occurred while extracting ligand ${ligand_identifier}."
fi

# Run the command to grep the ligand and save it to a new file
grep -v "$ligand_identifier" "$protein_pdb" > "${protein_basename}_Clean.pdb"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "Protein file ${protein_pdb} copied without lines containing ${ligand_identifier} and saved as ${ligand_identifier}_Clean.pdb"
else
    echo "Error occurred while copying protein file without lines containing ${ligand_identifier}."
fi


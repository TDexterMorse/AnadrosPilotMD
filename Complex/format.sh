#!/bin/bash

# Check if the script is being run in the correct directory
if [ ! -d "." ]; then
    echo "Please run this script in the directory containing the files."
    exit 1
fi

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <protein.pdb> <ligand.pdb>"
    exit 1
fi

protein_pdb="$1"
ligand_pdb="$2"

# Extracting basenames
protein_basename=$(basename "$1" .pdb)
ligand_basename=$(basename "$2" .pdb)

# Check if the provided files exist
if [ ! -f "$protein_pdb" ]; then
    echo "Protein PDB file not found."
    exit 1
fi

if [ ! -f "$ligand_pdb" ]; then
    echo "Ligand PDB file not found."
    exit 1
fi

./extract_models2.sh *Rank*.pdbqt

# Read in all M1_R*.pdbqt files
pdbqt_files=(M*_R*.pdbqt)

if [ ${#pdbqt_files[@]} -eq 0 ]; then
    echo "No M*_R*.pdbqt files found."
    exit 1
fi

# Loop through each M1_R1*.pdbqt file
for pdbqt_file in "${pdbqt_files[@]}"; do
    # Run coordinates.sh and combine.py
    name=$(basename "$pdbqt_file" .pdbqt)
    
    # Debug statement to check name
    echo "Extracted name: $name"

    ./coordinates.sh "$ligand_pdb" "$pdbqt_file"
    ./combine.py coordinates.txt modified_ligand.pdb "$protein_pdb"
    ./reframe.py ligand_clean.csv ligand_clean.pdb
    ./complex.sh "$protein_pdb"
#    tail -n 50 complex.pdb
    mv complex.pdb "${name}_${protein_basename}_Complex.pdb"
    echo "Renamed complex.pdb to ${name}_${protein_basename}_Complex.pdb"
done


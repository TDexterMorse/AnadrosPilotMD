#!/bin/bash

# Check if protein file is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <protein_pdb_file>"
    exit 1
fi

# Protein PDB file and ligand PDB files pattern
protein_file="$1"
ligand_pattern="ligand_clean.pdb"


# Check if the protein file exists
if [ ! -f "$protein_file" ]; then
    echo "Protein PDB file not found: $protein_file"
    exit 1
fi

# Read protein PDB file
protein_content=$(<"$protein_file")

# Find the line number for the insertion point (third line from the end)
insertion_point=$(($(wc -l < "$protein_file") - 2))

# Split protein content
upper_part=$(echo "$protein_content" | head -n $insertion_point)
lower_part=$(echo "$protein_content" | tail -n 2)

# Loop through ligand files
for ligand_file in $ligand_pattern; do
    # Extract ligand name from ligand file name
    ligand_name=$(basename "$ligand_file" _clean.pdb)
    protein_name=$(basename "$protein_file" .pdb)
    # Read ligand content
    ligand_content=$(<"$ligand_file")

    # Name the complex file based on ligand name and protein name
    complex_name="complex.pdb"

    # Append complex content to file
    printf "%s\n%s\n%s\n" "$upper_part" "$ligand_content" "$lower_part" >> "$complex_name"

    echo "Complex created: $complex_name"
done

echo "All complexes created successfully."


#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ligand.pdb>"
    exit 1
fi

# Assign arguments to variables
ligand_pdb="$1"

base_name=$(basename "$ligand_pdb" .pdb)

out="$base_name.mol2"

#Run obabel
echo "Protonate the Ligand Molecule"

#Causes translation events, used for debugging
#obabel "$ligand_pdb" -O "$out" --gen3D --connect

#Requires explicit bond parameters
obabel "$ligand_pdb" -O "$out" -p 7

#Post Process (Hydrogen addition order corrections and slight structural rearrangement)

perl -s -pe 's/\bUN\w*/substr($ligand_pdb, 0, 3)/ge' -- -ligand_pdb="$ligand_pdb" "$out" > delete_me.mol2

perl sort_mol2_bonds.pl delete_me.mol2 delete_me.mol2

mv delete_me.mol2 $out

echo "Formatted .mol2 file outputted as: " "$out"

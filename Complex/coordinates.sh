#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <ligand.pdb> <ligand.pdbqt"
    exit 1
fi

ligand_pdb="$1"
ligand_pdbqt="$2"
ligand_name=$(basename "$ligand_pdb" _clean.pdb)
ligand_pdbqt_name=$(basename "$ligand_pdbqt" .pdbqt)
#ligand_prefix=$(echo "$ligand_name" | cut -c1-3)
# Extract ligand name from REMARK Name line
#ligand_prefix=$(awk '/^REMARK  Name = /{print $4}' "$ligand_pdbqt" | cut -c 1-3)

#ligand_prefix=$(basename "$ligand_pdb" .pdb)

ligand_prefix=$(basename "$ligand_pdb" .pdb | cut -c 1-3)

modified_ligand_pdb_name="${ligand_pdbqt_name}_modified_ligand.pdb"


# Remove CONECT lines, lines starting with AUTHOR or COMPND, and replace UNL with ML233 in ligand file
sed '/^CONECT/d;/^AUTHOR/d;/^COMPND/d;/^UNL/d;/^MASTER/d;/^END/d;' "$ligand_pdb" | sed "s/UNL/$ligand_prefix	A/g" > "modified_ligand.pdb"



#cat modified_ligand.pdb

awk '$1 == "ATOM" {printf "%8.3f %8.3f %8.3f\n", $6, $7, $8}' "$ligand_pdbqt" > "coordinates.txt"

#cat coordinates.txt

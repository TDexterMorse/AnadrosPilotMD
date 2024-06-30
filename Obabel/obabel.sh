#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <protein.pdb> <ligand.mol>"
    exit 1
fi

protein_pdb="$1"
ligand_mol="$2"

# Define output filenames based on input filenames
protein_pdbqt="${protein_pdb%.*}.pdbqt"
ligand_pdb="${ligand_mol%.*}.pdb"
ligand_pdbqt="${ligand_mol%.*}.pdbqt"

# Convert protein.pdb to protein.pdbqt
obabel -ipdb "$protein_pdb" -opdbqt -O "$protein_pdbqt" -r

# Convert ligand.mol to ligand.pdb
obabel "$ligand_mol" -O "$ligand_pdb"


# Convert ligand.pdb to ligand.pdbqt
obabel -ipdb "$ligand_pdb" -opdbqt -O "$ligand_pdbqt" -r

obabel -ipdb "$ligand_pdb" -opdbqt -O temp.pdbqt -r

obabel -ipdbqt "temp.pdbqt" -opdb -O temp.pdb 

./extract_bonds.sh

grep -v '^REM' "temp.pdb" > temp2.pdb

mv "temp2.pdb" "$ligand_pdb"
rm temp*

echo "Conversion complete."



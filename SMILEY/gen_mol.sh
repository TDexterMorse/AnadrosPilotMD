#!/usr/bin/env python3

import sys
#sys.path.append('/home/ubuntu/.local/lib/python3.10/site-packages')
from rdkit import Chem
from rdkit.Chem import AllChem

def generate_mol2(molecule_name, smiles):
    # Convert SMILES to RDKit molecule object
    mol = Chem.MolFromSmiles(smiles)
    if mol is None:
        print("Error: Invalid SMILES string.")
        sys.exit(1)

    # mol = Chem.AddHs(mol)
    # Generate 3D coordinates
    AllChem.EmbedMolecule(mol)

    # Convert RDKit molecule to MOL2 format
    molblock = Chem.MolToMolBlock(mol)

    # Write MOL2 representation to a file
    filename = molecule_name + ".mol"
    with open(filename, "w") as f:
        f.write(molblock)
    print(f"MOL file '{filename}' generated successfully.")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: ./script.py <molecule_name> <smiles_string>")
        sys.exit(1)
    
    molecule_name = sys.argv[1]
    smiles = sys.argv[2]
    
    # Input checks
    if not all(c.isalnum() or c in ['_', '-'] for c in molecule_name):
        print("Error: Molecule name must contain only alphanumeric characters, underscores, or dashes.")
        sys.exit(1)
    
    generate_mol2(molecule_name, smiles)

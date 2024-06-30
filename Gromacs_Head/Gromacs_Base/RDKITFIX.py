#!/usr/bin/env python3

import sys
sys.path.append('/home/ubuntu/.local/lib/python3.10/site-packages')
from rdkit import Chem
from rdkit.Chem import AllChem

# Load molecule
mol = Chem.MolFromMol2File('input.mol2')

# Detect disconnected fragments
fragments = Chem.GetMolFrags(mol, asMols=True)

# Reconnect bonds for each disconnected fragment
for fragment in fragments:
    # Get a list of all atom pairs that are not connected
    disconnected_bonds = fragment.GetSubstructMatches(Chem.MolFromSmarts('[*]-[*]'))
    for bond_atoms in disconnected_bonds:
        # Determine the atoms involved in the disconnected bond
        atom1_idx, atom2_idx = bond_atoms
        # Add the bond between atom1 and atom2
        bond_order = Chem.BondType.SINGLE  # Adjust as needed
        mol.AddBond(atom1_idx, atom2_idx, bond_order)

# Export to Mol2
Chem.MolToMol2File(mol, 'output.mol2')

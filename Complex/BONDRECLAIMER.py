from rdkit import Chem

def read_pdbqt_file(file_path):
    mols = []
    with open(file_path, 'r') as file:
        lines = file.readlines()
        current_mol_lines = []
        for line in lines:
            if line.startswith('MODEL') or line.startswith('ATOM'):
                current_mol_lines.append(line)
            elif line.startswith('ENDMDL'):
                mol = Chem.MolFromPDBBlock(''.join(current_mol_lines))
                if mol:
                    mols.append(mol)
                current_mol_lines = []
    return mols

def write_pdb_file(mol, output_file):
    with open(output_file, 'a') as file:
        file.write(Chem.MolToPDBBlock(mol))

def main():
    input_file = 'M1_R1_CP1.pdbqt'
    output_file = 'bondout.pdb'

    # Read PDBQT file
    mols = read_pdbqt_file(input_file)

    # Write PDB file
    for idx, mol in enumerate(mols):
        write_pdb_file(mol, output_file)

if __name__ == '__main__':
    main()


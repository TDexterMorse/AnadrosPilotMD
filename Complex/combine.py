#!/usr/bin/env python

import warnings
import sys
sys.path.append('/home/ubuntu/miniconda3/lib/python3.12/site-packages')

import pandas as pd

warnings.filterwarnings("ignore", message="Setting an item of incompatible dtype")


def read_coordinates(file_path):
    """
    Read coordinates from a text file into a pandas DataFrame.
    """
    coordinates = pd.read_csv(file_path, sep='\s+', header=None, names=['x', 'y', 'z'])
    return coordinates

def read_pdb(file_path):
    """
    Read PDB data from a text file into a pandas DataFrame.
    """
    df = pd.read_csv(file_path, header=None, sep='\s+')
    return df

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: ./script.py coordinates.txt modified_ligand.pdb protein.pdb")
        sys.exit(1)

    coordinates_file = sys.argv[1]
    pdb_file = sys.argv[2]
    protein_file = sys.argv[3]
    pdb_df = read_pdb(pdb_file)

    # Read the protein file
    with open(protein_file, 'r') as file:
        last_atom_line = None
        for line in file:
            if line.startswith('ATOM'):
                last_atom_line = line

    # Print the last line that begins with "ATOM"
    if last_atom_line:
        last_atom_values = last_atom_line.strip().split()
        df = pd.DataFrame([last_atom_values])
#        print(df)
    # Extracting the second element of df
        multiplier = pd.to_numeric(df.iloc[0, 1])
        multiplier = multiplier.astype(int)
 #       print(multiplier)
    # Multiplying each row of pdb_df by the multiplier
        pdb_df.iloc[:, 1] += multiplier

    # Repeating the 6th element of df
        repeated_value = df.iloc[0, 5]
        repeated_value = int(repeated_value) + 1
        repeated_column = [repeated_value] * len(pdb_df)
  #      print(repeated_column)
    # Inserting the repeated value between columns 4 and 5 in pdb_df
        pdb_df.insert(5, 'Repeated_Value', repeated_column)
        pdb_df.drop(pdb_df.columns[6], axis=1, inplace=True)
#        print("BEFORE")
#        print(pdb_df)
    else:
        print("No line starting with 'ATOM' found in the protein file.")

    coordinates_df = read_coordinates(coordinates_file)

    # Replace columns 5, 6, and 7 in pdb_df with x, y, and z from coordinates_df
    pdb_df.iloc[:, 6:9] = coordinates_df.iloc[:, :3]
#    print("AFTER")
#    print(pdb_df)
    # Write the updated DataFrame to a new PDB file
    pdb_df.to_csv('ligand_clean.csv', sep='\t', index=False, header=False)
    print("Updated PDB file 'ligand_clean.csv' created successfully.")

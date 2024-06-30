#!/usr/bin/env python3


import pandas as pd
import sys

def read_gro_file(filename):
    # Read lines from the file, ignoring the first two comment lines and the last line
    with open(filename, 'r') as f:
        lines = f.readlines()[2:-1]
    
    # Extract data into separate lists
    atom_numbers = []
    atom_names = []
    coordinates = []
    for line in lines:
        parts = line.split()
        atom_numbers.append(int(parts[2]))
        atom_names.append(parts[1])
        coordinates.append([float(coord) for coord in parts[3:]])
    
    # Create a DataFrame
    df = pd.DataFrame({
        'AtomNumber': atom_numbers,
        'AtomName': atom_names,
        'Coordinates': coordinates
    })
    return df

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python script.py input.gro")
        sys.exit(1)
    
    input_file = sys.argv[1]
    df = read_gro_file(input_file)
    
    # Filter and count elements of the 'AtomName' column that are exactly 'N' or 'O'
    filtered_names = df[df['AtomName'].isin(['N', 'O'])]['AtomName']
    print("Filtered rows:")
    print(filtered_names)
    
    # Count the number of rows in the filtered DataFrame
    num_rows = len(filtered_names)
    print(f"Number of rows with 'N' or 'O': {num_rows}")


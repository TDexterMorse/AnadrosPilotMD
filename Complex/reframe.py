#!/usr/bin/env python

import csv
import sys

def reformat_csv(input_file, output_file):
    with open(input_file, 'r') as f:
        reader = csv.reader(f, delimiter='\t')  # Specify tab as the delimiter
        #next(reader)  # Skip header if present
        lines = list(reader)

    reformatted_lines = []
    for line in lines:
        # Extract columns from the CSV line
        hetatm, serial_number, atom_name, residue_name, chain_id, residue_seq_num, x, y, z, occupancy, temp_factor, element_symbol = line

        # Convert x, y, and z to floats
        x, y, z = map(float, (x, y, z))
        space = " "
        # Reformat the columns according to the PDB convention
        reformatted_line = ""
        for column in [
            {"name": "hetatm", "width": 7, "justify": "<"},
            {"name": "serial_number", "width": 6, "justify": "<"},
            {"name": "atom_name", "width": 4, "justify": "<"},
            {"name": "residue_name", "width": 4, "justify": "<"},
            {"name": "chain_id", "width": 2, "justify": ""},
            {"name": "residue_seq_num", "width": 4, "justify": "<"},
            {"name": "x", "width": 11, "justify": ">"},
            {"name": "y", "width": 8, "justify": ">"},
            {"name": "z", "width": 8, "justify": ">"},
            {"name": "space", "width": 2, "justify": ""},
            {"name": "occupancy", "width": 5, "justify": "<"},
            {"name": "temp_factor", "width": 15, "justify": "<"},
            {"name": "element_symbol", "width": 2, "justify": ">"}
        ]:
            value = locals()[column["name"]]
            width = column["width"]
            justify = column["justify"]
            reformatted_line += f"{value:{justify}{width}}"
        reformatted_line += "\n"
 
        reformatted_lines.append(reformatted_line)

    with open(output_file, 'w') as f:
        f.writelines(reformatted_lines)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py input.csv output.pdb")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    try:
        reformat_csv(input_file, output_file)
        print("Conversion complete.")
    except FileNotFoundError:
        print("Input file not found.")
        sys.exit(1)


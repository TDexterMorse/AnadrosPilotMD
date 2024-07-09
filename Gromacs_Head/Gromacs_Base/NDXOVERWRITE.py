#!/usr/bin/env python3

# Define the input and output file paths
input_file = 'index.ndx'
output_file = 'index.ndx'

# Read the content of the input file
with open(input_file, 'r') as file:
    lines = file.readlines()

# Initialize a list to store extracted data
ligand_complex_data = []

# Flag to check if we are currently reading the ligand complex data
reading_ligand_complex = False

# Iterate through each line in the file
for line in lines:
    line = line.strip()  # Remove leading/trailing whitespace

    if line.startswith('[ Protein ]') or line.startswith('[ non-Protein ]'):  # Check for start of ligand complex data
        reading_ligand_complex = True
    elif line.startswith('['):  # Check for end of ligand complex data
        reading_ligand_complex = False
    else:  # Add line to data if reading
        if reading_ligand_complex:
            ligand_complex_data.extend(line.split())

# Create a new content for the output file
new_content = "[ Protein-Ligand-Complex ]\n"
new_content += " ".join(ligand_complex_data) + "\n"

# Write the new content back to the file
with open(output_file, 'w') as file:
    file.write(new_content)

print(f"Data extracted and saved to {output_file}")

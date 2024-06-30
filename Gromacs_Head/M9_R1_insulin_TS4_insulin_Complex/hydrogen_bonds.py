#!/usr/bin/env python3

import subprocess
import pandas as pd
import os
import sys
import numpy as np
import copy
import json
import glob


# Check if the correct number of arguments are provided
if len(sys.argv) != 2:
    print("Usage: python resid_dist.py <ligand_indicator>")
    sys.exit(1)  # Exit the script with an error code

ligand_indicator = sys.argv[1]  # Get the ligand indicator from command line arguments


# Define the input topology file
top_file = "gromacs.top"


# Remove files in the local environment matching specific patterns
files_to_remove = ["#*#", "angle_atoms.ndx", "angle.xvg"]

for pattern in files_to_remove:
    files = glob.glob(pattern)
    for file in files:
        os.remove(file)


# Read the topology file and count the occurrences of "; residue"
with open(top_file, 'r') as f:
    residue_count = sum(1 for line in f if "; residue" in line)

# Subtract 1 from the residue count
previous_residue = residue_count - 1

# Print the previous residue index
print(f"Calculating the Average Residue Distances from Ligand (...Processing...)")


# Define input files
xtc_file = "md_0_10_center.xtc"
tpr_file = "md_0_10.tpr"
temp_output = "temp.xvg"
#temp_clean = "temp_clean.xvg"
# Create an empty DataFrame to hold the data
#result_df = pd.DataFrame()
dfs_to_concat = []


# Loop through residue indices from 1 to 472
for residue in range(1, residue_count):
    # Run gmx pairdist and save output to temporary file
    command = f"gmx pairdist -f {xtc_file} -s {tpr_file} -o {temp_output} -tu ps -selrpos res_com -refgrouping res -selgrouping res -ref 'resname {ligand_indicator}' -sel 'resid {residue}'"
    #subprocess.run(command, shell=True, check=True)
    subprocess.run(command, shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

# Read the input file, skip lines starting with '#' or '@', and store data in a list
    temp_data = []
    with open(temp_output, 'r') as infile:
        for line in infile:
            if not line.startswith('#') and not line.startswith('@'):
                temp_data.append(line.split())

    # Create a DataFrame from the collected data and append it to the list
    temp_df = pd.DataFrame(temp_data, columns=['Atom', 'Distance'])
    dfs_to_concat.append(temp_df[['Distance']].astype(float).rename(columns={'Distance': f"Residue {residue}"}))

    # Remove the temporary output file
    os.remove(temp_output)

result_df = pd.concat(dfs_to_concat, axis=1)

# Print the concatenated DataFrame
#print(result_df.head())


# Calculate the average of each column
column_averages = result_df.mean(axis=0)

# Find the ten residues with the lowest average
lowest_average_residues = column_averages.nsmallest(20)

residue_numbers = [int(col.split()[1]) for col in lowest_average_residues.index]


# Print the column averages and the ten residues with the lowest average
#print("\nTen residues with the lowest average:")
#print(lowest_average_residues)
#print(residue_numbers)






print(f"Finding Potential Hydrogen Bond Pairs in Protein (...Processing...)")



topology_file = "gromacs.top"
#residue_numbers = [19, 18, 17, 11, 8, 16, 7, 4, 15, 12]

atom_compare = []  # Initialize an empty list to store elements

with open(topology_file, 'r') as f:
    lines = f.readlines()

found_residue = False  # Flag to indicate whether "; residue" is found

for line in lines:
    if found_residue:
        if line.strip() and not line.startswith(';'):  # Check if line is not empty and doesn't start with ";"
            elements = line.split()
            if len(elements) >= 3 and int(elements[2]) in residue_numbers and any(char in elements[1] for char in ['N', 'O']):  # Check if the third element is in the list and if the second element contains 'N' or 'O'
                #print(line.strip())  # Print the line
                #print(elements[0])
                atom_compare.append(elements[0])  # Append the desired element to the list  
        elif not line.strip():  # Stop printing when encountering a blank line
            break
    elif line.startswith('; residue'):
        found_residue = True  # Set flag to start printing lines after finding "; residue"







print(f"Finding Potential Hydrogen Bond Pairs in Ligand (...Processing...)")


gro_file = "gromacs.gro"
ligand_atom_compare = []  # Initialize an empty list to store elements

with open(gro_file, 'r') as f:
    lines = f.readlines()

for line in lines:
    elements = line.split()  # Split the line into elements
    if len(elements) >= 3 and ('N' in elements[1] or 'O' in elements[1]) and ligand_indicator in line:
        ligand_atom_compare.append(elements[2])  # Append the third element to the list


#print(ligand_atom_compare)
#print(atom_compare)

print(f"Calculating Distance Between Potential Pairs (...Processing...)")

ligand_atoms = ligand_atom_compare
possible_hb_atoms = atom_compare

# Command using a here document to provide input interactively
command = "rm index.ndx"

subprocess.run(command, shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

# Command using a here document to provide input interactively
command = '''
gmx make_ndx -f md_0_10.tpr -o index.ndx <<EOF
q
EOF
'''

subprocess.run(command, shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)


temp_output = "temp.xvg"
temp_clean = "temp_clean.xvg"
result_df_list = []

for ligand_atom in ligand_atoms:
    result_df = pd.DataFrame()
    for hb_atom in possible_hb_atoms:
        # Create a temporary file for the distance output
        temp_output = "temp.xvg"
        # Construct the gmx distance command for each ligand atom and possible HB atom
        command = f"gmx distance -s md_0_10.tpr -f md_0_10_center.xtc -n index.ndx -select 'atomnr {ligand_atom} {hb_atom}' -oall {temp_output}"
        subprocess.run(command, shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        # Read the input file, skip lines starting with '#' or '@', and write to a new file
        with open(temp_output, 'r') as infile, open(temp_clean, 'w') as outfile:
            for line in infile:
                if not line.startswith('#') and not line.startswith('@'):
                    outfile.write(line)

        # Read the temporary output file into a DataFrame and extract the desired column
        with open(temp_clean, 'r') as infile:
            data = pd.read_csv(infile, sep='\s+', header=None, index_col=0, comment='@')
            result_df[f"LigandAtom {ligand_atom} ProteinAtom {hb_atom}"] = data[1]  # Assuming the column you want to extract is at index 3 (adjust as needed)
 #           print(data.head())
        # Remove the temporary output file
        os.remove(temp_output)
        os.remove(temp_clean)
    result_df_list.append(result_df
)

concatenated_df = pd.concat(result_df_list, axis=1)
#print(concatenated_df.head())


# Filter columns based on the condition
selected_columns = []
for col in concatenated_df.columns:
    avg = concatenated_df[col].mean()
    if avg < 0.5 or (concatenated_df[col] < 0.5).sum() > 0.5 * len(concatenated_df):
        selected_columns.append(col)

# Create a new DataFrame with selected columns
filtered_df = concatenated_df[selected_columns]

# Print the head of the filtered DataFrame
#print(filtered_df.head())

# Print column names
#print("Column Names:")
#print(filtered_df.columns.tolist())

# Initialize an empty dictionary to store column statistics
column_stats = {}

# Calculate and save average, minimum, and standard error for each column in the dictionary
for column_name in filtered_df.columns:
    column_data = filtered_df[column_name]
    avg = np.mean(column_data)
    min_val = np.min(column_data)
    std_err = np.std(column_data) / np.sqrt(len(column_data))  # Standard error = std deviation / sqrt(n)
    
    # Save statistics in the dictionary
    column_stats[column_name] = {
        'Average': avg,
        'Minimum Value': min_val,
        'Standard Error': std_err
    }

# Print the saved dictionary
#print("Column Statistics:")
#print(column_stats)

# Define the file path for saving the .txt file
file_path = 'column_stats.txt'

# Check if the file exists and delete it if it does
if os.path.exists(file_path):
    os.remove(file_path)
    print(f"Existing file '{file_path}' deleted.")


# Open the file in write mode ('w') and write the statistics in the specified format
with open(file_path, 'w') as file:
    for column_name, stats in column_stats.items():
        # Write the index (column name)
        file.write(f"{column_name}\n")
        # Write the statistics for the column
        for stat_name, stat_value in stats.items():
            file.write(f"{stat_name}: {stat_value}\n")
        # Write an empty line after each column's statistics
        file.write('\n')

# Print a message indicating successful writing to file
print(f"Column statistics saved to {file_path}")


print(f"Rank and Resolve Angles for Potential Bonds (...Processing...)")


statistics_dict = column_stats


# Define the path to the gromacs.gro file
gro_file_path = 'gromacs.gro'

# Loop through each dictionary element
for key in statistics_dict.keys():
    # Extract ligand and protein atom numbers from the key
    ligand_atom_number, protein_atom_number = [int(x) for x in key.split() if x.isdigit()]
    
    # Initialize variables to store line numbers
    ligand_line_number = None
    protein_line_number = None
    
    # Read the gromacs.gro file line by line to search for the specified atom numbers
    with open(gro_file_path, 'r') as gro_file:
        lines = gro_file.readlines()
        for i, line in enumerate(lines[2:-1], 3):  # Start from line 3, ignoring first 2 lines and last line
            # Split the line and check the atom number in the third element
            if len(line.split()) >= 3:
                atom_number = int(line.split()[2])
                if atom_number == ligand_atom_number:
                    ligand_line_number = i
                elif atom_number == protein_atom_number:
                    protein_line_number = i
    
    # Initialize variables to store hydrogen atom numbers
    ligand_hydrogen_atoms = []
    protein_hydrogen_atoms = []

    if ligand_line_number is not None:
        # Define the range of lines to search for hydrogen atoms below the ligand atom
        start_line = ligand_line_number  # Start searching from the line below the ligand atom
        end_line = len(lines)
    
        # Search for hydrogen atoms below the ligand atom within the specified range
        for j in range(start_line, end_line):
            if lines[j].strip():
                # Check if there are enough elements after splitting and if it's a hydrogen atom
                if len(lines[j].split()) > 3 and lines[j].split()[1].startswith('H'):
                    ligand_hydrogen_atoms.append(int(lines[j].split()[2]))  # Add hydrogen atom to ligand's list
                else:
                    break

    
    if protein_line_number is not None:
        # Define the range of lines to search for hydrogen atoms below the protein atom
        start_line = protein_line_number  # Start searching from the line below the protein atom
        end_line = len(lines)
    
        # Search for hydrogen atoms below the protein atom within the specified range
        for j in range(start_line, end_line):
            if lines[j].strip():
                # Check if there are enough elements after splitting and if it's a hydrogen atom
                if len(lines[j].split()) > 3 and lines[j].split()[1].startswith('H'):
                    protein_hydrogen_atoms.append(int(lines[j].split()[2]))  # Add hydrogen atom to protein's list
                else:
                    break
    
    # Update the dictionary with the found hydrogen atoms
    statistics_dict[key]['Ligand Hydrogen Atoms'] = ligand_hydrogen_atoms
    statistics_dict[key]['Protein Hydrogen Atoms'] = protein_hydrogen_atoms

statistics_dict = {key: value for key, value in statistics_dict.items()
                 if value.get('Ligand Hydrogen Atoms') or value.get('Protein Hydrogen Atoms')}



# Initialize lists to store the comparison pairs
pairs = []
categories = []


# Loop through each index and generate the comparison pairs
for key, value in statistics_dict.items():
    ligand_atom, protein_atom = [int(x) for x in key.split() if x.isdigit()]
    ligand_hydrogen_atoms = value['Ligand Hydrogen Atoms']
    protein_hydrogen_atoms = value['Protein Hydrogen Atoms']

    # Generate Ligand Atom to Ligand Hydrogen pairs
    for ligand_hydrogen in ligand_hydrogen_atoms:
        pairs.append(f"{ligand_atom}-{ligand_hydrogen}")
        categories.append("Ligand Atom to Ligand Hydrogen")

    # Generate Ligand Atom to Protein Hydrogen pairs
    for protein_hydrogen in protein_hydrogen_atoms:
        pairs.append(f"{ligand_atom}-{protein_hydrogen}")
        categories.append("Ligand Atom to Protein Hydrogen")

    # Generate Protein Atom to Ligand Hydrogen pairs
    for ligand_hydrogen in ligand_hydrogen_atoms:
        pairs.append(f"{protein_atom}-{ligand_hydrogen}")
        categories.append("Protein Atom to Ligand Hydrogen")

    # Generate Protein Atom to Protein Hydrogen pairs
    for protein_hydrogen in protein_hydrogen_atoms:
        pairs.append(f"{protein_atom}-{protein_hydrogen}")
        categories.append("Protein Atom to Protein Hydrogen")



#print(pairs)



# Initialize an empty dictionary to store key-value pairs of atom to associated hydrogens
associated_hydrogens_dict = {}

# Loop through each index and generate the comparison pairs
for key, value in statistics_dict.items():
    ligand_atom, protein_atom = [int(x) for x in key.split() if x.isdigit()]
    ligand_hydrogen_atoms = value['Ligand Hydrogen Atoms']
    protein_hydrogen_atoms = value['Protein Hydrogen Atoms']

    # Create a list to store associated hydrogens for the current key
    associated_hydrogens = []

    # Generate Ligand Atom to Ligand Hydrogen pairs
    for ligand_hydrogen in ligand_hydrogen_atoms:
        associated_hydrogens.append(ligand_hydrogen)

    # Generate Ligand Atom to Protein Hydrogen pairs
    for protein_hydrogen in protein_hydrogen_atoms:
        associated_hydrogens.append(protein_hydrogen)

    # Generate Protein Atom to Ligand Hydrogen pairs
    for ligand_hydrogen in ligand_hydrogen_atoms:
        associated_hydrogens.append(ligand_hydrogen)

    # Generate Protein Atom to Protein Hydrogen pairs
    for protein_hydrogen in protein_hydrogen_atoms:
        associated_hydrogens.append(protein_hydrogen)

    # Add the key and its associated hydrogens to the dictionary
    associated_hydrogens_dict[key] = associated_hydrogens

# Print each key element with its associated hydrogens
#for key, associated_hydrogens in associated_hydrogens_dict.items():
#    print(f"{key}: {associated_hydrogens}")



#for key, hydrogens_list in associated_hydrogens_dict.items():
#    associated_hydrogens_dict[key] = list(set(hydrogens_list))

#print(associated_hydrogens_dict)


# Iterate over each key-value pair
for key in associated_hydrogens_dict:
    associated_hydrogens_dict[key] = list(set(associated_hydrogens_dict[key]))







hydrogen_info = {}  # Initialize the new dictionary to store hydrogen information


for key, hydrogens in associated_hydrogens_dict.items():
    ligand_atom_number, protein_atom_number = [int(x) for x in key.split() if x.isdigit()]

    hydrogen_info[key] = []  # Initialize a list for each key (ligand-protein pair)

    for hydrogen in hydrogens:
        atom_number = int(hydrogen)  # Assuming hydrogen is an atom number

        # Calculate distances from ligand atom to hydrogen
        ligand_command = f"gmx distance -s md_0_10.tpr -f md_0_10_center.xtc -n index.ndx -select 'atomnr {ligand_atom_number} {atom_number}' -oall temp_ligand_dist.xvg"
        subprocess.run(ligand_command, shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        # Read and process distances from ligand atom to hydrogen
        distances_ligand = []
        with open('temp_ligand_dist.xvg', 'r') as infile:
            for line in infile:
                if not line.startswith('#') and not line.startswith('@'):
                    distances_ligand.append(float(line.split()[1]))  # Assuming distance is in the second column

        if distances_ligand:
            # Calculate metrics for ligand distances
            ligand_average_dist = sum(distances_ligand) / len(distances_ligand)
            ligand_percent_below_022_value = sum(1 for dist in distances_ligand if dist < 0.22) / len(distances_ligand) * 100
            ligand_percent_below_050_value = sum(1 for dist in distances_ligand if dist < 0.5) / len(distances_ligand) * 100
            ligand_variance_value = sum((dist - ligand_average_dist) ** 2 for dist in distances_ligand) / len(distances_ligand)

        os.remove("temp_ligand_dist.xvg")  # Remove temporary ligand distance file after processing

        # Calculate distances from protein atom to hydrogen
        protein_command = f"gmx distance -s md_0_10.tpr -f md_0_10_center.xtc -n index.ndx -select 'atomnr {protein_atom_number} {atom_number}' -oall temp_protein_dist.xvg"
        subprocess.run(protein_command, shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        # Read and process distances from protein atom to hydrogen
        distances_protein = []
        with open('temp_protein_dist.xvg', 'r') as infile:
            for line in infile:
                if not line.startswith('#') and not line.startswith('@'):
                    distances_protein.append(float(line.split()[1]))  # Assuming distance is in the second column

        if distances_protein:
            # Calculate metrics for protein distances
            protein_average_dist = sum(distances_protein) / len(distances_protein)
            protein_percent_below_022_value = sum(1 for dist in distances_protein if dist < 0.22) / len(distances_protein) * 100
            protein_percent_below_050_value = sum(1 for dist in distances_protein if dist < 0.5) / len(distances_protein) * 100
            protein_variance_value = sum((dist - protein_average_dist) ** 2 for dist in distances_protein) / len(distances_protein)

            # Determine the donor based on average distance
            donor = protein_atom_number if ligand_average_dist > protein_average_dist else ligand_atom_number
            # Determine the acceptor (not the donor or hydrogen)
            acceptor = ligand_atom_number if donor == protein_atom_number else protein_atom_number

            # Calculate rank value
            rank_value = protein_average_dist + ligand_average_dist


 # Calculate angle
            angle_atoms = f"{donor} {hydrogen} {acceptor}"

            # Create index file for angle calculation
            with open('angle_atoms.ndx', 'w') as index_file:
                index_file.write(f"[ angle_atoms ]\n{angle_atoms}\n")
            try:
            # Run gmx angle command
                angle_command = f"gmx angle -f md_0_10_center.xtc -n angle_atoms.ndx -ov angle.xvg"
                subprocess.run(angle_command, shell=True, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            
            except subprocess.CalledProcessError as e:
                print(f"Error running 'gmx angle' command: {e}")

            angles = []

            with open('angle.xvg', 'r') as angle_file:
                for line in angle_file:
                    if not line.startswith('#') and not line.startswith('@'):
                        angles.append(float(line.split()[1]))  # Assuming angle is in the second column

           # Calculate the average angle if angles were found
            if angles:
                average_angle = sum(angles) / len(angles)
            else:
                average_angle = None  # Handle the case when no angles were found

            os.remove("angle.xvg")  # Remove temporary ligand distance file after processing
            os.remove("angle_atoms.ndx")  # Remove temporary ligand distance file after processing




            # Append hydrogen information to the list under the corresponding key
            hydrogen_info[key].append({
                'Hydrogen Number': hydrogen,
                'donor': donor,
                'rank_value': rank_value,
                'theta': average_angle,  # Add the 'theta' value here
                'Protein Distance Info': {
                    'average_distance': protein_average_dist,
                    'percent_below_022': protein_percent_below_022_value,
                    'percent_below_050': protein_percent_below_050_value,
                    'variance': protein_variance_value
                },
                'Ligand Distance Info': {
                    'average_distance': ligand_average_dist,
                    'percent_below_022': ligand_percent_below_022_value,
                    'percent_below_050': ligand_percent_below_050_value,
                    'variance': ligand_variance_value
                }
            })

        os.remove("temp_protein_dist.xvg")  # Remove temporary protein distance file after processing

 # Sort hydrogen entries based on rank_value
    hydrogen_info[key] = sorted(hydrogen_info[key], key=lambda x: x['rank_value'])
# Assuming hydrogen_info is your dictionary and you have sorted the hydrogen entries based on rank_value
#first_key = list(hydrogen_info.keys())[0]  # Get the first key from the dictionary
#first_key_values = hydrogen_info[first_key]  # Get all values associated with the first key


#print("Key:", first_key)
#print("Hydrogen Number\tDonor\tRank Value\tProtein Avg Dist\tLigand Avg Dist")

# Print all elements associated with the first key
#for hydrogen_entry in first_key_values:
#    print(hydrogen_entry)  # Print the entire hydrogen entry dictionary


def classify_hydrogen_bond(distance, angle):
    if distance <= 0.1:
        return "Strong"
    elif distance > 0.1 and distance <= 0.32:
        if angle >= 170 and angle <= 180:
            return "Strong"
        elif angle >= 120:
            return "Normal"
        else:
            return "Weak"
    else:
        return "Not"




def add_bond_strength(your_dict):
    for key, values in your_dict.items():
        ligand_atom_number, protein_atom_number = [int(x) for x in key.split() if x.isdigit()]
        for entry in values:
            if entry["donor"] == ligand_atom_number:
                distance = entry["Protein Distance Info"]["average_distance"]
            elif entry["donor"] == protein_atom_number:
                distance = entry["Ligand Distance Info"]["average_distance"]
            else:
                distance = None

            if distance is not None:
                angle = entry["theta"]
                bond_strength = classify_hydrogen_bond(distance, angle)
                entry["Bond Strength"] = bond_strength






add_bond_strength(hydrogen_info)



def filtered_entries(your_dict):
    bond_strengths = ["Weak", "Normal", "Strong"]
    count = {strength: 0 for strength in bond_strengths}

    keys_to_delete = []  # Keep track of keys to delete

    for key, values in your_dict.items():
        filtered_values = []
        for entry in values:
            if "Bond Strength" in entry and entry["Bond Strength"] in bond_strengths:
                if count[entry["Bond Strength"]] < 2:
                    filtered_values.append(entry)
                    count[entry["Bond Strength"]] += 1
        if not filtered_values:  # If no valid entries found, mark key for deletion
            keys_to_delete.append(key)
        else:
            your_dict[key] = filtered_values

    # Delete keys with no entry data
    for key in keys_to_delete:
        del your_dict[key]
    return your_dict
    # Print the updated dictionary using json.dumps
    #print(json.dumps(your_dict, indent=4))







#print(hydrogen_info)
#print(json.dumps(hydrogen_info, indent=4))
hydrogen_info = filtered_entries(hydrogen_info)

#print(json.dumps(hydrogen_info, indent=4))

print(f"Resolve Duplication Events (...Processing...)")




def calculate_score(bond_strength):
    # Dictionary to map bond strengths to scores
    bond_strength_scores = {"Weak": 5, "Normal": 10, "Strong": 15}
    return bond_strength_scores.get(bond_strength, 0)  # Default to 0 if bond strength is not found


def extract_info(input_dict):
    hydrogen_numbers = []
    keys_with_hydrogen = []
    bond_strengths = []
    result_dict = {}
    
    # Dictionary to map bond strengths to numerical values
    bond_strength_values = {"Weak": 0, "Normal": 1, "Strong": 2}

    # Iterate through the input dictionary
    for key, value in input_dict.items():
        for item in value:
            H = item["Hydrogen Number"]
            Key = key 
            bond_strength = item["Bond Strength"]

            # Check if the hydrogen number is already in hydrogen_numbers
            if H in hydrogen_numbers:
                # Find the index of the existing hydrogen number
                i = hydrogen_numbers.index(H)
                existing_bond_strength = bond_strengths[i]

                # Compare bond strengths using numerical values
                if bond_strength_values[bond_strength] > bond_strength_values[existing_bond_strength]:
                    # Add to the new dictionary and remove from lists
                    new_key = keys_with_hydrogen[i]
                    del hydrogen_numbers[i]
                    del keys_with_hydrogen[i]
                    del bond_strengths[i]
                    result_dict[new_key] = H
                    hydrogen_numbers.append(H)
                    keys_with_hydrogen.append(Key)
                    bond_strengths.append(bond_strength)
                      
                elif bond_strength_values[bond_strength] == bond_strength_values[existing_bond_strength] or (
                        bond_strength_values[bond_strength] > 0 and bond_strength_values[existing_bond_strength] > 0
                ):
                    # Pass to the next item
                    continue
                else:
                    new_key = Key
                    result_dict[new_key] = H
                    
            else:
                hydrogen_numbers.append(H)
                keys_with_hydrogen.append(Key)
                bond_strengths.append(bond_strength)

    # Iterate through the result_dict and delete items with specified hydrogen number
    for key, value in result_dict.items():
        for item in input_dict[key]:
            if item["Hydrogen Number"] == value:
                input_dict[key].remove(item)

    # Delete keys with empty elements in the input dictionary
    keys_to_delete = [key for key, value in input_dict.items() if not value]
    for key in keys_to_delete:
        del input_dict[key]

    all_bond_strengths = [item["Bond Strength"] for key in input_dict for item in input_dict[key]]

    total_score = sum(calculate_score(bs) for bs in all_bond_strengths)

    return input_dict, total_score






result_dict, total_score = extract_info(hydrogen_info)
#print("Score:", total_score)
#print(json.dumps(result_dict, indent=4))


# Write to a text file
with open("Hydrogen_Bond_Score.txt", "w") as f:
    f.write("Score: {}\n".format(total_score))
    f.write(json.dumps(result_dict,indent=4))

print(f"(...Complete...)")

print("Hydrogen bond score information outputted to Hydrogen_Bond_Score.txt")

























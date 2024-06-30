#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <protein.pdb>"
    exit 1
fi

# Assign arguments to variables
protein_pdb="$1"

# Extract the base name
base_name=$(basename "$protein_pdb" .pdb)

# Extracting parameters from params.txt
parameters=$(grep 'PROTEIN_TOP:' params.txt | grep -o '[0-9, ]*')
parameters="${parameters//[ ,]/$'\n'}"$'\n'

# Run the command with extracted parameters
#echo "$parameters" | gmx pdb2gmx -f "$protein_pdb" -o "${base_name}_processed.gro" -ter

# Define log file
log_file="${base_name}_processing.log"

# Run the command with extracted parameters, capturing output to log file
echo "Running gmx pdb2gmx with parameters:" >> "$log_file"
{ echo "$parameters" | gmx pdb2gmx -f "$protein_pdb" -o "${base_name}_processed.gro" -ter; } &> "$log_file"

if grep -q "You have successfully generated a topology from" "$log_file"; then

	# Print out the last ten lines of the log file
	tail -5 "$log_file" | head -n 4
	grep -E '^(Start|End) terminus' "$log_file"

else
	# Print the whole log file
	echo "An Error Occured:"
	cat "$log_file"
fi

rm \#*#

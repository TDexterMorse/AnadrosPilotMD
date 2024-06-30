#!/bin/bash

output_file="JUSTBONDS.pdb"

# Extract lines starting with "CONECT" and save them to the output file
grep "^CONECT" temp.pdb > "$output_file"

echo "Extracted connections saved to $output_file"

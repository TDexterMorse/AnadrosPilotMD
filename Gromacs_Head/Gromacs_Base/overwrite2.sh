#!/bin/bash


# Check if correct number of arguments provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ligand_identifier>"
    exit 1
fi

# Assign argument to variable
ligand_identifier="$1"


# Define the marker
marker="; name    at.num    mass    charge ptype  sigma      epsilon"


cat <<EOF > iontypes.txt
OW             8  16.000000  0.00000000  A     0.29599219        0.87864
HW             1   1.008000  0.00000000  A     0.10690785      0.0656888
NA            11   22.99     0.00000000  A          0.242          0.085
Na            11   22.99     0.00000000  A          0.242          0.085
IB             1   0.000     0.00000000  A          0.000          0.000
C0             1   0.000     0.00000000  A          0.000          0.000
Cl            17   35.45     0.00000000  A          0.242          0.085
MG             1   0.000     0.00000000  A          0.000          0.000
K              1   0.000     0.00000000  A          0.000          0.000
Rb             1   0.000     0.00000000  A          0.000          0.000
Cs             1   0.000     0.00000000  A          0.000          0.000
Li             1   0.000     0.00000000  A          0.000          0.000
Zn             1   0.000     0.00000000  A          0.000          0.000
EOF

#cat iontypes.txt


# Define the file path
file_path="gromacs.top"  # Update with your file path


# Use grep to find the line number of the marker
line_number=$(grep -n "$marker" "$file_path" | cut -d ':' -f 1)


if [ -n "$line_number" ]; then
    # Use awk to find the line number of the next empty line
    next_empty_line=$(awk 'NR > '$line_number' && NF == 0 {print NR; exit}' "$file_path")

    if [ -n "$next_empty_line" ]; then
        echo "Line number of the next empty line after the marker is: $next_empty_line"
    else
        echo "No empty line found after the marker."
    fi
else
    echo "Marker '$marker' not found in the file."
fi

temp_file=$(mktemp)  # Create a temporary file
sed -e "$((next_empty_line-1))r iontypes.txt" gromacs.top > "$temp_file"
mv "$temp_file" gromacs.top  # Overwrite the original file with the modified content









# Define the filename
file="gromacs.top"
restraint_file="proteinrestraint.txt"

# Find the line number of the second "moleculetype" line
second_moleculetype_line=$(grep -n "moleculetype" "$file" | sed -n '2p' | cut -d: -f1)

# Find the line number of the preceding whitespace line
previous_empty_line=$(awk -v line="$second_moleculetype_line" 'NR < line && NF == 0 { prev_line = NR } END { print prev_line }' "$file")

# Create the text to be inserted
insert_text="; Include Position restraint file
#ifdef POSRES  
#include \"posre.itp\"
#endif
"

# Create the restraint file
cat <<EOF >"$restraint_file"
$insert_text

EOF

# Create a temporary file
temp_file=$(mktemp)

# Insert the text into the file at the specified line
sed -e "${previous_empty_line}r $restraint_file" "$file" >"$temp_file"
mv "$temp_file" "$file"  # Overwrite the original file with the modified content

# Clean up the temporary restraint file
rm "$restraint_file"

echo "Protein Restraint inserted successfully."





# Find the line number of the "system" line
system_line=$(grep -n "system ]" "$file" | cut -d: -f1)


# Create the restraint file
cat <<EOF > ligandres.txt
; Ligand position restraints
#ifdef POSRES_LIG
#include "posre_$ligand_identifier.itp"
#endif

; Include ML2_GMX.itp topology
;#include "./$ligand_identifier.acpype/$ligand_identifier_GMX.itp"

; Include water topology
#include "amber03.ff/tip3p.itp"

#ifdef POSRES_WATER
; Position restraint for each water oxygen
[ position_restraints ]
;  i funct       fcx        fcy        fcz
   1    1       1000       1000       1000
#endif

; Include topology for ions
#include "amber03.ff/ions2.itp"

EOF

temp_file=$(mktemp)  # Create a temporary file
sed -e "$((system_line - 1))r ligandres.txt" gromacs.top > "$temp_file"
mv "$temp_file" gromacs.top  # Overwrite the original file with the modified content


echo "LIGAND RESTRAINT ADDED"
echo "WATER FORCE ADDED"



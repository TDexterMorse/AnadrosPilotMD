#!/bin/bash

# Define base directory
BASE=$(pwd)

#Cleanup
# Delete non-executable files with specific suffixes recursively
find . -maxdepth 2 -type f ! -name '*.sh' ! -name '*.py' ! -name '*.md' ! -name '*.txt' ! -name 'insulin.pdb' -delete

# Set up paths


export PATH="$BASE/P2Rank/p2rank/distro:$PATH"


# Define directories
SMILES="$BASE/SMILEY"
OBABEL="$BASE/Obabel"
PRANK="$BASE/P2Rank"
AUTODOCK="$BASE/AutoDock"
COMPLEX="$BASE/Complex"
#SPLITTER="$BASE/Splitter"
GROMACS="$BASE/Gromacs_Head" #Contains Sub Docker Image For Python Script
RESULTS="$BASE/Results"


# Inputs
PROTEIN_PDB="$1"
LIGAND_NAME="$2"
SMILES_VALUE="$3"

PROTEIN=$(basename -s .pdb "$PROTEIN_PDB").pdbqt
LIGAND=$(basename -s .pdb "$LIGAND_NAME").pdbqt


# Commands
echo "Processing protein.pdb: $PROTEIN_PDB with ligand: $LIGAND_NAME and SMILES: $SMILES_VALUE"

# Push protein.pdb to directories
echo "Moving protein.pdb to directories..."
cp "$PROTEIN_PDB" "$OBABEL" && echo "Moved to $OBABEL"
cp "$PROTEIN_PDB" "$PRANK" && echo "Moved to $PRANK"
cp "$PROTEIN_PDB" "$COMPLEX" && echo "Moved to $COMPLEX"


# Move to SMILES directory
echo "Moving to SMILES directory..."
cd "$SMILES" || exit
echo "Moved to $SMILES"

# Generate .mol file from SMILES using your script
echo "Generating .mol file from SMILES..."
./gen_mol.sh "$LIGAND_NAME" "$SMILES_VALUE"


# Move the generated .mol file to OBABEL directory
echo "Moving generated .mol file to OBABEL directory..."
cp "$LIGAND_NAME.mol" "$OBABEL" && echo "Moved $LIGAND_NAME.mol to $OBABEL"

echo "Moving to Obabel directory..."
cd "$OBABEL" || exit
echo "Moved to $Obabel"


# Use OBabel to convert Ligand and Protein to correct Format
echo "Converting ligand and protein to correct format using OBabel..."
./obabel.sh "$PROTEIN_PDB" "$LIGAND_NAME.mol"
echo "Conversion completed."

# Move the output files to AUTODOCK and COMPLEX directories
echo "Moving output files to AUTODOCK and COMPLEX directories..."
cp *.pdbqt "$AUTODOCK" && echo "Moved $LIGAND_NAME.pdbqt to $AUTODOCK"
cp "$LIGAND_NAME.pdb" "$COMPLEX" && echo "Moved $LIGAND_NAME.pdb to $COMPLEX"

# Move to P2Rank directory
echo "Moving to P2Rank directory..."
cd "$PRANK" || exit
echo "Moved to $PRANK"

find ./results -maxdepth 2 -type f -delete
rm -r ./results/visualizations/


# Invoke P2Rank to predict binding sites
echo "Predicting binding sites using P2Rank..."
./predict_prank3.sh "$PROTEIN_PDB"

exit 1

echo "$PROTEIN_PDB"

# Move the output files to AUTODOCK and COMPLEX directories
echo "Moving output files to AUTODOCK and COMPLEX directories..."

# Move .csv files to AUTODOCK directory
cp ./results/*.csv "$AUTODOCK" && echo "Moved .csv files to $AUTODOCK"

echo "Moving to AUTODOCK directory..."
cd "$AUTODOCK" || exit
echo "Moved to $AUTODOCK"

./run_autodock_vina.sh *_predictions.csv "$PROTEIN" "$LIGAND"

cp *Rank1* "$COMPLEX" # && echo "Moved all ranks to $COMPLEX"

echo "Moving to $COMPLEX directory..."
cd "$COMPLEX" || exit
echo "Moved to $COMPLEX"

PROTEIN=$(basename -s qt "$PROTEIN")
LIGAND=$(basename -s qt "$LIGAND")

./format.sh "$PROTEIN" "$LIGAND"


# Move files matching the pattern to the GROMACS directory
cp M*Complex.pdb "$GROMACS" && echo "Moved all complex files to $GROMACS directory"




#------------------------------------------------------------------------------------------

## GROMACS

# Navigate to the GROMACS directory
echo "Moving to $GROMACS directory..."
cd "$GROMACS" || exit
echo "Moved to $GROMACS"

for dir in */; do
    if [ "$dir" != "Gromacs_Base/" ]; then
        rm -rf "$dir"
    fi
done

GROMACS_Base="$GROMACS/Gromacs_Base"

# Counter for tracking the number of processed .pdb files
count=0

# Iterate through each .pdb file
#for pdb_file in M*R*.pdb; do
for pdb_file in $(ls M*R*.pdb | sort -r); do
    # Increment the counter
    ((count++))

    # Break the loop if the counter exceeds 3
    if [ "$count" -gt 20 ]; then
        break
    fi

# Suppress messages from commands in this section
    {
    # Extract the base name of the .pdb file
    base_name=$(basename "$pdb_file" .pdb)
    # Create a new directory using the base name of the .pdb file
    mkdir -p "$base_name"
    # Copy script files from GROMACS_Base to the new directory
    cp "$GROMACS_Base"/*.sh "$GROMACS_Base"/*.py "$GROMACS_Base"/*.pl "$base_name"
    cp "$OBABEL"/JUSTBONDS.pdb "$base_name" && echo "Moved JUSTBONDS.pdb to Current"

    # Grant universal execute permissions to all .sh and .py scripts
    chmod +x "$base_name"/*.sh "$base_name"/*.py "$GROMACS_Base"/*.pl
    # Create a symbolic link to GROMACS_Base in the new directory
    # Move the associated .pdb file to the new directory
    mv "$pdb_file" "$base_name"
    } &>/dev/null
 # Enter the directory
    cd "$base_name"
    #break
    # Execute the hello world script\
    # Execute the complete4.sh script
    if [ -f "complete13.sh" ]; then
        #./hello_world.sh
	./complete13.sh "$base_name.pdb" "${LIGAND_NAME:0:3}" 2>&1 | tee output_log.txt
    else
        echo "complete8.sh not found in directory '$base_name'."
    fi
    # Move back to the previous directory
    # Get the last line of output_log.txt and check if it contains the specified phrase
    last_line=$(tail -n 1 output_log.txt)
    echo "${last_line}"
    if [[ "$last_line" == *"COMPLETE!!!!!"* ]]; then
        break
    fi


    cd ..
    echo "STARTING OVER, NEW MODEL"
done

#exit 1


echo "Collecting Fails/Final to Log Directory"

# Copy directories only from GROMACS to LOG_DIR, excluding Gromacs_Base
find "$GROMACS/" -mindepth 1 -maxdepth 1 -type d -not -name 'Gromacs_Base' -exec rsync -av {} "$LOG_DIR/" \; >/dev/null 2>&1


echo "Protecting Final From Purge"
highest_dir=""
for dir in */; do
    if [ "$dir" != "Gromacs_Base/" ]; then
        if [[ "$dir" > "$highest_dir" ]]; then
            highest_dir="$dir"
        fi
    fi
done

for dir in */; do
    if [ "$dir" != "Gromacs_Base/" ] && [ "$dir" != "$highest_dir" ]; then
        rm -rf "$dir"
    fi
done

echo "Transfer output to Results Directory"

find "$GROMACS/" -mindepth 1 -maxdepth 1 -type d -not -name 'Gromacs_Base' -exec rsync -av {} "$RESULTS/" \; >/dev/null 2>&1

for dir in */; do
    if [ "$dir" != "Gromacs_Base/" ]; then
        rm -rf "$dir"
    fi
done

#------------------------------------------------------------------------------------------

echo "Collection of Pertinent Intermediate files to Log"
# Suppress messages from commands in this section
#{
## Storage
# Move back to the base directory
cd "$BASE" || exit

# Create LOG directory if it doesn't exist
LOG_DIR="LOG/$PROTEIN$LIGAND"
mkdir -p "$LOG_DIR"

# Move all output files to the LOG directory
cp "$AUTODOCK"/*.csv "$AUTODOCK"/*.pdb "$AUTODOCK"/*.pdbqt "$COMPLEX"/*.pdbqt "$COMPLEX"/*Complex.pdb "$COMPLEX"/*.txt "$PRANK"/*.pdbqt "$PRANK"/*.txt "$LOG_DIR/" \; >/dev/null 2>&1

rsync -av --exclude='Gromacs_Base' "$GROMACS/" "$LOG_DIR/" \; >/dev/null 2>&1

echo "Zipping Log"
# Zip
zip -r "$LOG_DIR.zip" "$LOG_DIR" \; >/dev/null 2>&1

rm -r "$LOG_DIR" \; >/dev/null 2>&1

#} &>/dev/null

echo "ALL INTERMEDIATE FILES LOGGED AND ZIPPED!"

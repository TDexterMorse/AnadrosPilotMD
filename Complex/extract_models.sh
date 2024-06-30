#!/bin/bash

# Check if the script is being run in the correct directory
if [ ! -d "." ]; then
    echo "Please run this script in the directory containing the files."
    exit 1
fi

# Function to extract rank number from filename
extract_rank_number(){
    echo "$1" | grep -oE '_Rank[0-9]+' | sed 's/_Rank//'
}



# Iterate over all files in the current directory with "Rank" in the filename and ".pdbqt" suffix
for file in *Rank*.pdbqt; do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Extract lines between first "MODEL" and "ENDMDL"
        awk '/^MODEL/{f=1} f {print} /^ENDMDL/{exit}' "$file" > "Model1_${file}"
        echo "Extracted first model from $file and saved to Model1_${file}"

        # Extract ligand name from REMARK Name line
        ligand_name=$(awk '/^REMARK  Name = /{print $4}' "Model1_${file}")

        # Remove the suffix from the ligand name
        ligand_name=${ligand_name%.*}

        # Extract the rank number from the filename
        rank_number=$(extract_rank_number "$file")

        # Extract suffix from the original filename
        suffix="${file##*.}"

        # Rename the file
        mv "Model1_${file}" "M1_R${rank_number}_${ligand_name}.${suffix}"
        echo "Renamed the file to M1_R${rank_number}_${ligand_name}.${suffix}"
    else
        echo "$file not found."
    fi
done


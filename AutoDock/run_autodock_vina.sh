#!/bin/bash

# Check if correct number of arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <csv_file> <protein_file> <ligand_file>"
    exit 1
fi

csv_file=$1
protein_file=$2
ligand_file=$3

grep -vE '^ROOT|^ENDROOT|^BRANCH|^ENDBRANCH' "$protein_file" > "$protein_file"


# Extract base filenames (without extensions)
protein_basename=$(basename -s .pdbqt "$protein_file")
ligand_basename=$(basename -s .pdbqt "$ligand_file")

# Pull the autodock-vina image
docker pull biocontainers/autodock-vina:v1.1.2-5b1-deb_cv1

docker kill dock 

docker remove dock

# Run the autodock-vina container
docker run -d -it --name dock -v $(pwd):/data/ biocontainers/autodock-vina:v1.1.2-5b1-deb_cv1 bash

# Function to run vina command for each pocket
run_vina() {
    local protein=$1
    local ligand=$2
    local center_x=$3
    local center_y=$4
    local center_z=$5
    local output=$6

  docker exec dock bash -c "vina --receptor /data/$protein --ligand /data/$ligand --center_x $center_x --center_y $center_y --center_z $center_z --size_x 20 --size_y 20 --size_z 20 --out /data/$output"
# echo "vina --receptor /data/$protein --ligand /data/$ligand --center_x $center_x --center_y $center_y --center_z $center_z --size_x 20 --size_y 20 --size_z 20 --out /data/$output"
}

# Loop through CSV file, skipping the first line, and run vina command for each pocket
tail -n +2 "$csv_file" | while IFS=',' read -r name rank score probability sas_points surf_atoms center_x center_y center_z residue_ids surf_atom_ids; do
     # Remove spaces from variables
    name=$(echo "$name" | tr -d ' ')
    rank=$(echo "$rank" | tr -d ' ')
    score=$(echo "$score" | tr -d ' ')
    probability=$(echo "$probability" | tr -d ' ')
    sas_points=$(echo "$sas_points" | tr -d ' ')
    surf_atoms=$(echo "$surf_atoms" | tr -d ' ')
    center_x=$(echo "$center_x" | tr -d ' ')
    center_y=$(echo "$center_y" | tr -d ' ')
    center_z=$(echo "$center_z" | tr -d ' ')
    residue_ids=$(echo "$residue_ids" | tr -d ' ')
    surf_atom_ids=$(echo "$surf_atom_ids" | tr -d ' ')
    output="${protein_basename}_${ligand_basename}_Rank${rank}.pdbqt"

    run_vina "$protein_file" "$ligand_file" "$center_x" "$center_y" "$center_z" "$output"
done

# Clean up - stop and remove the docker container
docker stop dock
docker rm dock

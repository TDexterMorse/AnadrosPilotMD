#!/bin/bash

# Run prank script and redirect stderr to error.log
prank predict -f tyrosinase.pdb 2> error.log

# Read error log into a variable
error_message=$(<error.log)

# Print the line of interest if it exists
if [[ $error_message =~ "results saved to directory" ]]; then
    # Extract the line containing the directory path
    directory_line=$(grep "results saved to directory" error.log)
    echo "Directory path: $directory_line"
    
    # Extract the directory path
    # directory_path=$(echo "$directory_line" | awk '{print $NF}')
    directory_path=$(echo "$directory_line" | awk '{print $NF}' | sed 's/[][]//g')
    echo "Directory path extract: $directory_path"

    # Move all contents of the directory to the results directory
    mv "$directory_path"/* ./results
    
    echo "Contents moved to results directory."
else
    echo "Error: Directory path not found."
fi
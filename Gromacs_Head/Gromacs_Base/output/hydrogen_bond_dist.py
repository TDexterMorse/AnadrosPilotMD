#!/usr/bin/env python

import pandas as pd

# Define the file paths
input_file = 'mindist_ml2_protein.xvg'
output_file = 'cleaned_dist.xvg'

# Read the input file, skip lines starting with '#' or '@', and write to a new file
with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
    for line in infile:
        if not line.startswith('#') and not line.startswith('@'):
            outfile.write(line)

# Read the cleaned file into a DataFrame
data = pd.read_csv(output_file, sep='\s+', header=None, index_col=0)

# Display the first few rows of the DataFrame
print(data.head())

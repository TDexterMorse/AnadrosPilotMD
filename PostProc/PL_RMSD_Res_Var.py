#!/usr/bin/env python3

import pandas as pd
import plotly.graph_objs as go

# Read data from the file
file_path = 'combined_rmsd_residue_complex.xvg'
df = pd.read_csv(file_path, delimiter='\t')
time = df['Time (ps)']
df = df.drop(columns=['Time (ps)'])

# Calculate variance for each column
variances = df.var()

# Find columns with spikes
spike_threshold = 4 * df.mean()
spike_columns = df.columns[(df > spike_threshold).any()]

# Combine both criteria to select columns to plot
selected_columns = variances.nlargest(10).index.union(spike_columns)

data = []
for column in selected_columns:
    data.append(go.Scatter(
        x=time,
        y=df[column],
        mode='lines',
        name=f'Residue {column}',
        line=dict(width=0.5)  # Adjust line width here
    ))

# Create layout with hovermode set to closest
layout = go.Layout(
    title='Root Mean Square Deviation (RMSD)',
    xaxis=dict(title='Time (ps)'),
    yaxis=dict(title='RMSD (nm)', range=[0, .2]),
    hovermode='closest'
)

# Create figure object
fig = go.Figure(data=data, layout=layout)

# Show plot
fig.show()

# Save as PDF
print("Plot Saved RMSD_by_Residues_Highly_Variant.pdf")

print("Interactive Plot Saved RMSD_by_Residues_Highly_Variant.html")

fig.write_image("zzRMSD_by_Residues_Highly_Variant.pdf")
fig.write_html("RMSD_by_Residues_Highly_Variant.html")


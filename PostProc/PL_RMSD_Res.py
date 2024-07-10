#!/usr/bin/env python3

import pandas as pd
import plotly.graph_objs as go

# Read data from the file
file_path = 'combined_rmsd_residue_complex.xvg'

df = pd.read_csv(file_path, delimiter='\t')
time = df['Time (ps)']

data = []
for column in df.columns[1:]:
    data.append(go.Scatter(
        x=time,
        y=df[column],
        mode='markers',  # Change mode to 'markers'
        name=f'Residue {column}',
        marker=dict(size=4)  # Adjust marker size here
    ))

# Create layout with hovermode set to closest
layout = go.Layout(
    title='Root Mean Square Deviation (RMSD)',
    xaxis=dict(title='Time (ps)'),
    yaxis=dict(title='RMSD (nm)', range=[0, 0.2]),
    hovermode='closest'
)

# Create figure object
fig = go.Figure(data=data, layout=layout)

# Show plot
fig.show()

# Save as PDF
print("Plot Saved RMSD_by_Residues.pdf")

print("Interactive Plot Saved RMSD_by_Residues.html")

# Save as PDF
fig.write_image("zRMSD_by_Residues.pdf")
fig.write_html("RMSD_by_Residues.html")

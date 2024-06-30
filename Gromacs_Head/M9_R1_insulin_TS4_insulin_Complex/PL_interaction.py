#!/usr/bin/env python3

import sys
sys.path.append('/home/ubuntu/miniconda3/lib/python3.12/site-packages')
import matplotlib.pyplot as plt

# Read data from the file
file_path = 'interaction_energy.xvg'
data = {'time': [], 'coulombs': [], 'lj_potentials': []}
x_label = 'Time (ps)'
y_label = '(kJ/mol)'

with open(file_path, 'r') as file:
    for line in file:
        if line.startswith('@'):
            if line.startswith('@ xaxis'):
                x_label = line.split('"')[1]
            elif line.startswith('@ yaxis'):
                y_label = line.split('"')[1]
            continue
        elif line.startswith('#') or line.startswith('@'):
            continue
        cols = line.split()
        if len(cols) == 3:
            data['time'].append(float(cols[0]))
            data['coulombs'].append(float(cols[1]))
            data['lj_potentials'].append(float(cols[2]))

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(data['time'], data['coulombs'], label='Coul-SR:Protein-ML2')
plt.plot(data['time'], data['lj_potentials'], label='LJ-SR:Protein-ML2')
plt.xlabel(x_label)
plt.ylabel(y_label)
plt.legend()
plt.title('Interaction Energy')
plt.grid(True)

# Save plot to PDF
output_pdf = 'interaction_energy_plot.pdf'
plt.savefig(output_pdf)
print(f'Plot saved to {output_pdf}')
#plt.show()


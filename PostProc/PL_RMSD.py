#!/usr/bin/env python3

import matplotlib.pyplot as plt

# Read data from the file
file_path = 'rmsd_complex.xvg'
data = {'time': [], 'RMSD': []}
x_label = 'Time (ns)'
y_label = 'RMSD (nm)'

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
        if len(cols) == 2:
            data['time'].append(float(cols[0]))
            data['RMSD'].append(float(cols[1]))

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(data['time'], data['RMSD'])
plt.xlabel(x_label)
plt.ylabel(y_label)
plt.title('Root Mean Square Deviation (RMSD)')
plt.grid(True)

# Save plot to PDF
output_pdf = 'rmsd_plot.pdf'
plt.savefig(output_pdf)
print(f'Plot saved to {output_pdf}')
#plt.show()


#!/usr/bin/env python3

import matplotlib.pyplot as plt

# Read data from the file
file_path = 'gyration.xvg'
data = {'time': [], 'Rg': [], 'RgX': [], 'RgY': [], 'RgZ': []}
x_label = 'Time (ps)'
y_label = 'Radius of gyration (nm)'

with open(file_path, 'r') as file:
    for line in file:
        if line.startswith('@') or line.startswith('#'):
            continue
        cols = line.split()
        data['time'].append(float(cols[0]))
        data['Rg'].append(float(cols[1]))
        data['RgX'].append(float(cols[2]))
        data['RgY'].append(float(cols[3]))
        data['RgZ'].append(float(cols[4]))

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(data['time'], data['Rg'], label='Rg')
plt.plot(data['time'], data['RgX'], label='RgX')
plt.plot(data['time'], data['RgY'], label='RgY')
plt.plot(data['time'], data['RgZ'], label='RgZ')
plt.xlabel(x_label)
plt.ylabel(y_label)
plt.title('Radius of gyration (total and around axes)')
plt.legend()
plt.grid(True)

# Save plot to PDF
output_pdf = 'gyration_plot.pdf'
plt.savefig(output_pdf)
print(f'Plot saved to {output_pdf}')
#plt.show()

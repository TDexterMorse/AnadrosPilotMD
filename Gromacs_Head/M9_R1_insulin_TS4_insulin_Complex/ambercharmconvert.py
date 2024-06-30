import os
import parmed as pmd

parm = pmd.load_file('complex.prmtop', 'complex.inpcrd')

# Check if the files exist and delete them if they do
if os.path.exists('gromacs.top'):
    os.remove('gromacs.top')
if os.path.exists('gromacs.gro'):
    os.remove('gromacs.gro')

parm.save('gromacs.top', format='gromacs')
parm.save('gromacs.gro')

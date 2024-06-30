import sys; sys.path.append('/Users/dmorse/miniconda3/lib/python3.11/site-packages')

from openmm.app import *
from openmm import *
from openmm.unit import *
from sys import stdout

# Load .pdb file (converted from .mol2)
pdb = PDBFile('pdb.pdb')

forcefield = ForceField('amber/protein.ff14SB.xml', 'amber/tip3p_standard.xml', 'amber/tip3p_HFE_multivalent.xml')
system = forcefield.createSystem(pdbfile.topology)
print(system)

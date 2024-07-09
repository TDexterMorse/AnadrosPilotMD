OpenMM Command Line Executable: `openmm` 
==============================

This program sets up and runs an OpenMM simulation in a user-friendly
way.  It is roughly equivalent to to `grompp/mdrun` in Gromacs,
`dynamic` in Tinker, and `pmemd` in Amber.

To install this package, run `python setup.py install`. The only dependencies
are python and OpenMM.

For the short help, run `openmm -h`. To get help on all available options,
run `openmm --help-all`.

You need to provide coordinates and specify a force field.
Coordinates may come from a .pdb file.  Built-in protein force fields
and water models are shown in the help text, and you may add your own
OpenMM force field XML files.  Alternatively, you may provide AMBER
inpcrd/prmtop files.

You may provide simulation options through the command line; all
options are given in the help text.  Every time this program executes,
it makes a 'configuration file' which you may use as input for future
runs using the `--config` argument.  The command line options take
priority over those in the configuration file.  This provides a
convenient way to customize your default options.

Some nice features include:

1) Extensive validation of options and checking dependencies /
conflicts between options.

2) Reports your simulation progress, including speed in ns/day and
time left.

3) You may use units from simtk.unit on the command line when
specifying options with physical units.  

4) Suggestions are provided for typos on the command line.

5) Restart files that contain state information (coordinates,
velocities, and unit cell vectors) from the previous run.

This program is provided as an option for users to use OpenMM without
needing to write a Python script.  To take advantage of the full
flexibility of OpenMM as a domain-specific language for molecular
dynamics simulation, check out the OpenMM Script Builder located at
http://builder.openmm.org.

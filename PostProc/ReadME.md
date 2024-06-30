
**Step:** 
RMSD Calculation, Centroid Distance Calculation, Radius of Gyration Calculation, Hydrogen Bond Analysis, Interaction Energy Calculation, and Trajectory Conversion for Visualization
**Main Script:** `./PostProc.sh <ligand name>`
**Output:** `<combined.pdf>`

###### MD Parameters Setup
Create an MD parameter file (ie.mdp) for post-simulation analysis with specific simulation settings.

###### Trajectory Conversion and Centering
Convert and center the trajectory to remove periodic boundary conditions.

###### Index File Preparation
Generate an index file required for further analysis.

###### RMSD Calculation
Calculate the RMSD of the protein-ligand complex using the centered trajectory.

###### Centroid Distance Calculation
Compute the distance between the centers of mass of the protein and the ligand.

###### Radius of Gyration Calculation
Calculate the radius of gyration of the complex.

###### Hydrogen Bond Analysis
Detect and analyze hydrogen bonds between the protein and ligand.

###### Interaction Energy Calculation
Generate a new TPR file and rerun the trajectory to calculate interaction energies between the protein and ligand.

###### PDF Generation
Generate a PDF report of hydrogen bond scores and combine all plots into a single PDF file.

###### Trajectory Conversion for Visualization
Prepare and convert the trajectory for visualization in Chimera, generating a PDB file for each frame of the trajectory.

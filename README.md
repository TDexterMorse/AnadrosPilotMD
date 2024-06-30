## README: 

#### Introduction to AnadrosPilotMD: P2Rank, Autodock, and Gromacs Wrapper for a Complete Molecular Docking Pipeline

Welcome to AnadrosPilotMD, a comprehensive molecular docking pipeline. This high-throughput, reproducible cheminformatics workflow is designed to facilitate in-depth exploration of protein-ligand interactions. By integrating P2Rank, Autodock, Ambertools, and Gromacs AnadrosPilotMD enables researchers to span the space of many protein-ligand complexes in search of novel or same-similar protein-ligand interactions. 

This pipeline is merely the concatenation of already accepted docking modalities with the goal of further user abstraction and to facilitate reproducibility with full recognition as to the fragility of such a hands off approach; to this end all users are encouraged to read the documentation for each of the primary programs (P2Rank, Autodock, AmberTools, and Gromacs) and to carefully tailor each params file to the system at hand. Breakpoints are included to allow for user input, and an iterative docking approach is applied in order to access optimal simulation start points. For more information please consult these four tutorial workflows/githubs (on which this pipeline is based) as well as the TipsAndTricks file for help with compilation and debugging suggestions for common energy minimization problems.

P2Rank -> https://github.com/rdk/p2rank , https://prankweb.cz/

AutoDock -> https://github.com/ccsb-scripps/AutoDock-GPU

AmberTools -> https://ambermd.org/AmberTools.php , http://ffamber.cnsm.csulb.edu/ffamber.php

Gromacs -> http://www.mdtutorials.com/gmx/complex/index.html , https://www.gromacs.org/tutorial_webinar.html

Starting with a protein PDB file (in Alphafold Format) and a SMILES representation of a small molecule ligand, the pipeline performs the following tasks:

- Detect potential binding pockets using P2Rank.
- Conducts preliminary docking using AutoDock.
- Generates a small molecule force field using AmberTools with the GAFF2 force field.
- Runs molecular dynamics simulations using GROMACS.
- Outputs potential hydrogen bonding events, and measures system stability (gyroscopic stability, RMSD, Lennard-Jones and Coulombic interactions, and centroid distance).
- Future updates will include a CHARMM plugin for generating small molecule force fields.

## Tools and References

#### P2Rank

P2Rank is a versatile command line tool designed to predict ligand-binding pockets directly from protein structures. Unlike many other methods, P2Rank achieves high prediction success rates independently, without relying on external software for complex feature computation or pre-existing databases of protein-ligand templates P2Rank's predictive power stems from a machine learning model trained on a diverse dataset of protein-ligand complexes, scoring and clustering points on the protein's surface to identify potential binding sites effectively. P2Rank was chosen for pocket prediction due to its speed and its concision with previous (slower) graph based models. (Krivak et al., 2018)

#### AutoDock
AutoDock is an open-source suite of automated docking tools designed to predict how small molecules, such as substrates or drug candidates, bind to a receptor of known 3D structure. For our purposes we leveraged the initial physical docking predictions, and further iterated down (as part of initial Gromacs energy minimization) to find the optimal docking start point.(Morris et al., 2009)

#### GROMACS
GROMACS (Groningen Machine for Chemical Simulations) is a powerful software suite specifically designed for conducting molecular dynamics simulations, particularly for protein-ligand interaction studies. It employs advanced algorithms to simulate the Newtonian equations of motion for complex biochemical systems, allowing researchers to explore the dynamic behavior and stability of protein-ligand complexes with high precision. Widely recognized for its efficiency and scalability from desktops to supercomputers, GROMACS facilitates detailed analysis of molecular interactions, essential for drug discovery and molecular biology research. The bulk of this pipeline is a direct integration of the tutorial written by Justin A. Lemkul, Ph.D. with some augmentation for inclusion of AmberTools gaff2 forcefield and a few simple follow on analyses written by myself. This pipeline may be split such that the user can integrate outputs from the `Complex` module directly into this Gromacs Tutorial if they would rather have greater control of the simulation; my purpose with this pipeline is to eventually build out its robustness such that many ligands may be preliminarily tested in a parallel manner (under more general conditions), with more precise user directed follow on analysis performed on promising molecules. For more information on this workflow please consult the source material (http://www.mdtutorials.com/gmx/complex/index.html) as well as the Gromacs Manual on which I relied heavily (https://manual.gromacs.org/current/index.html) 

#### AmberTools

The GAFF2 (General AMBER Force Field 2) is a versatile force field within AMBERTools, designed specifically for small organic molecules. It incorporates parameters for a wide range of chemical functionalities, allowing accurate molecular simulations and calculations. GAFF2 is particularly useful for tasks like molecular docking, where precise modeling of non-standard organic compounds is essential. It's derived and optimized to maintain compatibility with AMBER molecular dynamics simulations, ensuring reliable and consistent results across various applications in computational chemistry and drug discovery. (http://ffamber.cnsm.csulb.edu/ffamber.php)

## Installation:

# Docker Import

# Mac

# NVIDIA

## CUDA Toolkit Installation:

### Download the CUDA toolkit repository pin and installation package:
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.4.1/local_installers/cuda-repo-ubuntu2204-12-4-local_12.4.1-550.54.15-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-4-local_12.4.1-550.54.15-1_amd64.deb
```

### Update the package list and install the CUDA toolkit:

```
sudo apt-get update
sudo apt-get install nvidia-cuda-toolkit

```

### Add CUDA to the system PATH:

```
echo 'export PATH=/usr/local/cuda-12.4/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

```

### Now Install Cuda Enabled Gromacs

```

wget ftp://ftp.gromacs.org/gromacs/gromacs-2024.1.tar.gz
tar xfz gromacs-2024.1.tar.gz
cd gromacs-2024.1
mkdir build
cd build
cmake -D CMAKE_CUDA_COMPILER=/usr/local/cuda/bin/nvcc \
      -D GMX_BUILD_OWN_FFTW=ON \
      -D REGRESSIONTEST_DOWNLOAD=ON \
      -D GMX_GPU=CUDA \
      ..
make
make check
sudo make install

```

### And Source Environment

```

source /usr/local/gromacs/bin/GMXRC
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

```

### Verify CUDA and GROMACS installations:

```

nvcc --version  # Check CUDA version
gmx --version   # Check GROMACS version and CUDA support

```




## Usage

## Pipeline Overview
This pipeline starts with a protein structure file and a small molecule ligand's SMILES string and progresses through various steps to prepare the system for molecular dynamics (MD) simulations with GROMACS.

#### WorkFLow

The easiest implementation is to place your protein file in the $BASE directory, then run the command `./RUNALL.sh <alphafold protein .pdb> <unique ligand name> <"Smiles Representation of Ligand">`
, then navigate to the `Results/<protein-ligand name>` directory, run command `cp $BASE/PostProc/* $BASE/Results/$Reult` and view statistics in the `combined.pdf` file and visualize the separated step images using Chimera or VMD.

1. **Input Preparation**: Obtain a protein PDB file from AlphaFold and a SMILES representation of your small molecule ligand.
2. **Pocket Detection**: Run P2Rank to identify potential binding pockets on the protein structure.
3. **Preliminary Docking**: Use AutoDock to perform docking studies and predict the binding mode of the ligand.
4. **Force Field Generation**: Utilize AmberTools to generate the force field parameters for the small molecule using the GAFF2 force field.
5. **Molecular Dynamics Simulation**: Conduct molecular dynamics simulations with GROMACS to analyze the interactions and stability of the protein-ligand complex.
6. **Analysis**: Extract and analyze key metrics such as hydrogen bonding events, system stability, and interaction energies.


#### Modules

Workflow is controlled by the `RUNALL.sh` script, all sub workflows are outlined there or in the respective module main scripts (shown below).


#### **Module 1: Input and Smile**

Within the `RUNRABBITRUN.sh` init file we may place multiple main calls (formatted):
**INPUT**
`./RUNALL.sh <alphafold protein .pdb> <unique ligand name> <"Smiles Representation of Ligand">`

Generate Initial Ligand Structure in .mol format
**Step:** Convert SMILES to .mol  
**Main Script:** `./gen_mol2.sh <ligand name> <“smiles”>`  
**Output:** `<ligand.mol>`

#### **Module 2: Tower of Babel**

Format Conversion Using Open Babel
**Step:** Convert to Required Formats  
**Main Script:**`./obabel.sh <protein.pdb> <ligand.mol>`  
**Output:** `<protein.pdbqt> <ligand.pdbqt>`  

**Additional Conversion:**  
**Main Script:** `obabel -imol <ligand.mol> -opdb -O ML233.pdb`  
**Output:** `<ligand.pdb>`

#### **Module 3: Get Pranked**

Binding Site Detection and Ordering
**Step:** Use P2Rank for Binding Site Prediction  
**Main Script:** `./predict_prank.sh <protein.pdb>`  
**Output:** `<rank order binding sites .csv>`

#### **Module 4: Physical Docking**

Docking with AutoDock Vina
**Step:** Docking Simulation  
**Main Script:** `./run_autodock_vina.sh <P2Rank_prediction.csv> <protein.pdbqt> <ligand.pdbqt>`  
**Output:** `[[<Ligand Positions on Protein>]]`

#### **Module 5: Re-Complex (Potential Break for integration with Gromacs Tutorial)**

Preparing Protein-Ligand Complex
**Step:** Complex Formation and Cleaning  
**Main Script:** `./format.sh <protein.pdb> <ligand.pdb>`

#### **Module 6: MD Simulation with Gromacs**

GROMACS Molecular Dynamics Simulation Script
**Step:** Energy Minimization and Initial Start Configuration selection follow by NPT/NVT and MD simulation  
**Main Script:** `./complete13.sh <protein.pdb> <"ligand name">`
**Output:** `A named folder with all Gromacs Simulation outputs`

**note** not yet part of workflow, simply pull the PostProc directory into whatever Gromacs output directory you are currently analyzing `cp $BASE/PostProc/* $BASE/Results/$Reult` **note**

#### **Module 7: PostProc, Post Processing and Analysis**
**Step:** RMSD Calculation, Centroid Distance Calculation, Radius of Gyration Calculation, Hydrogen Bond Analysis, Interaction Energy Calculation, and Trajectory Conversion for Visualization
**Main Script:** `./PostProc.sh <ligand name>`
**Output:** `<combined.pdf>`

References: 

Krivák, R., Hoksza, D. P2Rank: machine learning based tool for rapid and accurate prediction of ligand binding sites from protein structure. J Cheminform 10, 39 (2018). https://doi.org/10.1186/s13321-018-0285-8

Morris, G. M., Huey, R., Lindstrom, W., et al. (2009). "AutoDock4 and AutoDockTools4: Automated docking with selective receptor flexibility." Journal of Computational Chemistry, 30, 2785-2791.

Abraham, M. J., Murtola, T., Schulz, R., et al. (2015). "GROMACS: High-performance molecular simulations through multi-level parallelism from laptops to supercomputers." SoftwareX, 1-2, 19-25.

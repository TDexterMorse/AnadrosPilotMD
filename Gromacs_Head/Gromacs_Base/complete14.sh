#!/bin/bash


source /usr/local/gromacs/bin/GMXRC
export GMX_MAXCONSTRWARN=-1


# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <protein.pdb> <ligand_identifier>"
    exit 1
fi

# Assign arguments to variables
protein_pdb="$1"
ligand_identifier="$2"
protein_identifier=$(basename "$protein_pdb" .pdb)


# Function to run GROMACS with error handling
function run_gromacs {
    gmx mdrun "$@"
}


./split.sh "$protein_pdb" "$ligand_identifier"

tail -n +1 JUSTBONDS.pdb >> "$ligand_identifier.pdb"

./QUICKFIX.sh "${ligand_identifier}.pdb"


#sed -i '' '$ d' "${ligand_identifier}.pdb"

./protonate.sh "${ligand_identifier}.pdb"

#add on the old bond linkage component

#obabel "${ligand_identifier}.pdb" -O "${ligand_identifier}.mol2" --gen3D --connect

antechamber -fi mol2 -fo prepi -i "${ligand_identifier}.mol2" -o output.prepi -c bcc -j 4 -at gaff -dr no

parmchk2 -i output.prepi -o output.frcmod -f prepi

obabel "${ligand_identifier}.mol2" -O output.pdb


protein_clean="${protein_identifier}_Clean.pdb"


cat "$protein_clean" output.pdb > complex_h.pdb

pdb4amber -i complex_h.pdb -o complex_clean_h.pdb

cat <<EOF > tleap.in
source leaprc.protein.ff14SB  # Source leaprc file for ff14SB protein force field
source leaprc.gaff            # Source leaprc file for gaff
source leaprc.water.tip3p     # Source leaprc file for TIP3P water model
loadamberprep output.prepi    # Load the prepi file for the ligand
loadamberparams output.frcmod # Load the additional frcmod file for ligand
mol = loadpdb complex_clean_h.pdb     # Load cleaned PDB file for protein-ligand complex
saveamberparm mol complex.prmtop complex.inpcrd  # Save AMBER topology and coordinate files
quit  
EOF

tleap -s -f tleap.in > "${ligand_identifier}_tleap.out"

python ambercharmconvert.py

############## MD ENERGETICS PARAMS ###########################
rm ions.mdp
cat <<EOF > ions.mdp
title           = Minimization    ; Title of run

; Parameters describing what to do, when to stop and what to save
integrator      = steep      ; Algorithm (steepest descent minimization)
emtol           = 1000.0     ; Stop minimization when the maximum force < 10.0 kJ/mol
emstep          = 0.01       ; Energy step size
nsteps          = 150000      ; Maximum number of (minimization) steps to perform

; Parameters describing how to find the neighbors of each atom and how to calculate the interactions
nstlist         = 1          ; Frequency to update the neighbor list and long-range forces
cutoff-scheme   = Verlet
ns_type         = grid       ; Method to determine neighbor list (simple, grid)
rlist           = 1.0        ; Cut-off for making neighbor list (short-range forces)
coulombtype     = cutoff     ; Treatment of long-range electrostatic interactions
rcoulomb        = 1.0        ; Long-range electrostatic cut-off
rvdw            = 1.0        ; Long-range Van der Waals cut-off
pbc             = xyz        ; Periodic Boundary Conditions
EOF

rm nvt.mdp

cat <<EOF > nvt.mdp
title                   = Protein-ligand complex NVT equilibration 
define                  = -DPOSRES  -DPOSRES_LIG ; position restrain the protein and ligand
; Run parameters
integrator              = md        ; leap-frog integrator
nsteps                  = 100000     ; 2 * 50000 = 100 ps
dt                      = 0.002     ; 2 fs
; Output control
nstenergy               = 500       ; save energies every 1.0 ps
nstlog                  = 500       ; update log file every 1.0 ps
nstxout-compressed      = 500       ; save coordinates every 1.0 ps
; Bond parameters
continuation            = no        ; first dynamics run
constraint_algorithm    = lincs     ; holonomic constraints 
constraints             = h-bonds   ; bonds to H are constrained 
lincs_iter              = 4         ; accuracy of LINCS
lincs_order             = 4         ; also related to accuracy





; Neighbor searching and vdW
cutoff-scheme           = Verlet
ns_type                 = grid      ; search neighboring grid cells
nstlist                 = 20        ; largely irrelevant with Verlet
rlist                   = 1.2
vdwtype                 = cutoff
vdw-modifier            = force-switch
rvdw-switch             = 1.0
rvdw                    = 1.2       ; short-range van der Waals cutoff (in nm)
; Electrostatics
coulombtype             = PME       ; Particle Mesh Ewald for long-range electrostatics
rcoulomb                = 1.2       ; short-range electrostatic cutoff (in nm)
pme_order               = 4         ; cubic interpolation
fourierspacing          = 0.16      ; grid spacing for FFT
; Temperature coupling
tcoupl                  = V-rescale                     ; modified Berendsen thermostat
tc-grps                 = protein_${ligand_identifier} Water_and_ions    ; two coupling groups - more accurate
tau_t                   = 0.1   0.1                     ; time constant, in ps
ref_t                   = 300   300                     ; reference temperature, one for each group, in K
; Pressure coupling
pcoupl                  = no        ; no pressure coupling in NVT
; Periodic boundary conditions
pbc                     = xyz       ; 3-D PBC
; Dispersion correction is not used for proteins with the C36 additive FF
DispCorr                = no 
; Velocity generation
gen_vel                 = yes       ; assign velocities from Maxwell distribution
gen_temp                = 300       ; temperature for Maxwell distribution
gen_seed                = -1        ; generate a random seed
EOF


rm npt.mdp
cat <<EOF > npt.mdp
title                   = Protein-ligand complex NPT equilibration 
define                  = -DPOSRES  -DPOSRES_LIG ; position restrain the protein and ligand
; Run parameters
integrator              = md        ; leap-frog integrator
nsteps                  = 100000    ; 2 * 50000 = 100 ps
dt                      = 0.002     ; 2 fs
; Output control
nstenergy               = 500       ; save energies every 1.0 ps
nstlog                  = 500       ; update log file every 1.0 ps
nstxout-compressed      = 500       ; save coordinates every 1.0 ps
; Bond parameters
continuation            = yes       ; continuing from NVT 
constraint_algorithm    = lincs     ; holonomic constraints 
constraints             = h-bonds   ; bonds to H are constrained 
lincs_iter              = 4         ; accuracy of LINCS
lincs_order             = 4         ; also related to accuracy




; Neighbor searching and vdW
cutoff-scheme           = Verlet
ns_type                 = grid      ; search neighboring grid cells
nstlist                 = 20        ; largely irrelevant with Verlet
rlist                   = 1.2
vdwtype                 = cutoff
vdw-modifier            = force-switch
rvdw-switch             = 1.0
rvdw                    = 1.2       ; short-range van der Waals cutoff (in nm)
; Electrostatics
coulombtype             = PME       ; Particle Mesh Ewald for long-range electrostatics
rcoulomb                = 1.2
pme_order               = 4         ; cubic interpolation
fourierspacing          = 0.16      ; grid spacing for FFT
; Temperature coupling
tcoupl                  = V-rescale                     ; modified Berendsen thermostat
tc-grps                 = protein_${ligand_identifier} Water_and_ions    ; two coupling groups - more accurate
tau_t                   = 0.1   0.1                     ; time constant, in ps
ref_t                   = 300   300                     ; reference temperature, one for each group, in K
; Pressure coupling
pcoupl                  = C-rescale
pcoupltype              = isotropic                     ; uniform scaling of box vectors
tau_p                   = 2.0                           ; time constant, in ps
ref_p                   = 1.0                           ; reference pressure, in bar
compressibility         = 4.5e-5                        ; isothermal compressibility of water, bar^-1
refcoord_scaling        = com
; Periodic boundary conditions
pbc                     = xyz       ; 3-D PBC
; Dispersion correction is not used for proteins with the C36 additive FF
DispCorr                = no 
; Velocity generation
gen_vel                 = no        ; velocity generation off after NVT 
EOF


rm em.mdp
cat <<EOF > em.mdp
; LINES STARTING WITH ';' ARE COMMENTS
title		    = Minimization	; Title of run

; Parameters describing what to do, when to stop and what to save
define              = -DFLEXIBLE
integrator	    = steep		; Algorithm (steep = steepest descent minimization)
emtol		    = 10.0  	; Stop minimization when the maximum force < 10.0 kJ/mol
emstep          = 0.001      ; Energy step size
nsteps		    = 500000	  	; Maximum number of (minimization) steps to perform
gen_seed    = 12345     ; Random seed for reproducibility

; Parameters describing how to find the neighbors of each atom and how to calculate the interactions
nstlist		    = 1		        ; Frequency to update the neighbor list and long range forces
cutoff-scheme   = Verlet
ns_type		    = grid		    ; Method to determine neighbor list (simple, grid)
rlist		    = 1.2		    ; Cut-off for making neighbor list (short range forces)
coulombtype	    = PME		    ; Treatment of long range electrostatic interactions
rcoulomb	    = 1.2		    ; long range electrostatic cut-off

fourierspacing      = 0.12        ; PME grid spacing in nm (increase if encountering PME cutoff errors)
pme_order           = 4           ; PME interpolation order (adjust for accuracy vs. computational cost)


vdwtype         = cutoff
vdw-modifier    = force-switch
rvdw-switch     = 1.0
rvdw		    = 1.2		    ; long range Van der Waals cut-off
pbc             = xyz 		    ; Periodic Boundary Conditions
DispCorr        = no

free_energy              = yes
init_lambda              = 0.0
delta_lambda             = 0
sc_alpha                 = 0.5
EOF

rm md.in
cat <<EOF > md.in
MD simulation
&cntrl
  imin = 0,         ! 0=MD, 1=Minimization
  ntx = 1,          ! 1=Read initial coordinates and velocities from inpcrd
  irest = 0,        ! 0=Start new run, 1=Restart previous run
  nstlim = 10000,   ! Number of MD steps
  dt = 0.002,       ! Time step in ps (2 fs)
  ntt = 3,          ! Temperature coupling (3=Berendsen)
  temp0 = 300.0,    ! Temperature in K
  ntp = 1,          ! Pressure coupling (1=Constant pressure)
  pres0 = 1.0,      ! Pressure in atm
  ntb = 2,          ! Boundary conditions (2=Constant pressure periodic)
  ntpr = 1000,      ! Print frequency for output
  ntwx = 1000,      ! Write coordinates to trajectory file
  cut = 10.0,       ! Nonbonded cutoff in Angstroms
  ntr = 0,          ! Number of restraining potentials
  ig = -1,          ! Random number seed (set to -1 for auto-generate)
  / 
EOF


rm md.mdp
cat <<EOF > md.mdp
title                   = Protein-ligand complex MD simulation 
; Run parameters
integrator              = md        ; leap-frog integrator
nsteps                  = 5000000   ; 2 * 5000000 = 10000 ps (10 ns)
dt                      = 0.002     ; 2 fs
; Output control
nstenergy               = 5000      ; save energies every 10.0 ps
nstlog                  = 5000      ; update log file every 10.0 ps
nstxout-compressed      = 5000      ; save coordinates every 10.0 ps
; Bond parameters
continuation            = yes       ; continuing from NPT 
constraint_algorithm    = lincs     ; holonomic constraints 
constraints             = h-bonds   ; bonds to H are constrained
lincs_iter              = 1         ; accuracy of LINCS
lincs_order             = 4         ; also related to accuracy


; Neighbor searching and vdW
cutoff-scheme           = Verlet
; verlet-buffer-tolerance = -1
ns_type                 = grid      ; search neighboring grid cells
nstlist                 = 20        ; largely irrelevant with Verlet
rlist                   = 2.2
vdwtype                 = cutoff
vdw-modifier            = force-switch
rvdw-switch             = 1.0
rvdw                    = 1.2       ; short-range van der Waals cutoff (in nm)
; Electrostatics
coulombtype             = PME       ; Particle Mesh Ewald for long-range electrostatics
rcoulomb                = 1.2
pme_order               = 4         ; cubic interpolation
fourierspacing          = 0.16      ; grid spacing for FFT
; Temperature coupling
tcoupl                  = V-rescale                     ; modified Berendsen thermostat
tc-grps                 = protein_${ligand_identifier} Water_and_ions    ; two coupling groups - more accurate
tau_t                   = 0.1   0.1                     ; time constant, in ps
ref_t                   = 300   300                     ; reference temperature, one for each group, in K
; Pressure coupling 
pcoupl                  = Berendsen             ; pressure coupling is on for NPT
pcoupltype              = isotropic                     ; uniform scaling of box vectors
tau_p                   = 2.0                           ; time constant, in ps
ref_p                   = 1.0                           ; reference pressure, in bar
compressibility         = 4.5e-5                        ; isothermal compressibility of water, bar^-1
; Periodic boundary conditions
pbc                     = xyz       ; 3-D PBC
; Dispersion correction is not used for proteins with the C36 additive FF
DispCorr                = no 
; Velocity generation
gen_vel                 = no        ; continuing from NPT equilibration 
EOF

rm ie.mdp
cat <<EOF > ie.mdp
title                   = Protein-ligand complex MD simulation 
; Run parameters
integrator              = md        ; leap-frog integrator
nsteps                  = 500000   ; 2 * 5000000 = 10000 ps (10 ns)
dt                      = 0.002     ; 2 fs
; Output control
nstenergy               = 5000      ; save energies every 10.0 ps
nstlog                  = 5000      ; update log file every 10.0 ps
nstxout-compressed      = 5000      ; save coordinates every 10.0 ps
energygrps              = Protein ${ligand_identifier}
; Bond parameters
continuation            = yes       ; continuing from NPT 
constraint_algorithm    = lincs     ; holonomic constraints 
constraints             = h-bonds   ; bonds to H are constrained
lincs_iter              = 1         ; accuracy of LINCS
lincs_order             = 4         ; also related to accuracy
; Neighbor searching and vdW
cutoff-scheme           = Verlet
ns_type                 = grid      ; search neighboring grid cells
nstlist                 = 20        ; largely irrelevant with Verlet
rlist                   = 1.2
vdwtype                 = cutoff
vdw-modifier            = force-switch
rvdw-switch             = 1.0
rvdw                    = 1.2       ; short-range van der Waals cutoff (in nm)
; Electrostatics
coulombtype             = PME       ; Particle Mesh Ewald for long-range electrostatics
rcoulomb                = 1.2
pme_order               = 4         ; cubic interpolation
fourierspacing          = 0.16      ; grid spacing for FFT
; Temperature coupling
tcoupl                  = V-rescale                     ; modified Berendsen thermostat
tc-grps                 = protein_${ligand_identifier} Water_and_ions    ; two coupling groups - more accurate
tau_t                   = 0.1   0.1                     ; time constant, in ps
ref_t                   = 300   300                     ; reference temperature, one for each group, in K
; Pressure coupling 
pcoupl                  = Parrinello-Rahman             ; pressure coupling is on for NPT
pcoupltype              = isotropic                     ; uniform scaling of box vectors
tau_p                   = 2.0                           ; time constant, in ps
ref_p                   = 1.0                           ; reference pressure, in bar
compressibility         = 4.5e-5                        ; isothermal compressibility of water, bar^-1
; Periodic boundary conditions
pbc                     = xyz       ; 3-D PBC
; Dispersion correction is not used for proteins with the C36 additive FF
DispCorr                = no 
; Velocity generation
gen_vel                 = no        ; continuing from NPT equilibration 
EOF

################# FORMAT .TOP FILE ###########################

./overwrite2.sh "$ligand_identifier"



restart="yes"

while [ "$restart" = "yes" ]; do
    echo -e "1 | 13\n" | gmx editconf -f gromacs.gro -o newbox.gro -bt cubic -d 2.0 -c

    gmx solvate -cp newbox.gro -cs spc216.gro -p gromacs.top -o solv.gro -maxsol 10000 -radius 0.2

    echo "############## Neutralize Charge ######################"

    gmx grompp -f ions.mdp -c solv.gro -p gromacs.top -o ions.tpr -maxwarn 5

    echo "15" | gmx genion -s ions.tpr -o solv_ions.gro -p gromacs.top -pname NA -nname CL -neutral


    ################## Binarize the Solvated System ######################

    gmx grompp -f em.mdp -c solv_ions.gro -p gromacs.top -o em.tpr -maxwarn 50
    gmx mdrun -deffnm em
#    restart = "no"
    break
    echo "Close enough? (yes/no) Answer no if you want toe locally retry answer yes if you want to either continue with the experiment or else pick a new starting position"
    read satisfaction
    if [ "$satisfaction" = "no" ]; then
	head -n $(($(wc -l < gromacs.top) - 2)) gromacs.top > temp && mv temp gromacs.top
        echo "Restarting..."
    else
        echo "Moving Directories and selecting different start configuration model..."
        break
    fi
done

echo "Are you satisfied with the result? (yes/no)"

read finalsatisfaction
if [ "$finalsatisfaction" = "no" ]; then
    echo "Moving Directories and selecting different start configuration model..."
    echo "Proceeding to Next Model"
    exit 1
else
    echo "Oki-Doki"
fi






######### ACPYPE ############


acpype -i "${ligand_identifier}.mol2" -c user -n -1 -a gaff2 -d -o gmx -b $ligand_identifier -f

echo -e "0 & ! a H*\nq" | gmx make_ndx -f *acpype/*.gro -o index_ligand.ndx

echo -e 3 | gmx genrestr -f *acpype/*.gro -n index_ligand.ndx -o "posre_${ligand_identifier}.itp" -fc 1000 1000 1000

echo -e "1\n" | gmx genrestr -f gromacs.gro -o posre.itp

#cat "############## Thermostat ########################"

#### Volume Held Constant

echo -e "1 | 13\nq" | gmx make_ndx -f em.gro -o index.ndx

gmx grompp -f nvt.mdp -c em.gro -r em.gro -p gromacs.top -n index.ndx -o nvt.tpr -maxwarn 50

gmx mdrun -deffnm nvt -ddcheck no -npme 1 -ntmpi 4

# Check the exit status
if [ $? -ne 0 ]; then
    # If the previous run failed, try again without threading or with reduced threads
    echo "First attempt failed, retrying with reduced threading..."
    run_gromacs -deffnm nvt || run_gromacs -deffnm nvt || run_gromacs -deffnm nvt || run_gromacs -deffnm nvt || run_gromacs -deffnm nvt || run_gromacs -deffnm nvt || run_gromacs -nt 6 -deffnm nvt
fi


#### Pressure Held Constant

gmx grompp -f npt.mdp -c nvt.gro -t nvt.cpt -r nvt.gro -p gromacs.top -n index.ndx -o npt.tpr -maxwarn 50

gmx mdrun -deffnm npt -ddcheck no -npme 1 -ntmpi 4

# Check the exit status
if [ $? -ne 0 ]; then
    # If the previous run failed, try again without threading or with reduced threads
    echo "First attempt failed, retrying with reduced threading..."
    run_gromacs -deffnm npt || run_gromacs -deffnm npt || run_gromacs -deffnm npt || run_gromacs -deffnm npt || run_gromacs -deffnm npt || run_gromacs -deffnm npt || run_gromacs -nt 6 -deffnm npt
fi


#cat "############## MOLECULAR DYNAMICS  ########################"

gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p gromacs.top -n index.ndx -o md_0_10.tpr -maxwarn 50

gmx mdrun -deffnm md_0_10 -ddcheck no -npme 1 -ntmpi 4

# Check the exit status
#if [ $? -ne 0 ]; then
#    echo "First attempt failed, retrying with reduced threading..."
#    run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -deffnm md_0_10 || run_gromacs -nt 6 -deffnm md_0_10
#fi

echo "COMPLETE!!!!! PROCEED TO POST PROCESSING"



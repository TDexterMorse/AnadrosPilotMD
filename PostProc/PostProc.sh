#!/bin/bash


source /usr/local/gromacs/bin/GMXRC


# Check if correct number of arguments provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ligand_identifier>"
    exit 1
fi

# Assign arguments to variables
#protein_pdb="$1"
ligand_identifier="$1"
#protein_identifier=$(basename "$protein_pdb" .pdb)


rm ie.mdp
cat <<EOF > ie.mdp
title                   = Protein-ligand complex MD simulation 
; Run parameters
integrator              = md        ; leap-frog integrator
nsteps                  = 5000   ; 2 * 5000000 = 10000 ps (10 ns)
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

echo -e "1\n0\n" | gmx trjconv -s md_0_10.tpr -f md_0_10.xtc -o md_0_10_center.xtc -center -pbc mol -ur compact

#cat "############## Distance Calculations ########################"

echo -e "q\n" | gmx make_ndx -f gromacs.gro -o index.ndx 

#./NDXOVERWRITE.py

echo -e "1 | 13\n" | gmx rms -s em.tpr -f md_0_10_center.xtc -n index.ndx -tu ns -o rmsd_complex.xvg

./PL_RMSD.py

#./RMSD_Residues.sh 

#./PL_RMSD_Res.py

gmx distance -s md_0_10.tpr -f md_0_10_center.xtc -n index.ndx -select 'com of group "Protein" plus com of group "'"$ligand_identifier"'"' -oall centroid_distance.xvg

./PL_Centroid.py

echo -e "1\n" | gmx gyrate -s md_0_10.tpr -f md_0_10_center.xtc -o gyration.xvg

./PL_gyration.py

#cat "############## Graphings ########################"

cat "############## H Bonds Between Protein and Ligand ########################"

./hydrogen_bonds.py ${ligand_identifier}

echo -e '1 | 13\nq\n' | gmx make_ndx -f npt.gro -o index.ndx 

gmx grompp -f ie.mdp -c npt.gro -t npt.cpt -p gromacs.top -n index.ndx -o ie.tpr -maxwarn 50

gmx mdrun -deffnm ie -rerun md_0_10.xtc -nb cpu

echo -e "20\n21\n\n" | gmx energy -f ie.edr -o interaction_energy.xvg

./PL_interaction.py

enscript -p hydrogen.ps Hydrogen_Bond_Score.txt

ps2pdf hydrogen.ps Hydrogen_Bond_Score.pdf

echo "COMBINE ALL PLOTS AND OPEN"
rm combined_plots.pdf
pdfunite *.pdf combined_plots.pdf
open combined_plots.pdf

echo "GENERATE MOVIE FILE TO OPEN IN CHIMERA SEE READ ME FOR INSTRUCTIONS"

#Generate Movie
echo -e '1 | 13\nq\n' | gmx make_ndx -f md_0_10.tpr
awk '/\[ Protein_/ {p=1} p' index.ndx > temp && mv temp index.ndx
gmx trjconv -f md_0_10.xtc -s md_0_10.tpr -o md_0_10_protein_ligand.xtc -n index.ndx -pbc mol -center
gmx trjconv -s md_0_10.tpr -f md_0_10_protein_ligand.xtc -o md_0_10_protein_ligand.pdb -n index.ndx
gmx trjconv -s md_0_10.tpr -f md_0_10_protein_ligand.xtc -o md_0_10_protein_ligand.pdb -sep -n index.ndx

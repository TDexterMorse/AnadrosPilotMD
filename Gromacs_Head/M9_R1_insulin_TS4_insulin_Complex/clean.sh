#!/bin/bash

rm *ATOMTYPE*
rm *AC*
rm *.tpr
rm *complex*
rm em*
rm ML2*
rm sqm*
rm tleap*
find . -type f -name 'nvt.*' ! -name 'nvt.*mdp' -exec rm {} +
rm PREP*
rm *out*
rm solv*
rm *.gro
rm *.log
rm *.ndx
rm *.PODB
rm *.PDB
rm *Clean.pdb
rm -r *acpype 
rm *.top 
rm '#'* 
rm step*pdb
rm #*#
rm *.xtc
rm *.mdp
rm *.edr
rm *.cpt
rm *.in
rm *.itp
rm *.pl


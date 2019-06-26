#!/bin/bash
#SBATCH -t 24:00:00 # Runtime in D-HH:MM
#SBATCH -p medium
#SBATCH --qos medium
##SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=tina-meryl.amans@ibcp.fr # Email to which notifications will besent#!/bin/bash### Load gromacs
module load gromacs/5.1
OUTPUT_DIR=test_minimization
cd $WORKDIR
cp $SLURM_SUBMIT_DIR/rmsd_chainA.xvg .
cp $SLURM_SUBMIT_DIR/chainA.pdb .
cp $SLURM_SUBMIT_DIR/md_1500.xtc .
cp -r $SLURM_SUBMIT_DIR/toppar .
cp -r $SLURM_SUBMIT_DIR/restraints .
gmx rms -s chainA.pdb -f md_1500.xtc -o rmsd_chainA.xvg -b 400000 
0
0
mkdir $SLURM_SUBMIT_DIR/$OUTPUT_DIR/
cp  -p * $SLURM_SUBMIT_DIR/$OUTPUT_DIR/

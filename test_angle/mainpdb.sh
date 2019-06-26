#!/bin/bash
#use bash version 4.2.46(1) 
#sbatch pdb.sh
##sbatch pdb_center_pbc.sh 
#sbatch pdb_timstep.sh
#sbatch pdb_center_pbc_timestep.sh
#sbatch pdbdt.sh
#sbatch pdbskip10.sh
#sbatch pdbskip100.sh
#sbatch pdbdt40.sh
sbatch pdbdt40_BC.sh
#sbatch pdbdt40_BC_snap.sh

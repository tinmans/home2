#!/bin/bash
#SBATCH -n 1 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 0-13:00 # Runtime in D-HH:MM
#SBATCH -p medium # Partition to submit to
#SBATCH --qos medium # Partition to submit to
module load gromacs
#ac5_1azs_c2c2_gi_n2
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/traj.trr -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -o ac5_1azs_c2c2_gi_n2_atp.pdb << EOF
1
EOF

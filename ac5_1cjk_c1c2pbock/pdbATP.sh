#!/bin/bash
module load gromacs
#ac5_1cjk_c1c2pbock
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md/md_1500_solute.trr -s /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md/md-2.tpr -o ac5_1cjk_c1c2_golfpbock_atpmd1500solute.pdb << EOF
1
EOF
